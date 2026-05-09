class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.162"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.162/graphmind-cli-macos-arm64"
      sha256 "61d26fcbbaccaae454b5440668a689ba411e89922e361d23403b71da99d57a6d"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.162/graphmind-cli-macos-x64"
      sha256 "d665121605e500afa3b6fcf2c2e9daf0d0084f86f307c28575c44eaa46c529d8"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.162/graphmind-cli-linux-x64"
    sha256 "4e2b781c68757a1af4075d6662e3ea49836af467ec9eb6531a8d33fba3416839"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
