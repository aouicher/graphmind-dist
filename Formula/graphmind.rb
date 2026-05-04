class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.90"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.90/graphmind-cli-macos-arm64"
      sha256 "b441a3ba1f94cb435a58ce2f5b2ef5d559e5ae7863024a3c1d8e0054cba76785"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.90/graphmind-cli-macos-x64"
      sha256 "a9ffd79b3067f9d8514731705cd79b95085f1b5b6260faf66863d0b009ff4974"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.90/graphmind-cli-linux-x64"
    sha256 "dbb63e42e01a59b505e16787e01d9c01f9fb2d7237176077512c5f1431c36220"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
