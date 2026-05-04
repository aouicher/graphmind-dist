class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.103"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.103/graphmind-cli-macos-arm64"
      sha256 "9b0b5b2315ffe49c9e33eb4bb9e261492c4973015e8d808f528a48467cb35375"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.103/graphmind-cli-macos-x64"
      sha256 "649ccfc5884de997a38acd30d9b7e08b89f2caeecf5c7e95852f1fbdd347ffe2"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.103/graphmind-cli-linux-x64"
    sha256 "b3d48e9d27806ec5de1876bfb53365329072b609edd0281199b109bb27d52e2b"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
