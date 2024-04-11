cask "greenlight" do
  version "2.3.0"
  sha256 "e27b2128a47e7157ca1a98c0913a17c7ae8582f1d35afec3b09d44c9b3da7a56"

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
