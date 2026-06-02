# PowerShell script to create a Desktop Shortcut for the Book Store System

$WshShell = New-Object -ComObject WScript.Shell
$DesktopPath = [System.Environment]::GetFolderPath('Desktop')
$ShortcutPath = Join-Path $DesktopPath "BookHaven.lnk"
$Shortcut = $WshShell.CreateShortcut($ShortcutPath)

# Set the target to launch the dev server and open the browser
# We use cmd /c to ensure npm and browser open together
$ProjectPath = "c:\Users\Sanjay\OneDrive\Desktop\book-store-system"
$Shortcut.TargetPath = "cmd.exe"
$Shortcut.Arguments = "/c ""cd /d $ProjectPath && start npm run dev && timeout /t 5 && start http://localhost:3000"""

# Set working directory
$Shortcut.WorkingDirectory = $ProjectPath

# Set the Icon
$Shortcut.IconLocation = "$ProjectPath\public\app-icon.png"

$Shortcut.Save()

Write-Host "Success! A shortcut 'BookHaven' has been created on your Desktop." -ForegroundColor Green
Write-Host "You can now launch your Book Store System directly from your desktop." -ForegroundColor Cyan
