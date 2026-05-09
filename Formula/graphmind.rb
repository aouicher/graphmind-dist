class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.152"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.152/graphmind-cli-macos-arm64"
      sha256 "85fe89fd2839a01a42c823adefa2bd2c1fe8c28a97d0f6ba66b74696d34c20e2"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.152/graphmind-cli-macos-x64"
      sha256 "db17c520f0be376b2200fff7017256ea3023298beb5470836510510e1347b1c2"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.152/graphmind-cli-linux-x64"
    sha256 "17cfdeeb9e79ab45fac7f5a59d4b7f9f614bf7b1bd87f5e945605f4e0769d21d"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
