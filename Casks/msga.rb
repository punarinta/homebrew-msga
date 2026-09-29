cask "msga" do
  version "36"
  sha256 "02fe340782f4c59dc4ae01b5b348fd6fef0b4586daa67801d5fbf94df16ce354"

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
