class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.85"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.85/graphmind-cli-macos-arm64"
      sha256 "4c563526969cea0d100c3d9dbad69e9b84a9fb1b7a4a90c0a338dcb41989f8c1"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.85/graphmind-cli-macos-x64"
      sha256 "ab1866c323a29321bf40a8c60e656c4cd62df84123adcb470b781a619e974fe2"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.85/graphmind-cli-linux-x64"
    sha256 "66c37a9f7c3b8e6fa2e78aa0cecc58243c27eab9bf94d3085e01613693917707"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
