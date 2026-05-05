class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.115"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.115/graphmind-cli-macos-arm64"
      sha256 "42e74a8f659b5b19ca036dc53292dca7f9c22877a5547a1a14dd10e2fc33e6a1"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.115/graphmind-cli-macos-x64"
      sha256 "b57042e32f565e8dc202a203500ff83627cf480e69cba8f9db73ecabb9d19903"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.115/graphmind-cli-linux-x64"
    sha256 "1a14b08b8f986088371588818820eb05b1a46e8bbcf215f3cabf79891fbe37ee"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
