class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.120"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.120/graphmind-cli-macos-arm64"
      sha256 "2b7f51a25398ac4ea3b029d27ca97743441aadc54b0d99a9f1b64118036c6178"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.120/graphmind-cli-macos-x64"
      sha256 "33491cfaa3f8660f4f7ea319562ddb486ae030a6bc5d39519f4ae2f7f9499af1"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.120/graphmind-cli-linux-x64"
    sha256 "1058ff4e0b13c7e6561e5ee912d9eaa4325c026e36bf687cb9387d7bb2808fd2"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
