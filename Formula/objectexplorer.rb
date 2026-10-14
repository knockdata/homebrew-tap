# Homebrew formula for objectexplorer's binary (plan.md Phase 7.5): the server
# and command line, macOS and Linux. tools/release.sh fills 0.9.0 and the
# sha256 of each release tarball. `brew install knockdata/tap/objectexplorer`
class Objectexplorer < Formula
  desc "The VSCode for Cloud Storage: explore, analyze and search files and buckets"
  homepage "https://objectexplorer.com"
  version "0.9.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.0/objectexplorer-darwin-arm64.tar.gz"
      sha256 "b4d6433a66a35b0b5b9dffdaafbca8c68d3ba9e61896b008b2f5e15cd1a73132"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.0/objectexplorer-darwin-x64.tar.gz"
      sha256 "58bd197e3bd29c104033dd0fa3901da2e36b3c14aa33ba52a5cb6e76b06b65be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.0/objectexplorer-linux-arm64.tar.gz"
      sha256 "2e14c00d8b4012b23685c4631a4e696b4201f9238583352b71f4a9bdbcd84f24"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.0/objectexplorer-linux-x64.tar.gz"
      sha256 "a5014e42e1ee5adaa4eeaffe761668a8345b78cd7c96b8f98b78ff3f318969f7"
    end
  end

  def install
    bin.install "objectexplorer"
    bin.install_symlink "objectexplorer" => "oe"
  end

  service do
    run [opt_bin/"objectexplorer", "open=false"]
    keep_alive true
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/objectexplorer --version")
  end
end
