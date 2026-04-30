class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.35"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.35/graphmind-aarch64-apple-darwin"
      sha256 "cbf197c4a82772e47d3775bf1fb97194e379cac2c6aca69ecf5d1b85e21bd997"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.35/graphmind-x86_64-apple-darwin"
      sha256 "5a0b4d028f24967e3ef57f55ef76db64246872408566929771e1a2f63c7c43a3"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.35/graphmind-x86_64-unknown-linux-gnu"
    sha256 "f05440072157a53f88fc9bc3a3867ec23ed4b9e2cd6e2bf90f79a277dffcf1b4"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
