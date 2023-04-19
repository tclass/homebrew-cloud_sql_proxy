
## Homebrew Cloud SQL Proxy

in your terminal:
```
brew tap jmif/cloud_sql_proxy
brew install cloud_sql_proxy
```

### Service
To start the `cloud_sql_proxy` service, type
```
brew services start cloud_sql_proxy
```

Specify any configuration using environment variables (`cloud_sql_proxy --help` for more details)
```
CSQL_PROXY_INSTANCE_CONNECTION_NAME_0=xxx brew services start cloud_sql_proxy
```

