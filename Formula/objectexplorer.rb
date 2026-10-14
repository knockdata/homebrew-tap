# Homebrew formula for objectexplorer's binary (plan.md Phase 7.5): the server
# and command line, macOS and Linux. tools/release.sh fills 0.9.1 and the
# sha256 of each release tarball. `brew install knockdata/tap/objectexplorer`
class Objectexplorer < Formula
  desc "The VSCode for Cloud Storage: explore, analyze and search files and buckets"
  homepage "https://objectexplorer.com"
  version "0.9.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.1/objectexplorer-darwin-arm64.tar.gz"
      sha256 "d74e029add69a031a7e87c6c07dfcdaa00abecbe17ebed0f35b2d46d9edcd7e0"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.1/objectexplorer-darwin-x64.tar.gz"
      sha256 "7bb73d655783df77f016258b63c9207d555efb83b0e851545e1857be35ecfca2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.1/objectexplorer-linux-arm64.tar.gz"
      sha256 "9fba1d6729468d61ac2b271411d0fb0f49b633419e54debc89f2c738a7355220"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.1/objectexplorer-linux-x64.tar.gz"
      sha256 "520131dda0a1c03b8d95ce4d923f2f845e20ebd34d5113c620dfcbf0296af378"
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
