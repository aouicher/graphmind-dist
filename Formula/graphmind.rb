class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.43"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.43/graphmind-aarch64-apple-darwin"
      sha256 "ae23a41e425cf07b2b739a949d152a1141f8bb42a0cc20f858cf938215e8c792"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.43/graphmind-x86_64-apple-darwin"
      sha256 "3601a1d455a515a02beb1af57f6a81878502eb5ea2a0f821e059a3dcfd9a52dc"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.43/graphmind-x86_64-unknown-linux-gnu"
    sha256 "9a1c933d899b7a0d5a1e56458d53908244c4b8275664288c45a51910e7261b92"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
