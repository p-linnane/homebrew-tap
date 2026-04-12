cask "pinprick" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.4.1"

  url "https://github.com/p-linnane/pinprick/releases/download/v#{version}/pinprick-#{version}-#{arch}-#{os}.tar.gz"
  name "pinprick"
  desc "Pin your GitHub Actions. Prick holes in their supply chain security"
  homepage "https://github.com/p-linnane/pinprick"

  on_macos do
    sha256 "96ce4e860a3374cea16b5077b7fbb80542f31aa9edb3ed9894edd648fedf5658"

    depends_on arch: :arm64
  end

  on_linux do
    sha256 arm64_linux:  "ae81a8d39af9ba8b4756f1059f6da57a57804aa1da363dc4134ec10c52f9402b",
           x86_64_linux: "84014a3dcbefa16c6cca21a8b7a2a6385d194e0890569b54d2555a317d472d42"
  end

  binary "pinprick"

  zap trash: "~/.config/pinprick"
end
