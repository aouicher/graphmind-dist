class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.133"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.133/graphmind-cli-macos-arm64"
      sha256 "4ec09f9d8e12a0180ea9a53dfa00e11867ac31c811a24628d297593dee395f4c"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.133/graphmind-cli-macos-x64"
      sha256 "9ecdb44683be6bb6008ce7c77c831e630573c4065ac775d226a65ffdc9bef218"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.133/graphmind-cli-linux-x64"
    sha256 "7eb357e71aa7b11f6ae3ff8cb601bc0758d50cdfd3de43672abc2dda6bf162d2"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
