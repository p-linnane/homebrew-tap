cask "pinprick" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.6.1"

  url "https://github.com/p-linnane/pinprick/releases/download/v#{version}/pinprick-#{version}-#{arch}-#{os}.tar.gz"
  name "pinprick"
  desc "Pin your GitHub Actions. Prick holes in their supply chain security"
  homepage "https://github.com/p-linnane/pinprick"

  on_macos do
    sha256 "44091936f289c31f04c85b052ff2e8f80df6a9922af11d15419347dc53a956db"

    depends_on arch: :arm64
  end

  on_linux do
    sha256 arm64_linux:  "e197fc7a1993f69f20f8b04d916f207acc09774555791b7a0bccd03758630170",
           x86_64_linux: "6fcfe70921192b1c018a50ab8eb68dc759b8adb6ceac9029383167bb27813f08"
  end

  binary "pinprick"

  zap trash: "~/.config/pinprick"
end
