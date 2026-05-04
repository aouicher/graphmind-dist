class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.94"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.94/graphmind-cli-macos-arm64"
      sha256 "b01dcb917a6b452ee87b8c6f06b9360a53e10ffe3ee614da1b4f82b2c963416d"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.94/graphmind-cli-macos-x64"
      sha256 "ffd4f8957c5dca49375cea25d120046c0488d43dcd9aebccd8fd475042aff431"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.94/graphmind-cli-linux-x64"
    sha256 "f801ff949e0357dab73f9a01ea7a899a778d8f0b4105063b3e3d2049e3089924"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
