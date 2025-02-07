# Define an array of shortcut paths
$shortcuts = @(
    "C:\Users\zacha\OneDrive\Documents\Syncthing\syncthing-windows-amd64-v1.23.2\syncthing.exe",
    "C:\Program Files\Mozilla Thunderbird Beta\thunderbird.exe"
    "C:\S\EM\bin\emacs-29.1.exe"
    "C:\Users\zacha\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Plex Media Server.lnk"
)

# Loop through each shortcut and start it in the background
foreach ($shortcut in $shortcuts) {
    Start-Process -FilePath $shortcut -WindowStyle Hidden
}


# Change directory to 'C:\s\IPAD\T_AL\' (assuming it's a typo and you meant 'cd')
Set-Location 'C:\s\em\o'




# Open Google Chrome and navigate to a specific webpage
$webpageUrl = "https://calendar.google.com/"  # Replace with your desired webpage URL
Start-Process "chrome.exe" -ArgumentList $webpageUrl

# Execute the command 'yazi' in WSL (Windows Subsystem for Linux)
Invoke-Expression 'wsl foot yazi'
