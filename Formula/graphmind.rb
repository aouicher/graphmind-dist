class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.105"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.105/graphmind-cli-macos-arm64"
      sha256 "d40a7305a9716baf0a078340c89015090ae2d8cd5898e8e353f88807277fa03e"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.105/graphmind-cli-macos-x64"
      sha256 "8f87d3c853f19a08dad4ec63a046f1bea15c073ea4da75aec007b0c5ba9d110f"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.105/graphmind-cli-linux-x64"
    sha256 "83ea147ce86a199cee5a8d61fe823106cfcec2cd3e06db52380763ddd65e056d"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
