cask "msga" do
  version "38"
  sha256 "328fa7760e8ae966d5c6b50ee4776d69492b4da4c20d2a4348ff46bb1ff5ba10"

  url "https://github.com/punarinta/homebrew-msga/releases/download/v#{version}/msga-macos-arm64.dmg"
  name "msga"
  desc "Fast native client for Slack"
  homepage "https://msga.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself; `brew upgrade` leaves it alone unless --greedy.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "msga.app"

  zap trash: [
    "~/Library/Application Support/msga",
    "~/Library/Caches/msga",
    "~/Library/Preferences/com.msga.msga.plist",
    "~/Library/Preferences/com.nisdos.msga.plist",
  ]

  caveats <<~EOS
    msga is not notarized by Apple. On first launch macOS blocks it: open
    System Settings → Privacy & Security and click "Open Anyway".
  EOS
end
