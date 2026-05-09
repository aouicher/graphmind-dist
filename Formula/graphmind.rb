class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.157"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.157/graphmind-cli-macos-arm64"
      sha256 "ecc26c13f5983b1563a2db1dae99d038ec65c8ff8c75f11452f1a8a19a0b71ff"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.157/graphmind-cli-macos-x64"
      sha256 "002b766add130e4eff81294ec6a56141dc37703af8116954190cf43bcdb0b193"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.157/graphmind-cli-linux-x64"
    sha256 "3292b0a2548a2c69d11ff3c5e6864e5efa064b2c42692dea24514e5f11993273"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
