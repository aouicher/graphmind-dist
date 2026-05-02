class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.62"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.62/graphmind-cli-macos-arm64"
      sha256 "f9a685ff6d770aafb15d45d81f7b03cea3f979c63a88592df8ced248fc63bf92"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.62/graphmind-cli-macos-x64"
      sha256 "05b50e22fc050eea42996368d6969b120c617bbc4d883f419127443b41484d97"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.62/graphmind-cli-linux-x64"
    sha256 "1af9072e70d06ec932d85eeb0c8f434b3ce033cc85a36cad5456a9b365bd0b87"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
