cask "pinprick" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.5.1"

  url "https://github.com/p-linnane/pinprick/releases/download/v#{version}/pinprick-#{version}-#{arch}-#{os}.tar.gz"
  name "pinprick"
  desc "Pin your GitHub Actions. Prick holes in their supply chain security"
  homepage "https://github.com/p-linnane/pinprick"

  on_macos do
    sha256 "2a7f01b2c7cbf4574ca76e7e49106f305bc27a39db943c01e3721a598827333d"

    depends_on arch: :arm64
  end

  on_linux do
    sha256 arm64_linux:  "cbdfd9bb33131c25c042a922889a29a9b555d18dfcd3b53e3cfe2074a5ece5c8",
           x86_64_linux: "7d2a93f6ca8ec1b1497abfa7f0e97eecfd2528c65000ef94a55a527d4d833f43"
  end

  binary "pinprick"

  zap trash: "~/.config/pinprick"
end
