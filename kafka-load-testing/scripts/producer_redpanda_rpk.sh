#!/bin/bash

# Broker Redpanda dentro do container
BROKER="localhost:9092"
TOPIC="perf-test"
MESSAGE_FILE="/opt/project/data/message.json"
COUNT=20000  # ou o número de mensagens que você quiser

OUTPUT_FILE="/opt/project/results/producer_redpanda_rpk.txt"

# Garante que a pasta de resultados exista
mkdir -p "$(dirname "$OUTPUT_FILE")"

start_time=$(date +%s)

# Envia COUNT cópias do JSON para o rpk
for i in $(seq 1 "$COUNT"); do
  cat "$MESSAGE_FILE"
done | rpk topic produce "$TOPIC" \
       -X brokers="$BROKER" \
       > "$OUTPUT_FILE" 2>&1

end_time=$(date +%s)
elapsed=$((end_time - start_time))

echo "Sent $COUNT messages in ${elapsed}s" >> "$OUTPUT_FILE"
