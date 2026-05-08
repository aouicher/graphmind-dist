class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.141"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.141/graphmind-cli-macos-arm64"
      sha256 "2c286087f8f042e55ec14935a17355db1304dabee7b5b1e4541cf0b94941adc7"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.141/graphmind-cli-macos-x64"
      sha256 "ae64b91e49327a963e2db36edb6caafa3650064424d32f52bb2dbbb3411d426c"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.141/graphmind-cli-linux-x64"
    sha256 "5b02a01f78def3ed95eff2a4febe38a50c160d0247529510a87c2ede63b8ab96"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
