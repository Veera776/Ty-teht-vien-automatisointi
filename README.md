README: 
Tauko ja lukitusscripti

TOIMINTAPERIAATE:

Skripti ajaa itseään neljän tunnin sykleissä aina arkipäivisin, kun käyttäjä on kirjautunut. Skriptin tarkoitus on edistää taukojen pitämistä jotta silmät ja keho ei rasitu liikaa istumisesta näytön äärellä, ja se myöskin lukitsee käyttäjän koneen viiden minuutin jälkeen, jos toimintoa ei peruta.

Päätoiminnot:

-Näyttää käyttäjälle ponnahdusikkunan, joka muistuttaa tauon pitämisestä. Ponnahdusikkunassa on painikkeet "OK" ja "Cancel". Ponnahdusikkuna häviää kymmenen sekunnin jälkeen, jos käyttäjä ei reagoi siihen.
-Käyttäjälle annetaan ennakkovaroitus, viisi minuuttia ennen kuin kone menee lukkoon, sen jälkeen kun ponnahdusikkunaan ollaan reagoitu.
-Tietkone menee automaattisesti lukkoon 5 minuutin jälkeen.

Miten scripti otetaan käyttöön?

1. Lataa skripti omalle koneellesi
2. Tarkista, onko skriptien ajo sallittua, sen voi tarkistaa Powershellissä komennolla "Set-ExecutionPolicy RemoteSigned"
3. Scriptin voi suorittaa manuaalisesti, jos sitä haluaa testata ensin. Skripti myöhemmin toimii automaattisesti.

Ominaisuudet:

-Powershell ikkunan piilotus, koodissa on funktio, joka piilottaa powershellin ponnahdusikkunan muutaman sekunnin jälkeen.
-Skripti pyytää tarvittaessa järjestyksenvalvojan oikeuksia.
-Toimii vain arkisin, jos on viikonloppu skriptiä ei suoriteta.
-LockWorkStation funktio lukitsee tietokoneen.

Mukautus:

-Ponnahdusikkunoiden näkyvyyttä voi muuttaa, esimerkiksi 10 sekunnista 30 sekuntiin.
-Varoitusaikaa voi muuttaa säätämällä $warnTime ja $msgTimeout muuttujia.
-Lukituksen ajoitusta pystyy muuttamaan säätämällä $maxTime muuttujaa.

Muuta huomioitavaa:

Skripti kannattaa testata huolellisesti, ennen kuin sen ottaa käyttöön. Skriptissä ei käytetä kolmannen osapuolen työkaluja. 



