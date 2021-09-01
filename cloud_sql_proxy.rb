class CloudSqlProxy < Formula
  desc "The Cloud SQL Proxy for GoogleCloudPlatform"
  homepage "https://github.com/GoogleCloudPlatform/cloudsql-proxy"
  version "1.24.0"
  url "https://github.com/GoogleCloudPlatform/cloudsql-proxy/archive/v#{version}.tar.gz"
  sha256 "7006685f0bb23c1dd519da139ea341c34bc294e28924d15302112f93823cf5bb"
  head "https://github.com/GoogleCloudPlatform/cloudsql-proxy.git"
  
  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"cloud_sql_proxy", "./cmd/cloud_sql_proxy"
  end
end
