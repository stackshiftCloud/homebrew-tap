class Stackshift < Formula
  desc "Manage StackShift from the command-line"
  homepage "https://stackshift.cloud/"
  version "1.0.21"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/stackshiftCloud/stackshift-cli/releases/download/v1.0.21/stackshift_darwin_arm64.tar.gz"
      sha256 "a1a083c17ba2f9656ad8548f1f400bb73e1412d3bb3d56d64625b9d14e7ca28b"
    end
    on_intel do
      url "https://github.com/stackshiftCloud/stackshift-cli/releases/download/v1.0.21/stackshift_darwin_amd64.tar.gz"
      sha256 "96ec3f9cf24a2765c7785ab76461b76fe747fbe1ddcad9cc61002d01b705e0c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stackshiftCloud/stackshift-cli/releases/download/v1.0.21/stackshift_linux_arm64.tar.gz"
      sha256 "671eb3ad09487fbf7d2ac5fc443f61681b545c9840a396f37bcafead2d44e672"
    end
    on_intel do
      url "https://github.com/stackshiftCloud/stackshift-cli/releases/download/v1.0.21/stackshift_linux_amd64.tar.gz"
      sha256 "0e5febceb2aa74b6b10aed591cafe0008599575e94d3707cde5c402d102eb65f"
    end
  end

  def install
    bin.install "stackshift"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stackshift version")
  end
end
