#!/bin/bash
set -e

echo "Pulling images..."
docker compose pull

echo "Starting services..."
docker compose up -d

echo "Waiting for API..."
sleep 15

echo "ClearML UI available at http://localhost"