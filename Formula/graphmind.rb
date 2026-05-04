class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.81"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.81/graphmind-cli-macos-arm64"
      sha256 "9be0ebf684f578b5bba156702f4026a291642b31eed9871a158d310777bd4695"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.81/graphmind-cli-macos-x64"
      sha256 "62348a93906931e531f1bae7b0971e87ff96da95117fc4d43fba2ce69053436d"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.81/graphmind-cli-linux-x64"
    sha256 "7bb1ab63cbe96decf7056be61ad5b739e365a02988d0ad9b9224406037039a5c"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
