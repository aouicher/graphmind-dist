class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.14/graphmind-aarch64-apple-darwin"
      sha256 "a27a4868433d468da331400fbb303f03fb959f27a0db0231858fe7271b09299e"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.14/graphmind-x86_64-apple-darwin"
      sha256 "919fe9e7e4efb226ec8739756e97c68e0de7a6139da5ac215b1d33a02e129ff6"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.14/graphmind-x86_64-unknown-linux-gnu"
    sha256 "a1d991672b72f5ae0faa5d4fcd0c3d18b506007cadef9f523d73574d7ef379ff"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
