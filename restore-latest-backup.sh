#!/usr/bin/env bash

set -xe

SAVE_DIRECTORY="/home/egidio/.local/share/Steam/steamapps/compatdata/1086940/pfx/drive_c/users/steamuser/AppData/Local/Larian Studios/Baldur's Gate 3/PlayerProfiles/Public/Savegames/Story/e0cad730-4a6b-2993-c61c-f2a680a79f76__HonourMode"
BACKUP_DIRECTORY="/home/egidio/Documents/Baldur's Gate 3 Save Backups"

LAST_BACKUP=""
for BACKUP in "${BACKUP_DIRECTORY}"/*/; do
  LAST_BACKUP="${BACKUP}"
done
LAST_BACKUP="${LAST_BACKUP}/$(basename "${SAVE_DIRECTORY}")"

ORIGINAL_BACKUP_DIRECTORY="/tmp/bg3_original_saves/$(date +'%Y-%m-%dT%H:%M:%SZ')"
mkdir --parents "${ORIGINAL_BACKUP_DIRECTORY}"
mv "${SAVE_DIRECTORY}" "${ORIGINAL_BACKUP_DIRECTORY}/"
cp --recursive "${LAST_BACKUP}" "${SAVE_DIRECTORY}"
