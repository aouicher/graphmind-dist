class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.148"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.148/graphmind-cli-macos-arm64"
      sha256 "a4b0c2a18a149c8700adb8b9a2192c7d4b2320fb25c788450107a9824f0eb5bc"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.148/graphmind-cli-macos-x64"
      sha256 "031e31150ee43ae92ab87c6396b902bcc563e67c275a2fffd3377ab444ebd79e"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.148/graphmind-cli-linux-x64"
    sha256 "0a0e9e7c2f4e330e1b2f8bd6f8d6dfb0162641624abd7e0966ee2a73326308b0"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
