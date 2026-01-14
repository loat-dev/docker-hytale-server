#!/bin/sh

HEALTHY_FILE="/app/.healthy"

if [ -f "$HEALTHY_FILE" ]; then
  # healthy
  exit 0
else
  # unhealthy
  exit 1
fi
