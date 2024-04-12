cask "greenlight" do
  version "2.3.1"
  sha256 "8ee2bd65cdeeb3a5af772e5f4b5d6d47f80e48a04db3fd276fc67b70e573452b"

  url "https://github.com/unknownskl/greenlight/releases/download/v#{version}/Greenlight-#{version}-universal.dmg"
  name "Greenlight"
  desc "Client for xCloud and Xbox home streaming"
  homepage "https://github.com/unknownskl/greenlight"

  depends_on macos: ">= :catalina"

  app "Greenlight.app"

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.unknownskl.greenlight.sfl*",
    "~/Library/Application Support/greenlight",
    "~/Library/Preferences/com.unknownskl.greenlight.plist",
    "~/Library/Saved Application State/com.unknownskl.greenlight.savedState",
  ]
end
