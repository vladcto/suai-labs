$PathToFile = Read-Host "Enter the path and filename to save the results (e.g., C:\path\to\file.txt):"
$FolderPath = Read-Host "Enter the folder path to search for content (e.g., C:\path\to\folder):"
$IgnoredSubstrings = Read-Host "Enter the substrings to ignore (space-separated) (ignore to skip):"

$IgnoredSubstringsArray = $IgnoredSubstrings -split " " | ForEach-Object { $_.Trim() }

# Clear the result file if it exists
if (Test-Path $PathToFile) {
    Clear-Content -Path $PathToFile
}

$Files = Get-ChildItem -Path $FolderPath -Recurse -File

foreach ($File in $Files) {
    $Content = "$($File.Name)`n`n"
    $FileName = $File.Name
    $IgnoreFile = $false

    if (![string]::IsNullOrEmpty($IgnoredSubstrings)) {
        foreach ($Substring in $IgnoredSubstringsArray) {
            if ($FileName.EndsWith($Substring)) {
                $IgnoreFile = $true
                break
            }
        }
    }

    if ($IgnoreFile) {
        continue
    }

    $FileContent = Get-Content -Path $File.FullName -Raw -Encoding Default
    $Content += $FileContent.Replace("`r`n", "`n")
    $Content += "`n"

    $Content | Out-File -FilePath $PathToFile -Append -Force -Encoding Default
}

if (![string]::IsNullOrEmpty($PathToFile)) {
    Write-Host "Content saved to $PathToFile"
} else {
    Write-Host "Invalid path and filename. Content not saved."
}
