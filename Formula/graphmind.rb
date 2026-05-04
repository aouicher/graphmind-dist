class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.97"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.97/graphmind-cli-macos-arm64"
      sha256 "12ee19fee0d916aed0b071fc6fb0ae2d714f4cc0e333769bf2d845c49bab2b2f"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.97/graphmind-cli-macos-x64"
      sha256 "2929129d7f271e5d4cd9ea1e4a3144a832eb44c667740eabb7529e22702e81fd"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.97/graphmind-cli-linux-x64"
    sha256 "c6d92f44097b9daa82ccaefbb65a6e6f4650f10de53e3fa97790e6d55babe398"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
