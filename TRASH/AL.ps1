# Define an array of shortcut paths
$shortcuts = @(
    "C:\Users\zacha\OneDrive\Desktop\Air.lnk",
    "C:\Program Files\Tencent\WeChat\WeChat.lnk",
    "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\OBS Studio\OBS Studio (64bit).lnk"
)

# Loop through each shortcut and start it in the background
foreach ($shortcut in $shortcuts) {
    Start-Process -FilePath $shortcut -WindowStyle Hidden
}

# Change directory to 'C:\s\IPAD\T_AL\' (assuming it's a typo and you meant 'cd')
Set-Location 'C:\s\IPAD\T_AL\'



# Open Google Chrome and navigate to a specific webpage
$webpageUrl = "https://drive.google.com/drive/u/0/folders/1QjxMgmpPf86Zmv1Ucd5BkHArpVd2_TU7"  # Replace with your desired webpage URL
Start-Process "chrome.exe" -ArgumentList $webpageUrl

# Open the PDF file in the default PDF viewer
$webpageURL = "C:\S\EM\O\Artist_Lab_IPSF_Animation_Camp_2.pdf"
Start-Process "chrome.exe" -ArgumentList $webpageUrl
# Execute the command 'yazi' in WSL (Windows Subsystem for Linux)
Invoke-Expression 'wsl foot yazi'
