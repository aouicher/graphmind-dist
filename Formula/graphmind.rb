class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.58"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.58/graphmind-aarch64-apple-darwin"
      sha256 "241f1583bcb230ec27504a9700609a7faf585a5b0e814bf2a37a53c22d349cfa"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.58/graphmind-x86_64-apple-darwin"
      sha256 "84b4d1c920c4a7a8b0cf66666bef6d510ac32286f58167b8b23329fea88a8d2f"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.58/graphmind-x86_64-unknown-linux-gnu"
    sha256 "a8dc238ef1c1eeec1cc17ac187a257716d7932b07d703f2419a3be6210033600"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
