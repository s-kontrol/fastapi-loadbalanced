#!/bin/bash
./clear_logs.sh
docker-compose up -d --build --remove-orphans
