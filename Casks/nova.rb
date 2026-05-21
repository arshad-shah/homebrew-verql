cask "nova" do
  version "0.2.5"

  on_arm do
    sha256 "cae5dd7cae0db6f9575a2d1591629312e4f29c606565ba04abe8198fa7f83fbd"
    url "https://github.com/arshad-shah/nova/releases/download/v#{version}/nova-#{version}-arm64.dmg",
        verified: "github.com/arshad-shah/nova/"
  end

  on_intel do
    sha256 "1ffc0bafb0b80779c7e5a56620995058171d7399bc3a436419dccab41b920ebf"
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
