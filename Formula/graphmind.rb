class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.108"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.108/graphmind-cli-macos-arm64"
      sha256 "67613d41e88f16e86dea0f2e8e73b7206ad6bfde0bbcdf47eaec4856a0c05fd1"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.108/graphmind-cli-macos-x64"
      sha256 "5bc6dd2e35b5a14f5f45e520ad474d3dac988dd4dd009cc31fd595569e74743b"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.108/graphmind-cli-linux-x64"
    sha256 "af34475eca59fc8d0f95e8eada4ab3b8bd6a12b9e25ea89dc012cd6622eba640"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
