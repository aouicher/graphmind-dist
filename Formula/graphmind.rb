class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.161"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.161/graphmind-cli-macos-arm64"
      sha256 "fcf6f6823d52840495d9433c8a7a474e2a05e3329fc1a9da96e7a7fc8ed44d65"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.161/graphmind-cli-macos-x64"
      sha256 "62299de555e674cbbbb81a5bc5f8db995fb5ec115c2a6c51455b45957ba7eb0b"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.161/graphmind-cli-linux-x64"
    sha256 "e75414e84d11664c6b282bf53edcad6ea319d1c1c90a76178b67fbe472c1a6ba"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
