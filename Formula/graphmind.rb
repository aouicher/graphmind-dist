class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.144"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.144/graphmind-cli-macos-arm64"
      sha256 "435b4cbe0037ee4dd171d8d8a501737c27306401eac9653b8910dbfd06ea55e0"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.144/graphmind-cli-macos-x64"
      sha256 "63370c7f43257b55dc28ed97a7ce40aba9a09d88f21da7905d6ca744d192f31c"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.144/graphmind-cli-linux-x64"
    sha256 "6b3ab49766d4dc1fc339e612ada8fa27a74fea6b266aab9e726f3a703db0ea0f"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
