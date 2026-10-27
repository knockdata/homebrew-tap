# Homebrew cask for objectexplorer's desktop app (plan.md Phase 7.5): the
# same code base as the formula's binary, as a macOS .app. tools/create-release.sh
# fills 0.9.15 and the sha256. `brew install --cask knockdata/tap/objectexplorer-app`
cask "objectexplorer-app" do
  arch arm: "arm64", intel: "x64"

  version "0.9.15"
  sha256 arm:   "b34472267c2379dbe8117705f055e9e23fc66d466725a0774ce6b9335f3b4cbe",
         intel: "897a946368892463a012836d3bfdef6e97600b9f9b172437bbcca2aaa522778b"

  url "https://github.com/knockdata/objectexplorer/releases/download/v#{version}/objectexplorer-app-darwin-#{arch}.dmg"
  name "objectexplorer"
  desc "The VSCode for Cloud Storage: explore, analyze and search files and buckets"
  homepage "https://objectexplorer.com"

  depends_on macos: ">= :ventura"

  app "ObjectExplorer.app"
  binary "#{appdir}/ObjectExplorer.app/Contents/MacOS/ObjectExplorer", target: "objectexplorer-app"

  zap trash: "~/.objectexplorer"
end
