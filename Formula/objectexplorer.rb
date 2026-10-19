# Homebrew formula for objectexplorer's binary (plan.md Phase 7.5): the server
# and command line, macOS and Linux. tools/create-release.sh fills 0.9.7 and the
# sha256 of each release tarball. `brew install knockdata/tap/objectexplorer`
class Objectexplorer < Formula
  desc "The VSCode for Cloud Storage: explore, analyze and search files and buckets"
  homepage "https://objectexplorer.com"
  version "0.9.7"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.7/objectexplorer-darwin-arm64.tar.gz"
      sha256 "6e4e30b96daf2858ae67af9ccbe3e319dd0916d11bfac86bb1a1f3f5b11c3292"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.7/objectexplorer-darwin-x64.tar.gz"
      sha256 "0f26d85a2d2e133f20849659accd753db02ab4262d5d49a592fb7f133509e28e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.7/objectexplorer-linux-arm64.tar.gz"
      sha256 "8894b9820bd5de140bcc6912afa863a398502bc04b458d71d7e0d678a3160687"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.7/objectexplorer-linux-x64.tar.gz"
      sha256 "2628a91adc05a71852b4828b773c5c766d733d3db86536f38a47d333c8a1a307"
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
