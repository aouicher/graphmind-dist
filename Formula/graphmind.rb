class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.33"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.33/graphmind-aarch64-apple-darwin"
      sha256 "678e08b072331f23d0117ea57319a8c1875ce191e5d68c611ee4be27cbfa8da1"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.33/graphmind-x86_64-apple-darwin"
      sha256 "60af9bd5071dde03190f0a206aa69604516003bd209b0929770ab4df8fb0b3c7"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.33/graphmind-x86_64-unknown-linux-gnu"
    sha256 "ead3b62d882d1b54a241efc794092e6f9f815ac069b55483cea9cc7ca165fe90"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
