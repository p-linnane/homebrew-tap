cask "macosdb" do
  version "1.8.1"
  sha256 "fe1150c83bc824fb6278b449f464f71d5983ed259dfbca360cb76120921b1ccd"

  url "https://github.com/p-linnane/macOSdb/releases/download/#{version}/macOSdb-#{version}.zip"
  name "macOSdb"
  desc "Browse and compare open-source components shipped in IPSW files"
  homepage "https://github.com/p-linnane/macOSdb"

  depends_on arch: :arm64
  depends_on macos: ">= :sequoia"

  app "macOSdb.app"
  binary "#{appdir}/macOSdb.app/Contents/MacOS/macosdb-tool", target: "macosdb"

  zap trash: [
    "~/Library/Application Scripts/io.linnane.macOSdb",
    "~/Library/Caches/io.linnane.macosdb",
    "~/Library/Caches/macosdb",
    "~/Library/Caches/macOSdbApp",
    "~/Library/Containers/io.linnane.macOSdb",
    "~/Library/HTTPStorages/io.linnane.macosdb",
    "~/Library/HTTPStorages/macosdb",
    "~/Library/HTTPStorages/macOSdbApp",
    "~/Library/Preferences/io.linnane.macosdb.plist",
    "~/Library/Preferences/macOSdbApp.plist",
  ]
end
