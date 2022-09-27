class CloudSqlProxy < Formula
  desc "The Cloud SQL Proxy for GoogleCloudPlatform"
  homepage "https://github.com/GoogleCloudPlatform/cloudsql-proxy"
  version "1.32.0"
  url "https://github.com/GoogleCloudPlatform/cloudsql-proxy/archive/v#{version}.tar.gz"
  sha256 "ee5ce1f5cd1ffee3d75c68ab8bd864118de99aadefc21619a4d5077316259ca9"
  head "https://github.com/GoogleCloudPlatform/cloudsql-proxy.git"
  
  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"cloud_sql_proxy", "./cmd/cloud_sql_proxy"
  end
end
