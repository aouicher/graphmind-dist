class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.122"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.122/graphmind-cli-macos-arm64"
      sha256 "8ac2afa2ea0983856f8333856e628ee83e0e775aa4f882cea6ef8835d302f479"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.122/graphmind-cli-macos-x64"
      sha256 "8e74ab7f17022974feaa4668d936d58f50ad6741fe158478c4d2981b4a8aa6db"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.122/graphmind-cli-linux-x64"
    sha256 "2aaeeafd668a59f979649c68c4a3cd7a7e94bb9035e63ebf8c74e9da47cc1ac5"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
