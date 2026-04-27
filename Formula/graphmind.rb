class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.10/graphmind-aarch64-apple-darwin"
      sha256 "bdfab8a558dae2984aac7fc8f5b65a343f2218a42c9409df2452bdc47a3c0978"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.10/graphmind-x86_64-apple-darwin"
      sha256 "852584e8438e3113e393311bd97a2184b78c8e5f6b413c0584424ac2f68ce9c0"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.10/graphmind-x86_64-unknown-linux-gnu"
    sha256 "e72dcf94f60ed0d1b6ba6ec4733d89e6f9ffd664e6d9db9f85c54f1dcf704fbf"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
