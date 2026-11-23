# Homebrew formula for objectexplorer's binary: the server
# and command line, macOS and Linux. tools/create-release.sh fills 0.9.45 and the
# sha256 of each release tarball. `brew install knockdata/tap/objectexplorer`
class Objectexplorer < Formula
  desc "The VSCode for Cloud Storage: explore, analyze and search files and buckets"
  homepage "https://objectexplorer.com"
  version "0.9.45"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.45/objectexplorer-mac-arm64.tar.gz"
      sha256 "cf534fff6f860bf656a5355157b16e8893bdd976faa3d0d16ee4237331a64343"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.45/objectexplorer-mac-x64.tar.gz"
      sha256 "923d6abcb4c004e91cd89719541e5f421812988b9b47110a8d55e36f14f69128"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.45/objectexplorer-linux-arm64.tar.gz"
      sha256 "5496ae1fa207fa9d25f8ba61c1ee9d4df816c5614b759b8c9186c5e1b2989462"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.45/objectexplorer-linux-x64.tar.gz"
      sha256 "a590ac2f4c0d6e19e1a309ab76e1b3b64b8585591a20b6a4ece0ed66c046b6e5"
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
