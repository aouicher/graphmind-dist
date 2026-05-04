class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.91"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.91/graphmind-cli-macos-arm64"
      sha256 "232a7461467d357ff512cf9e54ae8dfd5b818b1ac1383c22938ac34975872f29"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.91/graphmind-cli-macos-x64"
      sha256 "97d28bb9ee05c2b388d2139d8dae5d0bb1d6a5a803f6f88fd0cccac5d382f67e"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.91/graphmind-cli-linux-x64"
    sha256 "17873e45d4c2ff484d3547d50834d0041f5bb0ccd8b0a2092438840da539a681"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
