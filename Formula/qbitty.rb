class Qbitty < Formula
  desc "Terminal UI client for qBittorrent"
  homepage "https://github.com/thatCraigW/qBitty"
  url "https://github.com/thatCraigW/qBitty/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "bff9792fbe1ca18d59125b99df3517b4662666ee855d303f55e3786cc9184bb4"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"qbitty", "."
  end

  test do
    assert_match "configuration required", shell_output("#{bin}/qbitty 2>&1", 1)
  end
end
