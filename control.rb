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
  #depends_on "statik"
  depends_on "govendor" => :recommended



  def install
    #mkdir_p buildpath/"src/github.com/supergiant/"
    ENV["GOPATH"] = buildpath
    #system "cd #{buildpath}"
    bin_path = buildpath/"src/github.com/supergiant/control1"
    bin_path.install Dir["*"]
    cd bin_path do
      system "/usr/local/Cellar/node/11.13.0/libexec/bin/npm install --prefix ./cmd/ui/assets"
      system "/usr/local/Cellar/node/11.13.0/libexec/bin/npm run build:prod --prefix ./cmd/ui/assets"
      system "/usr/local/opt/go/bin/go get github.com/rakyll/statik"
      system "#{buildpath}/.brew_home/go/bin/statik -src=./cmd/ui/assets/dist"
      #system "GOOS=darwin CGO_ENABLED=0 GOARCH=amd64 /usr/local/opt/go/bin/go build -o dist/controlplane-osx -a -installsuffix cgo -ldflags='-extldflags \"-static\" -w -s -X main.version=${VERSION}' ./cmd/controlplane"
    end


  end


end
