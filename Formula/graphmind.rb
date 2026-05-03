class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.71"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.71/graphmind-cli-macos-arm64"
      sha256 "ae45071d337deee4c383c7ebc475ccd098dbadbaf780ec156306b85488b377ed"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.71/graphmind-cli-macos-x64"
      sha256 "902043f52d6340d01cc3fdcd40d7a940fe1afba8999efa48ca05da6206d63be3"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.71/graphmind-cli-linux-x64"
    sha256 "759a5db0359a98d25d98fe7e86c1a7b3ba77cdd212580fd27efed4db6a449596"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
