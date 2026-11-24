class Stackshift < Formula
  desc "Manage StackShift from the command-line"
  homepage "https://stackshift.cloud/"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/stackshiftCloud/stackshift-cli/releases/download/v1.0.29/stackshift_darwin_arm64.tar.gz"
      sha256 "fd9b8f41d185e93510c9754110999f70823f7a69b85f01e7c15aa3d2489d1b3d"
    end
    on_intel do
      url "https://github.com/stackshiftCloud/stackshift-cli/releases/download/v1.0.29/stackshift_darwin_amd64.tar.gz"
      sha256 "3643f5bbe20a3c2f203556f6be96a7adca3c258d1db8ed1bbbb0741e43f07f91"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stackshiftCloud/stackshift-cli/releases/download/v1.0.29/stackshift_linux_arm64.tar.gz"
      sha256 "8649f1703c19f54d7f3f436e47b04dfeb1a920b1f19406879e3964e67599788a"
    end
    on_intel do
      url "https://github.com/stackshiftCloud/stackshift-cli/releases/download/v1.0.29/stackshift_linux_amd64.tar.gz"
      sha256 "a58af45da04ac4a5328d7cd37b0fa3c7f120b9b0b0e51886f036ce625346235c"
    end
  end

  def install
    bin.install "stackshift"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stackshift version")
  end
end
