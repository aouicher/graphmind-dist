class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.23"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.23/graphmind-aarch64-apple-darwin"
      sha256 "b14021c0702075fae136e9d7091f9b1d41d493911c44da3d9779ca864426ae0f"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.23/graphmind-x86_64-apple-darwin"
      sha256 "a679dd651f19c24c82a2e39e9bbaa2d8698631f9539cab26a104c3cc89e721a0"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.23/graphmind-x86_64-unknown-linux-gnu"
    sha256 "0141628b91831af09d499b18e31da951601f67eeb3518846f5683a1c14012023"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
