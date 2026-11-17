# Homebrew formula for objectexplorer's binary: the server
# and command line, macOS and Linux. tools/create-release.sh fills 0.9.42 and the
# sha256 of each release tarball. `brew install knockdata/tap/objectexplorer`
class Objectexplorer < Formula
  desc "The VSCode for Cloud Storage: explore, analyze and search files and buckets"
  homepage "https://objectexplorer.com"
  version "0.9.42"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.42/objectexplorer-mac-arm64.tar.gz"
      sha256 "3505eca7efd5da2bf831da41162cd92cb1e07e0183d99cb1d703d4eddfe04457"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.42/objectexplorer-mac-x64.tar.gz"
      sha256 "85fdb387d48b6b3358fc704b66d18e7b70d68d2efa914f86e7c900fc09fcc760"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.42/objectexplorer-linux-arm64.tar.gz"
      sha256 "b8f7bd89321da75741ca97ad0a916004ae4cdabecff6885e9d8d31c7c174b43d"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.42/objectexplorer-linux-x64.tar.gz"
      sha256 "d6c52aac79e33e314340cdf21a08242fabfa14e633c2e21ca6dee8119237d463"
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
