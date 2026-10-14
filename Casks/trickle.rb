cask "trickle" do
  version "1.3.0"
  sha256 "88bbe13e7abcaac8e7603bdda9b1a3bfca7fa64b513101e1aa345868d2b65eda"

  url "https://github.com/AndreCamm/Trickle/releases/download/v#{version}/Trickle.zip"
  name "Trickle"
  desc "Menu bar app that shows live charging wattage"
  homepage "https://github.com/AndreCamm/Trickle"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Trickle.app"

  # The app is not notarised yet. Clear the quarantine flag so it opens
  # without a Gatekeeper prompt. Remove this once releases are notarised.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Trickle.app"]
  end

  uninstall quit: "io.github.andrecamm.chargewatts"

  zap trash: "~/Library/Preferences/io.github.andrecamm.chargewatts.plist"
end
