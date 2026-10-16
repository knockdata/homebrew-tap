# Homebrew formula for objectexplorer's binary (plan.md Phase 7.5): the server
# and command line, macOS and Linux. tools/release.sh fills 0.9.5 and the
# sha256 of each release tarball. `brew install knockdata/tap/objectexplorer`
class Objectexplorer < Formula
  desc "The VSCode for Cloud Storage: explore, analyze and search files and buckets"
  homepage "https://objectexplorer.com"
  version "0.9.5"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.5/objectexplorer-darwin-arm64.tar.gz"
      sha256 "2deff3c0d8fc0cdea565233dafdbe44d0800a9c9d27c8b3afc2512b41df8b739"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.5/objectexplorer-darwin-x64.tar.gz"
      sha256 "38ba4ab42b3296066ec60bdc34e8048c2800241d8d9311669475c8dde6a68b4c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.5/objectexplorer-linux-arm64.tar.gz"
      sha256 "b7379c8fcfe85ae75889b5bb5147eab8d83d65353bd8dd4335c56c506ea5ca3d"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.5/objectexplorer-linux-x64.tar.gz"
      sha256 "ab4309831ac852a11ffd7ea9582ad791835be4aa434e5e1c53b3701443d43dac"
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
