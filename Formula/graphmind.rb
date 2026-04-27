class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.12/graphmind-aarch64-apple-darwin"
      sha256 "f39796e0d5151eafa8b07595e6fae2372a995ee6dfe2c6dc28c4873e9dbc3a47"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.12/graphmind-x86_64-apple-darwin"
      sha256 "c7df18fa3a1a36516d04cdbfac48a7d6df64176e75bde23fe42fd12dbad1153f"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.12/graphmind-x86_64-unknown-linux-gnu"
    sha256 "e3526f4d83ef3fb70e0199e29e0a532f4b66f82c982d185469ee8961e45bea17"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
