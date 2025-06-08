param(
    [string]$InputFolder = ".",
    [string]$OutputFolder = "."
)

if (-not (Test-Path $OutputFolder)) {
    New-Item -ItemType Directory -Path $OutputFolder | Out-Null
}

$heicFiles = Get-ChildItem -Path $InputFolder -Filter *.heic

foreach ($file in $heicFiles) {
    $inputPath = $file.FullName
    $outputPath = Join-Path $OutputFolder ($file.BaseName + ".jpg")

    Write-Host "Converting: $inputPath -> $outputPath"

    # Use ImageMagick's `magick` command
    & magick "$inputPath" "$outputPath"
}
