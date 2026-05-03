class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.65"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.65/graphmind-cli-macos-arm64"
      sha256 "f7bc68756e771b86ca54f06aa2a913949f8dfb887a4617c278725a44a6e6ba85"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.65/graphmind-cli-macos-x64"
      sha256 "3bd9f24f2c36cf48e732c56abce46738b24cf30949ef379970f746d29c672c0c"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.65/graphmind-cli-linux-x64"
    sha256 "9061d40dc150689a01e3c73b398026e80d75f77a16472ff2bf5d7cc89786c7f9"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
