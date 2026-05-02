class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.54"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.54/graphmind-aarch64-apple-darwin"
      sha256 "2a44f7fa92b1fe2244b01794f45a7576d60e74170ac49778b72ca30c3f1050bd"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.54/graphmind-x86_64-apple-darwin"
      sha256 "6f7c46011916f6f197ebc8b6ca2f2389a17a217ae50025ec8ea0bf36a0f9b6b9"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.54/graphmind-x86_64-unknown-linux-gnu"
    sha256 "e124385839bb3390b7ac525fd6900d0f7ff2005220137d0765877deaa54cfd52"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
