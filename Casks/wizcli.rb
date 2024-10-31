cask "wizcli" do
  arch arm: "arm64", intel: "amd64"

  version "0.53.0"
  sha256 arm:   "38bbe8bb47a647e1c74ed91ca7cafa903946c3b2e4070121b707aa22d172082f",
         intel: "eb374971bb1689459be97154657853a68fa41409b28dd9bc1a17fa12e0c74642"

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
