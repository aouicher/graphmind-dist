class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.155"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.155/graphmind-cli-macos-arm64"
      sha256 "d554ccd418603cc25ef7f965e13ecc121fdb4729c9d4d226db0dc733fca7f07e"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.155/graphmind-cli-macos-x64"
      sha256 "5ed74891d5507bbe78dd14283d6cce1c61f736c18309c04bdc4d77ad42b7fac9"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.155/graphmind-cli-linux-x64"
    sha256 "a0bea96a363faa2cfb3bd4060935ac78d32a3baedf8af6c9ca2187fed85ec6bb"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
