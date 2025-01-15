#Piilottaa powershell ikkunan alussa
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();

[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'

$console = [Console.Window]::GetConsoleWindow()

# 0 hide
[Console.Window]::ShowWindow($console, 0) | Out-Null


# Tarkistaa onko skriptin ajoon tarvittavat oikeudet
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { 
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit
}

#Muistutus tapahtuu maanantaista perjantaihin
$daysOfWeek = (Get-Date).DayOfWeek
if ($daysOfWeek -lt 1 -or $daysOfWeek -gt 5) {
Write-Host "ei ole arki, skriptiä ei ajeta"
exit
}

#Muistutus
$wshell = New-Object -ComObject Wscript.Shell
$result = $wshell.Popup("Aika pitää taukoa :)! Tallenna työsi, tietokone lukitaan kohta.", 30, "Taukohuomautus", 1 + 48) # 1 = OK/Cancel-painikkeet

# Tarkistetaan, mitä nappia käyttäjä painoi
if ($result -eq 2) { # Cancel-nappi
    Write-Host "Käyttäjä painoi Peruuta-painiketta. Lukitus perutaan."
    exit # Peruuta lukitus ja lopeta skriptin ajaminen
} elseif ($result -eq 1) { # OK-nappi
    Write-Host "Käyttäjä painoi OK-painiketta. Lukitus jatkuu normaalisti."
} elseif ($result -eq -1) { # Aikakatkaisu
    Write-Warning "Aikakatkaisu saavutettu. Jatketaan lukitsemista."
} else {
    Write-Warning "Tuntematon vastaus ($result). Jatketaan lukitsemista."
}


# Asetetaan aikarajoitukset ja varoitusviestit
$warnTime = 5 # minuuttia
$msgTimeout = 10 # sekuntia
$WarningMSG = "HUOM! Tietokone lukitaan pian, tallenna keskeneräiset työsi!!"

# Laskee aikaa automaattiselle lukitukselle, ja muuttaa minuutit ja tunnit sekunneiksi.
$sleepyTime = $maxTime * 60 * 60 
$warningTime = $warnTime * 60
Start-Sleep -Seconds ($sleepyTime - $warningTime)

# Varoitusviesti
$wshell.Popup($WarningMSG, $msgTimeout, "Tietokone lukitaan pian..", 0x0)


# Odottaa sekunnit loppuun ennen lukitusta.
Start-Sleep -Seconds $warningTime

# Lukitsee tietokoneen
Start-Sleep -Seconds 10
rundll32.exe user32.dll,LockWorkStation


