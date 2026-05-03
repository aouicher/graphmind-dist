class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.67"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.67/graphmind-cli-macos-arm64"
      sha256 "6b95aa8854d7b63d154f7400cd6593c4ff6bb697ba4fd1005bafde579df9b7d5"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.67/graphmind-cli-macos-x64"
      sha256 "4ea0f85868632f5439f6d62eb6a60f2b3f39318cbaca028a9c430950178f7995"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.67/graphmind-cli-linux-x64"
    sha256 "fc826d77b461947de0e4a0d4c95cc37adab80041ab768dd860a2c7427c4dd976"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
