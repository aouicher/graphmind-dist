class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.68"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.68/graphmind-cli-macos-arm64"
      sha256 "66a7321e14b70cbf4e6096da2be5cedba9bc7097929c48c16c28cc5a529f52b4"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.68/graphmind-cli-macos-x64"
      sha256 "959dacbafb9b8c5ec003eb2ac1d689fd7d7cb549c4d5bd1a8e81e0f201328242"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.68/graphmind-cli-linux-x64"
    sha256 "1699a7522f2922ec85e85936546b11b3dde15e4aff016d6384d2f1e528fd0fb3"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
