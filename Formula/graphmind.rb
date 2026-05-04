class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.93"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.93/graphmind-cli-macos-arm64"
      sha256 "c89066ad59d74c6b1d6628ab90f0be042e957ff3f5323b3566aec102a9a955e0"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.93/graphmind-cli-macos-x64"
      sha256 "25fae637bf23943aedc37d0b96578d899d234884159e6ea54f057debbc8b9b97"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.93/graphmind-cli-linux-x64"
    sha256 "1784469c4e886be039416c302fb198045ff2b35539ff212a0ec1e9158d3a6cb8"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
