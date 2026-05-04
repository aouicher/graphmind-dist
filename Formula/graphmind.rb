class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.104"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.104/graphmind-cli-macos-arm64"
      sha256 "210adf588c1b824564522a1cecca74a19665a2b268b9b90cf90dcebee05a9a0b"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.104/graphmind-cli-macos-x64"
      sha256 "34da73df0fe6d004b28705a71802603f2660c30c2086b996b25444d8defd7575"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.104/graphmind-cli-linux-x64"
    sha256 "4e3a3d3aa3d64975a7a0b7f2cce1626b046dbc5997fb28d35220c032f7b5364e"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
