class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.51"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.51/graphmind-aarch64-apple-darwin"
      sha256 "b915ed42ac3daacd1c0f71b05e730c0f9c316e1eff60a8adb3cd59af483b31ce"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.51/graphmind-x86_64-apple-darwin"
      sha256 "47c79618f237bd37748ac976239bea42dee6f8fb2d9154dcee80c0fdc7f429c1"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.51/graphmind-x86_64-unknown-linux-gnu"
    sha256 "6be75058b51cb5973fd947cd90bdd120d250314c4f58d120faad56f4bbe6ee48"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
