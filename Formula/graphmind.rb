class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.76"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.76/graphmind-cli-macos-arm64"
      sha256 "928193cb833d3ea1ab1b99d5e09875bc23a712696bba71e95ee93ad62811ee41"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.76/graphmind-cli-macos-x64"
      sha256 "10d3be7ba2d8906700ceaf6f03a20a56fb22eaab50f2ca24e931c42e8ba46eb0"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.76/graphmind-cli-linux-x64"
    sha256 "ae5782422790c0ae4287883a0fc4c213411da5790812be3549cbbc254cf15361"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
