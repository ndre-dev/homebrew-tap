cask "unghost" do
  version "1.1.0"
  sha256 "ceaa4a2f1f2d501d27cd80682cff1d56d709807471ba4a06bce03542190e048a"

  url "https://github.com/ndre-dev/Unghost/releases/download/v#{version}/Unghost.zip"
  name "Unghost"
  desc "Menu bar app that clears extra Claude icons from the Dock"
  homepage "https://github.com/ndre-dev/Unghost"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Unghost.app"

  # The app is not notarised yet. Clear the quarantine flag so it opens
  # without a Gatekeeper prompt. Remove this once releases are notarised.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Unghost.app"]
  end

  uninstall quit: "io.github.andrecamm.claudedockclean"

  zap trash: "~/Library/Preferences/io.github.andrecamm.claudedockclean.plist"

  caveats <<~EOS
    Unghost clears the extra icons already in the Dock. To stop new ones
    appearing, install the guard from the source repository:

      git clone https://github.com/ndre-dev/Unghost.git
      python3 Unghost/guard/patch.py --install

    Keep the cloned folder. The guard's login item runs from it.
  EOS
end
