#!/bin/bash
read -rp "Enter the path to the directory: " dir

if [[ ! -d "$dir" ]]; then

    echo "Directory does not exist."

    exit 1

fi





read -rp "Enter the word to remove from filenames: " word





for file in "$dir"/*; do



    filename=$(basename "$file")

    if [[ "$filename" == *"$word"* ]]; then

        newname="${filename//$word/}"

        mv -i "$file" "$dir/$newname"

        echo "Renamed: $filename -> $newname"

    fi

done



echo "Done."
