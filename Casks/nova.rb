cask "nova" do
  version "0.2.4"

  on_arm do
    sha256 "bb35c9f6962f11a309d3f835e467e91395a0d8b1b6e4f20d06fef8d456b6be17"
    url "https://github.com/arshad-shah/nova/releases/download/v#{version}/nova-#{version}-arm64.dmg",
        verified: "github.com/arshad-shah/nova/"
  end

  on_intel do
    sha256 "c9470317acb3005c2e572ecb53d25bddac6ac9b7d9c794acb4c068b0f45076c1"
    url "https://github.com/arshad-shah/nova/releases/download/v#{version}/nova-#{version}.dmg",
        verified: "github.com/arshad-shah/nova/"
  end

  name "Nova"
  desc "Fast, extensible desktop database client"
  homepage "https://github.com/arshad-shah/nova"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: ">= :ventura"

  app "nova.app"

  zap trash: [
    "~/Library/Application Support/nova",
    "~/Library/Logs/nova",
    "~/Library/Preferences/com.electron.nova.plist",
    "~/Library/Saved Application State/com.electron.nova.savedState",
  ]
end
