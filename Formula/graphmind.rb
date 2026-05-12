class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.165"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind/releases/download/v0.2.165/graphmind-cli-macos-arm64"
      sha256 "4f6843069cf3ccd0b45e03fcf31f5b4f9108861bce663fd542eaf6469e1f51ef"
    else
      url "https://github.com/aouicher/graphmind/releases/download/v0.2.165/graphmind-cli-macos-x64"
      sha256 "ee2c5bf120ea05f2cd5b7967bc8e8b53ab62d2d799f360dcc978ab8f24322ce6"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind/releases/download/v0.2.165/graphmind-cli-linux-x64"
    sha256 "4b749c3804513697a56b4d53449072dbca3a30b2f6719bf2548743737bf4a641"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
