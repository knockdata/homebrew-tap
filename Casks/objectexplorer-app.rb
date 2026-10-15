# Homebrew cask for objectexplorer's desktop app (plan.md Phase 7.5): the
# same code base as the formula's binary, as a macOS .app. tools/release.sh
# fills 0.9.3 and the sha256. `brew install --cask knockdata/tap/objectexplorer-app`
cask "objectexplorer-app" do
  arch arm: "arm64", intel: "x64"

  version "0.9.3"
  sha256 arm:   "30fd652e9303e2a875824f6f30d4de5d652b0ede16d8296c10d658475a7e8d01",
         intel: "fdbbbc6422d47cdab6ab4cabdbdb8828d577031faef42a74227be60895efd76b"

  url "https://github.com/knockdata/objectexplorer/releases/download/v#{version}/objectexplorer-app-darwin-#{arch}.dmg"
  name "objectexplorer"
  desc "The VSCode for Cloud Storage: explore, analyze and search files and buckets"
  homepage "https://objectexplorer.com"

  depends_on macos: ">= :ventura"

  app "ObjectExplorer.app"
  binary "#{appdir}/ObjectExplorer.app/Contents/MacOS/ObjectExplorer", target: "objectexplorer-app"

  zap trash: "~/.objectexplorer"
end
