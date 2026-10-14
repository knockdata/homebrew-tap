# Homebrew formula for objectexplorer's binary (plan.md Phase 7.5): the server
# and command line, macOS and Linux. tools/release.sh fills 0.9.2 and the
# sha256 of each release tarball. `brew install knockdata/tap/objectexplorer`
class Objectexplorer < Formula
  desc "The VSCode for Cloud Storage: explore, analyze and search files and buckets"
  homepage "https://objectexplorer.com"
  version "0.9.2"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.2/objectexplorer-darwin-arm64.tar.gz"
      sha256 "37bc60da93c2f81d8fe5e5366f681b538b28ea4e24f5fc2b3c2b81bbb22ca58c"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.2/objectexplorer-darwin-x64.tar.gz"
      sha256 "0cf8d8ee34a089f4cc6ee857538421bde4bb6d8ef2117af3c7e766d78f76809e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.2/objectexplorer-linux-arm64.tar.gz"
      sha256 "fe8b199dfaec97a578508357697c1755818b0970efca594dd37b4d344e033cad"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.2/objectexplorer-linux-x64.tar.gz"
      sha256 "3dc16f0c7ca7d11a66077b85f27a4d8b93aa809ee41219cf90647d0cf0f44af7"
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
