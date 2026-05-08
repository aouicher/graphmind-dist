class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.127"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.127/graphmind-cli-macos-arm64"
      sha256 "34d52cd365d41cc12894f44f64773a611d5efb2546b76a5e8b83190ae8af9cdd"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.127/graphmind-cli-macos-x64"
      sha256 "885e5612230a3c27aaa76c42a67ccf45e148306ff2b87d2666220e153a63a651"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.127/graphmind-cli-linux-x64"
    sha256 "acdc7b8c0c626a6e67838433fde95d7c2bb6709e204b826a9fa1d983c4ebde71"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
