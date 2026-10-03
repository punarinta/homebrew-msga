cask "msga" do
  version "37"
  sha256 "5d7b61f2e0e091427f6813fdf123d940ab42d78247cd7168e37603831910d84c"

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
