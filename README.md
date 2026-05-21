# homebrew-verql

A [Homebrew](https://brew.sh/) tap for [Verql](https://github.com/arshad-shah/verql) — a fast, extensible desktop database client.

## Install

```bash
brew install --cask arshad-shah/verql/verql
```

Or, equivalently:

```bash
brew tap arshad-shah/verql
brew install --cask verql
```

## Why install via brew?

Verql's macOS builds are currently unsigned (no Apple Developer ID). The cask's `postflight` block strips the quarantine attribute on install, so launching from Finder/Spotlight Just Works — no "damaged" dialog. Once Verql ships with a Developer ID signature this clause goes away.

## Upgrade / Uninstall

```bash
brew upgrade --cask verql
brew uninstall --cask verql
```

## Migrating from Nova

Verql was previously called Nova. To switch over:

```bash
brew uninstall --cask arshad-shah/nova/nova   # if you still have the old tap
brew untap arshad-shah/nova                   # optional cleanup
brew install --cask arshad-shah/verql/verql
```

## Repository

The cask formula in this repository is updated automatically when a new tag is pushed to [arshad-shah/verql](https://github.com/arshad-shah/verql).
