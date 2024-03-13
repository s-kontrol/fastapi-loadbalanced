#!/bin/bash
:> log/log
docker-compose up -d --build --remove-orphans
