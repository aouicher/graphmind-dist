class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.102"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.102/graphmind-cli-macos-arm64"
      sha256 "4c2fcb4d74a08ef0dfe82b671ae59094f1a63445601ea451d10bba498e550f71"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.102/graphmind-cli-macos-x64"
      sha256 "016c7da8cc6c6da727fc5742ec3404b7aa4c0d3088f15f643d71a8fd1e903b4b"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.102/graphmind-cli-linux-x64"
    sha256 "cfaf7d2bf495d86baa46e56af79bf7bf22e2ffa1b0c34a00c1381c00dbe4eb5a"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
