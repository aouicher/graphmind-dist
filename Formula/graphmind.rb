class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.56"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.56/graphmind-aarch64-apple-darwin"
      sha256 "0eccdfd70a9cd9bf5e007cbf5fa995fa4f871f34c0fcb71124783782076a2cdf"
    else
      url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.56/graphmind-x86_64-apple-darwin"
      sha256 "fe1a6efcf7932411218b0754ac3924ab44a14ba20f1556de17d12d8d7d5fab5c"
    end
  end

  on_linux do
    url "https://github.com/aouicher/homebrew-graphmind/releases/download/v0.2.56/graphmind-x86_64-unknown-linux-gnu"
    sha256 "80b4df9b7381942bbfbdb8ac6149d6201295f83ce3d365b43f939f43ac659727"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
