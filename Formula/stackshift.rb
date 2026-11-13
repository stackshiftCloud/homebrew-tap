class Stackshift < Formula
  desc "Manage StackShift from the command-line"
  homepage "https://stackshift.cloud/"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/stackshiftCloud/stackshift-cli/releases/download/v1.0.27/stackshift_darwin_arm64.tar.gz"
      sha256 "9b4bd6ddd50ba7f8c764f31d622bdc30c617b47c54b2be37eaaf7dc338b6731a"
    end
    on_intel do
      url "https://github.com/stackshiftCloud/stackshift-cli/releases/download/v1.0.27/stackshift_darwin_amd64.tar.gz"
      sha256 "c241330430e774b5e90da6449ae0eede4452cac305bd3214511fa05d1b253caf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stackshiftCloud/stackshift-cli/releases/download/v1.0.27/stackshift_linux_arm64.tar.gz"
      sha256 "a4f16444b9f39c1ba1b4f1882a70caf797bc0efedd1464799e03df9c60a013f7"
    end
    on_intel do
      url "https://github.com/stackshiftCloud/stackshift-cli/releases/download/v1.0.27/stackshift_linux_amd64.tar.gz"
      sha256 "4cc93bc094103607173c31d2b7a71e52446ad329a6b9b9c513e8e2493d22e344"
    end
  end

  def install
    bin.install "stackshift"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stackshift version")
  end
end
