curl -i -X POST \
    -H "Accept:application/json" \
    -H  "Content-Type:application/json" \
    http://connect-db:8083/connectors/ -d '
    {
	  "name": "inventory-connector",
	  "config": {
		  "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
		  "tasks.max": "1",
		  "database.hostname": "0.0.0.0",
		  "database.port": "5432",
		  "database.user": "postgres",
		  "database.password": "postgres",
		  "database.dbname" : "postgres",
		  "database.server.name": "dbserver1",
		  "schema.whitelist": "inventory"
		  }
	 }'
