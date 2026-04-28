class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.20/graphmind-aarch64-apple-darwin"
      sha256 "71df485096ede371998ad8df16909dabdc6f8117a8992319ec1ccad51b6236ea"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.20/graphmind-x86_64-apple-darwin"
      sha256 "85294f1c3d477064f1a2d801e20b98804648866288e19ce36e71497cc9ddd75c"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.20/graphmind-x86_64-unknown-linux-gnu"
    sha256 "91d09fb9c10e366f7f786f212bb85a71901f5fa1d9812036fe1900b2ed7f4c1d"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
