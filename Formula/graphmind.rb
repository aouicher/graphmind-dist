class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.25"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.25/graphmind-aarch64-apple-darwin"
      sha256 "a4ac2881d6cbe81f6f4d834bfedead61a2a3249ac44376ab1c5dd98ee1c136c8"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.25/graphmind-x86_64-apple-darwin"
      sha256 "c7c93f5443ce157ac13b9eb65dbbfa8da2ddc55bfd42aa0de38e704e231c4579"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.25/graphmind-x86_64-unknown-linux-gnu"
    sha256 "fe06d28c4760d4c82b799f32c0b1ef91ce673da8c8414f2d1a370b4ad99cd5f2"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
