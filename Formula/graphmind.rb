class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.86"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.86/graphmind-cli-macos-arm64"
      sha256 "835a6f58b4ef8a021aa8a9a196efa63e71f77fcb3b9020d3a10355d8548209cc"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.86/graphmind-cli-macos-x64"
      sha256 "863a86af518766586f6b9fb86e29acd30ff3f5335be668c6a36412a662bd758f"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.86/graphmind-cli-linux-x64"
    sha256 "58a55f5cb8cb5f082a45aff22ffa33eab8555f5c5ca068d6b367a657efdc03f6"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
