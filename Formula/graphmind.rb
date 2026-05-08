class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.132"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.132/graphmind-cli-macos-arm64"
      sha256 "b7bf9d36808d959e4c525f2cc0522b5d9e23b43929f208d032f63fea6ae2ebe4"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.132/graphmind-cli-macos-x64"
      sha256 "e507f57967534211017e47d72600edd952cec201bb32726e9cc63dd45943f24f"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.132/graphmind-cli-linux-x64"
    sha256 "b0b529508b1d769267bc7447ef8c458f6ae466889cb43a4856f40600a937b4d6"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
