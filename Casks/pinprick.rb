cask "pinprick" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.5.2"

  url "https://github.com/p-linnane/pinprick/releases/download/v#{version}/pinprick-#{version}-#{arch}-#{os}.tar.gz"
  name "pinprick"
  desc "Pin your GitHub Actions. Prick holes in their supply chain security"
  homepage "https://github.com/p-linnane/pinprick"

  on_macos do
    sha256 "520b9bad054d430ce43e086ae38aa6eedbaa4247e3c0d582075fdd97b255a58c"

    depends_on arch: :arm64
  end

  on_linux do
    sha256 arm64_linux:  "e269332f2f879f0bfabd45ac820a30bb24b8495d605ba50bd00ca9294a95a694",
           x86_64_linux: "859c50e0f4427382e1ac14f5e51761b4f33861da888ce1e4ec90272c89e5ee0b"
  end

  binary "pinprick"

  zap trash: "~/.config/pinprick"
end
