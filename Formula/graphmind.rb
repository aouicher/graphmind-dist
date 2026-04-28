class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.24"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.24/graphmind-aarch64-apple-darwin"
      sha256 "1ee327b795c98ff9a3cb8b47735758f48fdae3defdd8219c2022f43c4257d01a"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.24/graphmind-x86_64-apple-darwin"
      sha256 "ecb55fb2c6abf834d7e2b3c9132d6559a8d3211732efcf9795d004023b39aca7"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.24/graphmind-x86_64-unknown-linux-gnu"
    sha256 "00d069383e2decbad6957b029ef4eedcac7d16ef31c9dacbefd355bbac0551ef"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
