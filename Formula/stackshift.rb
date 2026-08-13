class Stackshift < Formula
  desc "Manage StackShift from the command-line"
  homepage "https://stackshift.cloud/"
  url "https://github.com/stackshiftCloud/stackshift-cli/releases/download/v1.0.4/stackshift-cli-source-v1.0.4.tar.gz"
  sha256 "aab301dbefa15d32870592714e4eba41d5495169ba5bc1ed01bad18a6a6364e6"
  license :cannot_represent

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ENV["GOFLAGS"] = "-mod=vendor"
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.commit=b765f6fcb923dbd41117e2d8a78febeaf7392cb2
      -X main.date=2026-08-13T04:45:21Z
    ]
    system "go", "build", *std_go_args(ldflags: ldflags.join(" ")),
           "./cmd/stackshift"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stackshift version")
  end
end
