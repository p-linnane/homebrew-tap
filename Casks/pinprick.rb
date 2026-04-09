cask "pinprick" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.1.1"

  url "https://github.com/p-linnane/pinprick/releases/download/v#{version}/pinprick-#{version}-#{arch}-#{os}.tar.gz"
  name "pinprick"
  desc "Pin your GitHub Actions. Prick holes in their supply chain security"
  homepage "https://github.com/p-linnane/pinprick"

  on_macos do
    sha256 "b3cbcc941d0fa65756698ee59b75222265e45fca5d4bcb3ca4413cf22a925662"

    depends_on arch: :arm64
  end

  on_linux do
    sha256 arm64_linux:  "1b36066b1511d72e4f57d0e0a01cafe511f7ca4353a996e02e671c0ddd3b20be",
           x86_64_linux: "008ea8843d660754223672c4d9daac4a239f7db72d0a18f8109a7fdd2a40f3b2"
  end

  binary "pinprick"

  zap trash: "~/.config/pinprick"
end
