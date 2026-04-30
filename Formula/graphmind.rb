class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.34"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.34/graphmind-aarch64-apple-darwin"
      sha256 "87ca043e0dddf919f2881d362aa9d3147f0e3fff597baf6f9b126557a1001b9d"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.34/graphmind-x86_64-apple-darwin"
      sha256 "6c9a4c6f1957a8f9255c8266585e724f8222f638877d4823c56113e56c853061"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.34/graphmind-x86_64-unknown-linux-gnu"
    sha256 "0b114c8845d7d744fef3bf8216ea2f1426cf52c519ab17f35370d4ec5cf9b57f"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
