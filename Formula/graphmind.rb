class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.160"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.160/graphmind-cli-macos-arm64"
      sha256 "1773a83c3e14cacacca76699c96d0a93884c34814de02e191d2562bbe817958c"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.160/graphmind-cli-macos-x64"
      sha256 "2f2d6ed3952e5812dbe4451994cce7be5501284b7792e8f583518b29695d4026"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.160/graphmind-cli-linux-x64"
    sha256 "4c813256021126a3f62daa76f8996fad655c2aa55cfa890abc25e2f143b86015"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
