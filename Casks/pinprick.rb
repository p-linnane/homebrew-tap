cask "pinprick" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.3.2"

  url "https://github.com/p-linnane/pinprick/releases/download/v#{version}/pinprick-#{version}-#{arch}-#{os}.tar.gz"
  name "pinprick"
  desc "Pin your GitHub Actions. Prick holes in their supply chain security"
  homepage "https://github.com/p-linnane/pinprick"

  on_macos do
    sha256 "7abbdfc1cae4ebc5f18109de670ffda7d8bfaf9d296d7416aac57ddea1282691"

    depends_on arch: :arm64
  end

  on_linux do
    sha256 arm64_linux:  "b99ddf60a1315fafe2e89eb80815bb654f6569ad567bf9cf8c182600482e5032",
           x86_64_linux: "7626db0db4d242206af54db16034b6bc4a5e327e205d7f489f06446d4007c603"
  end

  binary "pinprick"

  zap trash: "~/.config/pinprick"
end
