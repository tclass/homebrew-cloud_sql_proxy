class CloudSqlProxy < Formula
  desc "The Cloud SQL Proxy for GoogleCloudPlatform"
  homepage "https://github.com/GoogleCloudPlatform/cloudsql-proxy"
  version "2.4.0"
  url "https://github.com/GoogleCloudPlatform/cloud-sql-proxy/archive/refs/tags/v#{version}.tar.gz"
  sha256 "dfa23097db01f76f6bda1b433d3d2caa6929bcbc22c909577f4fcd20395c0310"
  head "https://github.com/GoogleCloudPlatform/cloud-sql-proxy.git"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"cloud_sql_proxy", "."
  end

  service do
    run [opt_bin/"cloud_sql_proxy", "-dir=/tmp/cloudsql"]
    keep_alive true
  end

  test do
    system "cloud_sql_proxy -version"
  end
end
