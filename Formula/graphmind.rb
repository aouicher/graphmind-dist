class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.63"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.63/graphmind-cli-macos-arm64"
      sha256 "0fd2e3e023a1e7d1dba1b148280f3e78f8f0bae57fde6ea287f883f410b76037"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.63/graphmind-cli-macos-x64"
      sha256 "b4398e103f6ae68055d4459ab6ebcaa7d7966a0ff01e271cd87a14622f79b7f5"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.63/graphmind-cli-linux-x64"
    sha256 "142300c3493a7f6bd03adf4cb9fce0ccf517c25a84d78abc4bb6a9aa5cc36c92"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
