-- Dar permissão de execução
chmod +x scripts/kafka_producer_custom.sh



-- Rodar o Script
docker exec -it broker bash -c "/opt/project/scripts/kafka_producer_custom.sh"
