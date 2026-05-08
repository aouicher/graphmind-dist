class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.123"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.123/graphmind-cli-macos-arm64"
      sha256 "b7ae1017e8eb0063daef4100908069e0e55c16969c55554ecbe713eb1a39a61a"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.123/graphmind-cli-macos-x64"
      sha256 "49b945df5e5eb35ed183199a9a3420d9899a9625d671c071164c2c0c4e86684f"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.123/graphmind-cli-linux-x64"
    sha256 "2c5af33c5b324fb92bd72d6085b2d7e44f07e6f7ace70288f8db6a28feddef18"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
