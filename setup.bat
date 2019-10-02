

docker-compose exec connect-debezium bash -c "/scripts/create-pg-source.sh"
docker-compose exec connect bash -c "/scripts/create-pg-sink.sh"
docker-compose exec elasticsearch bash -c "/scripts/create-dynamic-mapping.sh"
docker-compose exec connect bash -c "/scripts/create-es-sink.sh"

curl "http://localhost:5601/api/saved_objects/index-pattern" -H "kbn-version: 6.3.0" -H "Content-Type: application/json;charset=UTF-8" -H "Accept: application/json, text/plain, */*" --data-binary "{\"attributes\":{\"title\":\"movements\",\"timeFieldName\":\"EXTRACT_TS\"}}"




