# Homebrew formula for objectexplorer's binary: the server
# and command line, macOS and Linux. tools/create-release.sh fills 0.9.47 and the
# sha256 of each release tarball. `brew install knockdata/tap/objectexplorer`
class Objectexplorer < Formula
  desc "The VSCode for Cloud Storage: explore, analyze and search files and buckets"
  homepage "https://objectexplorer.com"
  version "0.9.47"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.47/objectexplorer-mac-arm64.tar.gz"
      sha256 "e370871d96edc3523ad44fac0cca4685a82ce23053c8ae5c5deefcabb9d104b1"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.47/objectexplorer-mac-x64.tar.gz"
      sha256 "a3a00deeaa1580140e4fbdabbe84f3ff6c0553963b0ed7532692e9febc835228"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.47/objectexplorer-linux-arm64.tar.gz"
      sha256 "798aaca777952a8abc3f0698e1f399632249dbcee4eea92d1ba4b81ff2e46ccd"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.47/objectexplorer-linux-x64.tar.gz"
      sha256 "7f98c906af91d0510dc60bb4082d99600b06542545901081d619cecd3b9bd8ff"
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
