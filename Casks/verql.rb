cask "verql" do
  version "0.12.0"

  on_arm do
    sha256 "ef795e1ace44e8d540ff5d968e6d6b6b5c56e87c9642f73f17660e71c9276806"
    url "https://github.com/arshad-shah/verql/releases/download/v#{version}/verql-#{version}-arm64.dmg",
        verified: "github.com/arshad-shah/verql/"
  end

  on_intel do
    sha256 "4d37eead1c1130588ae9881aaa6dea7fbb54efaffb557d44d5b6375a543f68e1"
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
