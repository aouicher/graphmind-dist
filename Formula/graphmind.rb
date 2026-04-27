class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.7/graphmind-aarch64-apple-darwin"
      sha256 "d1b4a1120d1bbc54862e6769de9766db3ad68fdc206cb2c9e73352e8e30ae58a"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.7/graphmind-x86_64-apple-darwin"
      sha256 "806088d48690dd4fec1cfcf2ed282e360304f63a5ba4d509aa974260896e94ec"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.7/graphmind-x86_64-unknown-linux-gnu"
    sha256 "fc5b8c6db2bd5b063048ed1ea8aa9097bd1e20bf42d9ef185058b9b2b084a066"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
