class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.92"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.92/graphmind-cli-macos-arm64"
      sha256 "1542750927b77feb37a0cf2a1444165991d61045d120b651e33677920cfa2c8c"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.92/graphmind-cli-macos-x64"
      sha256 "4497223ad223bb6098dcf3b6904fdcab335ae24960164367a1d55f68f60fcc14"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.92/graphmind-cli-linux-x64"
    sha256 "705a03b59170a02eb0a0c93e0cf2ecef32a9116ddbff05d75d44fbca6716f1e0"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
