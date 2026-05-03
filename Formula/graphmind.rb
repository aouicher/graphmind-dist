class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.72"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.72/graphmind-cli-macos-arm64"
      sha256 "7cb2c696531b810305bbdce23ec45b8c7b6b26b53a8759573671ac7e3cd9ce65"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.72/graphmind-cli-macos-x64"
      sha256 "c67a4842136fb5c28503de0c35b6ebc265179ee27bd4c5e53b1b01c57b0fa7d9"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.72/graphmind-cli-linux-x64"
    sha256 "7e45ce0dc498d9f8862802a440cc5bc421ee36f56893ffcba7b95322565cc0ec"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
