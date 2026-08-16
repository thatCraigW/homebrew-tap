class Qbitty < Formula
  desc "Terminal UI client for qBittorrent"
  homepage "https://github.com/thatCraigW/qBitty"
  url "https://github.com/thatCraigW/qBitty/archive/refs/tags/v0.8.2.tar.gz"
  sha256 "fdf9bdd17886646d0130395f8eba4c909704ffe810bc507fe1200eda5dc451f"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"qbitty", "."
  end

  test do
    assert_match "configuration required", shell_output("#{bin}/qbitty 2>&1", 1)
  end
end
