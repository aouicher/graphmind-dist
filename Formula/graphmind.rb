class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.109"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.109/graphmind-cli-macos-arm64"
      sha256 "285d272b3ea8773afe1c65af280bc6c9c4c6e763b526c99704eea48609124c85"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.109/graphmind-cli-macos-x64"
      sha256 "14a2c797c7e68f257cecad542122fd1eedfd50b40943632298e12eb1a7158604"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.109/graphmind-cli-linux-x64"
    sha256 "85437b0fe6bd4ca3ee4fdb532fe6d471319c25fcf817af621f49da5b93b51da9"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
