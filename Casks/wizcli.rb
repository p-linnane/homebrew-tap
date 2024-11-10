cask "wizcli" do
  arch arm: "arm64", intel: "amd64"

  version "0.56.0"
  sha256 arm:   "37c009e843b06f39fe9a86f106620c3564b705cf8e9f65c8e55f157dd58994f4",
         intel: "32cee3395350f4602b69d3d102801dfb3d2f99cd79a86a3ea82abc899ed20892"

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
