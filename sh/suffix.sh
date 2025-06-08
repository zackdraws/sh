#!/bin/bash



# Prompt for the directory

read -p "Enter the directory path: " directory



# Validate directory

if [[ ! -d "$directory" ]]; then

  echo "Directory does not exist. Please check the path and try again."

  exit 1

fi



# Prompt for the suffix to add

read -p "Enter the suffix to add (e.g., _edited, _v2): " suffix



# Change to that directory

cd "$directory" || exit



# Loop through all regular files

for file in *; do

  if [[ -f "$file" ]]; then

    base="${file%.*}"

    ext="${file##*.}"



    # Handle files without extension

    if [[ "$file" == "$ext" ]]; then

      new_name="${base}${suffix}"

    else

      new_name="${base}${suffix}.${ext}"

    fi



    mv "$file" "$new_name"

    echo "Renamed: $file -> $new_name"

  fi

done
