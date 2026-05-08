class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.131"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.131/graphmind-cli-macos-arm64"
      sha256 "b73510bf9ac3897ac25334b89df1395037a862ae004bc1961f9cb59d69d4b95f"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.131/graphmind-cli-macos-x64"
      sha256 "39a91063466b80b99ba8b64e958cbe9e761607c436186b7e433c63b0f4bc0ab8"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.131/graphmind-cli-linux-x64"
    sha256 "ff5328d7db68802df56a54034d7556a5fb126e3774d33c985cbaea1c7a73fc60"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
