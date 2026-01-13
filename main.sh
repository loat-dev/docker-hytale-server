#!/bin/sh

DOWNLOADER_URL="https://downloader.hytale.com/hytale-downloader.zip"

DOWNLOADER_TEMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

# Download and extract hytale downloader
echo "Downloading Hytale Downloader..."
curl -fsSL -o "$DOWNLOADER_TEMP_DIR/downloader.zip" "$DOWNLOADER_URL"
echo "Downloading Hytale Downloader... Done!"

echo "Extracting Hytale Downloader..."
mkdir -p "./downloader"
unzip -q -d "./downloader" "$DOWNLOADER_TEMP_DIR/downloader.zip" "hytale-downloader-linux-amd64"
echo "Extracting Hytale Downloader... Done!"

ls -al "./downloader"
