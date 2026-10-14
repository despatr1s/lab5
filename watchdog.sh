#!/bin/bash
CONTAINER_NAME="watched_app"
LOG_FILE="watchdog.log"

if docker ps --filter "name=$CONTAINER_NAME" --filter "status=running" | grep -q "$CONTAINER_NAME"; then
    echo "$(date): OK, $CONTAINER_NAME працює." >> "$LOG_FILE"
    exit 0
else
    echo "$(date): УВАГА, $CONTAINER_NAME не працює. Перезапускаю..." >> "$LOG_FILE"
    docker start "$CONTAINER_NAME"
    exit 1
fi
