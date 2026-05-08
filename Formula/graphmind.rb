class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.136"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.136/graphmind-cli-macos-arm64"
      sha256 "de26e609fc7c232944f6573658d73974e6476e2dd34a9928228aa7e11694e066"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.136/graphmind-cli-macos-x64"
      sha256 "86dba508344039ccd4c8d446f0d3226022a62e3b806a5af22c9b8d1ce450d0d2"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.136/graphmind-cli-linux-x64"
    sha256 "0ca6d5acd71677b2936cd9b3102730920fa03a539a22598cb96aa027b71d58ba"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
