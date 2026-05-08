class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.143"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.143/graphmind-cli-macos-arm64"
      sha256 "3eb96fe9cbf4202a3268aaac01a41d964658103ee3eae9416bb63811f084f47f"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.143/graphmind-cli-macos-x64"
      sha256 "a65934350ccf3706ec3f84cd159d27ac6e827e11570de65f7cdd64103740d87f"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.143/graphmind-cli-linux-x64"
    sha256 "e1c30fc55bc084efe643c3cbe6fad8acd63b6b92d9f10cec5d9b6e0b5f568a9b"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
