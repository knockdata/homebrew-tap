# Homebrew formula for objectexplorer's binary (plan.md Phase 7.5): the server
# and command line, macOS and Linux. tools/release.sh fills 0.9.4 and the
# sha256 of each release tarball. `brew install knockdata/tap/objectexplorer`
class Objectexplorer < Formula
  desc "The VSCode for Cloud Storage: explore, analyze and search files and buckets"
  homepage "https://objectexplorer.com"
  version "0.9.4"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.4/objectexplorer-darwin-arm64.tar.gz"
      sha256 "769a473a522f7cac178de3940c6f64914be24b1f347f16d97a0b2ac7b5bccd96"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.4/objectexplorer-darwin-x64.tar.gz"
      sha256 "4449a3c747e045d0b7752612c0b51cd0d5821a183295019a495cac6650820b0c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.4/objectexplorer-linux-arm64.tar.gz"
      sha256 "eb4369a7415bb963fb20aa35a03b51cb8b3d68307759614430e991cdb89db665"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.4/objectexplorer-linux-x64.tar.gz"
      sha256 "24b12476744d72c01c6fbda0fa1ca9525d5261a8aea59af212726c719546186b"
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
