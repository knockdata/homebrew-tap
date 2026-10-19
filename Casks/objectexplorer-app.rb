# Homebrew cask for objectexplorer's desktop app (plan.md Phase 7.5): the
# same code base as the formula's binary, as a macOS .app. tools/create-release.sh
# fills 0.9.8 and the sha256. `brew install --cask knockdata/tap/objectexplorer-app`
cask "objectexplorer-app" do
  arch arm: "arm64", intel: "x64"

  version "0.9.8"
  sha256 arm:   "8f0456860bd42643741886558f119c507bbab0a2761cc607b6c77e3f9c4633b1",
         intel: "71540ea6a7155bc5d73798fa06f07ced1b7d4e65e770cf8bca9b2270c601051b"

  url "https://github.com/knockdata/objectexplorer/releases/download/v#{version}/objectexplorer-app-darwin-#{arch}.dmg"
  name "objectexplorer"
  desc "The VSCode for Cloud Storage: explore, analyze and search files and buckets"
  homepage "https://objectexplorer.com"

  depends_on macos: ">= :ventura"

  app "ObjectExplorer.app"
  binary "#{appdir}/ObjectExplorer.app/Contents/MacOS/ObjectExplorer", target: "objectexplorer-app"

  zap trash: "~/.objectexplorer"
end
