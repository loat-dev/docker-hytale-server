#!/bin/sh

HYTALE_DOWNLOADER="https://downloader.hytale.com/hytale-downloader.zip"

# Download and extract hytale downloader
curl -fsSL -o "./hytale_downloader.zip" "$HYTALE_DOWNLOADER"
mkdir -p "./hytale_downloader"
unzip "./hytale_downloader.zip" "hytale-downloader-linux-amd64" -d "./hytale_downloader"
ls -al "./hytale_downloader"
