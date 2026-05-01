class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.44"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.44/graphmind-aarch64-apple-darwin"
      sha256 "79353073e476da8ca43a7cbaadcb2c215a4c8713d68a62f5b0ab58992ade9c2e"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.44/graphmind-x86_64-apple-darwin"
      sha256 "9645c1f66fe115232d7a2dc5f1d13f84180de96da64a559cbd6b7c88e598425d"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.44/graphmind-x86_64-unknown-linux-gnu"
    sha256 "069ce9fc277bc47ac0ab6444e38132375de462fa2db8f28799ac74a00f26aff8"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
