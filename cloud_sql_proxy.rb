class CloudSqlProxy < Formula
  desc "The Cloud SQL Proxy for GoogleCloudPlatform"
  homepage "https://github.com/GoogleCloudPlatform/cloudsql-proxy"
  version "v1.17"
  url "https://github.com/GoogleCloudPlatform/cloudsql-proxy/archive/#{version}.tar.gz"
  sha256 "cd4f426f779ede8c87f0efd7f47b7fd86f59157192df37a62822dd9ff53e5113"
  head "https://github.com/GoogleCloudPlatform/cloudsql-proxy.git"
  
  depends_on "go" => :build
  depends_on "git" => :build

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
