# Define the list of filenames as a single line of text
$fileNamesText = @"

"@

# Split the filenames into an array
$fileNames = $fileNamesText -split ' '

# Define the prefix and suffix
$prefix = "[[file:"
$suffix = "]]"

# Create the formatted list
$formattedList = $fileNames | ForEach-Object { "$prefix$_$suffix" }

# Join the formatted list into a single string with newline characters
$formattedListString = $formattedList -join "`n"

# Copy the formatted list to the clipboard
$formattedListString | Set-Clipboard
