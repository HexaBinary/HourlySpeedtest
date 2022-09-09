#!/bin/bash

filename='test_results.txt'
json_results=$(speedtest -I wlan0 --progress no -f json-pretty)

download_bytes=$(echo $json_results | jq '.download.bandwidth')
download=$(echo "scale=2 ; $download_bytes / 125000" | bc)

upload_bytes=$(echo $json_results | jq '.upload.bandwidth')
upload=$(echo "scale=2 ; $upload_bytes / 125000" | bc)

ping=$(echo $json_results | jq '.ping.latency')

timestamp=$(echo $json_results | jq '.timestamp')

parsed_results="Time: ${timestamp} Download: ${download} Upload: ${upload} Ping: ${ping}"

echo $parsed_results | tee -a $filename > /dev/null
