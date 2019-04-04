# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Control < Formula
  desc "Control manages the lifecycle of clusters on your infrastructure and allows deployment of applications via HELM. Its deployment and configuration workflows will help you to get up and running with Kubernetes faster."
  homepage "https://supergiant.io/toolkit/"
  url "https://github.com/supergiant/control/archive/v2.0.0.tar.gz"
  sha256 "62166c2b28d5c868bae9ac96f9974bc0836662a70c5e061bab4357bee7ffd078"
  # depends_on "cmake" => :build
  depends_on "go" => :build
  depends_on "npm"
  depends_on "govendor" => :recommended



  def install
    bin.install_symlink /usr/local/bin/npm
    #mkdir_p buildpath/"src/github.com/supergiant/"
    system "cd #{buildpath}"
    system "make", "build-ui"

  end


end
