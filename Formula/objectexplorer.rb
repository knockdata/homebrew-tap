# Homebrew formula for objectexplorer's binary (plan.md Phase 7.5): the server
# and command line, macOS and Linux. tools/release.sh fills 0.9.3 and the
# sha256 of each release tarball. `brew install knockdata/tap/objectexplorer`
class Objectexplorer < Formula
  desc "The VSCode for Cloud Storage: explore, analyze and search files and buckets"
  homepage "https://objectexplorer.com"
  version "0.9.3"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.3/objectexplorer-darwin-arm64.tar.gz"
      sha256 "eec2959ec873d0a897e4e41ef3d0829877c6efe6c95833caf86c05a7e1b27236"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.3/objectexplorer-darwin-x64.tar.gz"
      sha256 "8a806e4921dd16fb9a8241a8580c03bee8b2fafd5d9dfbfe3e7b29c5745691c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.3/objectexplorer-linux-arm64.tar.gz"
      sha256 "f66e15bbc1f0b6d9f4b17431d9e69af80cffc4b513ae463f4bad230821f542d7"
    end
    on_intel do
      url "https://github.com/knockdata/objectexplorer/releases/download/v0.9.3/objectexplorer-linux-x64.tar.gz"
      sha256 "e363cc00e59b7ad642faff859f9ea3c546ce9925dbaf913d8719648560bec416"
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
