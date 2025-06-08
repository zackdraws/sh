#!/bin/bash

set -e



# Create output directory

mkdir -p normalized



# Maximum width for resized images (change if needed)

MAX_WIDTH=2000



# Loop over common image types

for img in *.jpg *.jpeg *.png *.tif *.tiff; do

  [ -f "$img" ] || continue



  # Output filename

  base=$(basename "$img")

  out="normalized/${base%.*}.jpg"



  echo "Processing: $img → $out"



  # Use convert (or magick convert) to:

  #  - auto-orient

  #  - resize to $MAX_WIDTH if larger

  #  - convert to JPEG

  convert "$img" -auto-orient -resize "${MAX_WIDTH}x>" -quality 95 "$out"

done



echo "✅ All images normalized and saved to ./normalized/"
