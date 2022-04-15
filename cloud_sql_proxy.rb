class CloudSqlProxy < Formula
  desc "The Cloud SQL Proxy for GoogleCloudPlatform"
  homepage "https://github.com/GoogleCloudPlatform/cloudsql-proxy"
  version "1.30.0"
  url "https://github.com/GoogleCloudPlatform/cloudsql-proxy/archive/v#{version}.tar.gz"
  sha256 "071b3b13fcc0bc1a9c9cd33c69930e8d6fcd89d089c653ecbfc39ca02008acb7"
  head "https://github.com/GoogleCloudPlatform/cloudsql-proxy.git"
  
  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"cloud_sql_proxy", "./cmd/cloud_sql_proxy"
  end
end
