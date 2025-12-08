#!/bin/bash

BROKER="localhost:9092"
TOPIC="perf-test"
MESSAGE_FILE="/opt/project/data/message.json"
COUNT=20000

KAFKA_BIN="/opt/kafka/bin"
OUTPUT_FILE="/opt/project/results/producer_custom.txt"

start_time=$(date +%s)

for i in $(seq 1 $COUNT); do
  cat "$MESSAGE_FILE"
done | "$KAFKA_BIN/kafka-console-producer.sh" \
      --bootstrap-server "$BROKER" \
      --topic "$TOPIC" \
      > "$OUTPUT_FILE" 2>&1

end_time=$(date +%s)
elapsed=$((end_time - start_time))

echo "Sent $COUNT messages in ${elapsed}s" >> "$OUTPUT_FILE"
