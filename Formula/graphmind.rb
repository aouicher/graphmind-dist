class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.47"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.47/graphmind-aarch64-apple-darwin"
      sha256 "a0b448db2094fc74a1c1e589be59821d951f255d2110af4033c785549e2bf65b"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.47/graphmind-x86_64-apple-darwin"
      sha256 "95adb7a1dc63b11b0967a887e2a1ae6a5f758b01cdcd070cfabcd99f2e45443a"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.47/graphmind-x86_64-unknown-linux-gnu"
    sha256 "6e2c694eb82dc17b9db53d521f649e0b213b84e7819fd4f065bd31917d18ee7a"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
