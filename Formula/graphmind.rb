class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.55"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.55/graphmind-aarch64-apple-darwin"
      sha256 "2716a5fede8bc89a58d665c7864f48efdc99fe724875ff8f3d6af7623e28f547"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.55/graphmind-x86_64-apple-darwin"
      sha256 "eb36f527d3272e6479bcc6ff3c711b17602bf1f46b0276ff52f337097395822e"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.55/graphmind-x86_64-unknown-linux-gnu"
    sha256 "f26fe3109b5d762140d062232a44e86287a78c8404b917471f29e877bece8705"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
