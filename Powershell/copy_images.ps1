# Add required assemblies for clipboard and image handling
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Function to check if clipboard history is enabled
function Test-ClipboardHistoryEnabled {
    $clipboardSettings = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Clipboard" -ErrorAction SilentlyContinue
    if ($null -eq $clipboardSettings -or $clipboardSettings.EnableClipboardHistory -ne 1) {
        Write-Host "Warning: Clipboard history is not enabled. Enable it with Windows + V" -ForegroundColor Yellow
        Write-Host "To enable permanently: Settings -> System -> Clipboard -> Turn on 'Clipboard history'" -ForegroundColor Yellow
        return $false
    }
    return $true
}

# Function to copy image to clipboard with validation
function Copy-ImageToClipboard {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ImagePath
    )
    
    try {
        if (-not (Test-Path $ImagePath)) {
            Write-Host "Error: Image not found: $ImagePath" -ForegroundColor Red
            return $false
        }

        $image = [System.Drawing.Image]::FromFile($ImagePath)
        [System.Windows.Forms.Clipboard]::SetImage($image)
        $image.Dispose()
        
        Write-Host "Successfully copied: $ImagePath" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "Error copying image $ImagePath : $_" -ForegroundColor Red
        return $false
    }
}

# Main script
$ErrorActionPreference = "Stop"

# Check clipboard history
Test-ClipboardHistoryEnabled

# Get image paths from arguments or pipeline
$imagePaths = @($input)
if ($imagePaths.Count -eq 0) {
    $imagePaths = $args
}

if ($imagePaths.Count -eq 0) {
    Write-Host "No image paths provided. Please provide one or more image paths." -ForegroundColor Red
    Write-Host "Usage: .\copy_images.ps1 image1.jpg image2.jpg ..." -ForegroundColor Yellow
    exit 1
}

Write-Host "Processing $($imagePaths.Count) images..." -ForegroundColor Cyan

# Track success count
$successCount = 0

# Process each image
foreach ($path in $imagePaths) {
    Write-Host "`nProcessing: $path" -ForegroundColor Blue
    
    if (Copy-ImageToClipboard $path) {
        $successCount++
        # Add delay between copies to ensure clipboard history captures each image
        Start-Sleep -Milliseconds 500
    }
}

# Final status
Write-Host "`nOperation complete!" -ForegroundColor Cyan
Write-Host "Successfully copied $successCount of $($imagePaths.Count) images" -ForegroundColor Green
Write-Host "Press Windows + V to access clipboard history" -ForegroundColor Yellow

