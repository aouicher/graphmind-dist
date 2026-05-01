class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.38"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.38/graphmind-aarch64-apple-darwin"
      sha256 "1b7d5d4a79236869b6a92f3d9c81bdbe404c6682e65852c60427b80107066c2e"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.38/graphmind-x86_64-apple-darwin"
      sha256 "378178e4161fb7c81714df3c75d5437faf9d4db5ef2d61d43ad0e4de72795cee"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.38/graphmind-x86_64-unknown-linux-gnu"
    sha256 "c47e7d0220ba405c3197b1e1239e394f98bd328d50287f791db6eca797ff62f8"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
