# Homebrew cask for objectexplorer's desktop app: the
# same code base as the formula's binary, as a macOS .app. tools/create-release.sh
# fills 0.9.46 and the sha256. `brew install --cask knockdata/tap/objectexplorer-app`
cask "objectexplorer-app" do
  arch arm: "arm64", intel: "x64"

  version "0.9.46"
  sha256 arm:   "bb8ca4b1644f0ae4d73f4290c79dc64ea6e586041de64369015276733b747eae",
         intel: "31574cef1ca5db81847fa5aa0ef1e24d5e883c4aab0d6cee4fd5fbfd447dec53"

  url "https://github.com/knockdata/objectexplorer/releases/download/v#{version}/objectexplorer-mac-#{arch}.dmg"
  name "objectexplorer"
  desc "The VSCode for Cloud Storage: explore, analyze and search files and buckets"
  homepage "https://objectexplorer.com"

  depends_on macos: ">= :ventura"

  app "ObjectExplorer.app"
  binary "#{appdir}/ObjectExplorer.app/Contents/MacOS/ObjectExplorer", target: "objectexplorer-app"

  zap trash: "~/.objectexplorer"
end
