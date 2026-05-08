class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.146"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.146/graphmind-cli-macos-arm64"
      sha256 "3f9920a019935c1380bc84923e48a67749d713e75c95bac3657a97dd6ab45263"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.146/graphmind-cli-macos-x64"
      sha256 "9caf9209c03b6ce587525a9ec0b8b5a36a042c773e416d55a7b0593e4a358257"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.146/graphmind-cli-linux-x64"
    sha256 "e07b9c5bd8dfd6fb1096c73a58ce1b801920a09d677b5f16b07bcce6131cbe61"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
