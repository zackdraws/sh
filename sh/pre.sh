#!/usr/bin/env fish

function add_prefix_to_current_folder

    set folder (pwd)

    read -l -p "Enter the prefix to add to all files in '$folder': " prefix



    for file in *

        if test -f "$file"

            set newname "$prefix$file"

            mv "$file" "$newname"

            echo "Renamed: $file -> $newname"

        end

    end

end



add_prefix_to_current_folder
