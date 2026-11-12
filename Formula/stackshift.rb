class Stackshift < Formula
  desc "Manage StackShift from the command-line"
  homepage "https://stackshift.cloud/"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/stackshiftCloud/stackshift-cli/releases/download/v1.0.26/stackshift_darwin_arm64.tar.gz"
      sha256 "0e595288ddec56add7eff280c36cec1c68710a05f232362c5e5924e48c110419"
    end
    on_intel do
      url "https://github.com/stackshiftCloud/stackshift-cli/releases/download/v1.0.26/stackshift_darwin_amd64.tar.gz"
      sha256 "4c8c764f2b0990ce13b4fbf4fe6ef3a2cfdc56b8b0effe786ecb03654d9dfc33"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stackshiftCloud/stackshift-cli/releases/download/v1.0.26/stackshift_linux_arm64.tar.gz"
      sha256 "379a767874c59ff10ebfc7829d635c40a079ff5c077b3550fd70ba607179b4c2"
    end
    on_intel do
      url "https://github.com/stackshiftCloud/stackshift-cli/releases/download/v1.0.26/stackshift_linux_amd64.tar.gz"
      sha256 "c6173a559daf34e1229f190f940928e63ebab3c864667bcbd40b985de33eee82"
    end
  end

  def install
    bin.install "stackshift"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stackshift version")
  end
end
