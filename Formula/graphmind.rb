class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.19/graphmind-aarch64-apple-darwin"
      sha256 "c5bbdf9a5cf9db75b3d1c0ecd25db42b92f9705935d674b11c0547236a39e459"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.19/graphmind-x86_64-apple-darwin"
      sha256 "98dd7c6cf473960911e921787e778604acdd46a2cde657c6463d32e007a66dd9"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.19/graphmind-x86_64-unknown-linux-gnu"
    sha256 "2443ef5662c67bd2b27d91298f36a94ffa06beec4df2e573d4a87efb4b5cdd72"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
