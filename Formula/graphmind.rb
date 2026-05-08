class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.128"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.128/graphmind-cli-macos-arm64"
      sha256 "46fae177ddba92d465fbc8ec2694bc9b670ff11732545420821bc399b0499fb3"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.128/graphmind-cli-macos-x64"
      sha256 "bf3b1895c2b517ba2c857ae8db1b54953cad1f2567f57048b6fc36d23546c5b3"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.128/graphmind-cli-linux-x64"
    sha256 "38b5cd0735388434122f754a44f241af16485d7d97b1ee5ab0bdfc6101b49070"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
