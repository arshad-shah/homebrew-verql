cask "verql" do
  version "0.6.0"

  on_arm do
    sha256 "2bf50903cfde62b076de5455b1088bc198466d9f2c42c26f5d8ac18d7ceec759"
    url "https://github.com/arshad-shah/verql/releases/download/v#{version}/verql-#{version}-arm64.dmg",
        verified: "github.com/arshad-shah/verql/"
  end

  on_intel do
    sha256 "eed79729cf0774e3e81df19325837240ea4c43ee13a08d7f3dcfac74646ba206"
    url "https://github.com/arshad-shah/verql/releases/download/v#{version}/verql-#{version}-x64.dmg",
        verified: "github.com/arshad-shah/verql/"
  end

  name "Verql"
  desc "Fast, extensible desktop database client"
  homepage "https://github.com/arshad-shah/verql"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: ">= :ventura"

  app "Verql.app"

  # Verql is currently distributed unsigned. Homebrew normally just flips the
  # quarantine flag to "approved", but macOS Sequoia (15+) still rejects the
  # bundle from Finder/Spotlight ("Verql is damaged"). Strip the attribute
  # outright so Gatekeeper never re-evaluates the bundle on launch.
  # Remove this block once we ship signed + notarised builds.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Verql.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Verql",
    "~/Library/Logs/Verql",
    "~/Library/Preferences/com.electron.verql.plist",
    "~/Library/Saved Application State/com.electron.verql.savedState",
  ]
end
