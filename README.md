README: 
Tauko ja lukitusscripti 1.0

TOIMINTAPERIAATE:

-Skripti ajaa itseään neljän tunnin sykleissä aina arkipäivisin, kun käyttäjä on kirjautuneena. Skriptin tarkoitus on edistää taukojen pitämistä työpäivän aikana näyttämällä muistutuksia säännöllisin väliajoin, ja lukitsemalla tietokone tietyn ajan kuluttua.
-Näyttää käyttäjälle ponnahdusikkunan, joka muistuttaa tauon pitämisestä. Ponnahdusikkunassa on painikkeet "OK" ja "Cancel". Ponnahdusikkuna häviää kymmenen sekunnin jälkeen, jos käyttäjä ei reagoi siihen.
-Kun painaa "OK" skriptin ajoa jatketaan, jos painaa "Cancel" skriptin toiminta keskeytetään, ja skripti ajaa itsensä seuraavan kerran 4 tunnin päästä.
-Käyttäjällä on 10 minuuttia aikaa tallentaa keskeneräiset työt, ennen kuin ajastus menee loppuun ja uloskirjastuminen tapahtyuu.

MITEN SKRIPTI OTETAAN KÄYTTÖÖN?

1. Lataa tiedosto "Tauonmuistuttaja.ps1" githubista.
2. Tarkista, onko skriptien ajo sallittua windows-ympäristössä jota käytät, sen voi tarkistaa Powershellissä komennolla "Set-ExecutionPolicy RemoteSigned"
3. Testaa skriptin toimivuus ajamalla se manuaalisesti Powershellissä.

OMINAISUUDET:

-Powershell ikkunan piilotus, koodissa on seuraava funktio:

Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow(); //tämä tarkistaa konsoli-ikkunan tilan, eli onko ikkuna avoinna ja skripti pyörimässä.

[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'

$console = [Console.Window]::GetConsoleWindow()

[Console.Window]::ShowWindow($console, 0) | Out-Null //Tämä vastaa konsoli-ikkunan piilotuksesta, eli luku 0 piilottaa ikkunan näkyvistä.

-Skripti pyytää tarvittaessa järjestyksenvalvojan oikeuksia, jotta sen pystyy suorittamaan.
-Toimii vain arkisin silloin kun käyttäjä on kirjautuneena, jos on viikonloppu skriptiä ei suoriteta.
-LockWorkStation funktio lukitsee tietokoneen.

MUKAUTUS:

-Ponnahdusikkunoiden näkyvyyttä voi muuttaa, esimerkiksi 10 sekunnista 30 sekuntiin.
-Varoitusaikaa voi muuttaa säätämällä $warnTime ja $msgTimeout muuttujia.
-Lukituksen ajoitusta pystyy muuttamaan säätämällä $maxTime muuttujaa.
-Jos tietokoneessa on mahdollisuus lepotilaan, voi koodiin lisätä "Start-Sleep" ominaisuuden, joka laittaa tietokoneen lepotilaan tietyn ajan kuluttua, kun sille annetaan sekuntit, esimerkiksi "Start-Sleep -Seconds 10".

MUUTA HUOMIOITAVAA:

Skripti kannattaa testata huolellisesti, ennen kuin sen ottaa käyttöön. Skriptissä ei käytetä kolmannen osapuolen työkaluja, eli skripti käyttää pelkästään Windowsista löytyviä resursseja. 
Skriptiä on testattu kahdella eri Windows lisenssillä, "Home" versiolla sekä "Pro" versiolla. Skripti toimii molemmilla Windows lisensseillä olevilla tietokoneilla. Versiot jossa skripti on testattu ovat Windows 10 PRO ja Windows 11 Home, eli skripti toimii sekä vanhemmassa että uudemmassa Windowsissa suoraan, ilman että tarvitsee tehdä muokkauksia Powershellissä.
Testattu toimintaa, jossa tietokone laitettaisiin lepotilaan sen jälkeen kun käyttäjä kirjataan ulos. Tämä ominaisuus ei kuitenkaan toiminut tietokoneessa jossa oli Windows 10, koska tietokone on liian vanha tukemaan lepotilaa. Asetus toimi uudemmassa tietokoneessa jossa oli Windows 11.

KEHITETTÄVÄÄ:

-Voisi liätä ajastintoiminnon, joka näyttää jäljellä olevan ajan ennen kuin käyttäjä kirjataan ulos automaattisesti.
-Powershell ikkunoiden piilotustoimintaa voisi säätää jotta ne olisi kokonaan piilossa heti kun skripti käynnistyy, koska ne näkyy muutaman sekunnin ajan kun skripti käynnistää ponnahdusikkunoita.
-Skriptin ajoa varten voisi olla ns "pysyvät" järjestyksenvalvojan oikeudet, eli käyttäjältä ei kysyttäisi lupaa skriptin ajoon, tämän voisi totetuttaa esimerkiksi siten, että tiedoston muuttaa .XML muotoon, ja ajastaa sen Tehtävien ajoituksella, sekä antaa tarvittavat oikeudet.






