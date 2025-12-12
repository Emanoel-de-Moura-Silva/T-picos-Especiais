#!/bin/bash

# Broker e topic
BROKER_URL="pulsar://localhost:6650"
TOPIC="perf-test"
MESSAGE_FILE="/opt/project/data/message.json"
COUNT=20000
OUTPUT_FILE="/opt/project/results/producer_pulsar_custom.txt"

# Caminho do cliente Pulsar
PULSAR_CLIENT="bin/pulsar-client"

# Cria arquivo de saída
mkdir -p /opt/project/results
echo "Sending $COUNT messages to Pulsar topic '$TOPIC'..." > "$OUTPUT_FILE"

start_time=$(date +%s)

# Loop de envio
for i in $(seq 1 $COUNT); do
    $PULSAR_CLIENT produce "$TOPIC" \
        -m "$(cat $MESSAGE_FILE)" \
        -n 1 \
        -s "$BROKER_URL" \
        >> "$OUTPUT_FILE" 2>&1
done

end_time=$(date +%s)
elapsed=$((end_time - start_time))

echo "Sent $COUNT messages in ${elapsed}s" >> "$OUTPUT_FILE"
