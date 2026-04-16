cask "pinprick" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.6.0"

  url "https://github.com/p-linnane/pinprick/releases/download/v#{version}/pinprick-#{version}-#{arch}-#{os}.tar.gz"
  name "pinprick"
  desc "Pin your GitHub Actions. Prick holes in their supply chain security"
  homepage "https://github.com/p-linnane/pinprick"

  on_macos do
    sha256 "b4ef4ac96ad4a14fb89e686e24361cfdbd5c136094205fc06b98155a86ad94ed"

    depends_on arch: :arm64
  end

  on_linux do
    sha256 arm64_linux:  "fdf92e0281b00f05b76b9086978b1271123b868f6f850735515a4fc10e4c6326",
           x86_64_linux: "dcffeac292276ce59ff9804c1e19f4a757e878e244e6ac39cb6f8768190dca1b"
  end

  binary "pinprick"

  zap trash: "~/.config/pinprick"
end
