cask "wizcli" do
  arch arm: "arm64", intel: "amd64"

  version "0.52.0"
  sha256 arm:   "fee84f7e5525e8cb4d7df7b136b4bc9261ee0a7ac2b72ca122e8b2a36c96df23",
         intel: "23a0ed854acb2028d0e33ac260f7c653639811f51b3aac29d1d1eca30753a5e6"

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
