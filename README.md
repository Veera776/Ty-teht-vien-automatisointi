README: 
Tauko ja lukitusscripti 1.0

TOIMINTAPERIAATE:

Skripti ajaa itseään neljän tunnin sykleissä aina arkipäivisin, kun käyttäjä on kirjautunut. Skriptin tarkoitus on edistää taukojen pitämistä jotta silmät ja keho ei rasitu liikaa istumisesta näytön äärellä, ja se myöskin lukitsee käyttäjän koneen viiden minuutin jälkeen, jos toimintoa ei peruta.

Päätoiminnot:

-Näyttää käyttäjälle ponnahdusikkunan, joka muistuttaa tauon pitämisestä. Ponnahdusikkunassa on painikkeet "OK" ja "Cancel". Ponnahdusikkuna häviää kymmenen sekunnin jälkeen, jos käyttäjä ei reagoi siihen.
-Käyttäjälle annetaan ennakkovaroitus, viisi minuuttia ennen kuin kone menee lukkoon, sen jälkeen kun ponnahdusikkunaan ollaan reagoitu.
-Tietkone menee automaattisesti lukkoon 5 minuutin jälkeen.

Miten scripti otetaan käyttöön?

1. Lataa skripti omalle koneellesi
2. Tarkista, onko skriptien ajo sallittua windows-ympäristössä jota käytät, sen voi tarkistaa Powershellissä komennolla "Set-ExecutionPolicy RemoteSigned"
3. Scriptin voi suorittaa manuaalisesti, jos sitä haluaa testata ensin. Skripti myöhemmin toimii automaattisesti.

Ominaisuudet:

-Powershell ikkunan piilotus, koodissa on funktio, joka piilottaa powershellin ponnahdusikkunan muutaman sekunnin jälkeen.
-Skripti pyytää tarvittaessa järjestyksenvalvojan oikeuksia.
-Toimii vain arkisin silloin kun käyttäjä on kirjautuneena, jos on viikonloppu skriptiä ei suoriteta.
-LockWorkStation funktio lukitsee tietokoneen.

Mukautus:

-Ponnahdusikkunoiden näkyvyyttä voi muuttaa, esimerkiksi 10 sekunnista 30 sekuntiin.
-Varoitusaikaa voi muuttaa säätämällä $warnTime ja $msgTimeout muuttujia.
-Lukituksen ajoitusta pystyy muuttamaan säätämällä $maxTime muuttujaa.
-Jos tietokoneessa on mahdollisuus lepotilaan, voi koodiin lisätä "Start-Sleep" ominaisuuden, joka laittaa tietokoneen lepotilaan tietyn ajan kuluttua, kun sille annetaan sekuntit, esimerkiksi "Start-Sleep -Seconds 10".

Muuta huomioitavaa:

Skripti kannattaa testata huolellisesti, ennen kuin sen ottaa käyttöön. Skriptissä ei käytetä kolmannen osapuolen työkaluja, eli skripti käyttää pelkästään Windowsista löytyviä resursseja. 
Skriptiä on testattu kahdella eri Windows lisenssillä, "Home" versiolla sekä "Pro" versiolla. Skripti toimii molemmilla Windows lisensseillä olevilla tietokoneilla. Versiot jossa skripti on testattu ovat Windows 10 PRO ja Windows 11 Home, eli skripti toimii sekä vanhemmassa että uudemmassa Windowsissa suoraan, ilman että tarvitsee tehdä muokkauksia Powershellissä.
Testattu toimintaa, jossa tietokone laitettaisiin lepotilaan sen jälkeen kun käyttäjä kirjataan ulos. Tämä ominaisuus ei kuitenkaan toiminut tietokoneessa jossa oli Windows 10, koska tietokone on liian vanha tukemaan lepotilaa. Asetus toimi uudemmassa tietokoneessa jossa oli Windows 11.

Mitä voisi kehittää:

-Koodiin voisi tehdä lisäyksen jolla Powershell ikkunat voisi laittaa kokonaan piiloon, sillä kun ponnahdusikkunat käynnistyy, avautuu powershellin ikkuna muutaman sekunnin ajaksi, kun skripti käynnistää ponnahdusikkunoita. 
-Voisi liätä ajastintoiminnon, joka näyttää jäljellä olevan ajan ennen kuin käyttäjä kirjataan ulos automaattisesti.








