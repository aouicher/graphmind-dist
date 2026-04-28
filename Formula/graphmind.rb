class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.17/graphmind-aarch64-apple-darwin"
      sha256 "1cbe0d02304be54dae38a43829ac9327885e626762329ed4299cd84c211c91c0"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.17/graphmind-x86_64-apple-darwin"
      sha256 "12311220431c655c77d8f9cc10fe8d31476a4414c73725b7bedc36d4111ba02f"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.17/graphmind-x86_64-unknown-linux-gnu"
    sha256 "4e1995dcf04ca2cbbb057950d87b5d6be3ca04ce550026b5aa499c6c06e9dda0"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
