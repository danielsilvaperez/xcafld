#!/usr/bin/env bash

set -e

# Repository URL
REPO_URL="https://raw.githubusercontent.com/danielsilvaperez/xcafld/main/xcafld"
INSTALL_DIR="/usr/local/bin"
FALLBACK_DIR="$HOME/.local/bin"

# Determine target directory
TARGET_DIR="${INSTALL_DIR}"
if [ ! -w "${INSTALL_DIR}" ]; then
  echo "=> No write permissions for ${INSTALL_DIR}. Falling back to ${FALLBACK_DIR}..."
  TARGET_DIR="${FALLBACK_DIR}"
  mkdir -p "${TARGET_DIR}"
fi

# Download xcafld
DEST_FILE="${TARGET_DIR}/xcafld"
echo "=> Downloading xcafld to ${DEST_FILE}..."

if curl -sL "$REPO_URL" -o "$DEST_FILE"; then
  # Make executable
  chmod +x "$DEST_FILE"
  echo "=> Successfully installed xcafld v1.0.0."
  
  if [[ "$TARGET_DIR" == "$FALLBACK_DIR" ]]; then
      echo "=> NOTE: Ensure ${FALLBACK_DIR} is in your system PATH to run 'xcafld' globally."
  fi
  
  echo "=> Usage: xcafld <filename>"
else
  echo "=> Error: Failed to download xcafld from GitHub."
  exit 1
fi
