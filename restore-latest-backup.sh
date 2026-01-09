#!/usr/bin/env bash

set -xe

SAVE_DIRECTORY="/home/egidio/.var/app/com.valvesoftware.Steam/.local/share/Larian Studios/Baldur's Gate 3/PlayerProfiles/Public/Savegames/Story/e0cad730-4a6b-2993-c61c-f2a680a79f76__HonourMode"
BACKUP_DIRECTORY="/home/egidio/Documents/Baldur's Gate 3"

LAST_BACKUP=""
for BACKUP in "${BACKUP_DIRECTORY}"/*/; do
  LAST_BACKUP="${BACKUP}"
done
LAST_BACKUP="${LAST_BACKUP}/$(basename "${SAVE_DIRECTORY}")"

ORIGINAL_BACKUP_DIRECTORY="/tmp/bg3_original_saves/$(date +'%Y-%m-%dT%H:%M:%SZ')"
mkdir --parents "${ORIGINAL_BACKUP_DIRECTORY}"
mv "${SAVE_DIRECTORY}" "${ORIGINAL_BACKUP_DIRECTORY}/"
cp --recursive "${LAST_BACKUP}" "${SAVE_DIRECTORY}"
