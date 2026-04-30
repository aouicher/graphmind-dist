class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.37"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.37/graphmind-aarch64-apple-darwin"
      sha256 "65e3917ec2822a8e68331216e7fd08a1bc024258b18676a70a06c23e2a0bb94d"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.37/graphmind-x86_64-apple-darwin"
      sha256 "149df3c135bcff9e294a3257f1988f3605dc598bc5370530938255ee5c011d4a"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.37/graphmind-x86_64-unknown-linux-gnu"
    sha256 "ffb837b27ecaa248fcd79fe505bbd4b55e49fdbc8029f85817c200d6fd5f542b"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
