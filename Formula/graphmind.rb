class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.121"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.121/graphmind-cli-macos-arm64"
      sha256 "c346e2cc6fa256d33e28d4bdfd9f11ee8704225d38c26ad1f84dba2c0792492f"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.121/graphmind-cli-macos-x64"
      sha256 "84c7bb2883fa852f38de9b1adf42220e0a502e3a47555b86cf6575125e41199d"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.121/graphmind-cli-linux-x64"
    sha256 "81e754b23590902737c1bf093ea72231df944c05381a7ce7e489a7e7ab471f08"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
