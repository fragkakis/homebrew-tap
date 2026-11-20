cask "prty-time" do
  version "0.7.0"
  sha256 "12eea5e576589ab01dbca084dbad21d7aa7764c5337f50c92953dba848e686b1"

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
