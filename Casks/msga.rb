# The Homebrew cask, rendered by the release workflow (.github/workflows/
# release.yml) into punarinta/homebrew-msga as Casks/msga.rb on each release:
# the version is "<MSGA_VERSION>,<release tag>", the hashes are the DMGs'
# (Apple Silicon and Intel).
cask "msga" do
  arch arm: "arm64", intel: "x86_64"

  version "48,2026-11-24"
  sha256 arm:   "d8e0757c841d8330fb2412ec73324bca27e17132df01cfc13d831f6c3d84400b",
         intel: "8a8ff4db0b0838f3c07a5e38b979de2ef50a691c2f94db1f52ea7bb220af1472"

  url "https://github.com/punarinta/make-slack-great-again/releases/download/#{version.csv.second}/msga-macos-#{arch}.dmg"
  name "msga"
  desc "Fast native client for Slack"
  homepage "https://msga.app/"

  # The app updates itself; `brew upgrade` leaves it alone unless --greedy.
  auto_updates true
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
