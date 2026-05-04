class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.95"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.95/graphmind-cli-macos-arm64"
      sha256 "626a68ac6053292a93365cdae9c5b2c5080e2abbd65b953adc31f2fe7c848daa"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.95/graphmind-cli-macos-x64"
      sha256 "cf83813f3a3c7e5e2be678b8478189967967ea33b188eda8d6aa3f9983febccd"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.95/graphmind-cli-linux-x64"
    sha256 "334057e4ff5d80c36c7a16785bda0bce964bfad0c03985fe5de1d96f14d3e787"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
