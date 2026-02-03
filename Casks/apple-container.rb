cask "apple-container" do
  version "0.9.0"
  sha256 "e8a432b11f396d5ce50e44ea14f02f7df90ffcef441c916b2fa92b63e95f5801"

  url "https://github.com/apple/container/releases/download/#{version}/container-installer-signed.pkg"
  name "container"
  desc "Create and run Linux containers using lightweight virtual machines"
  homepage "https://github.com/apple/container"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :sequoia"

  pkg "container-installer-signed.pkg"

  # container APIs aren't guaranteed to be backward compatible,
  # so we stop the system service to ensure no components are out of sync.
  # Ref: https://github.com/apple/container/issues/551#issuecomment-3246928923
  postflight do
    system_command "/usr/local/bin/container",
                   args: ["system", "stop"]
  end

  uninstall pkgutil: "com.apple.container-installer"

  zap trash: "~/Library/Application Support/com.apple.container"

  caveats <<~EOS
    This cask uses the official Apple .pkg installer rather than building from source.
    Most users should install the `container` formula from Homebrew/core instead of this cask.
  EOS
end
