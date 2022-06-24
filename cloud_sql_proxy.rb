class CloudSqlProxy < Formula
  desc "The Cloud SQL Proxy for GoogleCloudPlatform"
  homepage "https://github.com/GoogleCloudPlatform/cloudsql-proxy"
  version "1.30.1"
  url "https://github.com/GoogleCloudPlatform/cloudsql-proxy/archive/v#{version}.tar.gz"
  sha256 "1504266f1e6917734c7a5e11e171e9824114de88c5a1dfcc654d6dbeff7bbad7"
  head "https://github.com/GoogleCloudPlatform/cloudsql-proxy.git"
  
  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"cloud_sql_proxy", "./cmd/cloud_sql_proxy"
  end

  service do
    run [opt_bin/"cloud_sql_proxy", "-dir=/tmp/cloudsql"]
    keep_alive true
  end

  test do
    system "cloud_sql_proxy -version"
  end
end
