class Graphmind < Formula
  desc "Local-first code intelligence CLI with MCP server"
  homepage "https://github.com/aouicher/graphmind"
  license "MIT"
  version "0.2.96"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.96/graphmind-cli-macos-arm64"
      sha256 "a5c2fe5bc7a3a5bb05dd4ec3e993f8f940521f775d2cea9107b37cd75904fedc"
    else
      url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.96/graphmind-cli-macos-x64"
      sha256 "6407624671234178a70d03bf27e5466626794a3ccfc19090106ec402bd2a64d1"
    end
  end

  on_linux do
    url "https://github.com/aouicher/graphmind-dist/releases/download/v0.2.96/graphmind-cli-linux-x64"
    sha256 "9e87b10809f932faf0bf29a54d9a2b43305158aa539b9737719807b3daf18a62"
  end

  def install
    binary = Dir["graphmind-*"].first || "graphmind"
    bin.install binary => "graphmind"
  end

  test do
    assert_match "graphmind", shell_output("#{bin}/graphmind --help")
  end
end
