class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.9/graphmind-aarch64-apple-darwin"
      sha256 "53cebc38b2297385dc3cdcf1e12bd7a734486a94a994f5c7dde9428782d0a5eb"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.9/graphmind-x86_64-apple-darwin"
      sha256 "9e2ac564d43fd9fbd8be6968dfd796f4d510317a0b2c8ce53aee44f428e9629d"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.9/graphmind-x86_64-unknown-linux-gnu"
    sha256 "c1b1159ba2bb747c37c0d6a82614e7624bddfcf9963e7357f719876e05357634"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
