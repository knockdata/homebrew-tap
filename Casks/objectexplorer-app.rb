# Homebrew cask for objectexplorer's desktop app: the
# same code base as the formula's binary, as a macOS .app. tools/create-release.sh
# fills 0.9.42 and the sha256. `brew install --cask knockdata/tap/objectexplorer-app`
cask "objectexplorer-app" do
  arch arm: "arm64", intel: "x64"

  version "0.9.42"
  sha256 arm:   "ecf445b49b60fda3586bf92e6454b8671bd3f1b4317728afc58d9233697b691b",
         intel: "f1d1cacc54d62c535e43e6b5c95a280d91eab215b977e0843175b5c357be4e81"

  url "https://github.com/knockdata/objectexplorer/releases/download/v#{version}/objectexplorer-mac-#{arch}.dmg"
  name "objectexplorer"
  desc "The VSCode for Cloud Storage: explore, analyze and search files and buckets"
  homepage "https://objectexplorer.com"

  depends_on macos: ">= :ventura"

  app "ObjectExplorer.app"
  binary "#{appdir}/ObjectExplorer.app/Contents/MacOS/ObjectExplorer", target: "objectexplorer-app"

  zap trash: "~/.objectexplorer"
end
