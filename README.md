# AndreCamm Homebrew tap

Homebrew casks for my small macOS tools.

| Cask | What it does | Install |
|---|---|---|
| [Trickle](https://github.com/AndreCamm/Trickle) | Shows live charging wattage in the menu bar | `brew install andrecamm/tap/trickle` |
| [Unghost](https://github.com/AndreCamm/Unghost) | Clears extra Claude icons from the Dock | `brew install andrecamm/tap/unghost` |

## Install

Run the install command for the app you want. Homebrew adds this tap the first time.

To update, run `brew upgrade`. To remove an app, run `brew uninstall --cask trickle` (or `unghost`). Add `--zap` to also delete its settings.

## About the quarantine step

The apps are not notarised by Apple yet. A downloaded app that is not notarised is blocked the first time you open it.

Each cask removes the quarantine flag from the app after install, so the app opens without a Gatekeeper prompt. The step changes only the app that the cask installs.

Notarised releases will replace this step. You can read the source of each app and build it yourself instead. Each app's README explains how.

## How the casks stay current

Each app's release workflow updates its cask when a new version is tagged. `brew livecheck andrecamm/tap/trickle` reports the latest release if a cask falls behind.

## License

[MIT](LICENSE)
