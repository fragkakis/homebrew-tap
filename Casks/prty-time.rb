cask "prty-time" do
  version "0.12.0"
  sha256 "e7085497909caef18d6bad3bd874c272b0b0248e6b7886ae2b6b986ecb655690"

  url "https://github.com/fragkakis/prty-time/releases/download/v#{version}/PRty-Time.zip"
  name "PRty Time"
  desc "Menu-bar app for the GitHub pull requests waiting on you"
  homepage "https://github.com/fragkakis/prty-time"

  depends_on formula: "gh"
  depends_on macos: :sequoia

  app "PRty Time.app"

  uninstall quit: "com.fragkakis.prty"

  zap trash: [
    "~/Library/Application Support/Prty",
    "~/Library/Preferences/com.fragkakis.prty.plist",
  ]

  caveats <<~EOS
    PRty Time isn't notarized by Apple, so macOS blocks its first launch.
    Open System Settings → Privacy & Security and click "Open Anyway".
    It reuses the GitHub CLI's login: run `gh auth login` if you haven't.
  EOS
end
