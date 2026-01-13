#!/bin/sh

DOWNLOADER_URL="https://downloader.hytale.com/hytale-downloader.zip"

DOWNLOADER_TEMP_DIR="$(mktemp -d)"
trap 'rm -rf "$DOWNLOADER_TEMP_DIR"' EXIT

# Download, extract and run hytale downloader
cd "$DOWNLOADER_TEMP_DIR"

echo "Downloading Downloader..."
curl -fsSL -o "./downloader.zip" "$DOWNLOADER_URL"
echo "Downloading Downloader... Done!"

echo "Extracting Downloader..."
unzip -q -d "./" "./downloader.zip" "hytale-downloader-linux-amd64"
mv "./hytale-downloader-linux-amd64" "./downloader"
chmod +x "./downloader"
echo "Extracting Downloader... Done!"

cd -

echo "Run Downloader..."
./downloader -download-path "./server.zip"
unzip -q -d "./server" "$DOWNLOADER_TEMP_DIR/server.zip"
ls -al "./server"
echo "Run Downloader... Done!"

