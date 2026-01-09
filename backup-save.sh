#!/usr/bin/env bash

set -xe

SAVE_DIRECTORY="/home/egidio/.var/app/com.valvesoftware.Steam/.local/share/Larian Studios/Baldur's Gate 3/PlayerProfiles/Public/Savegames/Story/e0cad730-4a6b-2993-c61c-f2a680a79f76__HonourMode"
BACKUP_DIRECTORY="/home/egidio/Documents/Baldur's Gate 3"

CURRENT_DATE_TIME="$(date +'%Y-%m-%dT%H:%M:%SZ')"
mkdir "${BACKUP_DIRECTORY}/${CURRENT_DATE_TIME}"
cp --recursive "${SAVE_DIRECTORY}" "${BACKUP_DIRECTORY}/${CURRENT_DATE_TIME}/"

# Keep only the latest 50 backups
find "${BACKUP_DIRECTORY}" -maxdepth 1 -type d -printf "%T@ %p\n" |
  sort -rn |
  tail -n +102 |
  cut -d' ' -f2- |
  xargs -d '\n' rm -rfv
