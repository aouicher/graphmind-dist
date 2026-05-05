class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.119"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.119/graphmind-cli-macos-arm64"
      sha256 "fc018e24ea32236cde9e09888ae02f3e92cbf3c69674c3f639abbc577f8a8813"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.119/graphmind-cli-macos-x64"
      sha256 "0e89887ae5c748f5a46d8e8021b285d356198fc8a62011553985208066f8f33a"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.119/graphmind-cli-linux-x64"
    sha256 "60e2a118ca55a7773be31fceb9dc654c8e42acfe54878ed19b4f1a4ad37ce764"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
