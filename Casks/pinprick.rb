cask "pinprick" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.2.0"

  url "https://github.com/p-linnane/pinprick/releases/download/v#{version}/pinprick-#{version}-#{arch}-#{os}.tar.gz"
  name "pinprick"
  desc "Pin your GitHub Actions. Prick holes in their supply chain security"
  homepage "https://github.com/p-linnane/pinprick"

  on_macos do
    sha256 "ec7cbf1a5951a5e1a2a8ffc63be6b87c5019378d52f128afdc85f3856d95497f"

    depends_on arch: :arm64
  end

  on_linux do
    sha256 arm64_linux:  "195bbefb3961d9203f9589784520f19e621003f2872bf4bad3afaeda4f1bc73c",
           x86_64_linux: "008ea8843d660754223672c4d9daac4a239f7db72d0a18f8109a7fdd2a40f3b2"
  end

  binary "pinprick"

  zap trash: "~/.config/pinprick"
end
