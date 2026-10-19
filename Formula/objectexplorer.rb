# Homebrew formula for objectexplorer's binary (plan.md Phase 7.5): the server
# and command line, macOS and Linux. tools/create-release.sh fills 0.9.8 and the
# sha256 of each release tarball. `brew install knockdata/tap/objectexplorer`
class Objectexplorer < Formula
  desc "The VSCode for Cloud Storage: explore, analyze and search files and buckets"
  homepage "https://objectexplorer.com"
  version "0.9.8"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.8/objectexplorer-darwin-arm64.tar.gz"
      sha256 "b120c359723cbbc683cbc5b338266675947734b936d6f9768a283fa099e8cc09"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.8/objectexplorer-darwin-x64.tar.gz"
      sha256 "b53337ad58d0d9664cb0b27c58ad78685fd80fe6b8dada85fb6eb8fd232b385d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.8/objectexplorer-linux-arm64.tar.gz"
      sha256 "0df3ebfd4c9e99de14d57a268b37d40f7de8297ca112f8343a44e2d963268005"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.8/objectexplorer-linux-x64.tar.gz"
      sha256 "e2bb3ead9a43652ca755c9510ce8abe81d90bda2d0a4aaff66f1754f989caf69"
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
