class CloudSqlProxy < Formula
  desc "The Cloud SQL Proxy for GoogleCloudPlatform"
  homepage "https://github.com/GoogleCloudPlatform/cloudsql-proxy"
  version "2.2.0"
  url "https://github.com/GoogleCloudPlatform/cloud-sql-proxy/archive/refs/tags/v#{version}.tar.gz"
  sha256 "83c3e801d9c153af47c74686e9d900e04adcbdb685328aad194bf91b55adc17c"
  head "https://github.com/GoogleCloudPlatform/cloud-sql-proxy.git"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"cloud_sql_proxy", "."
  end

  service do
    run [opt_bin/"cloud_sql_proxy"]
    keep_alive true
        
    # Select all environment variables that start with CSQL_PROXY_
    csql_proxy_env_vars = ENV.select { |k, _| k.start_with?("HOMEBREW_CSQL_PROXY_") }
    csql_proxy_env_vars = csql_proxy_env_vars.transform_keys do |key|
      key.sub(/^HOMEBREW_/, "")
    end
    
    environment_variables csql_proxy_env_vars
  end

  test do
    system "cloud_sql_proxy -version"
  end
end
