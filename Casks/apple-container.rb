cask "apple-container" do
  version "0.12.3"
  sha256 "83f363126ac1f064588de39cd6b474340d489c1926492a2c4e59c4d54aa6d8e3"

  url "https://github.com/apple/container/releases/download/#{version}/container-#{version}-installer-signed.pkg"
  name "container"
  desc "Create and run Linux containers using lightweight virtual machines"
  homepage "https://github.com/apple/container"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  pkg "container-#{version}-installer-signed.pkg"

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
