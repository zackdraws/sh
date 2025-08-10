#!/usr/bin/env fish

# Loop over all mp4 files in the current directory
for file in *.mp4
    # Get the base filename without extension
    set base (basename "$file" .mp4)
    echo "Converting $file to $base.gif..."
    # Run ffmpeg to convert the mp4 to gif
    ffmpeg -i "$file" -vf "fps=10,scale=480:-1:flags=lanczos" -c:v gif "$base.gif"

    echo "Done: $base.gif"
end
