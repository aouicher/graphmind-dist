class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.60"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.60/graphmind-cli-macos-arm64"
      sha256 "3c0be56d1199c1f2a62b98afd0da9432a21e9d36b844760873d8fab965ee350c"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.60/graphmind-cli-macos-x64"
      sha256 "820da9de8659615a509aca87eb5659e4a60e1bb0a9ce302b7fe0dcd3bbafc941"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.60/graphmind-cli-linux-x64"
    sha256 "0cd0602051ebaaffaf40acdbcc137ba77dfa358319e451cbf72c195fa4ce6619"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
