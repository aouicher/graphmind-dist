class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.13/graphmind-aarch64-apple-darwin"
      sha256 "f6f622d76b856e8318ff64c70e72289e64ff6fb9f862efddef0d8c308ce96dbe"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.13/graphmind-x86_64-apple-darwin"
      sha256 "306aead42807ad251fa024c1a6ce2f2eaa9e88d4a7130d478a2b119f1d6f6904"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.13/graphmind-x86_64-unknown-linux-gnu"
    sha256 "d77ba3a289c026e96cce1d9d78db5e252f41d127d8d546288ff2dbb8c68ca2ed"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
