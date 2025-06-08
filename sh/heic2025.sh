#!/bin/bash



# Default values

InputFolder="."

OutputFolder="."



# Parse parameters

while [[ "$#" -gt 0 ]]; do

    case $1 in

        -InputFolder|--input)

            InputFolder="$2"

            shift 2

            ;;

        -OutputFolder|--output)

            OutputFolder="$2"

            shift 2

            ;;

        *)

            echo "Unknown parameter passed: $1"

            echo "Usage: $0 [-InputFolder <input>] [-OutputFolder <output>]"

            exit 1

            ;;

    esac

done



# Create output folder if it doesn't exist

mkdir -p "$OutputFolder"



# Find .heic/.HEIC files (non-recursive, case-insensitive)

mapfile -t files < <(find "$InputFolder" -maxdepth 1 -type f -iname "*.heic")



if [ ${#files[@]} -eq 0 ]; then

    echo "No .heic or .HEIC files found in $InputFolder"

    exit 0

fi



# Check for available conversion tool

if command -v magick &> /dev/null; then

    convert_cmd="magick convert"

elif command -v convert &> /dev/null; then

    convert_cmd="convert"

else

    echo "Error: Neither 'magick' nor 'convert' command found. Please install ImageMagick."

    exit 1

fi



# Convert each file

for file in "${files[@]}"; do

    filename=$(basename "$file")

    base="${filename%.*}"

    output="$OutputFolder/$base.jpg"



    echo "Converting: $file -> $output"

    $convert_cmd "$file" "$output"

done
