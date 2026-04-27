class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-tap/releases/download/v0.2.2/graphmind-aarch64-apple-darwin"
      sha256 "096d3555fd84e07b2e7778ca78b498b89c76f56882c86e077245767007ec7d51"
    else
      url "https://github.com/aouicher/homebrew-tap/releases/download/v0.2.2/graphmind-x86_64-apple-darwin"
      sha256 "71d0c3ee68df31e0c9740c1f2abfa7c735abf0b6ea7af927470fb322ed6a42bb"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-tap/releases/download/v0.2.2/graphmind-x86_64-unknown-linux-gnu"
    sha256 "28186e69d15bffc73fdc3720f30e5b40f70ce98a63af15dca2c758b1d9e67822"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
