#!/bin/bash
./clear_logs.sh
echo "Shutting down containers..."
docker-compose down -v
echo "Starting Containers"
docker-compose up -d --build --remove-orphans
echo "Waiting 5 seconds to start performance tests.."
sleep 5
echo "Running performance tests..."
./perftest.sh || echo "Apache Benchmark is not installed. Please install apache2-utils."
