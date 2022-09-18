#!/bin/bash

filename='test_results.txt'
json_results=$(speedtest -I wlan0 --progress no -f json-pretty --accept-license)

download_bytes=$(echo $json_results | jq '.download.bandwidth')
download=$(echo "scale=2 ; $download_bytes / 125000" | bc)

upload_bytes=$(echo $json_results | jq '.upload.bandwidth')
upload=$(echo "scale=2 ; $upload_bytes / 125000" | bc)

ping=$(echo $json_results | jq '.ping.latency')

timestamp=$(date +"%x %X %Z")

parsed_results="${timestamp} Download: ${download} Upload: ${upload} Ping: ${ping}"

echo $parsed_results | tee -a $filename > /dev/null
