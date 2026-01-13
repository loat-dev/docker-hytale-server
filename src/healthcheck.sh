#!/bin/sh

READY_FILE="/run/.healthy"

if [ -f "$READY_FILE" ]; then
  # healthy
  exit 0
else
  # unhealthy
  exit 1
fi
