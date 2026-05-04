class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.80"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.80/graphmind-cli-macos-arm64"
      sha256 "7dfa282fb1b0c3b88d8b20a875d0273b60c44fc893f7be4fd2ca4b71f1ce902a"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.80/graphmind-cli-macos-x64"
      sha256 "58b819e6b49c6965a2d408327ae79784cada93c12d6ad6aae262638322db48e8"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.80/graphmind-cli-linux-x64"
    sha256 "fdf1cc59d19f52faa46a5cb191667f2e2d62e3e6dab62423153cb4232f261f59"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
