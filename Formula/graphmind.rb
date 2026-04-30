class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.36"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.36/graphmind-aarch64-apple-darwin"
      sha256 "1ece251a7f9e2b292ecd4623a737d0dbf2657f7e2b08fce4a4892d78b6f574f9"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.36/graphmind-x86_64-apple-darwin"
      sha256 "95ed03acdb55af16680f79e81caf7513b459ea3208e0b9d8809f95eed98889d3"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.36/graphmind-x86_64-unknown-linux-gnu"
    sha256 "deeca8d7cb2ac41aabcb19ce3f05a46ddceb52ba8af591bb132913e355c8d4a4"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
