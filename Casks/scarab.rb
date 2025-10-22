cask "scarab" do
  version "2.6.0.0"
  sha256 "d9db9d019584eb1775142b26c4408c1b55e79b01d9d9c6705b408c13a0662c3b"

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
