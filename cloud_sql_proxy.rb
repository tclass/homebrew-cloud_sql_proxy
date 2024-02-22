class CloudSqlProxy < Formula
  desc "The Cloud SQL Proxy for GoogleCloudPlatform"
  homepage "https://github.com/GoogleCloudPlatform/cloudsql-proxy"
  version "2.9.0"
  url "https://github.com/GoogleCloudPlatform/cloud-sql-proxy/archive/refs/tags/v#{version}.tar.gz"
  sha256 "f1623f1a8ac4798ac95f4908bd655265b947aad3101b4d68750527f375bf42a1"
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
