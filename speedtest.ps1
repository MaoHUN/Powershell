#first download speedtest-cli from: https://www.speedtest.net/apps/cli
#Unzip and place the Scrip whit same folder.
#Work only if you start in Powershell
#Get SSID name
$ssid_name = (Get-NetConnectionProfile).Name
#Get current date
$get_date = Get-Date -UFormat "%Y-%m-%d"
#Create a file name ssid name and current date
$file_name = $ssid_name + "-" + $get_date
#Output folder
$folder_resoult = "resault"
$Path = $folder_resoult

if (!(Test-Path $Path)) {
New-Item -ItemType Directory -Path $folder_resoult
Write-Host "Folder Created`n"
Write-Host "Starting speedtest...`n"
.\speedtest.exe --server-id=4246 --progress=no -u auto-binary-bits | Out-File -FilePath .\resault\$file_name".csv"
Write-Host "Test is done."
}
else {
Write-Host "resault Folder is exist`n"
Write-Host "Starting speedtest...`n"
.\speedtest.exe --server-id=4246 --progress=no -u auto-binary-bits | Out-File -FilePath .\resault\$file_name".csv"
Write-Host "Test is done."
}