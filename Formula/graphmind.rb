class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.77"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.77/graphmind-cli-macos-arm64"
      sha256 "5aa63e1af9c33529766eab3facc9dec7c9d341b75bf7f9bdade63de5a0c69aaf"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.77/graphmind-cli-macos-x64"
      sha256 "248fe79bd61090e31f966a49e643e68ad9f7112331a131651c38e5231928a514"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.77/graphmind-cli-linux-x64"
    sha256 "847618ba7b01e7044473d5bf9cc908e77b5e1d5684c5234e46ec5bcd59c0602d"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
