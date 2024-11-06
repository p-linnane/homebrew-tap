cask "wizcli" do
  arch arm: "arm64", intel: "amd64"

  version "0.55.0"
  sha256 arm:   "e4deee998c4089cff52afe56d28ae82b31fee070a4f4b7ad751a6529a6370ae7",
         intel: "9619afca48784402fb8e099511baefe9ab75c38d328911e7fcbde5b75192c715"

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
