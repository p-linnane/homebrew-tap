cask "wizcli" do
  arch arm: "arm64", intel: "amd64"

  version "0.60.0"
  sha256 arm:   "487fe3adac422200597cc62f6b4b35e0706c51229554939551f1f3b8c94e0354",
         intel: "4a80c00b588fcd086ee17c5090a77517c237715104a2ee86eb3ed45f2fb8eb85"

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
