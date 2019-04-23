# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Control < Formula
  desc "Control manages the lifecycle of clusters on your infrastructure and allows deployment of applications via HELM. Its deployment and configuration workflows will help you to get up and running with Kubernetes faster."
  homepage "https://supergiant.io/toolkit/"
  url "https://github.com/supergiant/control/releases/download/v2.1.0/supergiant_v2.1.0_Darwin_x86_64.tar.gz"
  sha256 "9a28ed2241f6a3cde5dc5605b076ab9151a94bc914499f5f0ac135acae75b613"
  # depends_on "cmake" => :build
  head "https://github.com/supergiant/control.git"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    #bin.install 'supergiant'
    mkdir_p buildpath/"/etc/supergiant/templates/"
    system "cp templates/* /etc/supergiant/templates/"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test control`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end

  def uninstall
    system "rm {HOMEBREW_PREFIX}/bin/supergiant"
  end
end
