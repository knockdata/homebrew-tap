# Homebrew cask for objectexplorer's desktop app: the
# same code base as the formula's binary, as a macOS .app. tools/create-release.sh
# fills 0.9.45 and the sha256. `brew install --cask knockdata/tap/objectexplorer-app`
cask "objectexplorer-app" do
  arch arm: "arm64", intel: "x64"

  version "0.9.45"
  sha256 arm:   "d1d7c9c73e5786fd991f6871d582beaec8659058438245a5116cbe5b9dae5bce",
         intel: "806c1385ad289dfe8fec08dc8cf7c23a20c0be693dc3b5e499fb0f1dc2738a44"

  url "https://github.com/knockdata/objectexplorer/releases/download/v#{version}/objectexplorer-mac-#{arch}.dmg"
  name "objectexplorer"
  desc "The VSCode for Cloud Storage: explore, analyze and search files and buckets"
  homepage "https://objectexplorer.com"

  depends_on macos: ">= :ventura"

  app "ObjectExplorer.app"
  binary "#{appdir}/ObjectExplorer.app/Contents/MacOS/ObjectExplorer", target: "objectexplorer-app"

  zap trash: "~/.objectexplorer"
end
