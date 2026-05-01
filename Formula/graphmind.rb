class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.48"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.48/graphmind-aarch64-apple-darwin"
      sha256 "a7240136d722017e53bf2828b8534dcbb36302342340e65cacbf5e8c6d5db191"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.48/graphmind-x86_64-apple-darwin"
      sha256 "80cd21b1f529f584ace0e25cf343c3ca4011d48895fb398c4bf5d019a3b088a1"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.48/graphmind-x86_64-unknown-linux-gnu"
    sha256 "cb70bfb9bc6f2874d3dcd3c6ba5188427b3cd5418b6c1fea85d27706fb66ff40"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
