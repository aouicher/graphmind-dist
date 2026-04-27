class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.0-rc1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind/releases/download/v#{version}/graphmind-aarch64-apple-darwin"
      sha256 "23341cc39e23858aade6f7e9cba5d61832d17cf1b4d9661c6d50b1b45d5b8947"
    else
      url "https://github.com/aouicher/graphmind/releases/download/v#{version}/graphmind-x86_64-apple-darwin"
      sha256 "PLACEHOLDER_X86_64_DARWIN"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind/releases/download/v#{version}/graphmind-x86_64-unknown-linux-gnu"
    sha256 "PLACEHOLDER_X86_64_LINUX"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
