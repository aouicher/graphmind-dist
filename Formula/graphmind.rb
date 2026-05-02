class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.61"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.61/graphmind-cli-macos-arm64"
      sha256 "c72d9a7e1c52152c499268960869a136279dbce27cc7e44177310557e4d1f143"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.61/graphmind-cli-macos-x64"
      sha256 "3bb4e1cbcc2ca1966b6180c60309fd078f13a2e52be6139ea92ba4d98b098c0e"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.61/graphmind-cli-linux-x64"
    sha256 "49fe2623fd3ef121cd0426f8496e36bb5fcff686559ac993fa80d2ef969fe29f"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
