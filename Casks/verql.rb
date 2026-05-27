cask "verql" do
  version "0.9.0"

  on_arm do
    sha256 "ecb4996db1cf5542e0f866ed22403e512e3b6897c04408e44ee35ae8729f0769"
    url "https://github.com/arshad-shah/verql/releases/download/v#{version}/verql-#{version}-arm64.dmg",
        verified: "github.com/arshad-shah/verql/"
  end

  on_intel do
    sha256 "a9750fe9a3d458d18168e89e4ce9d33ec25276bb3ca5e7828791a47ab94acb26"
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
