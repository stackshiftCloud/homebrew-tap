class Stackshift < Formula
  desc "Manage StackShift from the command-line"
  homepage "https://stackshift.cloud/"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/stackshiftCloud/stackshift-cli/releases/download/v1.0.23/stackshift_darwin_arm64.tar.gz"
      sha256 "3d2137f5b8725f3eb4c50c5d23446f4d034c711f03a0ff6a82b7309eaeb8f844"
    end
    on_intel do
      url "https://github.com/stackshiftCloud/stackshift-cli/releases/download/v1.0.23/stackshift_darwin_amd64.tar.gz"
      sha256 "a08163495b3ea022f6ba42c1fbb9c84d637256a46cd74b9857bbe482354ce19c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stackshiftCloud/stackshift-cli/releases/download/v1.0.23/stackshift_linux_arm64.tar.gz"
      sha256 "94ca6736d791645a779eeb6cf888b5082dfba33140ed3048d0789c29a9f1fd43"
    end
    on_intel do
      url "https://github.com/stackshiftCloud/stackshift-cli/releases/download/v1.0.23/stackshift_linux_amd64.tar.gz"
      sha256 "40b8fe63cf3fd11e63c09918455bdd596d41e250bf113c22d01d114b67fd9009"
    end
  end

  def install
    bin.install "stackshift"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stackshift version")
  end
end
