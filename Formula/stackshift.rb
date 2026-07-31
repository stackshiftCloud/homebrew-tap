class Stackshift < Formula
  desc "Manage StackShift from the command-line"
  homepage "https://stackshift.cloud/"
  url "https://github.com/stackshiftCloud/stackshift-cli/releases/download/v1.0.2/stackshift-cli-source-v1.0.2.tar.gz"
  sha256 "cb70a0f5afd56b4c744988e1bd419667c190884ab563cdd2c6545ac537d033a8"
  license :cannot_represent

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ENV["GOFLAGS"] = "-mod=vendor"
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.commit=40e5eeb842d895a4d9cf5cf91ba9a418fc4e8a3b
      -X main.date=2026-07-30T23:51:28Z
    ]
    system "go", "build", *std_go_args(ldflags: ldflags.join(" ")),
           "./cmd/stackshift"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stackshift version")
  end
end
