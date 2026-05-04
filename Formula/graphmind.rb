class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.87"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.87/graphmind-cli-macos-arm64"
      sha256 "c375baeed5accede8c7d15c26d5fc1f1c13980885aee401d2e3b7783efcd2e3b"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.87/graphmind-cli-macos-x64"
      sha256 "015f00c51b23f456e4f06f1a351dad0cdaab024c98f56aaefbe8763cf4818a3f"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.87/graphmind-cli-linux-x64"
    sha256 "cad8aece98821351fd7034fe6c34ce37b8ed759d826d78ce3690e94d16210979"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
