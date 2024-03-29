cask "greenlight" do
  version "2.2.1"
  sha256 "f79ae7ec1c85f5f30132b2861023266af52789cc81bcfa3c38824164b327c1a5"

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
