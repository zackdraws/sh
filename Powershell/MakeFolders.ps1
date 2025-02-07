# Parent folder 
$parentFolder = "C:\S\EM\O"
# List of names
$names = @("liam", "steve", "tyler")
# Create a folder for each name
foreach ($name in $names) {
    $folderPath = Join-Path -Path $parentFolder -ChildPath $name
    New-Item -Path $folderPath -ItemType Directory -Force
}

Write-Host "Folders successfully created!"
;;
