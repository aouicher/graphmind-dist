class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.22"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.22/graphmind-aarch64-apple-darwin"
      sha256 "37a12940f6bf4db300d8fabe023c9de5d7066996b18652a17ae30889af6f7558"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.22/graphmind-x86_64-apple-darwin"
      sha256 "af909670234b23c38bc34f59e307f7ae54045f736f090aaf7b36c99aa8d39526"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.22/graphmind-x86_64-unknown-linux-gnu"
    sha256 "12af94dcc93cef822b9efdcca849540b73a6c44a3966b35ddade00745923b010"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
