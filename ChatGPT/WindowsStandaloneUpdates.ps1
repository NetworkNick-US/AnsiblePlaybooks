# Define the path to the folder containing the update files
$updateFolderPath = "C:\updates"

# Get a list of all the update files in the folder
$updateFiles = Get-ChildItem $updateFolderPath -Filter "*.msu"

# Loop through each update file and install it using the WUSA.exe command
foreach ($updateFile in $updateFiles) {
    Write-Host "Installing $($updateFile.Name)..."
    $installCommand = "wusa.exe `"$($updateFile.FullName)`" /quiet /norestart"
    Start-Process -FilePath $installCommand -Wait
}

# Reboot the system to complete the installation process
Write-Host "All updates have been installed. The system will reboot in 15 seconds..."
Start-Sleep -Seconds 15
Restart-Computer -Force
