class CloudSqlProxy < Formula
  desc "The Cloud SQL Proxy for GoogleCloudPlatform"
  homepage "https://github.com/GoogleCloudPlatform/cloudsql-proxy"
  version "1.14"
  url "https://github.com/GoogleCloudPlatform/cloudsql-proxy/archive/#{version}.tar.gz"
  sha256 "03da0632e1f1f9d710ffa9086608102e2f3b5f48250571bbd494002fc6ca1ed6"
  head "https://github.com/GoogleCloudPlatform/cloudsql-proxy.git"
  
  depends_on "go" => :build
  depends_on "git"

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/GoogleCloudPlatform/cloud_sql_proxy").install buildpath.children
    
    cd "src/github.com/GoogleCloudPlatform/cloud_sql_proxy/cmd/cloud_sql_proxy" do
      system "go get"
      system "go build"
      system "mkdir bin"
      system "mv cloud_sql_proxy bin/cloud_sql_proxy"
      bin.install "bin/cloud_sql_proxy"
    end
  end
end