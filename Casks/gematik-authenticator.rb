cask "gematik-authenticator" do
  version "4.12.0"
  sha256 "19d431bbb8f27cc827901f79b6ef5cc90a889f593c9365b576e458cd7c72f867"

  url "https://github.com/gematik/app-Authenticator/releases/download/v#{version}/gematik-Authenticator-#{version}.dmg",
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
