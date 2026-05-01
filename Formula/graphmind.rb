class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.45"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.45/graphmind-aarch64-apple-darwin"
      sha256 "5b8083cb28e404e268bfff6a2a7300cf558ccfb7fda389fc6a3248cb22311c86"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.45/graphmind-x86_64-apple-darwin"
      sha256 "67b54158ef37c86321ddb4d743f51873f6cd18c4c3a6702397e93e4397490330"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.45/graphmind-x86_64-unknown-linux-gnu"
    sha256 "9cf7fb7d75ed1595ab0009ee9b41aafab891b4f8ae8ea1e3e8d3be6887408a11"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
