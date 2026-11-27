# Homebrew cask for objectexplorer's desktop app: the
# same code base as the formula's binary, as a macOS .app. tools/create-release.sh
# fills 0.9.47 and the sha256. `brew install --cask knockdata/tap/objectexplorer-app`
cask "objectexplorer-app" do
  arch arm: "arm64", intel: "x64"

  version "0.9.47"
  sha256 arm:   "02ebf0c7314b3e118d817c058ba8d2939f0a1cebafd98dbb1b1a4f6d1ec02372",
         intel: "7d90ed57db1d22257e0e70c46d69da51071b914f373cbed33abc0457f835b6c8"

  url "https://github.com/knockdata/objectexplorer/releases/download/v#{version}/objectexplorer-mac-#{arch}.dmg"
  name "objectexplorer"
  desc "The VSCode for Cloud Storage: explore, analyze and search files and buckets"
  homepage "https://objectexplorer.com"

  depends_on macos: ">= :ventura"

  app "ObjectExplorer.app"
  binary "#{appdir}/ObjectExplorer.app/Contents/MacOS/ObjectExplorer", target: "objectexplorer-app"

  zap trash: "~/.objectexplorer"
end
