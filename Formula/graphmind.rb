class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.147"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.147/graphmind-cli-macos-arm64"
      sha256 "2595e501b0ded38c538a5d196bd4cb67c913be7f610a25961842921802ac9e61"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.147/graphmind-cli-macos-x64"
      sha256 "233d100480c4d4d137371fac7a3fadd375688d071661287f68d11801ed76ef15"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.147/graphmind-cli-linux-x64"
    sha256 "cedef2b8753f20f7d92b408b92528bd205ebfd530d2ab7d955b4a7cacc6b97d1"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
