class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.28"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.28/graphmind-aarch64-apple-darwin"
      sha256 "767a3dea91d1f51fa0280e5d9f5ec9f0f3e45182de0b2e7ae451684024d0791a"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.28/graphmind-x86_64-apple-darwin"
      sha256 "5d738443663070940c69d0b26db54c17a156a40d457ee99ee49cb3cf088c574c"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.28/graphmind-x86_64-unknown-linux-gnu"
    sha256 "bf4df991adcc7d6d617b382518f8974eed3cd68d3345d51abf4dfb76a5f344bf"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
