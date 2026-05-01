class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.42"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.42/graphmind-aarch64-apple-darwin"
      sha256 "769be7b3b41d0a13e21d623fabc593fee62bc890d311e3db5940d03c81289183"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.42/graphmind-x86_64-apple-darwin"
      sha256 "38f5eda776f60300d051e6bdfb7b99dd83de75f402d85fbcca08d3b109eeddac"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.42/graphmind-x86_64-unknown-linux-gnu"
    sha256 "290fb8f3027714408e1edba7d7eecdeb32ce16b3788447e87febbc1dc682c666"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
