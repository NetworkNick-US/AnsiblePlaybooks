#Run to see an output of all software on your system.
#Get-WmiObject -Class Win32_Product | Select-Object Name, Version | Out-Host

# Read the software versions from the file
$softwareVersions = Get-Content -Path "software_versions.txt" | ForEach-Object {
    $split = $_.Split("=")
    @{ $split[0] = $split[1] }
}

# Retrieve a list of installed software and their version numbers
$installedSoftware = Get-WmiObject -Class Win32_Product | Select-Object Name, Version

# Compare the version numbers of installed software to the required versions
foreach ($software in $softwareVersions.Keys) {

    $requiredVersion = $softwareVersions.$software
    $installedVersion = $installedSoftware | Where-Object { $_.Name -eq $software } | Select-Object -ExpandProperty Version

#    Write-Host "$software testing. installed version $installedVersion, required version $requiredVersion"

    if ($installedVersion -eq $null) {
        Write-Host "$software is not installed" -ForegroundColor Black
    }
    elseif ($installedVersion -lt $requiredVersion) {
        Write-Host "$software is installed but needs to be updated (installed version $installedVersion, required version $requiredVersion)" -ForegroundColor Red
    }
    elseif ($installedVersion -ge $requiredVersion) {
        Write-Host "$software is installed and up to date (version $installedVersion)"
    }
    else {
        Wrie-Host "An unknown error occured with $software. Installed Version: $installedVersion. Required Version: $requiredVersion."
    }
}
