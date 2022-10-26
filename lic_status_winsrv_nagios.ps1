#Windows licens experation status checking for nagios
#Get the licens information
$get_licens = Get-CimInstance SoftwareLicensingProduct | Select-Object GracePeriodRemaining
#to day format
$licens = $get_licens.GracePeriodRemaining / 1440
#Truncate to integer
$remain_days = [Math]::Truncate($licens)
#Nagios notification
# greter then 14 day
if ($remain_days -gt 14)
{write-host "0 Windows_licence_expiration myvalue=$remain_days;14;7 ok:$remain_days day(s) left"}
#14 day >= 7day
elseif ($remain_days -ge 7 -and $remain_days -le 14)
{write-host "1 Windows_licence_expiration myvalue=$remain_days;14;7 warning:$remain_days day(s) left"}
#Less then 7 days
elseif ($remain_days -le 7)
{write-host "2 Windows_licence_expiration myvalue=$remain_days;14;7 error:$remain_days day(s) left"}
#anything else. :)
else
{Write-Host "unknow"}