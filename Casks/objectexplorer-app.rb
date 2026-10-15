# Homebrew cask for objectexplorer's desktop app (plan.md Phase 7.5): the
# same code base as the formula's binary, as a macOS .app. tools/release.sh
# fills 0.9.4 and the sha256. `brew install --cask knockdata/tap/objectexplorer-app`
cask "objectexplorer-app" do
  arch arm: "arm64", intel: "x64"

  version "0.9.4"
  sha256 arm:   "7f650dec94d01676fadbf4fd01922f176c513d5d07e48cf6cef19509a1797a65",
         intel: "e28d5fe8da007e7c3b50536bfe259eef8a4212579f35e756416ca03dde873674"

  url "https://github.com/knockdata/objectexplorer/releases/download/v#{version}/objectexplorer-app-darwin-#{arch}.dmg"
  name "objectexplorer"
  desc "The VSCode for Cloud Storage: explore, analyze and search files and buckets"
  homepage "https://objectexplorer.com"

  depends_on macos: ">= :ventura"

  app "ObjectExplorer.app"
  binary "#{appdir}/ObjectExplorer.app/Contents/MacOS/ObjectExplorer", target: "objectexplorer-app"

  zap trash: "~/.objectexplorer"
end
