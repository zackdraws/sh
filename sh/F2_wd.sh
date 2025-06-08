#!/bin/bash

# Prompt for file extension (e.g., jpg, png)
read -p "Enter the file extension (e.g., jpg, png): " file_extension

# Loop through files with the given extension in the current directory
for file in *."$file_extension"; do
  if [[ -f "$file" ]]; then
    # Get the modification time and format it
    mod_time=$(stat -c "%y" "$file" | cut -d'.' -f1)
    formatted_date=$(date -d "$mod_time" "+%Y%m%d%H%M%S" 2>/dev/null)

    # If date parsing failed, continue to the next file
    if [[ -z "$formatted_date" ]]; then
      echo "Failed to parse date for $file. Using fallback name."
      formatted_date="unknown_$RANDOM"
    fi

    new_filename="${formatted_date}.${file_extension}"

    # Avoid overwriting files
    if [[ -e "$new_filename" ]]; then
      new_filename="${formatted_date}_$RANDOM.${file_extension}"
    fi

    mv "$file" "$new_filename"
    echo "Renamed: $file -> $new_filename"
  fi
done
