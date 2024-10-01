cask "ryujinx" do
  version "1.1.1403"
  sha256 "45213edd0a9554562e3621eeeb5eb0977d000f84bf42f076678dcfafbc588293"

  url "https://github.com/Ryujinx/release-channel-master/releases/download/#{version}/ryujinx-#{version}-macos_universal.app.tar.gz",
      verified: "github.com/Ryujinx/release-channel-master/"
  name "Ryujinx"
  desc "Nintendo Switch emulator"
  homepage "https://ryujinx.org/"

  deprecate! date: "2024-10-01", because: :no_longer_available

  depends_on macos: ">= :monterey"

  app "Ryujinx.app"

  zap trash: [
    "~/Library/Application Support/Ryujinx",
    "~/Library/Logs/Ryujinx",
    "~/Library/Preferences/org.ryujinx.Ryujinx.plist",
    "~/Library/Saved Application State/org.ryujinx.Ryujinx.savedState",
  ]
end
