class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.6/graphmind-aarch64-apple-darwin"
      sha256 "c970636c12716971741c0861ae076763d5a516880d063502505b528f584b1d84"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.6/graphmind-x86_64-apple-darwin"
      sha256 "9dd28f6eade1ea4b75d8e91b93107cef194d3a0f18e339b398f49cdf4f9bcf22"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.6/graphmind-x86_64-unknown-linux-gnu"
    sha256 "0e9e1a7de428bb83dadfa9e46aed61024278191146865053bf1290919714006b"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
