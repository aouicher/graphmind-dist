class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.59"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.59/graphmind-aarch64-apple-darwin"
      sha256 "e045ea4598efc9537f7a461ed99d36b835e20e2f92969213d0498c191c77f296"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.59/graphmind-x86_64-apple-darwin"
      sha256 "71f42801ba5c0a567ae53f7b480b7fe3d448945f9f48eb12283d02700011b47b"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.59/graphmind-x86_64-unknown-linux-gnu"
    sha256 "544eda453dc6d1095e0faf878956f7649e4a5c9825ebe526ece7682d401958ce"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
