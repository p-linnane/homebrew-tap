cask "ryujinx" do
  version "1.1.1366"
  sha256 "52f873ac9f509836c53ef68f63ca0cd8f095febd7d81390b1bb642417abd9dd7"

  url "https://github.com/Ryujinx/release-channel-master/releases/download/#{version}/ryujinx-#{version}-macos_universal.app.tar.gz",
      verified: "github.com/Ryujinx/release-channel-master/"
  name "Ryujinx"
  desc "Nintendo Switch emulator"
  homepage "https://ryujinx.org/"

  depends_on macos: ">= :monterey"

  app "Ryujinx.app"

  zap trash: [
    "~/Library/Application Support/Ryujinx",
    "~/Library/Logs/Ryujinx",
    "~/Library/Preferences/org.ryujinx.Ryujinx.plist",
    "~/Library/Saved Application State/org.ryujinx.Ryujinx.savedState",
  ]
end
