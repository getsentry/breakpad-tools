#!/bin/bash
set -e

if [[ "$#" -lt 2 ]]; then
    echo "Usage: $0 <directory> <symbol-file>"
    echo "Moves symbols into the correct location"
    exit 1
fi

TARGET_DIR=$1
mkdir -p "$TARGET_DIR"
shift

for SYM_FILE in "$@"; do
    if [ ! -f "$SYM_FILE" ]; then
        echo "File not found: $SYM_FILE"
        continue
    fi

    HEADER="$(head -1 "$SYM_FILE")"
    MODULE_ID=$(echo "$HEADER" | cut -d' ' -f4)
    MODULE_NAME="$(echo "$HEADER" | cut -d' ' -f5-)"
    FILE_NAME="${MODULE_NAME#*.pdb}.sym"

    TARGET_PATH="$TARGET_DIR/$MODULE_NAME/$MODULE_ID"
    TARGET_FILE="$TARGET_PATH/$MODULE_NAME.sym"
    mkdir -p "$TARGET_PATH"
    cp "$SYM_FILE" "$TARGET_FILE"
done
