# Homebrew formula for objectexplorer's binary: the server
# and command line, macOS and Linux. tools/create-release.sh fills 0.9.48 and the
# sha256 of each release tarball. `brew install knockdata/tap/objectexplorer`
class Objectexplorer < Formula
  desc "The VSCode for Cloud Storage: explore, analyze and search files and buckets"
  homepage "https://objectexplorer.com"
  version "0.9.48"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.48/objectexplorer-mac-arm64.tar.gz"
      sha256 "3fa894cae3e49f04ca9b2197da355dda4a7c5e7e061c66cc1ee3662fe6280d93"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.48/objectexplorer-mac-x64.tar.gz"
      sha256 "e0f50a4800e986455d1ce81abdaa293bd643906ae428a011d20469cd9f120eea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.48/objectexplorer-linux-arm64.tar.gz"
      sha256 "fffeae10dc0727e7ae908ab6c994310529c0d98d3141b6cea325c0d0461a4076"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.48/objectexplorer-linux-x64.tar.gz"
      sha256 "d4483243094dbbafca49559a4831e1afadf0831cc170f7310f01be5f97a19c20"
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
