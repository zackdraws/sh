param(
    [string]$TVPaintFile
)

# Path to the TVPaint executable
$TVPaintExec = "C:\Program Files\TVPaint Developpement\TVPaint Animation 11.7.1 Pro (64bits) (STD)\TVPaint Animation 11.7.1 Pro (64bits) (STD).exe"

# Check if the executable exists
if (-Not (Test-Path $TVPaintExec)) {
    Write-Host "TVPaint executable not found: $TVPaintExec"
    exit 1
}

# Check if the TVPaint file exists
if (-Not (Test-Path $TVPaintFile)) {
    Write-Host "File does not exist: $TVPaintFile"
    exit 1
}

# Start TVPaint with the specified file
Start-Process -FilePath $TVPaintExec -ArgumentList $TVPaintFile
