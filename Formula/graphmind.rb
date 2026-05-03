class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.74"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.74/graphmind-cli-macos-arm64"
      sha256 "97407ea9e471a070f4702a178db5ed7211e04584e17c7a5b6ac585a708f42bb7"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.74/graphmind-cli-macos-x64"
      sha256 "1ef583b253410091cc512cdf0e4bd7ac2d87e461972fbe0ba271d5ecccb4d9b0"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.74/graphmind-cli-linux-x64"
    sha256 "95f467a5a8bd3c4b8e3dcd2198fae6d600e2d9c9b46706d11cc2e44a220415b4"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
