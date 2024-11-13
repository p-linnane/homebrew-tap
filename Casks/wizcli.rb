cask "wizcli" do
  arch arm: "arm64", intel: "amd64"

  version "0.57.0"
  sha256 arm:   "9c877cfa516ec1d291dc9388948420c5db4988405f080038da573fa5e950f81b",
         intel: "03c9f0861e3bf7ce533467095009f2bdbf27754a334389037a658e44425ad7a6"

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
