
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

Specify any configuration using environment variables during install (`cloud_sql_proxy --help` for more details)
```
CSQL_PROXY_INSTANCE_CONNECTION_NAME_0=xxx brew install cloud_sql_proxy
```

To change the configuration at a later time
```
brew services stop cloud_sql_proxy
CSQL_PROXY_INSTANCE_CONNECTION_NAME_0=yyy brew reinstall cloud_sql_proxy
brew services start cloud_sql_proxy
```
