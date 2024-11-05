library(shiny)
library(flexdashboard)
library(shinyjs)

#####################################################################################
####### Translation data for English, Finnish and Swedish#####################################
#####################################################################################
translations <- list(
  en = list(
    title="CowCalfSolutions - economic tool",
    subtitle="In the CowCalf Solution project, we developed a simple economic simulation tool for farmers who want to implement cow-calf contact. The tool allows producers to simulate cost and benefit options for different management strategies. The tool is not directly applicable to foster cow systems at this stage",
    tab1_title = "Calculator",
    tab2_title = "User guide",
    select_language = "Select Language",
    housing_tab="Housing",
    housing_question = "How are you adjusting the building?",
    housing_1 = "I will be renovating the existing building", 
    housing_2 = "I will be building a new facility", 
    housing_3 = "I will be making small changes to the existing facilities and I know/can approximate the total cost",
    renovation_cost = "Enter the renovation cost (€/m2):",
    building_cost = "Enter the building cost (€/m2):",
    small_change_cost = "Enter the small changes cost (€):",
    total_space = "Total space for mother with calf (m2)",
    investment_time = "Predicted time-span of investment",
    c_r_tab="Operational costs and revenues",
    milkPriceLabel="Milk price <br> (EUR/l)",
    milkAdditionLabel="Additional milk price for cow-calf contact (EUR/l)",
    LabourCostLabel="Labour price input (EUR/hour)",
    CalfCostLabel="Revenue from sold calf (EUR/calf)",
    extraCalfCostLabel="Extra revenue from heavier calf due to cow-calf contact (EUR/calf)",
    interestLabel="Average interest rate (%)",
    VetCostLabel="Veterinary costs (EUR/calf)",
    MilkReplacerCostsLabel="Liquid feed cost for calves (EUR/l)", 
    Herd_Size_Tab="Herd Size", 
    herdSizeLabel= "Number of cows", 
    calfNumberLabel="Number of cows with 1 month cow-calf contact",
    calfNumber1Label="Number of cows with 2 month cow-calf contact",
    calfNumber2Label="Number of cows with 3 month cow-calf contact",
    repalcementLabel="Number of cow-calf contact calves kept for replacement (heifers)",
    Milk_Production_Tab="Milk production", 
    milkProductionLabel="Average milk production (day/l/cow)",
    milkProductionLabel1="Total milk production - cows in first lactation (l/lactation)",
    suckledMilkLabel= "Average milk yield loss (l/day/cow) for cow-calf contact cows",
    suckledMilkVarLabel= "Variation in milk yield loss (l/day) for cow-calf contact cows",
    other="Other production parameters",
    mortalityLabel= "Current calf mortality rate (1-180d, %)",
    feeding_question="Current feeding system for calves",
    feeding_1="Liquid feed (e.g. milk replacer)",
    feeding_2="Whole milk (from your own farm)",
    production_Label="Production effect",
    mortalityDicreaseLabel= "Expected effect on calf mortality rate (%)",
    vetExpensesLabel = "Expected effect on veterinary expenses (EUR/calf)",
    labourImpactFeedingLabel = "Expected impact on labour for feeding (minutes/calf)",
    labourImpactHealthLabel = "Expected impact on other labour for animal care (minutes/calf)",
    ImpactMilkLabel="Expected impact on milk yield for cows in their 1st lactation (% change)",
    c_b_tab="Results of cost-benefit analyses",
    c_b_tab1="Cost-benefit ratio (fixed and operational costs)",
    exp1="Enter the number of cows in your adjusted building. Note that you can plan suckling for all or some of the cows",
    exp2="Note that the combined number of cows suckling their calf for 1,2 and 3 month cannot be higher than the total number of cows",
    renovation_tooltip="For detailed cost estimates, consult the architect or construction company", 
    Housing_tooltip="Total renovated space needed for cow with calf, including corridors, feeding and milking space",
    Housing1_tooltip="Total space needed for cow with calf, incluiding corridors, feeding and milking space",
    guidetext1a="Calculator structure",
    guidetext1="All fields in the tool have default values that can be changed to reflect specific farm conditions. The default values are based on statistics, current research literature or experience from cow-calf contact farms and research barns. As little research has been done on the effects of extended cow-calf contact, particularly on production parameters,  where reliable data is not available, the default values have been set to zero. In addition, each farm has different production conditions and animals. It is therefore important for the user to check and, if necessary, adjust all the figures entered for their own farm. 
For example, the amount of extra milk consumed by the calf is based on estimates from the literature, but is also highly dependent on the amount of feeding prior to cow-calf-contact and tends to vary widely between individual animals. The realisation of most effects, both positive and negative, depends on the starting point on the farm and the chosen CCC practices. The producer's own input values, based on on-farm measurements and educated guesses, will give the best result.
<br>The calculator tab has seven sections: language selection, housing, herd size, operational costs and revenues, milk production and production effect.<br>  The results of the calculation are displayed in the eighth section, where a cost-benefit table is presented.  The fields to be filled in by the user as well as the results section of the calculator are briefly described below. ",
    Guide1Table="The user can choose between a Finnish, Swedish or English version of the tool.", 
    Guide2Table="For housing, the user has the possibility to enter in the tool different costs related to the adaptation of the premises (minor changes, renovation and new construction) according to his needs.<br> The cost of minor alterations to a building can be estimated by the producer, but in the case of a renovation or new building, it may be useful to contact a professional designer for more precise cost estimates.",
    Guide3Table="The tool allows the producer to define the desired production conditions: the number of cows in a production year in general, the number of calves to be reared in cow-calf contact each year, and the length of contact between mother and calf in months (1, 2 or 3).<br> The following example is set as default: A farm has 50 cows. The farmer expects that 30 cows will have prolonged contact with their calves for 2 months. In addition, ten of the calves raised by their mothers will remain on the farm to become replacement heifers.",
    Guide4Table="The user can specify both price and income parameters, such as the price of milk and the income from the sold calf. The tool also includes the possibility to take into account current or future price premium produced for higher animal welfare standards, such as a possible additional price for milk or meat from a farm where animal welfare has been improved through extended cow-calf contact.",
    Guide5Table="Here the user can enter the average daily yield of the cows. The basic value of  amount of extra milk suckled by the calf is based on the literature, but the user can also modify this parameter. ",
    Guide6Table="Here the user can specify mortality rate of calves (deaths occurring between day 1-180) and current calf feeding strategy (liquid feed or whole milk from own farm). ",
    Guide7Table="By default, the effects on production parameters such as calf mortality, veterinary costs and labour for feeding and animal care are set to zero. In questionnaires and interviews, several producers report a reduction in the time spent on animal care as a result of the use of extended cow-calf contact. Well-managed rearing can also have a positive impact on animal health. High pre-weaning milk intake has been shown to increase milk production in later life (especially in the 1st lactation), so this effect is also included in the calculator.",
    Guide8Table="The results are shown in a separate table by cost and benefit category. A cost-benefit ratio is also calculated.
A ratio below one means that the investment will result in a loss, while ratios above one indicate that the producer can expect to make a profit from the switch to prolonged cow-calf contact. The tool should be used primarily as a simulator, adjusting production parameters to examine different options (for example, by increasing the estimated loss of sold milk by one liter or by calculating an estimate of the change in calf mortality or labour related to feeding). The tool allows the producer to make more informed decisions about the introduction and form of cow-calf-contact. It is also useful to consult a range of experts such as a veterinarian who is familiar with the herd, a farm adviser and a building designer to help make the final decision.",
    guidetext2a="Contact our team",
    guidetext2="- Tool developer: anna.stygar@luke.fi<br>- User guide: mikaela.mughal@luke.fi<br>- Project coordinator: matti.pastell@luke.fi"
    
    
  ),
  fi = list(
    title="CowCalfSolutions - taloustyökalu",
    subtitle="Kehitimme CowCalf Solution -hankkeessa yksinkertaisen taloudellisen simulointityökalun maidontuottajille, jotka haluavat aloittaa vasikoiden pidemmän vierihoidon oman emän kanssa. Työkalun avulla tuottajat voivat simuloida kustannuksia ja hyötyjä erilaisissa vierihoitoratkaisuissa. Työkalua ei tässä vaiheessa voida suoraan soveltaa imettäjälehmäjärjestelmiin",
    tab1_title = "Laskuri",
    tab2_title = "Käyttöopas",
    select_language = "Valitse kieli",
    housing_tab="Navetta",
    housing_question = "Kuinka muokkaat navettaa?",
    housing_1 = "Korjaan olemassa olevaa rakennusta",
    housing_2 = "Rakennan uuden rakennuksen",
    housing_3 = "Teen pieniä muutoksia olemassa oleviin tiloihin ja tiedän /voin arvioida kokonaiskustannukset",
    renovation_cost = "Syötä korjauskustannukset (€/m2):",
    building_cost = "Syötä rakennuskustannukset (€/m2):",
    small_change_cost = "Syötä pienten muutosten kustannukset (€):",
    total_space = "Yhteensä tilaa emälle ja vasikalle (m2)",
    investment_time = "Ennustettu investointiaika",
    c_r_tab="Toimintakustannukset ja tulot",
    milkPriceLabel="Maidon hinta <br> (EUR/l)",
    milkAdditionLabel="Maidon lisähinta vierihoidossa (EUR/l)",
    LabourCostLabel="Työn hintapanos (EUR/tunti)",
    CalfCostLabel="Tulot myydystä vasikasta (EUR/vasikka)",
    extraCalfCostLabel="Vierihoidosta johtuvat lisätulot suuremmasta vasikasta (EUR/vasikka)",
    interestLabel="Keskimääräinen korko (%)",
    VetCostLabel="Eläinlääkintäkustannukset (EUR/vasikka)",
    MilkReplacerCostsLabel="Vasikoiden nestemäisen rehun kustannukset (EUR/l)", 
    Herd_Size_Tab="Karjan koko",
    herdSizeLabel= "Lehmien lukumäära",
    calfNumberLabel="Niiden lehmien lukumäärä, jotka vierihoitavat vasikkaa  1 kuukauden ajan",
    calfNumber1Label="Niiden lehmien lukumäärä, jotka vierihoitavat vasikkaa  2 kuukauden ajan",
    calfNumber2Label="Niiden lehmien lukumäärä, jotka vierihoitavat vasikkaa 3 kuukauden ajan",
    repalcementLabel="Tilalla uudistushiehoiksi kasvatettavien vasikoiden lukumäärä",
    Milk_Production_Tab="Maidontuotanto ", 
    milkProductionLabel="Keskimääräinen maitotuotos (pv/l/lehmä)",
    milkProductionLabel1="Kokonaismaidontuotanto - ensimmäisen kerran lypsävät lehmät (l/lypsy)",
    suckledMilkLabel= "Keskimääräinen maitotuotoksen menetys (l/pv/lehmä) vierihoitolehmillä",
    suckledMilkVarLabel= "Maitotuotoksen menetyksen vaihtelu (l/pv) vierihoitolehmillä",
    other="Muut tuotantoparametrit",
    mortalityLabel= "Nykyinen vasikkakuolleisuus (1-180pv, %)",
    feeding_question="Nykyinen vasikoiden ruokintajärjestelmä",
    feeding_1="Nestemäinen rehu (esim. maidonkorvike)",
    feeding_2="Täysmaito (omalta tilalta)",
    production_Label="Tuotantovaikutus",
    mortalityDicreaseLabel= "Odotettu vaikutus vasikoiden kuolleisuuteen (%)",
    vetExpensesLabel = "Odotettu vaikutus eläinlääkintäkuluihin (EUR/vasikka)",
    labourImpactFeedingLabel = "Odotettu vaikutus ruokintatyöhön (minuuttia/vasikka)",
    labourImpactHealthLabel = "Odotettu vaikutus muuhun eläintenhoitotyöhön (minuuttia/vasikka)",
    ImpactMilkLabel="Odotettu vaikutus ensikkotuotokseen (%)",
    c_b_tab="Kustannus-hyötyanalyysien tulokset",
    c_b_tab1="Kustannus-hyötysuhde (kiinteät ja toimintakustannukset)",
    exp1="Syötä mukautetun rakennuksen lehmien lukumäärä. Muistutetaan, että kaikkien lehmien ei tarvitse olla lehmä-vasikka-kontaktijärjestelmässä.",
    exp2="Huomaa, että vasikkaansa 1-, 2- tai 3 kuukautta vierihoitavien lehmien yhteenlaskettu määrä ei voi ylittää lehmien kokonaismäärää",
    renovation_tooltip="Tarkempien arvioiden saamiseksi konsultoi suunnitteluyritystä tai urakoitsijaa", 
    Housing_tooltip="Lehmän ja vasikan tarvitsema uudistettu kokonaistila, käytävät, ruokinta- ja lypsytila mukaan luettuina.", ##Check
    Housing1_tooltip="Lehmän ja vasikan tarvitsema kokonaistila, mukaan lukien käytävät, ruokinta- ja lypsytila", ##Check
    guidetext1a="Laskurin rakenne",
    guidetext1="Kaikissa työkalun kenttiä on valmiina oletusarvot, joita käyttäjä voi halutessaan muuttaa. Oletusarvot perustuvat tilastoihin, tämänhetkiseen tutkimuskirjallisuuteen tai vierihoitotiloilta ja tutkimusnavetoista kerättyihin kokemuksiin. Vierihoidon vaikutuksia erityisesti tuotantoparametreihin on kuitenkin vielä tutkittu vähän, ja mikäli luotettavaa tietoa ei ole ollut saatavilla, kentän oletusarvona on nolla. Lisäksi jokaisella tilalla on erilaiset tuotanto-olosuhteet ja eläinaines. Siksi on tärkeää, että käyttäjä tarkistaa ja tarkentaa kaikki syötettävät luvut oman tilansa osalta. 
<br>Esimerkiksi vasikan imemän ylimääräisen maitomäärän arvio perustuu kirjallisuudesta saatuihin arvioihin, mutta on hyvin riippuvainen vierihoitoa edeltäneestä juottomäärästä ja vaihtelee yleensä paljon eläinyksilöiden välillä. Useimpien, niin positiivisten kuin negatiivistenkin vaikutusten toteutuminen riippuu tilan lähtötilanteesta ja vierihoitoon valikoituvista käytänteistä. Tuottajan omat, tilalla mitattuihin tunnuslukuihin ja perusteltuihin arvauksiin nojaavat luvut antavat siis parhaimman lopputuloksen.
Laskuri-välilehdellä on seitsemän osiota: kielivalinta, navetta, karjan koko, toiminta-kustannukset ja tulot, maidontuotanto sekä muut tuotantoparametrit. Laskennan tulokset näkyvät kahdeksannessa osiossa, jossa on esitelty kustannus-hyötytaulukko. <br> Alla esitellään lyhyesti käyttäjän täytettävät kentät sekä laskurin tulososio", 
    Guide1Table="Käyttäjä voi valita työkalun suomen- ruotsin- tai englanninkielisen version.", 
    Guide2Table="Rakennuksen osalta käyttäjällä on mahdollisuus syöttää työkaluun tarpeidensa mukaan erilaisia tilojen mukauttamiseen liittyviä kustannuksia (pienet muutokset, peruskorjaus ja uusi rakennus).<br> Rakennukseen tehtävien pienten muutosten kustannukset voivat olla tuottajan arvioitavissa, mutta, jos kyseessä on remontin tai uuden rakennuksen rakentamisen kustannusten ar-viointi, voi olla hyvä ottaa yhteyttä asiantuntevaan suunnittelijaan tarkempien kustannusarvioiden saamiseksi.",
    Guide3Table="Tuottajalla on työkalussa mahdollisuus määritellä itse haluamansa tuotanto-olosuhteet: lehmien lukumäärä yleensä tuotantovuoden aikana, vuosittain vierihoidossa olevien vasikoiden lukumäärä, sekä emän ja vasikan kontaktin pituus kuukausina (1, 2 tai 3). <br> Esimerkki karjan ja vierihoitojärjestelmän määrittelystä: tilalla on vuoden aikana 20 perinteisesti juotettavaa vasikkaa, ja loput vasikat ovat vierihoidossa kahden kuukauden ajan. Vasikoista kymmenen jää tilalle kasvamaan uudistushiehoiksi.",
    Guide4Table="Käyttäjä voi määrittää sekä hinta- että tuloparametrit kuten maidon hinnan ja myydystä vasikasta saatavat tulot. Työkaluun on myös sisällytetty mahdollisuus ottaa huomioon nykyiset tai tulevat tuet tai mahdollinen maidon tai lihan lisähinta tilalle, jonka eläinten hyvinvointia on ke-hitetty vierihoidon avulla.", 
    Guide5Table="Työkaluun syötetään lehmän keskimääräinen päivätuotos. Vasikan imemän maitomäärän arvio perustuu kirjallisuudesta saatuihin arvioihin, mutta käyttäjä voi myös muuttaa tätä parametria.",
    Guide6Table="Osioon syötetään nykyinen vasikoiden kuolleisuus (1-180 pv) sekä juottostrategia ennen vierihoitoa (jauhejuotto vai täysmaito omalta tilalta).",
    Guide7Table="Oletusarvona vaikutukset tuotantoparametreihin kuten vasikoiden kuolleisuuteen, eläinlääkin-täkustannuksiin, ruokintaan ja eläinten hoitoon tarvittavaan työhön on asetettu nollaan. Kysely-tutkimuksissa ja haastatteluissa useat tuottajat raportoivat eläinten hoitoon kuluvan työajan vähenevän vierihoidon myötä. Hyvin toteutettu vierihoito voi myös vaikuttaa myönteisesti eläinten terveyteen. Runsas maidonsaanti vasikkana lisää tutkitusti ensikoiden ensimmäisen kauden maitotuotosta, joten tämä vaikutus sisältyy laskuriin.",
    Guide8Table="Tulokset näytetään erillisessä taulukossakustannus- ja hyötyluokittain. Lisäksi lasketaan kustannus-hyötysuhde. Alle yhden jäävä suhdeluku tarkoittaa, että investointi aiheuttaa tappioita, kun taas yhden ylittävät suhdeluvut kertovat, että tuottaja voi odottaa vierihoitoon siirtymisen tuottavan voittoa.<br> Työkalua kannattaa käyttää ennen kaikkea simulaattorina ja säätää tuotantoparametrejä erilaisten vaihtoehtojen tarkastelemiseksi (esimerkiksi nostamalla arvioitua maitotuotoksen menetystä yhdellä litralla tai laskemalla arviota vasikoiden kuolleisuuden tai ruokintatyön muutoksesta). Työkalu antaa tuottajalle mahdollisuuden tehdä perustellumpia päätöksiä vierihoidon käyttöönoton ja muodon suhteen. Lopullisen päätöksen tekemiseksi on hyvä konsultoida lisäksi eri asiantuntijoita kuten karjan tuntevaa eläinlääkäriä, neuvojaa ja rakennussuunnittelijaa.",
    guidetext2a="Ota yhteyttä tiimiimme",
    guidetext2="- Työkalun kehittäjä: anna.stygar@luke.fi<br>- Käyttöopas: mikaela.mughal@luke.fi<br>- Hankekoordinaattori: matti.pastell@luke.fi"
    
    ),
  se = list(
    title="CowCalfSolutions - ekonomiskt verktyg",
    subtitle="I projektet CowCalf Solution utvecklade vi ett enkelt ekonomiskt simuleringsverktyg för lantbrukare som vill införa kontakt mellan ko och kalv. Verktyget gör det möjligt för producenter att simulera kostnads- och nyttoalternativ för olika hanteringsstrategier. Verktyget är inte direkt tillämpligt på system med fosterkor i detta skede",
    tab1_title = "Kalkylator",
    tab2_title = "Användarhandledning",
    select_language = "Välj språk",
    housing_tab="Boende",
    housing_question = "Hur anpassar du byggnaden?",
    housing_1 = "Jag kommer att renovera den befintliga byggnaden", 
    housing_2 = "Jag kommer att bygga en ny anläggning", 
    housing_3 = "Jag ska göra små ändringar i de befintliga lokalerna och jag vet/kan uppskatta den totala kostnaden",
    renovation_cost = "Ange renoveringskostnaden (€/m2):",
    building_cost = "Ange byggnadskostnaden (€/m2):",
    small_change_cost = "Ange kostnaden för små förändringar (€):",
    total_space = "Totalt utrymme för mor med kalv (m2)",
    investment_time = "Förväntad tidsperiod för investeringen",
    c_r_tab="Operativa kostnader och intäkter",
    milkPriceLabel="Mjölkpris (EUR/l)",
    milkAdditionLabel= "Extra mjölkpris för kontakt mellan ko och kalv (EUR/l)", 
    LabourCostLabel="Insats för arbetskostnad (EUR/timme)",
    CalfCostLabel="Intäkt från såld kalv (EUR/kalv)",
    extraCalfCostLabel="Extra intäkt från tyngre kalv på grund av kontakt mellan ko och kalv (EUR/kalv)",
    interestLabel="Genomsnittlig räntesats (%)",
    VetCostLabel="Veterinärkostnader (EUR/kalv)",
    MilkReplacerCostsLabel="Kostnad för flytande foder till kalvar (EUR/l)", 
    Herd_Size_Tab="Besättningens storlek", 
    herdSizeLabel="Antal kor", 
    calfNumberLabel="Antal kor med 1 månads kontakt mellan ko och kalv",
    calfNumber1Label="Antal kor med 2 månaders kontakt mellan ko och kalv",
    calfNumber2Label="Antal kor med 3 månaders kontakt mellan ko och kalv",
    repalcementLabel="Antal kalvar med kontakt mellan ko och kalv som hålls för ersättning (kvigor)",
    Milk_Production_Tab="Mjölkproduktion", 
    milkProductionLabel="Genomsnittlig mjölkproduktion (dag/l/ko)",
    milkProductionLabel1="Total mjölkproduktion - förstalakterande kor (l/laktation)",
    suckledMilkLabel="Genomsnittlig förlust av mjölkavkastning (l/dag/ko) för kontaktkor mellan ko och kalv",
    suckledMilkVarLabel= "Variation i mjölkavkastningsförlust (l/dag) för kor som har kontakt med kalv",
    other="Övriga produktionsparametrar",
    mortalityLabel= "Aktuell dödlighet för kalvar (1-180d, %)",
    feeding_question="Aktuellt utfodringssystem för kalvar",
    feeding_1="Flytande foder (t.ex. mjölkersättning)",
    feeding_2="Helmjölk (från den egna gården)",
    production_Label="Produktionseffekt",
    mortalityDicreaseLabel= "Förväntad effekt på kalvarnas dödlighet (%)",
    vetExpensesLabel = "Förväntad effekt på veterinärkostnader (EUR/kalv)",
    labourImpactFeedingLabel = "Förväntad effekt på arbetsinsatsen för utfodring (minuter/kalv)",
    labourImpactHealthLabel = "Förväntad effekt på annat arbete för djuromsorg (minuter/kalv)",
    ImpactMilkLabel="Förväntad påverkan på mjölkavkastning för kor i 1:a laktationen (% förändring)",
    c_b_tab="Resultat av kostnadsnyttoanalyser",
    c_b_tab1="Kostnadsnyttoförhållande (fasta kostnader och driftskostnader)",
    exp1="Ange antalet kor i din justerade byggnad. Observera att du kan planera amning för alla eller några av korna",
    exp2="Observera att det sammanlagda antalet kor som diar sin kalv under 1, 2 och 3 månader inte får vara högre än det totala antalet kor",
    renovation_tooltip="För detaljerade kostnadsberäkningar, kontakta arkitekten eller byggföretaget", 
    Housing_tooltip="Totalt renoverat utrymme som behövs för ko med kalv, inklusive korridorer, utfodrings- och mjölkningsutrymme",
    Housing1_tooltip="Totalt utrymme som behövs för ko med kalv, inklusive korridorer, utfodrings- och mjölkningsutrymme",
    guidetext1a="Kalkylatorstruktur",
    guidetext1="Alla fält i verktyget har standardvärden som kan ändras för att återspegla specifika gårdsförhållanden. Standardvärdena baseras på statistik, aktuell forskningslitteratur eller erfarenheter från kontaktgårdar för ko-kalv och forskningsladugårdar. Eftersom lite forskning har gjorts om effekterna av förlängd kontakt mellan ko och kalv, särskilt på produktionsparametrar, där tillförlitliga data inte finns tillgängliga, har standardvärdena satts till noll. Dessutom har varje gård olika produktionsförhållanden och djur. Det är därför viktigt att användaren kontrollerar och vid behov justerar alla siffror som angetts för den egna gården. Till exempel baseras den mängd extra mjölk som kalven konsumerar på uppskattningar från litteraturen, men den är också starkt beroende av mängden utfodring före kontakten mellan ko och kalv och tenderar att variera kraftigt mellan enskilda djur. Förverkligandet av de flesta effekter, både positiva och negativa, beror på utgångsläget på gården och den valda CCC-praktiken. Producentens egna ingångsvärden, baserade på mätningar på gården och kvalificerade gissningar, kommer att ge det bästa resultatet.
Kalkylatorfliken har sju avsnitt: språkval, inhysning, besättningsstorlek, driftskostnader och intäkter, mjölkproduktion och produktionseffekt.  Resultatet av beräkningen visas i det åttonde avsnittet, där en kostnads- och nyttotabell presenteras.  Nedan beskrivs kortfattat de fält som ska fyllas i av användaren samt kalkylatorns resultatdel. ",
    Guide1Table="Användaren kan välja mellan en finsk, svensk eller engelsk version av verktyget.", 
    Guide2Table="För bostäder har användaren möjlighet att i verktyget ange olika kostnader för att anpassa lokalerna (mindre ändringar, renovering och nybyggnation) efter sina behov. Kostnaden för mindre ändringar av en byggnad kan uppskattas av producenten, men när det gäller renovering eller nybyggnation kan det vara bra att kontakta en professionell designer för mer exakta kostnadsberäkningar.",
    Guide3Table="Verktyget gör det möjligt för producenten att definiera önskade produktionsförhållanden: antalet kor under ett produktionsår i allmänhet, antalet kalvar som ska födas upp i kontakt mellan ko och kalv varje år och längden på kontakten mellan mor och kalv i månader (1, 2 eller 3).följande exempel är standardinställt: En gård har 50 kor. Lantbrukaren förväntar sig att 30 kor kommer att ha långvarig kontakt med sina kalvar under 2 månader. Dessutom kommer tio av de kalvar som fötts upp av sina mödrar att stanna kvar på gården för att bli rekryteringskvigor.",
    Guide4Table="Användaren kan ange både pris- och inkomstparametrar, t.ex. mjölkpriset och inkomsten från den sålda kalven. Verktyget innehåller också möjligheten att ta hänsyn till nuvarande eller framtida subventioner, till exempel ett eventuellt extrapris för mjölk eller kött från en gård där djurens välbefinnande har förbättrats genom utökad kontakt mellan ko och kalv.",
    Guide5Table="Här kan användaren ange kornas genomsnittliga dagliga avkastning. 
Grundvärdet för mängden extra mjölk som kalven suger i sig baseras på litteraturen, men användaren kan även ändra denna parameter. ",
    Guide6Table="Här kan användaren ange kalvarnas dödlighet (dödsfall som inträffar mellan dag 1-180) och kalvarnas nuvarande utfodringsstrategi (flytande foder eller helmjölk från den egna gården). ",
    Guide7Table="Som standard sätts effekterna på produktionsparametrar som kalvdödlighet, veterinärkostnader och arbete för utfodring och djuromsorg till noll. I frågeformulär och intervjuer rapporterar flera producenter en minskning av den tid som läggs på djuromsorg till följd av användningen av utökad kontakt mellan ko och kalv. En välskött uppfödning kan också ha en positiv inverkan på djurhälsan. Högt mjölkintag före avvänjning har visat sig öka mjölkproduktionen senare i livet (särskilt i 1:a laktationen), så denna effekt ingår också i kalkylatorn.",
    Guide8Table="Resultaten visas i en separat tabell per kostnads- och nyttokategori. Dessutom beräknas en kostnads-/nyttokvot.
En kvot under ett innebär att investeringen kommer att resultera i en förlust, medan kvoter över ett indikerar att producenten kan förvänta sig att göra en vinst från övergången till långvarig kontakt mellan ko och kalv. Verktyget bör i första hand användas som en simulator, där produktionsparametrarna justeras för att undersöka olika alternativ (t.ex. genom att öka den beräknade förlusten av såld mjölk med en liter eller genom att beräkna en uppskattning av förändringen i kalvdödlighet eller arbete i samband med utfodring). Verktyget gör det möjligt för producenten att fatta mer välgrundade beslut om införande och form av kontakt mellan ko och kalv. Det är också bra att rådfråga en rad experter, t.ex. en veterinär som känner till besättningen, en lantbruksrådgivare och en byggnadsarkitekt, för att få hjälp med att fatta det slutliga beslutet.",
    guidetext2a=" Kontakta vårt team ",
    guidetext2="- Verktygsutvecklare: anna.stygar@luke.fi<br>- Användarhandbok: mikaela.mughal@luke.fi<br>- Projektkoordinator: matti.pastell@luke.fi"
  )    
  
)


# Define the language mappings for the result table
item_names <- list(
  en = c("Housing (€)", "Feeding cost (€)", 
         "Animal welfare price premium for milk (€)", "Labour (€)", 
         "Health (€)", "Sold animals premium (€)", "First lactation yield effect (€)",  "Total (€)" ),
  fi = c("Rakentaminen (€)", "Ruokintakustannus (€)", 
         "Eläinten hyvinvoinnista maksettava maidon hintapalkkio (€)", "Työvoima (€)", 
         "Terveys (€)", "Myydyt eläimet palkkio (€)", "Vaikutuksen ensikkokauden tuotokseen (€)",  "Yhteensä (€)"),
  se = c("Boende (€)", "Foderkostnad (€)", 
         "Prispremie för djurskydd för mjölk (€)", "Arbetskraft (€)", 
         "Hälsa (€)", "Premie för sålda djur (€)", "Avkastningseffekt första laktationen (€)", "Totalt (€)" )
  
)
#
# Define the column names based on the selected language for the result table
column_names <- list(
  en = c("Item", "Cost", "Benefit"),
  fi = c("Tuote", "Kustannus", "Hyöty"),
  se = c("Föremål", "Kostnad", "Förmån")
)
#######################################################################h###############


ui <- fluidPage(
  useShinyjs(),  # Initialize shinyjs
  tags$head(tags$link(rel = "stylesheet", href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css")),
  
  # Application title
  titlePanel(div(
    uiOutput("app_title")
  )),
  
  tabsetPanel(
    # First tab: Input
    tabPanel(uiOutput("tab1_title"),
             fluidRow(
               column(3,  # Left sidebar for the first set of inputs
                      wellPanel(
                        uiOutput("language_label"),  # Dynamic label for language
                        selectInput("lang", "", choices = c("Suomi" = "fi", "Svenska"="se", "English" = "en"))
                      ),
                      wellPanel(
                        uiOutput("housing_tab", style = "text-align: center"),
                        uiOutput("dynamic_radio_buttons"),
                        uiOutput("housing_inputs")
                      ),
                      wellPanel(
                        uiOutput("Herd_Size_Tab", style = "text-align: center"),
                        uiOutput("dynamicherdSize"),
                        fluidRow(
                          column(4, uiOutput("dynamiccalfNumber")),
                          column(4, uiOutput("dynamiccalfNumber1")),
                          column(4, uiOutput("dynamiccalfNumber2"))
                        ),
                        uiOutput("dynamicReplacement")
                      )
               ),
               
               column(3,  # middle sidebar for the second set of inputs
                      wellPanel(
                        uiOutput("c_r_tab", style = "text-align: center"),
                        fluidRow(
                          column(6, uiOutput("dynamicMilkPrice")),
                          column(6, uiOutput("dynamicMilkAddition"))
                        ),
                        fluidRow(
                          column(6, uiOutput("dynamicCalfCost")),
                          column(6, uiOutput("dynamicextraCalfCost"))
                        ),
                        
                        
                        uiOutput("dynamicLabourCost"),

                        uiOutput("dynamicInterest"),
                        uiOutput("dynamicVetCost"),
                        uiOutput("dynamicMilkReplacerCosts")
                      ),
                      wellPanel(
                        uiOutput("Milk_Production_Tab", style = "text-align: center"),
                        uiOutput("dynamicmilkProduction"),
                        uiOutput("dynamicmilkProduction1"),
                        uiOutput("dynamicsuckledMilk"),
                        uiOutput("dynamicsuckledMilkVar")
                      )
                     ), 
               column(2, # right sidebar for the second set of inputs
                      wellPanel(
                        uiOutput("dynamicOther", style = "text-align: center"),
                        uiOutput("dynamicmortality"),
                        uiOutput("dynamic_radio_buttons1")
                      ),
                       wellPanel(
                        uiOutput("dynamicProductionEffect", style = "text-align: center"),
                        uiOutput("dynamicmortalityDicrease"),
                        uiOutput("dynamicvetExpenses"),
                        uiOutput("dynamiclabourImpactFeeding"),
                        uiOutput("dynamiclabourImpactHealth"),
                        uiOutput("dynamicMilk1")
                      )
               ),
               
               column(4,  # Forth column for results
                      wellPanel(
                        style = "border: 2px solid black; background-color: #f7f7f7; padding: 10px;",  # Custom styles for distinction
                          uiOutput("c_b_tab", style = "text-align: center"),
                          tableOutput("resultTable"),
                          h4(uiOutput("c_b_tab1" , style = "text-align: center")),
                          gaugeOutput("gaugeChart"),
                          textOutput("costBenefitRatioText")
                          
                      ),
                      wellPanel(
                        #actionButton("save", "Save Parameters"), 
                        downloadButton("downloadData", "Download Data as JSON")
                      )
               )
             )
    ),
    
    # Second tab: Guide
    tabPanel(uiOutput("tab2_title"),
             uiOutput("guidetext1a"), 
             uiOutput("guidetext1"),
             uiOutput("subheading"),
             uiOutput("Guide1Table"),
             uiOutput("subheading2"),
             uiOutput("Guide2Table"),
             uiOutput("subheading3"),
             uiOutput("Guide3Table"),
             uiOutput("subheading4"),
             uiOutput("Guide4Table"),
             uiOutput("subheading5"),
             uiOutput("Guide5Table"),
             uiOutput("subheading6"),
             uiOutput("Guide6Table"),
             uiOutput("subheading7"),
             uiOutput("Guide7Table"),
             uiOutput("subheading8"),
             uiOutput("Guide8Table"),
             uiOutput("guidetext2a"),
             uiOutput("guidetext2")
    ),
    #blocking any warning for user
    tags$style(type="text/css",
               ".shiny-output-error { visibility: hidden; }",
               ".shiny-output-error:before { visibility: hidden; }"
    )
  )
)
#####################################################################
# Define the server logic############################################
#####################################################################
server <- function(input, output, session) {
  
  
####################################################################
####Hear mostly language change and parameters baisc valeus  ######
#####################################################################
  
  # Reactive expression to get the selected language's translations
  current_lang <- reactive({
    translations[[input$lang]]
  })
  
  output$app_title <- renderUI({
    title <- current_lang()$title  # Get the translated title
    subtitle <- current_lang()$subtitle 
    tagList(
      div(
        div(
          img(src = "LUKE.jpg", height = 50),  # Adjust height as needed
          img(src = "University.jpg", height = 50),
          img(src = "4DBarn.PNG", height = 50),
          img(src = "Valio.PNG", height = 50),
          img(src= "MinistryLogo.PNG", height = 60),
          style = "display: flex; align-items: left;"  # Center logos horizontally
        ),
        div(
          title,  # Display the dynamic title
          style = "text-align: left; margin-top: 10px;"  # Center the title and add some space above it
        ),
        div(
          subtitle,  # Display the dynamic subtitle
          style = "font-size: 16px; text-align: left; margin-top: 5px; color: #555;"  # Subtitle styling
        ),
        style = "display: flex; flex-direction: column; align-items: left;"  # Stack images and title vertically
      )
    )
  })
  
  # Dynamic tab titles and content
  output$tab1_title <- renderUI({
    h4(current_lang()$tab1_title)
  })
  
  output$tab2_title <- renderUI({
    h4(current_lang()$tab2_title)
  })
  output$housing_tab <- renderUI({
    h4(current_lang()$housing_tab)
  })
  
  # Create the dynamic choice map based on the current language
  housing_choices <- reactive({
    lang <- current_lang()
    setNames(
      as.list(1:3),  # Numerical identifiers for choices
      c(lang$housing_1, lang$housing_2, lang$housing_3)
    )
  })
  
  # Build
  output$dynamic_radio_buttons <- renderUI({
    radioButtons("checkBuild",
                 label = current_lang()$housing_question,
                 choices = housing_choices(),
                 selected = 1  # Default selection
    )
  })
  
  # Dynamic UI rendering 
  output$housing_inputs <- renderUI({
    req(input$checkBuild)  
    
    lang <- current_lang()
    
    switch(as.numeric(input$checkBuild),
           `1` = {
             tagList(
               # Renovation cost input with tooltip
               div(
                 style = "margin-bottom: 15px;",  
                 tags$label(
                   lang$renovation_cost,
                   tags$i(class = "fa fa-info-circle", title = lang$renovation_tooltip),
                   style = "display: inline-flex; align-items: center;"  # Aligns label and icon horizontally
                 ),
                 numericInput("barnRen", label = NULL, value = 150)  # Input below the label
               ),
               sliderInput("space", tags$label(
                 lang$total_space,
                 tags$i(class = "fa fa-info-circle", title = lang$Housing_tooltip),
                 style = "display: inline-flex; align-items: center;"  # Aligns label and icon horizontally
               ), min = 15, max = 30, value = 22),
               sliderInput("years", lang$investment_time, min = 1, max = 50, value = 30)
             )
           },
           `2` = {
             tagList(
               div(
                 style = "margin-bottom: 15px;",  # Adds some space below each input section
                 tags$label(
                   lang$building_cost,
                   tags$i(class = "fa fa-info-circle", title = lang$renovation_tooltip),
                   style = "display: inline-flex; align-items: center;"  # Aligns label and icon horizontally
                 ),
                 numericInput("barnBuild", label = NULL, value = 500, width = "100%")  # Input below the label
               ),
               sliderInput("space", tags$label(
                 lang$total_space,
                 tags$i(class = "fa fa-info-circle", title = lang$Housing1_tooltip),
                 style = "display: inline-flex; align-items: center;"  # Aligns label and icon horizontally
               ), min = 15, max = 30, value = 22),
               sliderInput("years", lang$investment_time, min = 1, max = 50, value = 30)
             )
           },
           `3` = {
             tagList(
               numericInput("barnsmallchange", lang$small_change_cost, value = 0),
               sliderInput("years",lang$investment_time,  min = 1, max = 50, value = 10)
             )
           }
    )
  })
  
  output$selected_building <- renderText({
    paste("Selected Building Adjustment:", input$checkBuild)
  })
##Cost and revenues
  output$c_r_tab <- renderUI({
    h4(current_lang()$c_r_tab)
  })

  output$dynamicMilkPrice <- renderUI({
    numericInput("MilkPrice", label = HTML(paste0("<span style='color: #333333; font-size: 14px'>", current_lang()$milkPriceLabel, "</span>")), value = 0.55) 
  })
  output$dynamicMilkAddition <- renderUI({
    numericInput("MilkAddition", label=current_lang()$milkAdditionLabel,  value = 0.00)
  })
  output$dynamicLabourCost <- renderUI ({
    numericInput("LabourCost",label=current_lang()$LabourCostLabel,  value = 7.5) 
  })
  output$dynamicCalfCost <- renderUI ({
    numericInput("CalfCost",label=current_lang()$CalfCostLabel,  value = 190) 
  }) 
  
  output$dynamicextraCalfCost <- renderUI ({
    numericInput("extraCalfCost",label = HTML(paste0("<span style='color: #333333; font-size: 14px'>", current_lang()$extraCalfCostLabel, "</span>")),  value = 0) 
  })
  output$dynamicInterest <- renderUI ({
    numericInput("Interest",label=current_lang()$interestLabel,  value = 3) 
  })
  output$dynamicVetCost <- renderUI ({
    numericInput("VetCost",label=current_lang()$VetCostLabel,  value = 25) 
  })
  output$dynamicMilkReplacerCosts <- renderUI ({
    numericInput("MilkReplacerCosts",label=current_lang()$MilkReplacerCostsLabel,  value = 0.43) 
  })
  

  output$Herd_Size_Tab<- renderUI({
    h4(current_lang()$Herd_Size_Tab)
  })
  
  output$dynamicherdSize <- renderUI({
    tagList(
      numericInput("herdSize", 
                   label = tagList(
                     current_lang()$herdSizeLabel, 
                     tags$span(
                       tags$i(class = "fa fa-info-circle"),  # info-circle icon
                       title = current_lang()$exp1
                     )
                   ),  
                   value = 50)
    )
  })
  output$dynamiccalfNumber <- renderUI ({
    numericInput("calfNumber",label = tagList(
      current_lang()$calfNumberLabel, 
      tags$span(
        tags$i(class = "fa fa-info-circle"),  # info-circle icon
        title = current_lang()$exp2
      )
    ),  value = 0) 
  })
  output$dynamiccalfNumber1 <- renderUI ({
    numericInput("calfNumber1",label = tagList(
      current_lang()$calfNumber1Label, 
      tags$span(
        tags$i(class = "fa fa-info-circle"),  # info-circle icon
        title = current_lang()$exp2
      )
    ),  value = 30) 
  })
  output$dynamiccalfNumber2 <- renderUI ({
    numericInput("calfNumber2",label = tagList(
      current_lang()$calfNumber2Label, 
      tags$span(
        tags$i(class = "fa fa-info-circle"),  #  info-circle icon
        title = current_lang()$exp2
      )
    ),  value = 0)  
  })
  output$dynamicReplacement <- renderUI ({
    numericInput("Replacement",label=current_lang()$repalcementLabel,  value = 10) 
  })
  
  output$Milk_Production_Tab<- renderUI({
    h4(current_lang()$Milk_Production_Tab)
  })
  output$dynamicmilkProduction<- renderUI({
    numericInput("milkProduction",label= current_lang()$milkProductionLabel,  value = 35) 
  })
  output$dynamicmilkProduction1<- renderUI({
    numericInput("milkProductionFirstLactating",label= current_lang()$milkProductionLabel1,  value = 8800) 
  })
  
  output$dynamicsuckledMilk<- renderUI({
    numericInput("suckledMilk",label= current_lang()$suckledMilkLabel,  value = 7.3) 
  })
  output$dynamicsuckledMilkVar<- renderUI({
    numericInput("suckledMilkVar",label= current_lang()$suckledMilkVarLabel,  value = 6.6) 
  })
  output$dynamicOther<- renderUI({
    h4(current_lang()$other)
  })
  output$dynamicmortality<- renderUI({
    numericInput("mortality",label= current_lang()$mortalityLabel,  value = 7.1) 
  })
  # Create the dynamic choice map based on the current language
  feeding_choices <- reactive({
    lang <- current_lang()
    setNames(
      as.list(1:2),  # Numerical identifiers for choices
      c(lang$feeding_1, lang$feeding_2)
    )
  })
  
  # Dynamic UI rendering for radio button choices
  output$dynamic_radio_buttons1 <- renderUI({
    radioButtons("checkGroup",
                 label = current_lang()$feeding_question,
                 choices = feeding_choices(),
                 selected = 1  # Default selection
    )
  })
  #Production effect part
  output$dynamicProductionEffect<- renderUI({
    h4(current_lang()$production_Label)
  })
  
  output$dynamicmortalityDicrease<- renderUI({
    sliderInput("mortalityDicrease",label= current_lang()$mortalityDicreaseLabel, min = -5, max = 5, value = 0) 
  })
  output$dynamicvetExpenses<- renderUI({
    sliderInput("vetExpenses",label= current_lang()$vetExpensesLabel, min = -25, max = 25, value = 0) 
  })
  
  output$dynamiclabourImpactFeeding<- renderUI({
    sliderInput("labourImpactFeeding",label= current_lang()$labourImpactFeedingLabel, min = -5, max = 5, value = 0) 
  })
  
  output$dynamiclabourImpactHealth<- renderUI({
    sliderInput("labourImpactHealth",label= current_lang()$labourImpactHealthLabel, min = -5, max = 5, value = 0) 
  })
  
  output$dynamicMilk1<- renderUI({
    sliderInput("ImpactMilk",label= current_lang()$ImpactMilkLabel, min = -15, max = 15, value = 0) 
  })
  output$c_b_tab <- renderUI({
    h4(current_lang()$c_b_tab)
  })
  output$c_b_tab1 <- renderUI({
    h4(current_lang()$c_b_tab1)
  })
  output$guidetext1a <- renderUI({
    h4(HTML(paste0("<span style='color: #007BFF; font-size: 24px;'>", current_lang()$guidetext1a, "</span>")))
  })
 
  output$guidetext1 <- renderUI({
    h4(HTML(current_lang()$guidetext1))
  })
  
  output$subheading <- renderUI({
    h5(HTML(paste0("<span style='color: #007BFF; font-size: 18px; font-style: italic;'>", current_lang()$select_language, "</span>")))
  }) 
  
  output$Guide1Table <- renderUI({
    h4(HTML(current_lang()$Guide1Table))
  })

  output$subheading2 <- renderUI({
    h5(HTML(paste0("<span style='color: #007BFF; font-size: 18px; font-style: italic;'>", current_lang()$housing_tab, "</span>")))
  }) 
  
  output$Guide2Table <- renderUI({
    h4(HTML(current_lang()$Guide2Table))
  })
  
  output$subheading3 <- renderUI({
    h5(HTML(paste0("<span style='color: #007BFF; font-size: 18px; font-style: italic;'>", current_lang()$Herd_Size_Tab, "</span>")))
  }) 
  
  output$Guide3Table <- renderUI({
    h4(HTML(current_lang()$Guide3Table))
  })
  
  output$subheading4 <- renderUI({
    h5(HTML(paste0("<span style='color: #007BFF; font-size: 18px; font-style: italic;'>", current_lang()$c_r_tab, "</span>")))
  }) 
  
  output$Guide4Table <- renderUI({
    h4(HTML(current_lang()$Guide4Table))
  })
  
  output$subheading5 <- renderUI({
    h5(HTML(paste0("<span style='color: #007BFF; font-size: 18px; font-style: italic;'>", current_lang()$Milk_Production_Tab, "</span>")))
  }) 
  
  output$Guide5Table <- renderUI({
    h4(HTML(current_lang()$Guide5Table))
  })
  
  output$subheading6 <- renderUI({
    h5(HTML(paste0("<span style='color: #007BFF; font-size: 18px; font-style: italic;'>", current_lang()$other, "</span>")))
  }) 
  output$Guide6Table <- renderUI({
    h4(HTML(current_lang()$Guide6Table))
  })
  output$subheading7 <- renderUI({
    h5(HTML(paste0("<span style='color: #007BFF; font-size: 18px; font-style: italic;'>", current_lang()$production_Label, "</span>")))
  })
  
  output$Guide7Table <- renderUI({
    h4(HTML(current_lang()$Guide7Table))
  })
  output$subheading8 <- renderUI({
    h5(HTML(paste0("<span style='color: #007BFF; font-size: 18px; font-style: italic;'>", current_lang()$c_b_tab, "</span>")))
  })
  output$Guide8Table <- renderUI({
    h4(HTML(current_lang()$Guide8Table))
  })
  
  output$guidetext2a <- renderUI({
    h4(HTML(paste0("<span style='color: #007BFF; font-size: 24px;'>", current_lang()$guidetext2a, "</span>")))
  })
  
  
  output$guidetext2 <- renderUI({
    h4(HTML(current_lang()$guidetext2))
  })
  
  
  # Dynamic language label
  output$language_label <- renderUI({
    
    tags$div(
      current_lang()$select_language,
      tags$img(src = "Fi_flag.png", width = 20, height = 13),
      tags$img(src = "Se_flag.png", width = 20, height = 13),
      tags$img(src = "En_flag.png", width = 20, height = 13),style = "text-align: center"
   # label <- current_lang()$select_language  # Get the translated label
    
    )
  })
  
  
###############################################################################################  
#############################Cost-benefit analyses#############################################
###############################################################################################  
  
  
  
  
  # Function to calculate the building costs
  calculate_sum <- function(selected_values) {
    sum_val <- 0
    if (selected_values == 1) {
      sum_val <- input$barnRen * input$herdSize * input$space  # Value 1 contributes 1 to the sum
    } else {
      if (selected_values == 2) {
      sum_val <- input$barnBuild * input$herdSize * input$space # Value 2 contributes 2 to the sum
    }
   else {
    sum_val <- input$barnsmallchange # Value 2 contributes 2 to the sum
  }}
    return(sum_val)
  }
 
  # Function to calculate the feeding costs in conventional system
  calculate_sumFeeding <- function(selected_values) {
    sum_val <- 0
    if (selected_values == 1) {
      sum_val <- (30.5 * 6 * input$MilkReplacerCosts*input$calfNumber)+(61 * 6 * input$MilkReplacerCosts*input$calfNumber1) +(61 * 6 * input$MilkReplacerCosts*input$calfNumber2)  # we need to allow for minutes input here instead of 0.05
    } else {
      sum_val <- (30.5 * 6 * input$MilkPrice*input$calfNumber)+(61 * 6 * input$MilkPrice*input$calfNumber1)+ (61 * 6 * input$MilkPrice*input$calfNumber2) # 6 is nr of liters
    }
    return(sum_val)
  }
  

  
  result_df <- reactive({
    
    req(input$checkBuild)
    req(input$herdSize)
    req(input$Replacement)
    req(input$milkProductionFirstLactating)
    req(input$VetCost)
    # Create a vector for time from 1 to years of investment as provided by user
    time <- 1:input$years
    # Calculate the depreciation rate for each year
    depreciation_rate <- exp(-(input$Interest/100) * time)
    
    
    # Building Calculation
    selected_values <- input$checkBuild
    sum_val <- calculate_sum(selected_values)
    #print(sum_val)
    withdepreciation <- (sum_val - (sum_val * 0.15*depreciation_rate[input$years])) # selvage value is 15%

    total <- withdepreciation
    #print(total)
    
    
    # Feeding Calculation
    selected_values1 <- input$checkGroup
    sum_valFeeding <- calculate_sumFeeding(selected_values1)
    
    Sd <- input$suckledMilkVar
    Mean <- input$suckledMilk
    NumberOfCalves <- input$calfNumber + input$calfNumber1 + input$calfNumber2
    MilkPrice <- input$MilkPrice
    extraCalfCost <- input$extraCalfCost
     #We simulate milk loss
    test <- numeric(700)
    for (i in 1:700) {
      test[i] <- mean(pmax(rnorm(n = NumberOfCalves, mean = Mean, sd = Sd)),0)
    }

    
    FeedingExpensesCCS <- mean(test) * 30.5 * input$calfNumber * MilkPrice +
      mean(test) * 61 * input$calfNumber1 * MilkPrice +
      mean(test) * 90 * input$calfNumber2 * MilkPrice  
    FeedingCostTotal <- FeedingExpensesCCS - sum_valFeeding
    
    # Calculate the present value of the feeding cost for each year
    present_value_costs_feeding <-  FeedingCostTotal * depreciation_rate
    
    # Calculate the net present cost by summing the present values
    net_present_cost_feeding <- sum(present_value_costs_feeding)
    #############
    ##Labour#####
    #############
    LabourFeeding <- (input$LabourCost * (input$labourImpactFeeding)/60 * 30.5 * input$calfNumber) + 
      (input$LabourCost * (input$labourImpactFeeding)/60 * 61 * input$calfNumber1) + 
      (input$LabourCost * (input$labourImpactFeeding)/60 * 90 * input$calfNumber2) +
      (input$LabourCost * (input$labourImpactHealth)/60 * 30.5 * input$calfNumber) + 
      (input$LabourCost * (input$labourImpactHealth)/60 * 61 * input$calfNumber1) + 
      (input$LabourCost * (input$labourImpactHealth)/60 * 90 * input$calfNumber2)
    
    # Calculate the present value of the labour cost for each year
    present_value_costs_LabourFeeding <-  LabourFeeding * depreciation_rate
    
    # Calculate the net present cost by summing the present values
    net_present_cost_LabourFeeding <- sum(present_value_costs_LabourFeeding)
    
    MilkBenefit <- 0 - (input$MilkAddition * (input$milkProduction - input$suckledMilk) * input$herdSize * 0.7 * 365)
    
    # Calculate the present value of the milk_benefit cost for each year
    present_value_costs_MilkBenefit <-  MilkBenefit * depreciation_rate
    
    # Calculate the net present cost by summing the present values
    net_present_cost_MilkBenefit <- sum(present_value_costs_MilkBenefit)
    
    totalCalves <- input$calfNumber + input$calfNumber1 + input$calfNumber2
    
    AnimalHealth <- (totalCalves * ((100 - input$mortality)/100) * input$CalfCost) - 
      (totalCalves * (100 - (input$mortality + input$mortalityDicrease))/100 * input$CalfCost) + 
      (totalCalves * input$vetExpenses)
    # Calculate the present value of the AnimalHealth cost for each year
    present_value_costs_AnimalHealth <-  AnimalHealth * depreciation_rate
    
    # Calculate the net present cost by summing the present values
    net_present_cost_AnimalHealth <- sum(present_value_costs_AnimalHealth)
    
    nrSoldAnimals <- totalCalves - input$Replacement
    SoldAnimals <- 0 - (nrSoldAnimals * extraCalfCost)
    # Calculate the present value of the AnimalHealth cost for each year
    present_value_costs_SoldAnimals <-  SoldAnimals * depreciation_rate
    
    # Calculate the net present cost by summing the present values
    net_present_cost_SoldAnimals <- sum(present_value_costs_SoldAnimals)
    
    
    
    heiferBenefit <- 0 - (input$Replacement/100) * totalCalves * (input$milkProductionFirstLactating * (input$ImpactMilk/100))
    # Calculate the present value of the heiferBenefit cost for each year
    present_value_costs_heiferBenefit <-  heiferBenefit * depreciation_rate
    
    # Calculate the net present cost by summing the present values
    net_present_cost_heiferBenefit <- sum(present_value_costs_heiferBenefit)
    
    
    # Determine the language for the table
    lang_selected <- input$lang
    lang_items <- item_names[[lang_selected]]
    # Print lengths of vectors to debug
   # print(paste("Length of lang_items:", length(lang_items)))
    # Select the appropriate column names
    selected_columns <- column_names[[lang_selected]]
    
    # Calculate total costs and total benefits
    total_cost <- round(sum(c(total, net_present_cost_feeding, net_present_cost_LabourFeeding, net_present_cost_AnimalHealth, net_present_cost_SoldAnimals, net_present_cost_heiferBenefit)[c(total, net_present_cost_feeding, net_present_cost_LabourFeeding, net_present_cost_AnimalHealth, net_present_cost_SoldAnimals, net_present_cost_heiferBenefit) > 0]), digits = 0)
    total_benefit <- round(sum(abs(c(total, net_present_cost_feeding, net_present_cost_MilkBenefit, net_present_cost_LabourFeeding, net_present_cost_AnimalHealth, net_present_cost_SoldAnimals, net_present_cost_heiferBenefit)[c(total, net_present_cost_feeding, net_present_cost_MilkBenefit, net_present_cost_LabourFeeding, net_present_cost_AnimalHealth, net_present_cost_SoldAnimals, net_present_cost_heiferBenefit) < 0])), digits = 0)
    net_present_value <- total_cost - total_benefit
    
    # Create a data frame with the results
    result_df <- data.frame(
      "Item" = lang_items,
      "Cost" = c(
        ifelse(total > 0, format(round(total), big.mark = ",", scientific = FALSE), ""),
        ifelse(net_present_cost_feeding > 0, format(round(net_present_cost_feeding), big.mark = ",", scientific = FALSE), ""),
        ifelse(net_present_cost_MilkBenefit > 0, format(round(net_present_cost_MilkBenefit), big.mark = ",", scientific = FALSE), ""),
        ifelse(net_present_cost_LabourFeeding > 0, format(round(net_present_cost_LabourFeeding), big.mark = ",", scientific = FALSE), ""),
        ifelse(net_present_cost_AnimalHealth > 0, format(round(net_present_cost_AnimalHealth), big.mark = ",", scientific = FALSE), ""),
        ifelse(net_present_cost_SoldAnimals > 0, format(round(net_present_cost_SoldAnimals), big.mark = ",", scientific = FALSE), ""), 
        ifelse(net_present_cost_heiferBenefit > 0, format(round(net_present_cost_heiferBenefit), big.mark = ",", scientific = FALSE), ""),
        ifelse(total_cost > 0, format(total_cost, big.mark = ",", scientific = FALSE), "")  # Total cost
       
      ),
      "Benefit" = c(
        ifelse(total < 0, format(total, big.mark = ",", scientific = FALSE), ""),
        ifelse(net_present_cost_feeding < 0, format(abs(round(net_present_cost_feeding)), big.mark = ",", scientific = FALSE), ""), 
        ifelse(net_present_cost_MilkBenefit < 0, format(abs(round(net_present_cost_MilkBenefit)), big.mark = ",", scientific = FALSE), ""),
        ifelse(net_present_cost_LabourFeeding < 0, format(abs(round(net_present_cost_LabourFeeding)), big.mark = ",", scientific = FALSE), ""),
        ifelse(net_present_cost_AnimalHealth < 0, format(abs(round(net_present_cost_AnimalHealth)), big.mark = ",", scientific = FALSE), ""),
        ifelse(net_present_cost_SoldAnimals < 0, format(abs(round(net_present_cost_SoldAnimals)), big.mark = ",", scientific = FALSE), ""),
        ifelse(net_present_cost_heiferBenefit < 0, format(abs(round(net_present_cost_heiferBenefit)), big.mark = ",", scientific = FALSE), ""),
        ifelse(total_cost > 0,format(total_benefit, big.mark = ",", scientific = FALSE), "")    # Total benefit
      )
    )
 print( result_df)
# print(nrow(result_df))
# print(ncol(result_df))
# print(dim(result_df))
# print( length(result_df))
 


    # Bold the total cost and benefit
    result_df[nrow(result_df), "Cost"] <- paste0("<b>", result_df[nrow(result_df), "Cost"], "</b>")
    result_df[nrow(result_df), "Benefit"] <- paste0("<b>", result_df[nrow(result_df), "Benefit"], "</b>")


    colnames(result_df) <- selected_columns
    return(result_df)
    
  })
  
  
  
  
  output$resultTable <- renderTable({
    result_df()
  }, striped = TRUE, sanitize.text.function = function(x) x)
  
  #new plot - cost benefit ratio
  
  output$costBenefitRatioText <- renderText({
    df <- result_df()[1:7,]
    # Convert cost and benefit columns from comma-separated text to numeric
    total_cost <- sum(as.numeric(gsub(",", "", df[1:7, 2])), na.rm = TRUE)
    total_benefit <- sum(as.numeric(gsub(",", "", df[1:7, 3])), na.rm = TRUE)
    # Calculate net present value (NPV)
    net_present_value <- total_benefit - total_cost
    
    # Calculate cost-benefit ratio
    cost_benefit_ratio <- ifelse(abs(total_cost) > 0, total_benefit / total_cost, 0)
    
    # Determine the language for the text
    lang_selected <- input$lang
    
    # Define text for English
    npv_text_en <- if (net_present_value >= 0) {
      paste("Net Present Value (NPV): EUR", format(round(net_present_value, 2), big.mark = ",", scientific = FALSE))
    } else {
      paste("Net Present Value (NPV): -EUR", format(round(abs(net_present_value), 2), big.mark = ",", scientific = FALSE))
    }
    cbr_text_en <- paste("Cost-Benefit Ratio: ", round(cost_benefit_ratio, 2))
    
    # Define text for Finnish
    npv_text_fi <- if (net_present_value >= 0) {
      paste("Nykyarvo (NPV): EUR", format(round(net_present_value, 2), big.mark = ",", scientific = FALSE))
    } else {
      paste("Nykyarvo (NPV): -EUR", format(round(abs(net_present_value), 2), big.mark = ",", scientific = FALSE))
    }
    cbr_text_fi <- paste("Kustannus-hyöty-suhde: ", round(cost_benefit_ratio, 2))
    
    # Define text for Swidish
    npv_text_se <- if (net_present_value >= 0) {
      paste("Nettonuvärde: EUR", format(round(net_present_value, 2), big.mark = ",", scientific = FALSE))
    } else {
      paste("Nettonuvärde: -EUR", format(round(abs(net_present_value), 2), big.mark = ",", scientific = FALSE))
    }
    cbr_text_se <- paste("Förhållande mellan kostnad och nytta: ", round(cost_benefit_ratio, 2))
    
    # Choose the appropriate text based on the selected language
    if (lang_selected == "en") {
      result_text <- paste(npv_text_en, "\n", cbr_text_en)
    } else if (lang_selected == "fi") {
      result_text <- paste(npv_text_fi, "\n", cbr_text_fi)
    } else if (lang_selected == "se") {
      result_text <- paste(npv_text_se, "\n", cbr_text_se)
    }else {
      result_text <- "Language not supported"
    }
    
    # Return the result text
    result_text
  })
  
  output$gaugeChart <- renderGauge({
    df <- result_df()[1:7,]
    total_cost <- sum(as.numeric(gsub(",", "",df[,2])), na.rm = TRUE)
    total_benefit <- abs(sum(as.numeric(gsub(",", "", df[,3])), na.rm = TRUE))
    
    # Calculate cost-benefit ratio
    cost_benefit_ratio <- ifelse(abs(total_cost) > 0, total_benefit / total_cost, 0)
    # Debugging: Print values to console
    #print(paste("Total Cost:", total_cost))
    #print(paste("Total Benefit:", total_benefit))
    #print(paste("Cost-Benefit Ratio (fixed and operational costs):", cost_benefit_ratio))
    
    gauge( cost_benefit_ratio, min = 0, max = 2,  # Adjust min and max values as needed
           sectors = gaugeSectors(success = c(1, 2), warning = c(0.90, 0.99), danger = c(0, 0.89)))
    
    
  })
  
  # observeEvent(input$save, {

    # Define a function to get the cost based on input$checkBuild
    get_cost <- function(checkBuild) {
      lang <- current_lang()  # Retrieve the actual list from the reactive expression
      if (checkBuild == 1) {
        return(lang$renovation_cost)
      } else if (checkBuild == 2) {
        return(lang$building_cost)
      } else if (checkBuild == 3) {
        return(lang$small_change_cost)
      } else {
        return(NULL)
      }
    }


    # Define a function to get the cost based on input$checkBuild
    get_InvestmentTime <- function(checkBuild) {
      lang <- current_lang()  # Retrieve the actual list from the reactive expression
      if (checkBuild <4) {
        return(lang$investment_time)

      } else {
        return(NULL)
      }
    }



    # Define a function to get the cost based on input$checkBuild input
    get_costInput <- function(checkBuild) {
      #lang <- current_lang()  # Retrieve the actual list from the reactive expression
      if (checkBuild == 1) {
        return(input$barnRen )
      } else if (checkBuild == 2) {
        return(input$barnBuild)
      } else if (checkBuild == 3) {
        return(input$barnsmallchange)
      } else {
        return(NULL)
      }
    }

    # Define a function to get the space based on input$checkBuild
    get_space <- function(checkBuild) {
      lang <- current_lang()  # Retrieve the actual list from the reactive expression
      if (checkBuild <3) {
        return(lang$total_space)
      } else if (checkBuild == 3) {
        return("Space (m2) not specified")
      } else {
        return(NULL)
      }
    }

    # Define a function to get the space based on input$checkBuild
    get_spaceVariable <- function(checkBuild) {
      lang <- current_lang()  # Retrieve the actual list from the reactive expression
      if (checkBuild <3) {
        return(input$space)
      } else if (checkBuild == 3) {
        return("NA")
      } else {
        return(NULL)
      }
    }



    
    # Capture all inputs in a data frame
    params <- reactive({data.frame(
      
      Input_Parameter = c(current_lang()$housing_question,
                          get_cost(as.numeric(input$checkBuild)),
                          get_InvestmentTime(as.numeric(input$checkBuild)),
                          get_space(as.numeric(input$checkBuild)),
                          current_lang()$herdSizeLabel, 
                          current_lang()$calfNumberLabel, 
                          current_lang()$calfNumber1Label, 
                          current_lang()$calfNumber2Label, 
                          current_lang()$repalcementLabel, 
                          current_lang()$milkPriceLabel, 
                          current_lang()$milkAdditionLabel, 
                          current_lang()$LabourCostLabel, 
                          current_lang()$CalfCostLabel, 
                          current_lang()$extraCalfCostLabel, 
                          current_lang()$interestLabel, 
                          current_lang()$VetCostLabel, 
                          current_lang()$MilkReplacerCostsLabel, 
                          current_lang()$milkProductionLabel, 
                          current_lang()$milkProductionLabel1, 
                          current_lang()$suckledMilkLabel, 
                          current_lang()$suckledMilkVarLabel, 
                          current_lang()$mortalityLabel, 
                          current_lang()$feeding_question, 
                          current_lang()$mortalityDicreaseLabel, 
                          current_lang()$vetExpensesLabel, 
                          current_lang()$labourImpactFeedingLabel, 
                          current_lang()$labourImpactHealthLabel, 
                          current_lang()$ImpactMilkLabel), 
     
      Input_Value = c(input$checkBuild,
                      get_costInput(as.numeric(input$checkBuild)), 
                      input$years,
                      get_spaceVariable(as.numeric(input$checkBuild)),
                      input$herdSize,  
                      input$calfNumber, 
                      input$calfNumber1,  
                      input$calfNumber2,  
                      input$Replacement, 
                      input$MilkPrice, 
                      input$MilkAddition, 
                      input$LabourCost, 
                      input$CalfCost, 
                      input$extraCalfCost, 
                      input$Interest, 
                      input$VetCost, 
                      input$MilkReplacerCosts, 
                      input$milkProduction, 
                      input$milkProductionFirstLactating, 
                      input$suckledMilk, 
                      input$suckledMilkVar,
                      input$mortality, 
                      input$checkGroup, 
                      input$mortalityDicrease, 
                      input$vetExpenses, ####
                      input$labourImpactFeeding, 
                      input$labourImpactHealth, 
                      input$ImpactMilk),
      stringsAsFactors = FALSE
    )
  })
    

  # output$downloadData <- downloadHandler(
  #   filename = function() { "output_data.json" },
  #   content = function(file) {
  #     data_list <- list(Parameters = params(), Results= result_df())
  #     json_data <- jsonlite::toJSON(data_list, pretty = TRUE)
  #     write(json_data, file)
  #   }, 
  #   contentType = "application/json"  # Explicitly setting content type
  # )
    
    output$downloadData <- downloadHandler(
      filename = function() { "output_data.json" },
      content = function(file) {
        # Retrieve data from result_df
        result_data <- result_df()
        
        # Extract Total Costs and Benefits as strings
        total_cost_str <- result_data[result_data$Item == "Total (€)", "Cost"]
        total_benefit_str <- result_data[result_data$Item == "Total (€)", "Benefit"]
        
        # Remove HTML tags and commas using gsub and convert to numeric
        total_cost <- as.numeric(gsub("<[^>]+>|,", "", total_cost_str))
        total_benefit <- as.numeric(gsub("<[^>]+>|,", "", total_benefit_str))
        
        # Calculate Cost-Benefit Ratio (CBR) if totals are valid
        if (!is.na(total_cost) && !is.na(total_benefit) && total_cost != 0) {
          cbr <- total_benefit / total_cost
        } else {
          cbr <- NA
          warning("Total costs or benefits are missing or invalid, CBR cannot be calculated.")
        }
        
        # Add CBR to the data list
        data_list <- list(
          Parameters = params(),
          Results = result_data,
          Cost_Benefit_Ratio = cbr  # Adding calculated CBR here
        )
        
        # Convert to JSON format
        json_data <- jsonlite::toJSON(data_list, pretty = TRUE)
        
        # Write to file
        write(json_data, file)
      },
      contentType = "application/json"  # Explicitly setting content type
    )
}

# Run the application
shinyApp(ui = ui, server = server)