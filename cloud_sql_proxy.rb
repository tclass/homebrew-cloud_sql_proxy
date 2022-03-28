class CloudSqlProxy < Formula
  desc "The Cloud SQL Proxy for GoogleCloudPlatform"
  homepage "https://github.com/GoogleCloudPlatform/cloudsql-proxy"
  version "1.29.0"
  url "https://github.com/GoogleCloudPlatform/cloudsql-proxy/archive/v#{version}.tar.gz"
  sha256 "77dd4486a6e8bf2ea237f562477828c2e3416002da2a7f648bf793fd900ba8f8"
  head "https://github.com/GoogleCloudPlatform/cloudsql-proxy.git"
  
  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"cloud_sql_proxy", "./cmd/cloud_sql_proxy"
  end
end
