cask "gematik-authenticator" do
  version "4.15.2"
  sha256 "04c92f9848d4abc7ffd2887d11305166e8453e46d0e2fb3eb994e63b9ab173b5"

  url "https://github.com/gematik/app-Authenticator/releases/download/#{version}/gematik-Authenticator-#{version}.dmg",
      verified: "github.com/gematik/app-Authenticator/"
  name "Gematik Authenticator"
  desc "Securely authenticate users for login to digital health applications"
  homepage "https://fachportal.gematik.de/hersteller-anbieter/komponenten-dienste/authenticator/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "gematik Authenticator.app"

  zap trash: [
    "~/Library/Application Support/gematik Authenticator",
    "~/Library/Preferences/de.gematik.authenticator.plist",
    "~/Library/Saved Application State/de.gematik.authenticator.savedState",
  ]
end
