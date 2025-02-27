#!/bin/bash

# Check if a file path is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 /path/to/tvpaint/file.tvp"
    exit 1
fi

# Use the provided file path
TVPAINT_FILE="$1"

# Path to the TVPaint executable (using Windows path format)
TVPAINT_EXEC="C:/Program Files/TVPaint Developpement/TVPaint Animation 11.7.1 Pro (64bits) (STD)/TVPaint Animation 11.7.1 Pro (64bits) (STD).exe"

# Check if the TVPaint file exists
if [ -f "$TVPAINT_FILE" ]; then
    # Open the TVPaint executable with the specified file
    cmd.exe /C start "" "$TVPAINT_EXEC" "$TVPAINT_FILE"
else
    echo "File does not exist: $TVPAINT_FILE"
fi