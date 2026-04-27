class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.8/graphmind-aarch64-apple-darwin"
      sha256 "331aa59a18661553d2d0b79dbc595f8f3ab9a9f900fe12add486a09954d56a84"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.8/graphmind-x86_64-apple-darwin"
      sha256 "598eda73b21580f4ac6e6ff2b4e4e0368bede7e0c47dbe94e42b51571c407e58"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.8/graphmind-x86_64-unknown-linux-gnu"
    sha256 "ef44d286d04546fb92936358a43d47a79dae3509de0ace08ea5d278fd4fd9351"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
