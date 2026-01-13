#!/bin/sh
set -e

DOWNLOADER_TEMP_DIR="$(mktemp -d)"

echo "Run Downloader..."
"/app/downloader" -download-path "$DOWNLOADER_TEMP_DIR/server.zip"

unzip -q "$DOWNLOADER_TEMP_DIR/server.zip" -d "$DOWNLOADER_TEMP_DIR/server"
ls -al "."
echo "Run Downloader... Done!"

