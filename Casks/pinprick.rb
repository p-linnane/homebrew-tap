cask "pinprick" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.3.1"

  url "https://github.com/p-linnane/pinprick/releases/download/v#{version}/pinprick-#{version}-#{arch}-#{os}.tar.gz"
  name "pinprick"
  desc "Pin your GitHub Actions. Prick holes in their supply chain security"
  homepage "https://github.com/p-linnane/pinprick"

  on_macos do
    sha256 "f5afd4bc0b4391945b7a8bb156ee7cd2d2bfd974e30e701ae33bd1dd09075801"

    depends_on arch: :arm64
  end

  on_linux do
    sha256 arm64_linux:  "80f48f85a6ca4c93cfdcff29338b1e00c300db3e9da9dc81a265a6fbef59f190",
           x86_64_linux: "008ea8843d660754223672c4d9daac4a239f7db72d0a18f8109a7fdd2a40f3b2"
  end

  binary "pinprick"

  zap trash: "~/.config/pinprick"
end
