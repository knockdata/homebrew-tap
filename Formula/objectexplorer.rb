# Homebrew formula for objectexplorer's binary (plan.md Phase 7.5): the server
# and command line, macOS and Linux. tools/create-release.sh fills 0.9.15 and the
# sha256 of each release tarball. `brew install knockdata/tap/objectexplorer`
class Objectexplorer < Formula
  desc "The VSCode for Cloud Storage: explore, analyze and search files and buckets"
  homepage "https://objectexplorer.com"
  version "0.9.15"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.15/objectexplorer-darwin-arm64.tar.gz"
      sha256 "2ee76bef1f16c5cbc2fbe342e87ee5c6ebaa512c56e1df7d05ea375bca9045b5"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.15/objectexplorer-darwin-x64.tar.gz"
      sha256 "f4ed305e05ce9bd829f69c005b2a953f66362f22f92c5cd138e3891d35d6ce89"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.15/objectexplorer-linux-arm64.tar.gz"
      sha256 "9a4357cb1d62e77a019ce7d8b53e24558ba03c345e0165e5df18bf904e11a259"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.15/objectexplorer-linux-x64.tar.gz"
      sha256 "d293f3fc1a608471fcce3d45e407488ff916e74e6251e2b08134b25bee02a9c9"
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
