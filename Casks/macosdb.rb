cask "macosdb" do
  version "1.10.0"
  sha256 "ad122ff8d936a491e9ef4d1ab8a37e2ddaeee5e063f63b7722337c20b7247d1e"

  url "https://github.com/p-linnane/macOSdb/releases/download/#{version}/macOSdb-#{version}.zip"
  name "macOSdb"
  desc "Catalog of open-source components from .ipsw and .xip files"
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
