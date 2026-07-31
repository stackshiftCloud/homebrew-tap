class Stackshift < Formula
  desc "Manage StackShift from the command-line"
  homepage "https://stackshift.cloud/"
  url "https://github.com/stackshiftCloud/stackshift-cli/releases/download/v1.0.3/stackshift-cli-source-v1.0.3.tar.gz"
  sha256 "d75d7e981800cc48b828814b636b48a20b8dbe5543d507fa6ebcc167d286ca67"
  license :cannot_represent

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ENV["GOFLAGS"] = "-mod=vendor"
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.commit=72d99646c145e35bafecdd8c4d0ced06d23fef7e
      -X main.date=2026-07-31T04:54:40Z
    ]
    system "go", "build", *std_go_args(ldflags: ldflags.join(" ")),
           "./cmd/stackshift"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stackshift version")
  end
end
