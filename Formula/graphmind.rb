class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.70"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.70/graphmind-cli-macos-arm64"
      sha256 "9bdbb53e4ee6eecbe525dd6ac1245c02f9cabbbc7046091508bf9efec8cce348"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.70/graphmind-cli-macos-x64"
      sha256 "edc052fa1e4cbc238feb8d877cce1fae206cc5bc9a4b4c370bfa701ed30347b9"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.70/graphmind-cli-linux-x64"
    sha256 "67f2cad91e4e1f0b769c191384096d057e2a7aa76bd8243fa2334ffb729082a4"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
