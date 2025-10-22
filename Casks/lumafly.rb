cask "lumafly" do
  version "3.3.0.0"
  sha256 "2e45dee4ca450bd46926540c19e98b9a452759eaa233cf5d5d258c2dc2866f0d"

  url "https://github.com/TheMulhima/Lumafly/releases/download/v#{version}/Lumafly-MacOS.zip",
      verified: "github.com/TheMulhima/Lumafly/"
  name "Lumafly"
  desc "Mod manager for Hollow Knight"
  homepage "https://themulhima.github.io/Lumafly/"

  app "Lumafly.app"

  zap trash: "~/.config/HKModInstaller"

  caveats <<~EOS
    This software is not signed and does not meet macOS Gatekeeper requirements.
    Running it requires bypassing built-in macOS protections, which reduces system security.
  EOS
end
