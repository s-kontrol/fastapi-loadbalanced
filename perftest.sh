#!/bin/bash
IP=$(hostname -I | awk '{print $1}')
if [ -z "$IP" ]; then
  echo "Failed to get our IP address."
  exit 1
else
    ./clear_logs.sh
    echo "IP address of fastapi-proxy-1 is $IP"
    echo "Running performance tests..."
    ab -n 40000 -c 2 -k -r http://$IP:8080/counter | tee -a log/benchmark.log
    echo "Results are in log/benchmark.log"
    exit 0
fi
