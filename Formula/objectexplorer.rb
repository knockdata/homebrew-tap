# Homebrew formula for objectexplorer's binary: the server
# and command line, macOS and Linux. tools/create-release.sh fills 0.9.46 and the
# sha256 of each release tarball. `brew install knockdata/tap/objectexplorer`
class Objectexplorer < Formula
  desc "The VSCode for Cloud Storage: explore, analyze and search files and buckets"
  homepage "https://objectexplorer.com"
  version "0.9.46"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.46/objectexplorer-mac-arm64.tar.gz"
      sha256 "4356dcdb343607940022b1c3063c7c63649d3ab78e724427d916d63a52e5cd50"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.46/objectexplorer-mac-x64.tar.gz"
      sha256 "9008950f030f2e20ada4908f366c874ba491bd121a0310fd66dc892aefa8aa2b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.46/objectexplorer-linux-arm64.tar.gz"
      sha256 "d0c7bcbc21bac39ae5bdbc8dde2047b5ad6b01b6857bb22ee867028b88beb6d4"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.46/objectexplorer-linux-x64.tar.gz"
      sha256 "f40e5258d8ab908fba5bf334943345efdc939f055a72b79f570032e35106b9b4"
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
