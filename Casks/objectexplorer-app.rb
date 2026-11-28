# Homebrew cask for objectexplorer's desktop app: the
# same code base as the formula's binary, as a macOS .app. tools/create-release.sh
# fills 0.9.48 and the sha256. `brew install --cask knockdata/tap/objectexplorer-app`
cask "objectexplorer-app" do
  arch arm: "arm64", intel: "x64"

  version "0.9.48"
  sha256 arm:   "d29cfeb3838fbee81f30d7f625516d9f97b879a2888cc7055a0e2c4592a357d6",
         intel: "9433754bdc92f817d49250887131934d52fcac662cc07c9521ed0784cc62b7b6"

  url "https://github.com/knockdata/objectexplorer/releases/download/v#{version}/objectexplorer-mac-#{arch}.dmg"
  name "objectexplorer"
  desc "The VSCode for Cloud Storage: explore, analyze and search files and buckets"
  homepage "https://objectexplorer.com"

  depends_on macos: ">= :ventura"

  app "ObjectExplorer.app"
  binary "#{appdir}/ObjectExplorer.app/Contents/MacOS/ObjectExplorer", target: "objectexplorer-app"

  zap trash: "~/.objectexplorer"
end
