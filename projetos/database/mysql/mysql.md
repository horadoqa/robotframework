# Test MySQL com Robot 

https://hub.docker.com/_/mysql

## Executar

```bash
docker run --rm --name mysql -e MYSQL_ROOT_PASSWORD=pass -e MYSQL_DATABASE=db -e MYSQL_USER=db_user -e MYSQL_PASSWORD=pass -p 3306:3306 -d mysql
```

## For tests with pyodbc install the ODBC driver

https://learn.microsoft.com/en-us/sql/connect/odbc/windows/system-requirements-installation-and-driver-files?view=sql-server-ver16#installing-microsoft-odbc-driver-for-sql-server