cask "pinprick" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.4.2"

  url "https://github.com/p-linnane/pinprick/releases/download/v#{version}/pinprick-#{version}-#{arch}-#{os}.tar.gz"
  name "pinprick"
  desc "Pin your GitHub Actions. Prick holes in their supply chain security"
  homepage "https://github.com/p-linnane/pinprick"

  on_macos do
    sha256 "5375fda6622a19bfbb0a51a8be3d6808fa12dd77e1ae2334043d4da7130289fb"

    depends_on arch: :arm64
  end

  on_linux do
    sha256 arm64_linux:  "9d4b2ab92a023fbf3557e19e2e00ad3509a177482850aced54faeb469eb71d61",
           x86_64_linux: "beaf4dd56fc960a1f83213d6015744f33e480845a4d04185ba0b4c11d98f21cb"
  end

  binary "pinprick"

  zap trash: "~/.config/pinprick"
end
