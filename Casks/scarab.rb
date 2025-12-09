cask "scarab" do
  version "2.7.0.0"
  sha256 "9c6b96df169294a47652d52755d1de37b93f9615b60b86e098a98efc479c9392"

  url "https://github.com/fifty-six/Scarab/releases/download/v#{version}/mac.zip"
  name "Scarab"
  desc "Mod manager for Hollow Knight"
  homepage "https://github.com/fifty-six/Scarab"

  app "Scarab.app"

  zap trash: "~/Library/Application Support/HKModInstaller"

  caveats <<~EOS
    This software is not signed and does not meet macOS Gatekeeper requirements.
    Running it requires bypassing built-in macOS protections, which reduces system security.
  EOS
end
