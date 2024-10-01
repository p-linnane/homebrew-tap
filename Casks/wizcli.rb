cask "wizcli" do
  arch arm: "arm64", intel: "amd64"

  version "0.51.0"
  sha256 arm:   "d997954d6ab01572b0cd405f3d86de59b35d4085a885a3da1eedd9a7087c9d1c",
         intel: "ecf975c1f8316a21d788a14d5df7835131fca1291cd33840eb95c472574156b1"

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
