curl -i -X POST \
    -H "Accept:application/json" \
    -H  "Content-Type:application/json" \
    http://connect-db:8083/connectors/ -d '
    {
	  "name": "td-connector",
	  "config": {
		  "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
		  "tasks.max": "1",
		  "database.hostname": "postgres",
		  "database.port": "5432",
		  "database.user": "postgres",
		  "database.password": "postgres",
		  "database.dbname" : "postgres",
		  "database.server.name": "dbserver1",
		  "schema.whitelist": "td",
		  "key.converter": "org.apache.kafka.connect.storage.StringConverter",
		  "value.converter": "org.apache.kafka.connect.json.JsonConverter",
		  "transforms": "unwrap, flatten",
		  "transforms.unwrap.type": "io.debezium.transforms.ExtractNewRecordState",
		  "transforms.unwrap.operation.header":"true",
		  "transforms.flatten.type": "org.apache.kafka.connect.transforms.Flatten$Value",
		  "transforms.flatten.delimiter": "."
		  }
	 }'
