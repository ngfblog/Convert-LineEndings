# Convert-LineEndings.ps1
# Description: Recursively convert Windows line endings (CRLF) to Unix (LF) for selected file types in a chosen folder.

Add-Type -AssemblyName System.Windows.Forms

# Show folder selection dialog
$folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
$folderBrowser.Description = "Select folder to convert line endings (Windows to Unix)"

if ($folderBrowser.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
    $folderPath = $folderBrowser.SelectedPath

    Write-Host "`nSelected Folder: $folderPath" -ForegroundColor Cyan
    Write-Host "Starting conversion..." -ForegroundColor Yellow

    # Define file extensions to include (customize as needed)
    $extensions = @("*.sh", "*.txt", "*.conf", "*.ps1", "*.env", "*.cfg", "*.ini")

    $converted = 0
    foreach ($ext in $extensions) {
        $files = Get-ChildItem -Path $folderPath -Recurse -File -Include $ext
        foreach ($file in $files) {
            Write-Host "Converting: $($file.FullName)"
            (Get-Content $file.FullName -Raw) -replace "`r`n", "`n" | Set-Content -NoNewline $file.FullName
            $converted++
        }
    }

    Write-Host "`nConversion complete! $converted file(s) updated." -ForegroundColor Green
} else {
    Write-Host "No folder selected. Exiting." -ForegroundColor Red
}
