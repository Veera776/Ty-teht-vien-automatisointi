README: 
Tauko ja lukitusscripti 1.0

TOIMINTAPERIAATE:

-Skripti ajaa itseään neljän tunnin sykleissä aina arkipäivisin, kun käyttäjä on kirjautuneena. Skriptin tarkoitus on edistää taukojen pitämistä työpäivän aikana näyttämällä muistutuksia säännöllisin väliajoin, ja se myöskin lukitsee tietokoneen tietyn ajan kuluttua.
-Näyttää käyttäjälle ponnahdusikkunan, joka muistuttaa tauon pitämisestä. Ponnahdusikkunassa on painikkeet "OK" ja "Cancel". Ponnahdusikkuna häviää kymmenen sekunnin jälkeen, jos käyttäjä ei reagoi siihen.
-Kun painaa "OK" skriptin ajoa jatketaan, jos painaa "Cancel" skriptin toiminta keskeytetään, ja skripti ajaa itsensä seuraavan kerran 4 tunnin päästä.
-Käyttäjällä on 10 minuuttia aikaa tallentaa keskeneräiset työt, ennen kuin ajastus menee loppuun ja uloskirjautuminen tapahtuu.
-Käyttäjälle näytetään varoitusikkuna, jonka jälkeen uloskirjautuminen tapahtuu.

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
-Toimii vain arkisin silloin kun käyttäjä on kirjautuneena, skriptiä ei suoriteta viikonloppuisin
-LockWorkStation funktio lukitsee tietokoneen.

MUKAUTUS:

-Ponnahdusikkunoiden näkyvyyttä voi muuttaa, esimerkiksi 10 sekunnista 30 sekuntiin.
-Jos varoitusikkunan haluaa pysyvän kauemmin näkyvissä, voi muuttaa $warnTime ja $msgTimeout muuttujia, silloin ponnahdusikkuna pysyy kauemmin näkyvillä, eikä häviä liian nopeasti näkyvistä. Näin käyttäjä saa varmasti tietoonsa, että uloskirjautuminen tapahtuu pian.
-Lukituksen ajoitusta pystyy muuttamaan säätämällä $maxTime muuttujaa, eli halutessaan ajoituksen voi muuttaa 10 minuutista 5 minuuttiin.
-Koodista löytyy Start-sleep muuttuja, sen ajoitusta voi halutessaan muuttaa. Huomioitavaa on kuitenkin, että lepotilaominaisuus ei toimi kaikilla kokoonpanoilla tai Windows versioilla.

MUUTA HUOMIOITAVAA:

-Skripti kannattaa testata huolellisesti, ennen kuin sen ottaa käyttöön. Skriptissä ei käytetä kolmannen osapuolen työkaluja, eli skripti käyttää pelkästään Windowsista löytyviä resursseja. 
-Skriptiä on testattu kahdella eri Windows lisenssillä, "Home" versiolla sekä "Pro" versiolla. Skripti toimii molemmilla Windows lisensseillä olevilla tietokoneilla. Versiot jossa skripti on testattu ovat Windows 10 PRO ja Windows 11 Home, eli skripti toimii sekä vanhemmassa että uudemmassa Windowsissa suoraan, ilman että tarvitsee tehdä muokkauksia Powershellissä.
-Koodista löytyy Start-sleep ominaisuus, mutta se ei toiminut Windows 10:ssä testatessa. Skriptin lepotilaominaisuus toimi kuitenkin Windows 11 versiossa, johtuen uudemmasta tietokoneesta ja Windows versiosta.

KEHITETTÄVÄÄ:

-Voisi liätä ajastintoiminnon, joka näyttää jäljellä olevan ajan ennen kuin käyttäjä kirjataan ulos automaattisesti.
-Powershell ikkunoiden piilotustoimintaa voisi säätää jotta ne olisi kokonaan piilossa heti kun skripti käynnistyy, koska ne näkyy muutaman sekunnin ajan kun skripti käynnistää ponnahdusikkunoita.
-Skriptin ajoa varten voisi olla ns "pysyvät" järjestyksenvalvojan oikeudet, eli käyttäjältä ei kysyttäisi lupaa skriptin ajoon, tämän voisi totetuttaa esimerkiksi siten, että tiedoston muuttaa .XML muotoon, ja ajastaa sen Tehtävien ajoitus ohjelmalla, sekä antaa tarvittavat oikeudet.






