#!/usr/bin/env bash
git pull
docker build -t lighthouse-app .
docker stop -t 0 lighthouse-app
docker-compose up -d
