class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.5/graphmind-aarch64-apple-darwin"
      sha256 "2488fff1b878c156295cfd004fdd0fdf385ea22089890cfed04fbab5eb4867f3"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.5/graphmind-x86_64-apple-darwin"
      sha256 "599eb2062a6d0a701af47e97df3be3ccd4591322fb685072dab6c5bfecb0a5d7"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.5/graphmind-x86_64-unknown-linux-gnu"
    sha256 "61fe453e4b2f1f5a1cbf2404493f8cd1bfdaf400877a1fc229a569f8be2921a6"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
