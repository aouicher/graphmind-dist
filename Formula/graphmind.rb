class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.15/graphmind-aarch64-apple-darwin"
      sha256 "d04b9ac2b0462599bdd9bd5347216ced463bf0955ca5394951379feda778c34c"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.15/graphmind-x86_64-apple-darwin"
      sha256 "aecfb4fa0bee5cc5f091a717f4bd2bb8c162fd992c81950c636bd41ab5b65e57"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.15/graphmind-x86_64-unknown-linux-gnu"
    sha256 "2f97983eaad757ffcade76af2882fea853dc502323c98e1b1bb9f8bd319a666e"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
