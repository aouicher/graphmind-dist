class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.11/graphmind-aarch64-apple-darwin"
      sha256 "844410b2f36cee110947330798455f63aa56199cc536233189578be8d5c49f91"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.11/graphmind-x86_64-apple-darwin"
      sha256 "21d6bfaaefec14b2b4a65ee67f754d82a52462daac250749a0915796a32d17e2"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.11/graphmind-x86_64-unknown-linux-gnu"
    sha256 "b266eb42d44973307c598c51a48b40755449af10c5a0700f17fc5c09ee2e647b"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
