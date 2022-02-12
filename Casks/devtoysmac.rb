cask "devtoysmac" do
  version "V0.0.6"
  sha256 "1770202ee4cb3bc45f2100992dceb308f606b130529d70d71abff1e11ad76f28"

  url "https://github.com/ObuchiYuki/DevToysMac/releases/download/0.0.6/DevToys.zip"
  name "DevToysMac"
  desc "This is the mac app version of Windows DevToys!"
  homepage "https://github.com/ObuchiYuki/DevToysMac"

  app "DevToys.app"

  zap trash: [
    "~/Library/Preferences/com.yuki.DevToys.plist",
  ]
end
