class Qbitty < Formula
  desc "Terminal UI client for qBittorrent"
  homepage "https://github.com/thatCraigW/qBitty"
  url "https://github.com/thatCraigW/qBitty/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "8e6071d637c72620b7770e59598ff9653d3c3d34699580ea5ad803ffce42602e"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"qbitty", "."
  end

  test do
    assert_match "configuration required", shell_output("#{bin}/qbitty 2>&1", 1)
  end
end
