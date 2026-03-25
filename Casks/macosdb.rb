cask "macosdb" do
  version "1.4.0"
  sha256 "1c7fb97427e936c6f4c638d11bb2c72f4e0770beb55651ed77b0f21c624b12e0"

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
