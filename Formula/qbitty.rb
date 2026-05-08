class Qbitty < Formula
  desc "Terminal UI client for qBittorrent"
  homepage "https://github.com/thatCraigW/qBitty"
  url "https://github.com/thatCraigW/qBitty/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "6e1a097395b7f63dca9a2c9032cb3d58d99237e9179c3bf8de58751d4440ff88"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"qbitty", "."
  end

  test do
    assert_match "configuration required", shell_output("#{bin}/qbitty 2>&1", 1)
  end
end
