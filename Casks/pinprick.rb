cask "pinprick" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.3.3"

  url "https://github.com/p-linnane/pinprick/releases/download/v#{version}/pinprick-#{version}-#{arch}-#{os}.tar.gz"
  name "pinprick"
  desc "Pin your GitHub Actions. Prick holes in their supply chain security"
  homepage "https://github.com/p-linnane/pinprick"

  on_macos do
    sha256 "9a189626500cffa42b732201d9db667eae60140e1d55ee6a4ab9325f9a77cb81"

    depends_on arch: :arm64
  end

  on_linux do
    sha256 arm64_linux:  "dfe3c27a342377c3c622e27e15e9bbb39dd6c153bff82534dca1cb9997b737a5",
           x86_64_linux: "e27e759eb1e4402acdc799d8e3bb88902d7ac329419b3281cbd33b4e595472a6"
  end

  binary "pinprick"

  zap trash: "~/.config/pinprick"
end
