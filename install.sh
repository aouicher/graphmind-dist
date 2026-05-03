#!/usr/bin/env bash
set -euo pipefail

REPO="aouicher/graphmind-dist"
INSTALL_DIR="${GRAPHMIND_INSTALL_DIR:-$HOME/.local/bin}"
BINARY="graphmind"

info()  { printf '\033[1;34m%s\033[0m\n' "$*"; }
error() { printf '\033[1;31merror:\033[0m %s\n' "$*" >&2; exit 1; }

detect_asset_name() {
    local os arch
    os="$(uname -s)"
    arch="$(uname -m)"

    case "$os" in
        Darwin) os="macos" ;;
        Linux)  os="linux" ;;
        *)      error "Unsupported OS: $os" ;;
    esac

    case "$arch" in
        x86_64|amd64)  arch="x64" ;;
        arm64|aarch64) arch="arm64" ;;
        *)             error "Unsupported architecture: $arch" ;;
    esac

    echo "graphmind-cli-${os}-${arch}"
}

get_latest_version() {
    local url="https://api.github.com/repos/${REPO}/releases/latest"
    if command -v curl &>/dev/null; then
        curl -fsSL "$url" | grep '"tag_name"' | head -1 | sed 's/.*"tag_name": *"//;s/".*//'
    elif command -v wget &>/dev/null; then
        wget -qO- "$url" | grep '"tag_name"' | head -1 | sed 's/.*"tag_name": *"//;s/".*//'
    else
        error "curl or wget required"
    fi
}

TMP_DIR=""
cleanup() { [ -n "$TMP_DIR" ] && rm -rf "$TMP_DIR"; }

main() {
    local asset_name version download_url

    asset_name="$(detect_asset_name)"
    info "Detected platform: ${asset_name#graphmind-cli-}"

    if [ -n "${1:-}" ]; then
        version="$1"
    else
        info "Fetching latest version..."
        version="$(get_latest_version)"
    fi

    [ -z "$version" ] && error "Could not determine latest version. Check https://github.com/${REPO}/releases"

    info "Installing graphmind ${version}"

    download_url="https://github.com/${REPO}/releases/download/${version}/${asset_name}"

    TMP_DIR="$(mktemp -d)"
    trap cleanup EXIT

    info "Downloading ${download_url}"
    if command -v curl &>/dev/null; then
        curl -fsSL -o "${TMP_DIR}/${BINARY}" "$download_url" || error "Download failed. Check that release ${version} has a binary for your platform."
    else
        wget -qO "${TMP_DIR}/${BINARY}" "$download_url" || error "Download failed."
    fi

    chmod +x "${TMP_DIR}/${BINARY}"

    mkdir -p "$INSTALL_DIR"
    mv "${TMP_DIR}/${BINARY}" "${INSTALL_DIR}/${BINARY}"

    info "Installed to ${INSTALL_DIR}/${BINARY}"

    if ! echo "$PATH" | tr ':' '\n' | grep -qx "$INSTALL_DIR"; then
        echo ""
        info "Add to your PATH:"
        echo "  export PATH=\"${INSTALL_DIR}:\$PATH\""
    fi

    echo ""
    info "Done! Run 'graphmind setup' to configure your environment."
}

main "$@"
