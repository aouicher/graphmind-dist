class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.16/graphmind-aarch64-apple-darwin"
      sha256 "645575221b212bc1022904ec3c2544f92ba0633b9f673e508d48efa3bba10771"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.16/graphmind-x86_64-apple-darwin"
      sha256 "db897bbae3c12845152cf419e1c6a0d6280e0130957eb0b8910b19152c5d8703"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.16/graphmind-x86_64-unknown-linux-gnu"
    sha256 "17310e247f124ea8c81c8be9f0820e3e595e9366a15d32d78983539c1acb4a32"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
