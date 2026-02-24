cask "devtoysmac" do
  version "0.0.11"
  sha256 "84f6b354546b1731204deb48daed53caacab277b524bcdd8d5e47d53fc47b413"

  url "https://github.com/DevToys-app/DevToysMac/releases/download/#{version}/DevToys.app.zip"
  name "DevToysMac"
  desc "This is the mac app version of Windows DevToys!"
  homepage "https://github.com/DevToys-app/DevToysMac"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "DevToys.app"

  zap trash: [
    "~/Library/Preferences/com.yuki.DevToys.plist",
  ]
end
