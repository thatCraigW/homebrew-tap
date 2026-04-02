class Qbitty < Formula
  desc "Terminal UI client for qBittorrent"
  homepage "https://github.com/thatCraigW/qBitty"
  url "https://github.com/thatCraigW/qBitty/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "c21b9c25ec00624d2741db103f0f7600ea35f772f20de67396368627c302f2ef"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"qbitty", "."
  end

  test do
    assert_match "configuration required", shell_output("#{bin}/qbitty 2>&1", 1)
  end
end
