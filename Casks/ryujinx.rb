cask "ryujinx" do
  version "1.1.1321"
  sha256 "f62a77abd63871719b1eec48cab41027120e48073a04538215a55e6a84760672"

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
