cask "wizcli" do
  arch arm: "arm64", intel: "amd64"

  version "0.58.0"
  sha256 arm:   "c648a6ca79bf244c4ca3a3e529ca625321b97ac7feb31e97485ee40e2dc2014b",
         intel: "3db2bf69ce8a2e3433eeb13e71b5180458dcaeec4ab8e8b3daa6fcbde3eb2b3b"

  url "https://downloads.wiz.io/wizcli/#{version}/wizcli-darwin-#{arch}"
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
