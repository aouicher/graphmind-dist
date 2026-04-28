class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.18/graphmind-aarch64-apple-darwin"
      sha256 "f2b0ef2da25528348555d9537d235fe7ff908245f2c1296cf30933f554ae1e91"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.18/graphmind-x86_64-apple-darwin"
      sha256 "d941a08fe6d88b8bd6d85afff2312be2690614737434d8b8d1ba2a2d9f66a93f"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.18/graphmind-x86_64-unknown-linux-gnu"
    sha256 "a1551cbaf508c3af190e68e3a6fba05f7b68736ee6e6320d3a4ba42a9c9edb44"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
