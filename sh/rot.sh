#!/usr/bin/env fish



# Check if ImageMagick's convert is installed

which convert > /dev/null

if test $status -ne 0

    echo "ImageMagick is not installed. Please install it first."

    exit 1

end



# Check if a file was provided

if test (count $argv) -eq 0

    echo "Please provide a file path."

    exit 1

end



# Get the file path from the arguments

set file $argv[1]



# Check if the provided file exists

if not test -f $file

    echo "The file '$file' does not exist."

    exit 1

end



# Extract the file extension

set extension (string split '.' $file)[-1]



# Check if the file is an image (you can add more extensions if needed)

if not echo $extension | grep -q -i 'jpg\|jpeg\|png\|gif\|bmp'

    echo "The file '$file' is not a supported image format (only jpg, jpeg, png, gif, bmp)."

    exit 1

end



# Rotate the image 90 degrees clockwise

convert "$file" -rotate 90 "$file"



# Print a message indicating the file was rotated

echo "Rotated '$file' by 90 degrees clockwise"
