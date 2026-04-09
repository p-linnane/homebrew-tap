cask "pinprick" do
  version "0.1.1"
  sha256 "b3cbcc941d0fa65756698ee59b75222265e45fca5d4bcb3ca4413cf22a925662"

  url "https://github.com/p-linnane/pinprick/releases/download/v#{version}/pinprick-#{version}-aarch64-apple-darwin.tar.gz"
  name "pinprick"
  desc "Pin your GitHub Actions. Prick holes in their supply chain security"
  homepage "https://github.com/p-linnane/pinprick"

  depends_on arch: :arm64

  binary "pinprick"

  zap trash: "~/.config/pinprick"
end
