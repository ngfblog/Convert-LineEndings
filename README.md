# Convert Line Endings (CRLF to LF)

This PowerShell script recursively converts Windows-style line endings (CRLF: `\r\n`) to Unix-style line endings (LF: `\n`) in all matching text files within a specified folder.

## 📌 Features

- Converts line endings from CRLF to LF
- Recursively processes files in all subdirectories
- Supports multiple file types: `.sh`, `.txt`, `.conf`, `.ps1`, `.env`, `.cfg`, `.ini`
- Outputs a count of how many files were updated
- Works entirely on Windows (no external tools required)

## 📁 Target Folder

The target folder path is set directly in the script. You can edit the following line:

$folderPath = "B:\Unraid_Replica_BackupS\OS\pfSense"
🛠 How to Use
Download or copy the script into a file named Convert-LineEndings.ps1

Open PowerShell

Run the script with:
Set-ExecutionPolicy Bypass -Scope Process -Force
.\Convert-LineEndings.ps1
💡 You do not need admin privileges.

## 🧪 Output Example
Target Folder: B:\Unraid_Replica_BackupS\OS\pfSense
Starting conversion...
Converting: B:\Unraid_Replica_BackupS\OS\pfSense\example.sh
Converting: B:\Unraid_Replica_BackupS\OS\pfSense\config.conf

Conversion complete! 2 file(s) updated.
## 🧼 Tip
If you're copying files from Windows to Linux-based systems (e.g., Unraid, pfSense, Docker), converting line endings avoids issues like:

Permission denied errors

^M character artifacts

Shell script failures (/bin/bash^M: bad interpreter)

