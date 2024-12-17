if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

#Tehtävän nimi
$Taskname = 'Virustarkistus'

#Käyttäjä
$User = "DESKTOP-8SR35N3\user"

#Suoritettava komento
$Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument '-NoProfile -ExecutionPolicy Bypass -Command Start-MpWDOScan'


#Polku 
$Scriptpath = "C:\Users\user\tehtavat\Virustarkistus.ps1"

#Aika jolloin scripti suoritetaan
$Trigger =  New-ScheduledTaskTrigger -Weekly -WeeksInterval 4 -DaysOfWeek Monday -At 12:00am 

#Scripti ajetaan tiettyyn kellonaikaan
Register-ScheduledTask -TaskName $TaskName -Trigger $Trigger -user $User -Action $Action -RunLevel Highest -Force