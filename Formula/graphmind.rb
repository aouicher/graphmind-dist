class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.84"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.84/graphmind-cli-macos-arm64"
      sha256 "bd639bf9c14ac095e29360f004d058fb9b7e088f1a8bc8e7cecf0bfe692ab71b"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.84/graphmind-cli-macos-x64"
      sha256 "119915457d77d7fc92691f7460a6f052b511f1e54dd2932dc3be6cf9e06c13ff"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.84/graphmind-cli-linux-x64"
    sha256 "e9d46c658307bd1bd6f474c33daa3a7c9c8c34339a81842c863fd313bade9333"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
