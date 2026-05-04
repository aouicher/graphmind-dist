class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.88"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.88/graphmind-cli-macos-arm64"
      sha256 "722668f83551027d064dc0f4a649ea47282e97940c3201f685111eff6908e027"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.88/graphmind-cli-macos-x64"
      sha256 "e144db5be2df09b84c93b9347285d46ff6c044d264c7b875c18e85d9b5a3f107"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.88/graphmind-cli-linux-x64"
    sha256 "b544f3301c92bf9baceed41405f6f7d11a655b5d33acebf37d986d049793fefc"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
