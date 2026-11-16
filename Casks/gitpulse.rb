# Reference copy of Casks/gitpulse.rb in drosam/homebrew-tap.
# The release workflow rewrites `version` and `sha256` in the tap on each stable tag
# (tap GitHub App token, see CONTRIBUTING.md).
cask "gitpulse" do
  version "0.1.0"
  sha256 "b1cad63d94a2ec4d7578719efad30ecc75ca7ff25e34ecf8211b9021b4e9f66d"

  url "https://github.com/drosam/gitpulse/releases/download/v#{version}/GitPulse-#{version}.zip"
  name "GitPulse"
  desc "Menu bar app that tracks your GitHub pull requests and review requests"
  homepage "https://github.com/drosam/gitpulse"

  depends_on macos: :sequoia

  app "GitPulse.app"

  # Unsigned build: drop the quarantine flag so Gatekeeper doesn't block launch.
  # Default appdir only; a custom --appdir keeps quarantine instead of failing the install.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "/Applications/GitPulse.app"],
        must_succeed: false
  end

  zap trash: [
    "~/Library/Preferences/dev.davidrosa.gitpulse.plist",
    "~/Library/Saved Application State/dev.davidrosa.gitpulse.savedState",
  ]
end
