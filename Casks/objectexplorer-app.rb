# Homebrew cask for objectexplorer's desktop app (plan.md Phase 7.5): the
# same code base as the formula's binary, as a macOS .app. tools/release.sh
# fills 0.9.1 and the sha256. `brew install --cask knockdata/tap/objectexplorer-app`
cask "objectexplorer-app" do
  arch arm: "arm64", intel: "x64"

  version "0.9.1"
  sha256 arm:   "0bb55e70b9a22719f6e520eb96215dc0e0743c58e6a081bb780a256a6fb435f0",
         intel: "e21fca0a2cdf2c6bb5e00b82e687fb3da6cf352b8ec7cfb6e55119c29d302ffb"

  url "https://github.com/knockdata/objectexplorer/releases/download/v#{version}/objectexplorer-app-darwin-#{arch}.zip"
  name "objectexplorer"
  desc "The VSCode for Cloud Storage: explore, analyze and search files and buckets"
  homepage "https://objectexplorer.com"

  depends_on macos: ">= :ventura"

  app "ObjectExplorer.app"
  binary "#{appdir}/ObjectExplorer.app/Contents/MacOS/ObjectExplorer", target: "objectexplorer-app"

  zap trash: "~/.objectexplorer"
end
