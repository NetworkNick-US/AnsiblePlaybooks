#Run to see an output of all software on your system.
#Get-WmiObject -Class Win32_Product | Select-Object Name, Version | Out-Host

# Define a hashtable of software and their required version numbers
$softwareVersions = @{
    "Microsoft Office" = "16.0.14131.20278"
    "Google Chrome" = "94.0.4606.81"
    "Adobe Acrobat Reader DC" = "21.007.20091"
}

# Retrieve a list of installed software and their version numbers
$installedSoftware = Get-WmiObject -Class Win32_Product | Select-Object Name, Version

# Compare the version numbers of installed software to the required versions
foreach ($software in $softwareVersions.Keys) {
    $requiredVersion = $softwareVersions[$software]
    $installedVersion = $installedSoftware | Where-Object { $_.Name -eq $software } | Select-Object -ExpandProperty Version

    if ($installedVersion -eq $null) {
        Write-Host "$software is not installed"
    }
    elseif ($installedVersion -ge $requiredVersion) {
        Write-Host "$software is installed and up to date (version $installedVersion)"
    }
    else {
        Write-Host "$software is installed but needs to be updated (installed version $installedVersion, required version $requiredVersion)"
    }
}
