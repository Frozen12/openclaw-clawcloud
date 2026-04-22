#!/bin/bash
set -e

MAX_RETRIES=30
WAIT_INTERVAL=2
VOLUME_PATH="${OPENCLAW_HOME:-/data/openclaw}"

echo "==> [entrypoint] Waiting for volume at $VOLUME_PATH..."

for i in $(seq 1 $MAX_RETRIES); do
  if [ -d "$VOLUME_PATH" ] && [ -w "$VOLUME_PATH" ]; then
    echo "==> [entrypoint] Volume ready ($i/$MAX_RETRIES)"
    break
  fi
  if [ "$i" -eq "$MAX_RETRIES" ]; then
    echo "ERROR: Volume $VOLUME_PATH not available after ${MAX_RETRIES}x${WAIT_INTERVAL}s"
    exit 1
  fi
  echo "==> [entrypoint] Waiting... ($i/$MAX_RETRIES)"
  sleep $WAIT_INTERVAL
done

echo "==> [entrypoint] Setting up cache directories..."
mkdir -p "${VOLUME_PATH}/.local/share/pnpm"
mkdir -p "${VOLUME_PATH}/.npm"
mkdir -p "${VOLUME_PATH}/.cache/uv"

echo "==> [entrypoint] Starting OpenClaw..."
exec node openclaw.mjs gateway --allow-unconfigured