class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.153"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.153/graphmind-cli-macos-arm64"
      sha256 "e3b9197aa72eed61bd117abe7ebef16034365e79bfcc4a5e0d0c93ec143de6c3"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.153/graphmind-cli-macos-x64"
      sha256 "a704448f78bf4ce1481c9b5d08fcfdf0849b1be6a5c77e723986dc05bf5701b1"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.153/graphmind-cli-linux-x64"
    sha256 "2d3932d8a86196c3f2d6fd8ac3668d73055cab1a060003aebdc701d5449b02fe"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
