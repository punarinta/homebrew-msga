cask "msga" do
  version "45"
  sha256 "fcad8b1c91341b775e13f818f5a47f32c973f9127cb5325efec1106b64d28487"

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
