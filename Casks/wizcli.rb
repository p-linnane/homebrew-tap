cask "wizcli" do
  arch arm: "arm64", intel: "amd64"

  version "0.54.0"
  sha256 arm:   "cc947baabe77ba8900062612dd4d70aac4b15e9f64cc9ba3e7b18334a0ad1245",
         intel: "23f174efbf3dbfdad9486211ed16e94004fe35593ec268c453e6b76de198807c"

  url "https://downloads.wiz.io/wizcli/latest/wizcli-darwin-#{arch}"
  name "Wiz CLI"
  desc "CLI for interacting with the Wiz platform"
  homepage "https://www.wiz.io/"

  livecheck do
    url "https://downloads.wiz.io/wizcli/latest/wizcli-version"
    regex(/cli:\s"(\d+(?:\.\d+)+)/i)
    strategy :page_match
  end

  binary "wizcli-darwin-#{arch}", target: "wizcli"

  zap trash: "~/.wiz"
end
