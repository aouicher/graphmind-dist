class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.4/graphmind-aarch64-apple-darwin"
      sha256 "a1395352de08f89da10babf2b27be094513f51ef76400ad26c183d843a24ade2"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.4/graphmind-x86_64-apple-darwin"
      sha256 "d62482e619bbf7d24d09845a2a333cf7139230679fd931e63e8516d5b60ece8c"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.4/graphmind-x86_64-unknown-linux-gnu"
    sha256 "d156c4cb2c85f6ebb4b2c87790cee660a80ad36153a29e362ba34d78c389ba7d"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
