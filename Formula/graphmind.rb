class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.79"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.79/graphmind-cli-macos-arm64"
      sha256 "44ae8b8c1df3bd28f9171336659841461210ce92e81a7146d55ab317180c0b3e"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.79/graphmind-cli-macos-x64"
      sha256 "c6be95e4c70e79bfcd707793bb9bd47f654fce5a08cdaca207cc8abd361f4515"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.79/graphmind-cli-linux-x64"
    sha256 "a64f1c484aca5fabe02b755806612511dac1d54e2cb9cf0987a530203bf924a3"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
