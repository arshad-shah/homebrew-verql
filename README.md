# homebrew-nova

A [Homebrew](https://brew.sh/) tap for [Nova](https://github.com/arshad-shah/nova) — a fast, extensible desktop database client.

## Install

```bash
brew install --cask arshad-shah/nova/nova
```

Or, equivalently:

```bash
brew tap arshad-shah/nova
brew install --cask nova
```

## Why install via brew?

Nova's macOS builds are currently unsigned (no Apple Developer ID). When you download the `.dmg` directly from a browser, macOS sets the quarantine bit and refuses to launch the app with a misleading "damaged" message. Homebrew installs casks without setting that bit, so the app just runs.

Once Nova ships with a Developer ID signature, this distinction goes away and the direct `.dmg` download will work too — the tap will continue to work either way.

## Upgrade

```bash
brew upgrade --cask nova
```

## Uninstall

```bash
brew uninstall --cask nova
```

## Repository

The cask formula in this repository is updated automatically when a new tag is pushed to [arshad-shah/nova](https://github.com/arshad-shah/nova).
