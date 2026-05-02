class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.64"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.64/graphmind-cli-macos-arm64"
      sha256 "4fcad0e39b59f94e2cab7fc5477606a19a9e5f9d5aacb8f7b7763c5de796b0c0"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.64/graphmind-cli-macos-x64"
      sha256 "188d5b22e5a8b4d406fca149418b4ae9f06c82f4c7cd2f7eddcfaef506e8b6b7"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.64/graphmind-cli-linux-x64"
    sha256 "47c2d94f5bd29ec917de42512b2da4fee9c36083e3fbb00e003fdebdb69edca2"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
