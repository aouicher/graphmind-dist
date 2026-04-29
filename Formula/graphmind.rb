class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.32"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.32/graphmind-aarch64-apple-darwin"
      sha256 "1eab52500b32a5da71263d81ccfb9d091fab49b94017f728057bad5aa7760ef5"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.32/graphmind-x86_64-apple-darwin"
      sha256 "c602352526e3720e50a29ca4a749a8598384617e2594a65fc65ca8b21d6adb75"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.32/graphmind-x86_64-unknown-linux-gnu"
    sha256 "d9f39cfa1a4f0d4261f549604da06bf60722107d6fae46708589d1480edffa8a"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
