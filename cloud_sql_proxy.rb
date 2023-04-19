class CloudSqlProxy < Formula
  desc "The Cloud SQL Proxy for GoogleCloudPlatform"
  homepage "https://github.com/GoogleCloudPlatform/cloudsql-proxy"
  version "2.1.2"
  url "https://github.com/GoogleCloudPlatform/cloud-sql-proxy/archive/refs/tags/v#{version}.tar.gz"
  sha256 "c8866e3effa4c95b3fb6bf19a7f3a5f237e832786eaca6291062c7cfec94d725"
  head "https://github.com/GoogleCloudPlatform/cloud-sql-proxy.git"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"cloud_sql_proxy", "."
  end

  service do
    run [opt_bin/"cloud_sql_proxy"]
    keep_alive true
        
    # Select all environment variables that start with CSQL_PROXY_
    csql_proxy_env_vars = ENV.select { |k, _| k.start_with?("CSQL_PROXY_") }
    environment_variables csql_proxy_env_vars
  end

  test do
    system "cloud_sql_proxy -version"
  end
end
