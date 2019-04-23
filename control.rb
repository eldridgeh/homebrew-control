# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Control < Formula
  desc "Control manages the lifecycle of clusters on your infrastructure and allows deployment of applications via HELM. Its deployment and configuration workflows will help you to get up and running with Kubernetes faster."
  homepage "https://supergiant.io/"
  version "2.1.0"
  url "https://github.com/supergiant/supergiant/archive/v2.1.0.tar.gz"
  sha256 "78ee9dad415b21d6bab1182f9af84d679a3394e34e295efccaa35af2b46a1fb3"
  # depends_on "cmake" => :build
  head "https://github.com/supergiant/control.git"

  depends_on "go" => :build
  depends_on "govendor" => :recommended


  def install
    mkdir_p buildpath/"src/github.com/control"
    system prefix.install Dir["templates/*"]

    system "GOOS=darwin CGO_ENABLED=0 GOARCH=amd64 go build -o dist/controlplane-osx -a -installsuffix cgo ./cmd/controlplane"
    system bin.install "dist/controlplane-osx"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test supergiant`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
