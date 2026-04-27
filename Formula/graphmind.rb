class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-tap/releases/download/v0.2.3/graphmind-aarch64-apple-darwin"
      sha256 "b7aa5705fec24c2ca7cce77bfa6301c3f69ec83e3ed20fc7f565f6df33da0081"
    else
      url "https://github.com/aouicher/homebrew-tap/releases/download/v0.2.3/graphmind-x86_64-apple-darwin"
      sha256 "6d795f7016f569a90066402e0682361ab57a3cc78c55ae2c16abb444825daed2"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-tap/releases/download/v0.2.3/graphmind-x86_64-unknown-linux-gnu"
    sha256 "d08c5fc8503160484ffcb4c18cdd77e29550be586f0887430e89318870bbae60"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
