cask "pinprick" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.5.0"

  url "https://github.com/p-linnane/pinprick/releases/download/v#{version}/pinprick-#{version}-#{arch}-#{os}.tar.gz"
  name "pinprick"
  desc "Pin your GitHub Actions. Prick holes in their supply chain security"
  homepage "https://github.com/p-linnane/pinprick"

  on_macos do
    sha256 "5ced1f275b6f0e0e00e4aba357a3620d53b0d15a4ff7e52204c3dd921c5d9fd1"

    depends_on arch: :arm64
  end

  on_linux do
    sha256 arm64_linux:  "e9b29df47c83aae6dfb22df0177e1d025f5d1e9149820f8230d39423b3af0683",
           x86_64_linux: "85da6800e7c982bc20c66c34ce59394f4fea5380250e8b275d2b0b4181d39e28"
  end

  binary "pinprick"

  zap trash: "~/.config/pinprick"
end
