#!/bin/bash

PULSAR_PERF="/pulsar/bin/pulsar-perf"
TOPIC="persistent://public/default/perf-test"
COUNT=20000

OUTPUT_FILE="/opt/project/results/producer_pulsar_perf.txt"
mkdir -p "$(dirname "$OUTPUT_FILE")"

start_time=$(date +%s)

$PULSAR_PERF produce \
  -m "$COUNT" \
  -r 0 \
  -s 1024 \
  "$TOPIC" \
  > "$OUTPUT_FILE" 2>&1

end_time=$(date +%s)
elapsed=$((end_time - start_time))

echo "Sent $COUNT messages in ${elapsed}s" >> "$OUTPUT_FILE"
