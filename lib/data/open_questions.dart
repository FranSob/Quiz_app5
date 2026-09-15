import '../task_models.dart';

/// Zadania otwarte w stylu maturalnym, z kluczem punktowania.
///
/// Kryteria opisują elementy, które musi zawierać odpowiedź — uczeń zaznacza
/// je sam po porównaniu swojej odpowiedzi z odpowiedzią wzorcową.
const List<OpenQuestion> openQuestions = [
  // ===========================================================================
  // KLASA 1
  // ===========================================================================
  OpenQuestion(
    id: 'oq_k1_woda',
    topicId: 'k1_chemizm_nieorganiczne',
    prompt: 'Wyjaśnij, w jaki sposób duże ciepło parowania wody pomaga ssakom w termoregulacji.',
    criteria: [
      OpenCriterion('Parowanie potu z powierzchni ciała pochłania dużo ciepła, dzięki czemu ciało się ochładza.'),
    ],
    modelAnswer:
        'Woda ma duże ciepło parowania, dlatego odparowanie nawet niewielkiej ilości potu z powierzchni skóry pochłania dużo ciepła i skutecznie obniża temperaturę ciała.',
  ),
  OpenQuestion(
    id: 'oq_k1_denaturacja',
    topicId: 'k1_chemizm_bialka',
    prompt:
        'Wyjaśnij, dlaczego denaturacja enzymu powoduje utratę jego aktywności, chociaż sekwencja aminokwasów (struktura I-rzędowa) pozostaje niezmieniona.',
    criteria: [
      OpenCriterion('Denaturacja niszczy strukturę przestrzenną białka (II-, III- lub IV-rzędową).'),
      OpenCriterion('Zmienia się kształt centrum aktywnego, więc substrat nie może się do niego przyłączyć.'),
    ],
    modelAnswer:
        'Podczas denaturacji zostaje zniszczona struktura przestrzenna enzymu. Zmienia się kształt centrum aktywnego, które przestaje pasować do substratu, dlatego enzym nie może katalizować reakcji.',
  ),
  OpenQuestion(
    id: 'oq_k1_plazmoliza',
    topicId: 'k1_komorka_blona_transport',
    experiment: true,
    prompt:
        'Uczeń chce zbadać, czy stężenie roztworu chlorku sodu wpływa na plazmolizę komórek skórki cebuli. Sformułuj problem badawczy i hipotezę do tego doświadczenia.',
    criteria: [
      OpenCriterion('Problem badawczy jest pytaniem o wpływ stężenia NaCl na plazmolizę, np. „Czy stężenie roztworu NaCl wpływa na plazmolizę komórek skórki cebuli?”.'),
      OpenCriterion('Hipoteza jest stwierdzeniem wskazującym kierunek zależności, np. „Im wyższe stężenie NaCl, tym więcej komórek ulega plazmolizie”.'),
    ],
    modelAnswer:
        'Problem badawczy: Czy stężenie roztworu chlorku sodu wpływa na plazmolizę komórek skórki cebuli? Hipoteza: Im wyższe stężenie roztworu chlorku sodu, tym więcej komórek skórki cebuli ulega plazmolizie.',
  ),
  OpenQuestion(
    id: 'oq_k1_endosymbioza',
    topicId: 'k1_komorka_mitochondria_plastydy',
    prompt: 'Podaj dwa argumenty przemawiające za endosymbiotycznym pochodzeniem mitochondriów.',
    criteria: [
      OpenCriterion('Pierwszy poprawny argument, np. własne koliste DNA, rybosomy typu 70S, dwie błony, podziały niezależne od podziału komórki, wielkość zbliżona do bakterii.'),
      OpenCriterion('Drugi, inny poprawny argument z tej listy.'),
    ],
    modelAnswer:
        'Mitochondria mają własne, koliste DNA podobne do bakteryjnego oraz rybosomy typu 70S, takie jak u bakterii. (Poprawne są też: dwie błony, samodzielne podziały, wielkość zbliżona do bakterii.)',
  ),
  OpenQuestion(
    id: 'oq_k1_inhibicja',
    topicId: 'k1_metabolizm_enzymy',
    prompt:
        'Wyjaśnij, na czym polega inhibicja kompetycyjna i dlaczego jej działanie można osłabić, zwiększając stężenie substratu.',
    criteria: [
      OpenCriterion('Inhibitor ma budowę podobną do substratu i konkuruje z nim o przyłączenie do centrum aktywnego.'),
      OpenCriterion('Im więcej cząsteczek substratu, tym większa szansa, że to substrat, a nie inhibitor, zajmie centrum aktywne.'),
    ],
    modelAnswer:
        'Inhibitor kompetycyjny jest podobny do substratu i przyłącza się do centrum aktywnego, konkurując z substratem. Gdy stężenie substratu rośnie, cząsteczki substratu częściej zajmują centrum aktywne niż inhibitor, więc hamowanie słabnie.',
  ),
  OpenQuestion(
    id: 'oq_k1_calvin',
    topicId: 'k1_metabolizm_fotosynteza',
    prompt: 'Wyjaśnij, dlaczego po wyłączeniu światła faza niezależna od światła fotosyntezy szybko się zatrzymuje.',
    criteria: [
      OpenCriterion('Bez światła nie powstają ATP i NADPH (siła asymilacyjna), które są niezbędne w cyklu Calvina.'),
    ],
    modelAnswer:
        'ATP i NADPH powstają w fazie zależnej od światła. Po wyłączeniu światła ich zapas szybko się wyczerpuje, a bez nich cykl Calvina nie może przebiegać.',
  ),
  OpenQuestion(
    id: 'oq_k1_mleczan',
    topicId: 'k1_metabolizm_oddychanie',
    prompt: 'Wyjaśnij, dlaczego w warunkach beztlenowych komórki mięśniowe przekształcają pirogronian w mleczan.',
    criteria: [
      OpenCriterion('Przekształcenie pirogronianu w mleczan regeneruje NAD+ (utlenia NADH).'),
      OpenCriterion('Dzięki temu glikoliza może zachodzić dalej i dostarczać ATP.'),
    ],
    modelAnswer:
        'W fermentacji mleczanowej NADH oddaje wodór pirogronianowi, więc odtwarza się NAD+. Bez NAD+ glikoliza by się zatrzymała, a tak komórka może nadal wytwarzać w niej ATP bez udziału tlenu.',
  ),
  OpenQuestion(
    id: 'oq_k1_mejoza',
    topicId: 'k1_podzialy_mitoza_mejoza',
    prompt:
        'Podaj dwa procesy zachodzące podczas mejozy, które są źródłem zmienności rekombinacyjnej, i dla każdego określ, w której fazie mejozy zachodzi.',
    criteria: [
      OpenCriterion('Crossing-over — w profazie I.'),
      OpenCriterion('Niezależna segregacja (rozchodzenie się) chromosomów homologicznych — w anafazie I (ustawienie par w metafazie I).'),
    ],
    modelAnswer:
        'Crossing-over, czyli wymiana odcinków chromatyd między chromosomami homologicznymi, zachodzi w profazie I. Niezależna segregacja chromosomów homologicznych zachodzi w anafazie I — o jej wyniku decyduje losowe ustawienie par w metafazie I.',
  ),
  OpenQuestion(
    id: 'oq_k1_replikacja',
    topicId: 'k1_podzialy_dna_cykl',
    prompt: 'Wyjaśnij, dlaczego replikacja DNA musi zajść przed podziałem komórki.',
    criteria: [
      OpenCriterion('Dzięki replikacji każda komórka potomna otrzymuje pełną kopię informacji genetycznej (taką samą ilość DNA jak komórka macierzysta).'),
    ],
    modelAnswer:
        'Podczas podziału materiał genetyczny jest rozdzielany między dwie komórki potomne. Wcześniejsza replikacja podwaja ilość DNA, więc każda komórka potomna otrzymuje kompletną kopię informacji genetycznej.',
  ),
  OpenQuestion(
    id: 'oq_k1_parafiletyczna',
    topicId: 'k1_klasyfikacja_filogenetyka',
    prompt: 'Wyjaśnij, dlaczego tradycyjnie wyróżniana grupa „gady” (bez ptaków) jest grupą parafiletyczną.',
    criteria: [
      OpenCriterion('Grupa obejmuje wspólnego przodka i tylko część jego potomków — pomija ptaki, które pochodzą od tego samego przodka.'),
    ],
    modelAnswer:
        'Ptaki wywodzą się od tego samego przodka co gady. Grupa „gady” obejmuje wspólnego przodka i tylko część jego potomków, bo nie zawiera ptaków — dlatego jest parafiletyczna.',
  ),

  // ===========================================================================
  // KLASA 2
  // ===========================================================================
  OpenQuestion(
    id: 'oq_k2_opornosc',
    topicId: 'k2_bakterie_czynnosci',
    prompt: 'Wyjaśnij, dlaczego nadużywanie antybiotyków przyczynia się do rozprzestrzeniania się bakterii opornych na te leki.',
    criteria: [
      OpenCriterion('Antybiotyk eliminuje bakterie wrażliwe, a przeżywają bakterie oporne — zachodzi dobór.'),
      OpenCriterion('Bakterie oporne namnażają się lub przekazują geny oporności innym bakteriom (np. na plazmidach w koniugacji).'),
    ],
    modelAnswer:
        'Antybiotyk zabija bakterie wrażliwe, a przeżywają te, które mają geny oporności. Namnażają się one bez konkurencji i mogą przekazywać geny oporności innym bakteriom, np. na plazmidach podczas koniugacji, więc bakterii opornych przybywa.',
  ),
  OpenQuestion(
    id: 'oq_k2_porosty',
    topicId: 'k2_grzyby_porosty',
    prompt: 'Wyjaśnij, dlaczego porosty wykorzystuje się do oceny stopnia zanieczyszczenia powietrza.',
    criteria: [
      OpenCriterion('Porosty są wrażliwe na zanieczyszczenia powietrza (zwłaszcza SO2), więc ich obecność lub brak określonych form wskazuje stopień zanieczyszczenia.'),
    ],
    modelAnswer:
        'Porosty są bardzo wrażliwe na zanieczyszczenia powietrza, szczególnie na dwutlenek siarki. Na podstawie tego, jakie porosty rosną na danym terenie (np. krzaczkowate tylko w czystym powietrzu), można ocenić stopień zanieczyszczenia.',
  ),
  OpenQuestion(
    id: 'oq_k2_wodniczki',
    topicId: 'k2_protisty_roznorodnosc',
    prompt: 'Wyjaśnij, dlaczego wodniczki tętniące występują u pantofelka żyjącego w wodzie słodkiej, a nie występują u większości protistów morskich.',
    criteria: [
      OpenCriterion('Woda słodka jest dla komórki środowiskiem hipotonicznym — woda stale napływa do komórki na drodze osmozy.'),
      OpenCriterion('Wodniczki tętniące usuwają nadmiar wody, a w morzu (środowisko zbliżone do izotonicznego) woda nie napływa w nadmiarze.'),
    ],
    modelAnswer:
        'Woda słodka jest hipotoniczna względem cytoplazmy, więc woda stale wnika do komórki pantofelka. Wodniczki tętniące usuwają jej nadmiar i chronią komórkę przed pęknięciem. Woda morska ma stężenie zbliżone do stężenia cytoplazmy, więc nadmiar wody nie napływa i wodniczki nie są potrzebne.',
  ),
  OpenQuestion(
    id: 'oq_k2_transpiracja',
    topicId: 'k2_rosliny_woda',
    prompt: 'Wyjaśnij, w jaki sposób transpiracja umożliwia transport wody z korzeni do liści.',
    criteria: [
      OpenCriterion('Parowanie wody z liści wytwarza siłę ssącą, która pociąga wodę w górę.'),
      OpenCriterion('Woda tworzy w naczyniach ciągły słup dzięki kohezji (przyleganiu cząsteczek do siebie) i adhezji (przyleganiu do ścian naczyń).'),
    ],
    modelAnswer:
        'Woda paruje z liści, co wytwarza siłę ssącą. Ponieważ cząsteczki wody przylegają do siebie (kohezja) i do ścian naczyń (adhezja), w drewnie powstaje ciągły słup wody, który jest pociągany od liści aż do korzeni.',
  ),
  OpenQuestion(
    id: 'oq_k2_moczarka',
    topicId: 'k2_rosliny_odzywianie',
    experiment: true,
    prompt:
        'W doświadczeniu badano wpływ natężenia światła na intensywność fotosyntezy moczarki, licząc pęcherzyki tlenu wydzielane w ciągu minuty. Podaj zmienną niezależną, zmienną zależną oraz jeden czynnik, który trzeba utrzymać na stałym poziomie.',
    criteria: [
      OpenCriterion('Zmienna niezależna: natężenie światła (odległość od lampy) oraz zmienna zależna: liczba pęcherzyków tlenu (intensywność fotosyntezy) — obie poprawnie.'),
      OpenCriterion('Poprawny czynnik stały, np. temperatura wody, stężenie wodorowęglanu sodu (CO2), ten sam pęd lub gatunek rośliny, czas pomiaru.'),
    ],
    modelAnswer:
        'Zmienna niezależna to natężenie światła, a zmienna zależna — liczba pęcherzyków tlenu wydzielanych w ciągu minuty. Na stałym poziomie trzeba utrzymać np. temperaturę wody.',
  ),
  OpenQuestion(
    id: 'oq_k2_zaplodnienie',
    topicId: 'k2_rosliny_rozmnazanie',
    prompt: 'Wyjaśnij, dlaczego u mchów do zapłodnienia niezbędna jest woda, a u roślin nasiennych nie.',
    criteria: [
      OpenCriterion('U mchów plemniki muszą dopłynąć do komórki jajowej w wodzie.'),
      OpenCriterion('U roślin nasiennych pyłek jest przenoszony przez wiatr lub zwierzęta, a komórki plemnikowe docierają do komórki jajowej łagiewką pyłkową.'),
    ],
    modelAnswer:
        'Mchy wytwarzają ruchliwe plemniki, które przepływają do komórki jajowej w kropli wody. U roślin nasiennych ziarna pyłku przenosi wiatr lub zwierzęta, a komórki plemnikowe docierają do komórki jajowej łagiewką pyłkową, więc woda nie jest potrzebna.',
  ),
  OpenQuestion(
    id: 'oq_k2_fototropizm',
    topicId: 'k2_rosliny_wzrost',
    prompt: 'Wyjaśnij, dlaczego pęd rośliny oświetlanej z jednej strony wygina się w kierunku światła.',
    criteria: [
      OpenCriterion('Auksyny gromadzą się po stronie zacienionej pędu.'),
      OpenCriterion('Komórki po stronie zacienionej wydłużają się silniej, więc pęd wygina się ku światłu.'),
    ],
    modelAnswer:
        'Przy jednostronnym oświetleniu auksyny przemieszczają się na zacienioną stronę pędu. Pobudzają tam wydłużanie komórek, więc zacieniona strona rośnie szybciej i pęd wygina się w stronę światła.',
  ),
  OpenQuestion(
    id: 'oq_k2_owodnia',
    topicId: 'k2_zwierzeta_podzialy',
    prompt: 'Wyjaśnij, jakie znaczenie dla opanowania środowiska lądowego przez gady miało wytworzenie błon płodowych.',
    criteria: [
      OpenCriterion('Błony płodowe (owodnia z płynem owodniowym) chronią zarodek przed wysychaniem, dzięki czemu rozwój może zachodzić na lądzie, bez wody.'),
    ],
    modelAnswer:
        'Owodnia wypełniona płynem chroni zarodek przed wysychaniem i wstrząsami. Dzięki temu jaja mogą rozwijać się na lądzie, a rozmnażanie gadów nie zależy od zbiorników wodnych.',
  ),
  OpenQuestion(
    id: 'oq_k2_wirusy',
    topicId: 'k2_wirusy_budowa',
    prompt: 'Wyjaśnij, dlaczego wirusów nie zalicza się do organizmów żywych.',
    criteria: [
      OpenCriterion('Wirusy nie mają budowy komórkowej ani własnego metabolizmu i namnażają się wyłącznie wewnątrz komórki gospodarza.'),
    ],
    modelAnswer:
        'Wirusy nie mają budowy komórkowej, nie przeprowadzają przemian metabolicznych i nie rosną. Mogą się namnażać tylko w żywej komórce, wykorzystując jej enzymy i rybosomy.',
  ),
  OpenQuestion(
    id: 'oq_k2_grypa',
    topicId: 'k2_wirusy_choroby',
    prompt: 'Wyjaśnij, dlaczego szczepienie przeciw grypie należy powtarzać co roku.',
    criteria: [
      OpenCriterion('Wirus grypy ma dużą zmienność antygenową — co sezon pojawiają się nowe odmiany, których nie rozpoznają przeciwciała i komórki pamięci powstałe wcześniej.'),
    ],
    modelAnswer:
        'Wirus grypy bardzo szybko się zmienia i co sezon krążą inne odmiany. Odporność wytworzona po wcześniejszym szczepieniu nie chroni przed nowymi odmianami, dlatego szczepionkę co roku przygotowuje się na nowo i trzeba ją powtarzać.',
  ),

  // ===========================================================================
  // KLASA 3
  // ===========================================================================
  OpenQuestion(
    id: 'oq_k3_ryjowka',
    topicId: 'k3_zasady_homeostaza',
    prompt: 'Wyjaśnij, dlaczego ryjówka musi zjadać w przeliczeniu na masę ciała znacznie więcej pokarmu niż słoń.',
    criteria: [
      OpenCriterion('Małe zwierzę ma większy stosunek powierzchni ciała do objętości, więc traci relatywnie więcej ciepła.'),
      OpenCriterion('Aby utrzymać stałą temperaturę ciała, musi mieć wyższe tempo metabolizmu, czyli zużywać więcej energii na jednostkę masy.'),
    ],
    modelAnswer:
        'Ryjówka jest bardzo mała, więc ma duży stosunek powierzchni ciała do objętości i szybko traci ciepło. Jako zwierzę stałocieplne musi to wyrównywać wysokim tempem metabolizmu, a na to potrzebuje dużo pokarmu w stosunku do masy ciała.',
  ),
  OpenQuestion(
    id: 'oq_k3_kosmki',
    topicId: 'k3_odzywianie_uklad',
    prompt: 'Wykaż związek budowy ściany jelita cienkiego z funkcją wchłaniania.',
    criteria: [
      OpenCriterion('Fałdy błony śluzowej, kosmki i mikrokosmki zwiększają powierzchnię wchłaniania.'),
      OpenCriterion('Kosmki są bogato unaczynione (naczynia krwionośne i chłonne), a nabłonek jest cienki, co ułatwia przenikanie substancji do krwi i limfy.'),
    ],
    modelAnswer:
        'Fałdy, kosmki jelitowe i mikrokosmki komórek nabłonka wielokrotnie zwiększają powierzchnię wchłaniania. Kosmki zawierają gęstą sieć naczyń krwionośnych i naczynie chłonne, a pokrywa je cienki nabłonek, więc produkty trawienia szybko trafiają do krwi i limfy.',
  ),
  OpenQuestion(
    id: 'oq_k3_amylaza',
    topicId: 'k3_odzywianie_uklad',
    experiment: true,
    prompt:
        'Zaplanuj próbę kontrolną do doświadczenia sprawdzającego, czy amylaza ślinowa trawi skrobię w temperaturze 37°C, i wyjaśnij, do czego jest ona potrzebna.',
    criteria: [
      OpenCriterion('Próba kontrolna: kleik skrobiowy z wodą zamiast śliny, w tej samej temperaturze 37°C i w tych samych pozostałych warunkach.'),
      OpenCriterion('Uzasadnienie: pozwala wykazać, że zanik skrobi w próbie badawczej jest skutkiem działania śliny (amylazy), a nie innych czynników.'),
    ],
    modelAnswer:
        'Próba kontrolna to probówka z taką samą ilością kleiku skrobiowego, do której zamiast śliny dodaje się tyle samo wody i trzyma w 37°C tak samo długo. Jeśli w niej płyn Lugola nadal barwi się na granatowo, a w próbie ze śliną nie, wiadomo, że skrobię rozłożyła amylaza ślinowa.',
  ),
  OpenQuestion(
    id: 'oq_k3_szczepienie',
    topicId: 'k3_odpornosc_mechanizmy',
    prompt: 'Wyjaśnij, dlaczego zaszczepiony człowiek szybciej zwalcza zakażenie patogenem, przeciwko któremu go zaszczepiono.',
    criteria: [
      OpenCriterion('Szczepionka wywołuje odpowiedź odpornościową i powstanie komórek pamięci.'),
      OpenCriterion('Przy zakażeniu komórki pamięci szybko rozpoznają antygen, a odpowiedź wtórna jest szybsza i silniejsza.'),
    ],
    modelAnswer:
        'Antygeny zawarte w szczepionce pobudzają układ odpornościowy do wytworzenia przeciwciał i komórek pamięci. Gdy do organizmu dostanie się ten patogen, komórki pamięci szybko go rozpoznają i rozwija się szybka, silna odpowiedź wtórna, zanim choroba się rozwinie.',
  ),
  OpenQuestion(
    id: 'oq_k3_antyd',
    topicId: 'k3_odpornosc_zaburzenia',
    prompt: 'Wyjaśnij, dlaczego matce z krwią Rh− po urodzeniu dziecka Rh+ podaje się immunoglobulinę anty-D.',
    criteria: [
      OpenCriterion('Podane przeciwciała niszczą erytrocyty dziecka, które dostały się do krwi matki, zanim jej układ odpornościowy wytworzy własne przeciwciała anty-Rh i komórki pamięci.'),
      OpenCriterion('Zapobiega to konfliktowi serologicznemu (chorobie hemolitycznej płodu) w kolejnej ciąży z płodem Rh+.'),
    ],
    modelAnswer:
        'Podczas porodu erytrocyty dziecka Rh+ przedostają się do krwi matki. Immunoglobulina anty-D niszczy je, zanim układ odpornościowy matki wytworzy własne przeciwciała i komórki pamięci. Dzięki temu w kolejnej ciąży z płodem Rh+ przeciwciała matki nie zniszczą erytrocytów płodu.',
  ),
  OpenQuestion(
    id: 'oq_k3_przeciwprad',
    topicId: 'k3_oddychanie_zwierzeta',
    prompt: 'Wyjaśnij, na czym polega przewaga przeciwprądowej wymiany gazowej w skrzelach ryb nad wymianą współprądową.',
    criteria: [
      OpenCriterion('Na całej długości blaszki krew styka się z wodą zawierającą więcej tlenu niż ona, więc tlen stale do niej dyfunduje i ryba pobiera go więcej.'),
    ],
    modelAnswer:
        'Krew płynie w przeciwnym kierunku niż woda, więc na całej długości blaszki skrzelowej woda ma więcej tlenu niż krew. Różnica stężeń się utrzymuje, tlen stale przechodzi do krwi i ryba pobiera większą jego część niż przy przepływie współprądowym.',
  ),
  OpenQuestion(
    id: 'oq_k3_czad',
    topicId: 'k3_oddychanie_czlowiek',
    prompt: 'Wyjaśnij, dlaczego zatrucie tlenkiem węgla (czadem) może prowadzić do śmierci.',
    criteria: [
      OpenCriterion('Tlenek węgla wiąże się z hemoglobiną znacznie silniej niż tlen (powstaje karboksyhemoglobina).'),
      OpenCriterion('Hemoglobina nie może transportować tlenu, co prowadzi do niedotlenienia tkanek, zwłaszcza mózgu i serca.'),
    ],
    modelAnswer:
        'Tlenek węgla wiąże się z hemoglobiną ponad 200 razy silniej niż tlen i blokuje ją. Krew przenosi wtedy za mało tlenu, dochodzi do niedotlenienia mózgu i serca, utraty przytomności, a nawet śmierci.',
  ),
  OpenQuestion(
    id: 'oq_k3_lewa_komora',
    topicId: 'k3_krazenie_serce',
    prompt: 'Wykaż związek między grubością ściany lewej komory serca a funkcją, jaką pełni.',
    criteria: [
      OpenCriterion('Lewa komora tłoczy krew do aorty i całego ciała (obieg duży) pod wysokim ciśnieniem, co wymaga grubej, silnej ściany mięśniowej.'),
    ],
    modelAnswer:
        'Lewa komora tłoczy krew do aorty, skąd płynie ona do wszystkich narządów. Musi wytworzyć wysokie ciśnienie, dlatego ma grubszą warstwę mięśnia sercowego niż prawa komora, która tłoczy krew tylko do płuc.',
  ),
  OpenQuestion(
    id: 'oq_k3_cukromocz',
    topicId: 'k3_wydalanie_czlowiek',
    prompt: 'Wyjaśnij, dlaczego u osoby z nieleczoną cukrzycą w moczu ostatecznym pojawia się glukoza.',
    criteria: [
      OpenCriterion('Stężenie glukozy we krwi, a więc i w moczu pierwotnym, jest bardzo wysokie.'),
      OpenCriterion('Zostaje przekroczona zdolność resorpcji zwrotnej glukozy w kanalikach nerkowych, więc część glukozy nie wraca do krwi.'),
    ],
    modelAnswer:
        'Przy nieleczonej cukrzycy stężenie glukozy we krwi jest bardzo wysokie, więc do moczu pierwotnego trafia jej dużo. Komórki kanalików nerkowych mogą wchłonąć zwrotnie tylko ograniczoną ilość glukozy, a jej nadmiar pozostaje w moczu ostatecznym.',
  ),
  OpenQuestion(
    id: 'oq_k3_tyroksyna',
    topicId: 'k3_hormony_gruczoly',
    prompt: 'Opisz mechanizm ujemnego sprzężenia zwrotnego regulujący wydzielanie tyroksyny.',
    criteria: [
      OpenCriterion('Podwzgórze wydziela tyreoliberynę, która pobudza przysadkę do wydzielania TSH, a TSH pobudza tarczycę do wydzielania tyroksyny.'),
      OpenCriterion('Wysokie stężenie tyroksyny hamuje wydzielanie tyreoliberyny i TSH, więc wydzielanie tyroksyny maleje (a przy niskim stężeniu — rośnie).'),
    ],
    modelAnswer:
        'Tyreoliberyna z podwzgórza pobudza przysadkę do wydzielania TSH, a TSH pobudza tarczycę do wydzielania tyroksyny. Gdy stężenie tyroksyny we krwi rośnie, hamuje ona wydzielanie tyreoliberyny i TSH, więc tarczyca wydziela jej mniej — i odwrotnie.',
  ),
  OpenQuestion(
    id: 'oq_k3_synapsa',
    topicId: 'k3_nerwowy_impuls',
    prompt: 'Wyjaśnij, dlaczego synapsa chemiczna przewodzi pobudzenie tylko w jednym kierunku.',
    criteria: [
      OpenCriterion('Neuroprzekaźnik jest uwalniany tylko z błony presynaptycznej, a receptory dla niego ma tylko błona postsynaptyczna.'),
    ],
    modelAnswer:
        'Pęcherzyki z neuroprzekaźnikiem znajdują się tylko w zakończeniu presynaptycznym, a receptory wiążące neuroprzekaźnik — tylko w błonie postsynaptycznej. Dlatego sygnał może być przekazany wyłącznie z neuronu presynaptycznego na postsynaptyczny.',
  ),
  OpenQuestion(
    id: 'oq_k3_stezenie',
    topicId: 'k3_ruch_czlowiek',
    prompt: 'Wyjaśnij, dlaczego po śmierci mięśnie ulegają stężeniu.',
    criteria: [
      OpenCriterion('Po śmierci brakuje ATP, który jest potrzebny do odłączenia główek miozyny od aktyny, więc mostki poprzeczne się nie rozłączają.'),
    ],
    modelAnswer:
        'ATP jest potrzebny nie tylko do ruchu główek miozyny, ale też do ich odłączenia od aktyny. Po śmierci ATP nie jest wytwarzany, więc główki miozyny pozostają połączone z aktyną i mięśnie sztywnieją.',
  ),
  OpenQuestion(
    id: 'oq_k3_solarium',
    topicId: 'k3_pokrycie_skora',
    prompt: 'Wyjaśnij, dlaczego częste korzystanie z solarium zwiększa ryzyko nowotworów skóry.',
    criteria: [
      OpenCriterion('Promieniowanie UV uszkadza DNA komórek skóry i wywołuje mutacje, które mogą prowadzić do transformacji nowotworowej (np. czerniaka).'),
    ],
    modelAnswer:
        'Promieniowanie UV z lamp solarium uszkadza DNA komórek naskórka. Nagromadzenie mutacji, zwłaszcza w genach regulujących podziały komórek, może doprowadzić do nowotworu, np. czerniaka.',
  ),
  OpenQuestion(
    id: 'oq_k3_alkohol_ciaza',
    topicId: 'k3_rozmnazanie_czlowiek',
    prompt: 'Wyjaśnij, dlaczego picie alkoholu przez kobietę w ciąży szkodzi rozwijającemu się dziecku.',
    criteria: [
      OpenCriterion('Alkohol przenika przez łożysko do krwi płodu.'),
      OpenCriterion('Uszkadza rozwijające się narządy, zwłaszcza mózg — może wywołać płodowy zespół alkoholowy (FAS).'),
    ],
    modelAnswer:
        'Łożysko nie zatrzymuje alkoholu, więc przedostaje się on do krwi płodu. Uszkadza rozwijające się narządy, szczególnie mózg, i może wywołać płodowy zespół alkoholowy — niepełnosprawność intelektualną i zaburzenia wzrostu.',
  ),

  // ===========================================================================
  // KLASA 4
  // ===========================================================================
  OpenQuestion(
    id: 'oq_k4_splicing',
    topicId: 'k4_ekspresja_procesy',
    prompt: 'Wyjaśnij, dlaczego u eukariontów z jednego genu mogą powstawać różne białka.',
    criteria: [
      OpenCriterion('Dzięki alternatywnemu splicingowi egzony pre-mRNA mogą być łączone w różny sposób, więc powstają różne cząsteczki mRNA.'),
    ],
    modelAnswer:
        'Podczas obróbki pre-mRNA introny są wycinane, a egzony łączone. W alternatywnym splicingu egzony tego samego genu mogą być łączone w różnych kombinacjach, więc powstają różne mRNA i różne białka.',
  ),
  OpenQuestion(
    id: 'oq_k4_krzyzowka_testowa',
    topicId: 'k4_dziedziczenie_mendel',
    prompt:
        'U grochu żółta barwa nasion (A) dominuje nad zieloną (a). Zaplanuj krzyżówkę, która pozwoli ustalić, czy roślina o żółtych nasionach jest homozygotą, czy heterozygotą, i podaj oczekiwane wyniki.',
    criteria: [
      OpenCriterion('Krzyżówka badanej rośliny z homozygotą recesywną aa (rośliną o zielonych nasionach).'),
      OpenCriterion('Wyniki: całe potomstwo o żółtych nasionach → AA; potomstwo żółte i zielone w stosunku 1 : 1 → Aa.'),
    ],
    modelAnswer:
        'Należy skrzyżować badaną roślinę z rośliną o zielonych nasionach (aa). Jeśli całe potomstwo będzie miało żółte nasiona, badana roślina jest homozygotą AA. Jeśli pojawią się rośliny o żółtych i zielonych nasionach w stosunku 1 : 1, jest heterozygotą Aa.',
  ),
  OpenQuestion(
    id: 'oq_k4_hemofilia',
    topicId: 'k4_dziedziczenie_plec',
    prompt: 'Wyjaśnij, dlaczego hemofilia występuje znacznie częściej u mężczyzn niż u kobiet.',
    criteria: [
      OpenCriterion('Gen leży na chromosomie X; mężczyzna ma jeden chromosom X, więc choruje, mając jeden allel recesywny, a kobieta musiałaby mieć dwa takie allele.'),
    ],
    modelAnswer:
        'Allel hemofilii jest recesywny i leży na chromosomie X. Mężczyzna ma tylko jeden chromosom X, więc pojedynczy allel wystarcza, by zachorował. Kobieta z jednym takim allelem jest zdrową nosicielką — choruje tylko wtedy, gdy ma dwa allele.',
  ),
  OpenQuestion(
    id: 'oq_k4_mutacja_cicha',
    topicId: 'k4_zmiennosc_mutacje',
    prompt: 'Wyjaśnij, dlaczego nie każda substytucja nukleotydu w sekwencji kodującej genu zmienia budowę kodowanego białka.',
    criteria: [
      OpenCriterion('Kod genetyczny jest zdegenerowany — zmieniony kodon może kodować ten sam aminokwas (mutacja cicha).'),
    ],
    modelAnswer:
        'Ten sam aminokwas może być kodowany przez kilka kodonów. Jeśli po zamianie nukleotydu powstaje kodon oznaczający ten sam aminokwas, sekwencja aminokwasów białka się nie zmienia.',
  ),
  OpenQuestion(
    id: 'oq_k4_down',
    topicId: 'k4_zmiennosc_aberracje',
    prompt: 'Wyjaśnij, w jaki sposób powstaje gameta, której połączenie z prawidłową gametą prowadzi do zespołu Downa.',
    criteria: [
      OpenCriterion('Podczas mejozy chromosomy 21 (homologiczne lub chromatydy siostrzane) nie rozchodzą się, więc powstaje gameta z dwoma chromosomami 21.'),
    ],
    modelAnswer:
        'Podczas mejozy dochodzi do nierozdzielenia się chromosomów 21. Gameta otrzymuje wtedy dwa chromosomy 21 zamiast jednego, a po zapłodnieniu prawidłową gametą powstaje zygota z trzema chromosomami 21.',
  ),
  OpenQuestion(
    id: 'oq_k4_pcr',
    topicId: 'k4_biotech_techniki',
    prompt: 'Wyjaśnij, dlaczego w metodzie PCR stosuje się polimerazę DNA pochodzącą z organizmów żyjących w gorących źródłach.',
    criteria: [
      OpenCriterion('Polimeraza jest termostabilna — nie ulega denaturacji w wysokiej temperaturze (ok. 95°C) etapu rozdzielania nici DNA w każdym cyklu.'),
    ],
    modelAnswer:
        'W każdym cyklu PCR mieszaninę ogrzewa się do około 95°C, aby rozdzielić nici DNA. Polimeraza z organizmów z gorących źródeł jest termostabilna, więc nie ulega w tej temperaturze denaturacji i działa przez wszystkie cykle.',
  ),
  OpenQuestion(
    id: 'oq_k4_bt',
    topicId: 'k4_biotech_gmo',
    prompt: 'Podaj jedną korzyść i jedno zagrożenie związane z uprawą roślin transgenicznych odpornych na owady szkodniki.',
    criteria: [
      OpenCriterion('Korzyść, np. mniejsze zużycie środków owadobójczych, mniejsze straty plonów.'),
      OpenCriterion('Zagrożenie, np. przeniesienie wprowadzonego genu do dzikich gatunków pokrewnych, szkodliwy wpływ na owady niebędące szkodnikami, powstanie szkodników odpornych.'),
    ],
    modelAnswer:
        'Korzyść: rolnik może stosować mniej środków owadobójczych, a plony są wyższe. Zagrożenie: wprowadzony gen może przenieść się do dzikich roślin pokrewnych albo szkodniki mogą z czasem stać się odporne.',
  ),
  OpenQuestion(
    id: 'oq_k4_krepak',
    topicId: 'k4_ewolucja_dobor',
    prompt: 'Wyjaśnij, jak dobór naturalny doprowadził do upowszechnienia się ciemnej formy krępaka nabrzozaka na terenach przemysłowych.',
    criteria: [
      OpenCriterion('Na okopconych pniach ciemne ćmy były mniej widoczne dla ptaków, a jasne częściej zjadane.'),
      OpenCriterion('Ciemne osobniki częściej przeżywały i rozmnażały się, więc w kolejnych pokoleniach wzrastała częstość ciemnej formy (jej alleli).'),
    ],
    modelAnswer:
        'Sadza zaczerniła pnie drzew, na których odpoczywają ćmy. Ciemne osobniki były na nich słabo widoczne dla ptaków, a jasne łatwo je wypatrywały. Ciemne ćmy częściej przeżywały i wydawały potomstwo, więc częstość formy ciemnej w populacji rosła z pokolenia na pokolenie.',
  ),
  OpenQuestion(
    id: 'oq_k4_dryf',
    topicId: 'k4_ewolucja_populacje',
    prompt: 'Wyjaśnij, dlaczego dryf genetyczny ma większe znaczenie w małych populacjach niż w dużych.',
    criteria: [
      OpenCriterion('W małej populacji przypadek (to, które osobniki przeżyją i się rozmnożą) silnie zmienia częstość alleli, więc allel może zniknąć lub się utrwalić.'),
    ],
    modelAnswer:
        'W małej populacji o przekazaniu alleli następnemu pokoleniu w dużej mierze decyduje przypadek — śmierć lub brak potomstwa kilku osobników wyraźnie zmienia częstość alleli. W dużej populacji takie losowe zdarzenia się równoważą.',
  ),
  OpenQuestion(
    id: 'oq_k4_allopatria',
    topicId: 'k4_ewolucja_specjacja',
    prompt: 'Wyjaśnij, w jaki sposób izolacja geograficzna może doprowadzić do powstania nowych gatunków.',
    criteria: [
      OpenCriterion('Bariera geograficzna uniemożliwia przepływ genów między rozdzielonymi populacjami.'),
      OpenCriterion('W każdej populacji niezależnie zachodzą mutacje, dobór i dryf, więc pule genowe stają się coraz bardziej różne, aż powstaje izolacja rozrodcza.'),
    ],
    modelAnswer:
        'Rozdzielone barierą populacje nie wymieniają genów. W każdej z nich pojawiają się inne mutacje, a dobór naturalny i dryf działają niezależnie. Po wielu pokoleniach pule genowe tak się różnią, że osobniki nie mogą się skutecznie krzyżować — powstają odrębne gatunki.',
  ),
  OpenQuestion(
    id: 'oq_k4_bioindykacja',
    topicId: 'k4_ekologia_organizmy',
    prompt: 'Wyjaśnij, dlaczego do bioindykacji wykorzystuje się organizmy o wąskim zakresie tolerancji ekologicznej.',
    criteria: [
      OpenCriterion('Organizmy o wąskim zakresie tolerancji reagują nawet na niewielkie zmiany warunków, więc ich obecność lub brak wskazuje stan środowiska.'),
    ],
    modelAnswer:
        'Stenobionty mogą żyć tylko w wąskim zakresie danego czynnika, więc nawet niewielka zmiana, np. zanieczyszczenie, powoduje ich zanik. Ich obecność albo brak dobrze pokazuje stan środowiska.',
  ),
  OpenQuestion(
    id: 'oq_k4_opoznienie',
    topicId: 'k4_ekologia_zaleznosci',
    prompt: 'Wyjaśnij, dlaczego wzrost liczebności drapieżników następuje z opóźnieniem względem wzrostu liczebności ich ofiar.',
    criteria: [
      OpenCriterion('Drapieżniki potrzebują czasu, by przy obfitości pokarmu rozmnożyć się i odchować potomstwo.'),
    ],
    modelAnswer:
        'Gdy ofiar przybywa, drapieżniki mają więcej pokarmu, ale ich liczebność rośnie dopiero wtedy, gdy zdążą się rozmnożyć i odchować młode. Dlatego zmiany liczebności drapieżników są przesunięte w czasie względem zmian liczebności ofiar.',
  ),
  OpenQuestion(
    id: 'oq_k4_lancuchy',
    topicId: 'k4_ekologia_ekosystem',
    prompt: 'Wyjaśnij, dlaczego łańcuchy pokarmowe rzadko mają więcej niż 4–5 ogniw.',
    criteria: [
      OpenCriterion('Na kolejny poziom troficzny przechodzi tylko ok. 10% energii (reszta jest zużywana w oddychaniu i tracona jako ciepło), więc na wyższych poziomach energii jest za mało.'),
    ],
    modelAnswer:
        'Na każdym poziomie troficznym większość energii jest zużywana na procesy życiowe i rozpraszana jako ciepło — dalej przechodzi tylko około 10%. Po kilku ogniwach pozostaje tak mało energii, że nie wystarczyłaby do utrzymania kolejnego poziomu.',
  ),
  OpenQuestion(
    id: 'oq_k4_endemity',
    topicId: 'k4_roznorodnosc_poziomy',
    prompt: 'Wyjaśnij, dlaczego na długo izolowanych wyspach występuje wiele gatunków endemicznych.',
    criteria: [
      OpenCriterion('Izolacja geograficzna uniemożliwia przepływ genów z populacjami z lądu, więc populacje na wyspie ewoluują niezależnie i powstają gatunki występujące tylko tam.'),
    ],
    modelAnswer:
        'Organizmy na wyspie są oddzielone morzem od populacji z lądu i nie wymieniają z nimi genów. Przez długi czas ewoluują niezależnie, przystosowując się do warunków na wyspie, i powstają gatunki, które nie występują nigdzie indziej.',
  ),
  OpenQuestion(
    id: 'oq_k4_fragmentacja',
    topicId: 'k4_roznorodnosc_ochrona',
    prompt: 'Wyjaśnij, dlaczego fragmentacja siedlisk zagraża przetrwaniu gatunków, i podaj sposób ograniczania tego zagrożenia.',
    criteria: [
      OpenCriterion('Fragmentacja tworzy małe, izolowane populacje, między którymi nie ma przepływu genów — tracą różnorodność genetyczną i łatwiej wymierają.'),
      OpenCriterion('Sposób ograniczania, np. tworzenie korytarzy ekologicznych lub przejść dla zwierząt nad drogami i pod nimi.'),
    ],
    modelAnswer:
        'Podzielenie siedliska np. drogami tworzy małe, izolowane populacje. Nie wymieniają one genów, tracą różnorodność genetyczną i łatwiej wymierają wskutek przypadkowych zdarzeń. Zagrożenie ogranicza się, tworząc korytarze ekologiczne i przejścia dla zwierząt.',
  ),
];

OpenQuestion? openQuestionById(String id) {
  for (final q in openQuestions) {
    if (q.id == id) return q;
  }
  return null;
}
