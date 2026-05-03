class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.73"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.73/graphmind-cli-macos-arm64"
      sha256 "b6f0f09a1ec9abbf4cf15bb42cd1610b622f4a98214de98b7a57200dea758257"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.73/graphmind-cli-macos-x64"
      sha256 "a174435a224f484ed03376b0ecf06ac62cdc63261659e604e2895d8379b24caf"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.73/graphmind-cli-linux-x64"
    sha256 "48d0dcb79091699d87cef7a720c0374d4727a964f9a51a5886d476a733dbc988"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
