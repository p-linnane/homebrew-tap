cask "wizcli" do
  arch arm: "arm64", intel: "amd64"

  version "0.59.0"
  sha256 arm:   "1c3a36da5be3707ceebc1055033ad37f88f76d7f5150bd55e2b481c545a7a94f",
         intel: "6747cdfb9c1ada6ccc0aee5c76ebd917671c7376f93893832c27678bf8e341f4"

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
