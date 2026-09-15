import '../task_models.dart';

/// Kolejne zadania z danymi. Wartości liczbowe są przybliżone lub
/// hipotetyczne, ale zgodne z przebiegiem opisywanych zjawisk.
const List<DataTask> moreDataTasks = [
  // ---------------------------------------------------------------- klasa 1
  DataTask(
    id: 'dt_k1_podzialy',
    title: 'Chromosomy i DNA w podziałach komórkowych',
    topicId: 'k1_podzialy_mitoza_mejoza',
    intro:
        'W tabeli przedstawiono liczbę chromosomów w komórce i ilość DNA w jądrze w wybranych etapach podziałów komórkowych organizmu, którego komórki somatyczne mają 2n = 8 chromosomów.',
    caption: 'Liczba chromosomów i ilość DNA w wybranych etapach podziałów.',
    visual: TableVisual(
      headers: ['Etap', 'Liczba chromosomów', 'Ilość DNA'],
      rows: [
        ['Faza G1', '8', '2c'],
        ['Metafaza mitozy', '8', '4c'],
        ['Komórka potomna po mitozie', '8', '2c'],
        ['Metafaza I mejozy', '8', '4c'],
        ['Komórka po I podziale mejotycznym', '4', '2c'],
        ['Komórka po II podziale mejotycznym', '4', '1c'],
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k1_pod_1',
        prompt: 'W którym z etapów komórka ma haploidalną liczbę chromosomów, ale każdy chromosom składa się z dwóch chromatyd?',
        options: ['Metafaza mitozy', 'Komórka po I podziale mejotycznym', 'Komórka po II podziale mejotycznym', 'Faza G1'],
        correctIndex: 1,
        explanation: 'Po I podziale mejotycznym komórka ma 4 chromosomy (n), ale ilość DNA wynosi 2c — każdy chromosom ma dwie chromatydy.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k1_pod_2',
        prompt: 'Gameta tego organizmu zawiera chromosomów:',
        options: ['2', '4', '8', '16'],
        correctIndex: 1,
        explanation: 'Gamety powstają w wyniku mejozy i są haploidalne: n = 4.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k1_pod_3',
        prompt: 'Prawda czy fałsz: komórki potomne powstałe w wyniku mitozy mają tyle samo chromosomów co komórka macierzysta.',
        options: ['Prawda', 'Fałsz'],
        correctIndex: 0,
        explanation: 'Zarówno komórka w fazie G1, jak i komórka po mitozie mają 8 chromosomów.',
      ),
    ],
  ),
  DataTask(
    id: 'dt_k1_widmo',
    title: 'Widmo pochłaniania chlorofilu a',
    topicId: 'k1_metabolizm_fotosynteza',
    intro:
        'Wykres przedstawia (w uproszczeniu) pochłanianie światła o różnej długości fali przez chlorofil a oraz intensywność fotosyntezy liści oświetlanych światłem o tych długościach fali.',
    caption: 'Pochłanianie światła przez chlorofil a i intensywność fotosyntezy.',
    visual: LineChartVisual(
      xLabel: 'Długość fali [nm]',
      yLabel: 'Wartość względna [%]',
      minX: 400,
      maxX: 700,
      minY: 0,
      maxY: 100,
      xInterval: 50,
      yInterval: 20,
      series: [
        LineSeries(name: 'Pochłanianie przez chlorofil a', points: [
          ChartPoint(400, 40), ChartPoint(430, 95), ChartPoint(460, 50), ChartPoint(500, 10), ChartPoint(550, 5),
          ChartPoint(600, 15), ChartPoint(640, 45), ChartPoint(662, 80), ChartPoint(700, 5),
        ]),
        LineSeries(name: 'Intensywność fotosyntezy', points: [
          ChartPoint(400, 60), ChartPoint(430, 85), ChartPoint(460, 75), ChartPoint(500, 40), ChartPoint(550, 30),
          ChartPoint(600, 45), ChartPoint(640, 70), ChartPoint(662, 80), ChartPoint(700, 20),
        ]),
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k1_wid_1',
        prompt: 'Chlorofil a najsilniej pochłania światło o barwie:',
        options: ['Niebieskofioletowej i czerwonej', 'Zielonej', 'Żółtej i pomarańczowej', 'Wyłącznie czerwonej'],
        correctIndex: 0,
        explanation: 'Maksima pochłaniania przypadają na około 430 nm (niebieskofioletowe) i 662 nm (czerwone).',
      ),
      DataTaskQuestion(
        id: 'q_dt_k1_wid_2',
        prompt: 'Liście są zielone, ponieważ chlorofil:',
        options: [
          'Słabo pochłania światło zielone, które jest odbijane',
          'Najsilniej pochłania światło zielone',
          'Wytwarza zielone światło w fazie zależnej od światła',
          'Pochłania wyłącznie promieniowanie podczerwone',
        ],
        correctIndex: 0,
        explanation: 'W zakresie około 500–600 nm pochłanianie jest najmniejsze, więc światło zielone jest odbijane i przepuszczane.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k1_wid_3',
        prompt:
            'Prawda czy fałsz: przy długości fali 550 nm fotosynteza zachodzi intensywniej, niż wynikałoby to z pochłaniania światła przez sam chlorofil a, co wskazuje na udział barwników pomocniczych.',
        options: ['Prawda', 'Fałsz'],
        correctIndex: 0,
        explanation: 'Przy 550 nm chlorofil a pochłania tylko 5%, a intensywność fotosyntezy wynosi 30% — energię pochłaniają też np. karotenoidy i chlorofil b.',
      ),
    ],
  ),

  // ---------------------------------------------------------------- klasa 2
  DataTask(
    id: 'dt_k2_antybiotyk',
    title: 'Działanie antybiotyku na hodowlę bakterii',
    topicId: 'k2_bakterie_czynnosci',
    intro:
        'Założono dwie jednakowe hodowle bakterii. Do jednej z nich w 4. godzinie dodano antybiotyk. Liczbę bakterii przedstawiono jako logarytm dziesiętny liczby komórek w 1 cm³ (wzrost o 1 oznacza dziesięciokrotnie więcej bakterii).',
    caption: 'Liczba bakterii w hodowlach (log10 komórek/cm³).',
    visual: LineChartVisual(
      xLabel: 'Czas hodowli [h]',
      yLabel: 'Liczba bakterii [log10 komórek/cm³]',
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 8,
      xInterval: 2,
      yInterval: 1,
      series: [
        LineSeries(name: 'Bez antybiotyku', points: [
          ChartPoint(0, 3), ChartPoint(2, 4), ChartPoint(4, 5), ChartPoint(6, 6), ChartPoint(8, 7), ChartPoint(10, 7.5), ChartPoint(12, 7.5),
        ]),
        LineSeries(name: 'Antybiotyk dodany w 4. godzinie', points: [
          ChartPoint(0, 3), ChartPoint(2, 4), ChartPoint(4, 5), ChartPoint(6, 4), ChartPoint(8, 3), ChartPoint(10, 2.2), ChartPoint(12, 2),
        ]),
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k2_ant_1',
        prompt: 'Liczba bakterii w hodowli bez antybiotyku przestała rosnąć po około:',
        options: ['4 h', '6 h', '10 h', '12 h'],
        correctIndex: 2,
        explanation: 'Między 10. a 12. godziną liczba bakterii się nie zmienia (7,5), a do 10. godziny jeszcze rosła.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k2_ant_2',
        prompt: 'Po 6 godzinach liczba bakterii w hodowli bez antybiotyku była większa niż na początku hodowli:',
        options: ['3 razy', '30 razy', '1000 razy', '6 razy'],
        correctIndex: 2,
        explanation: 'Logarytm wzrósł z 3 do 6, czyli o 3 — liczba bakterii wzrosła 10 · 10 · 10 = 1000 razy.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k2_ant_3',
        prompt: 'Spadek liczby bakterii po dodaniu antybiotyku świadczy o tym, że antybiotyk:',
        options: [
          'Zabijał bakterie (działał bakteriobójczo)',
          'Tylko hamował podziały bakterii, nie zabijając ich',
          'Był rozkładany przez bakterie',
          'Nie wpływał na bakterie',
        ],
        correctIndex: 0,
        explanation: 'Gdyby antybiotyk tylko hamował podziały, liczba bakterii przestałaby rosnąć, ale by nie malała.',
      ),
    ],
  ),

  // ---------------------------------------------------------------- klasa 3
  DataTask(
    id: 'dt_k3_przeciwciala',
    title: 'Odpowiedź pierwotna i wtórna',
    topicId: 'k3_odpornosc_mechanizmy',
    intro:
        'Wykres przedstawia stężenie przeciwciał we krwi po pierwszym kontakcie z antygenem (dzień 0) i po drugim kontakcie z tym samym antygenem (dzień 30).',
    caption: 'Stężenie przeciwciał swoistych dla antygenu (jednostki względne).',
    visual: LineChartVisual(
      xLabel: 'Czas [dni]',
      yLabel: 'Stężenie przeciwciał [jednostki względne]',
      minX: 0,
      maxX: 60,
      minY: 0,
      maxY: 100,
      xInterval: 10,
      yInterval: 20,
      series: [
        LineSeries(name: 'Przeciwciała', points: [
          ChartPoint(0, 0), ChartPoint(5, 1), ChartPoint(10, 8), ChartPoint(14, 10), ChartPoint(20, 5), ChartPoint(25, 3), ChartPoint(30, 2),
          ChartPoint(33, 30), ChartPoint(36, 100), ChartPoint(40, 90), ChartPoint(45, 75), ChartPoint(50, 65), ChartPoint(55, 55), ChartPoint(60, 50),
        ]),
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k3_prz_1',
        prompt: 'Maksymalne stężenie przeciwciał po drugim kontakcie z antygenem było wyższe niż po pierwszym około:',
        options: ['2 razy', '5 razy', '10 razy', '100 razy'],
        correctIndex: 2,
        explanation: 'Po pierwszym kontakcie maksimum wynosiło 10, a po drugim — 100 jednostek.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k3_prz_2',
        prompt: 'Szybsza i silniejsza odpowiedź po drugim kontakcie z antygenem wynika z obecności:',
        options: [
          'Komórek pamięci immunologicznej',
          'Dużej ilości przeciwciał pozostałych po pierwszej odpowiedzi',
          'Interferonów wytworzonych po pierwszym kontakcie',
          'Białek ostrej fazy',
        ],
        correctIndex: 0,
        explanation: 'W 30. dniu stężenie przeciwciał było już bardzo niskie (2) — szybką odpowiedź umożliwiły komórki pamięci.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k3_prz_3',
        prompt: 'Prawda czy fałsz: na zjawisku przedstawionym na wykresie opiera się podawanie dawek przypominających szczepionki.',
        options: ['Prawda', 'Fałsz'],
        correctIndex: 0,
        explanation: 'Kolejna dawka wywołuje silną odpowiedź wtórną i utrwala odporność.',
      ),
    ],
  ),
  DataTask(
    id: 'dt_k3_cisnienie',
    title: 'Ciśnienie krwi w naczyniach',
    topicId: 'k3_krazenie_krew',
    intro: 'Wykres przedstawia średnie ciśnienie krwi w kolejnych rodzajach naczyń krwionośnych obiegu dużego człowieka (wartości przybliżone).',
    caption: 'Średnie ciśnienie krwi w naczyniach obiegu dużego.',
    visual: BarChartVisual(
      yLabel: 'Średnie ciśnienie krwi [mm Hg]',
      maxY: 100,
      yInterval: 20,
      bars: [
        BarItem(label: 'A', description: 'aorta', value: 95),
        BarItem(label: 'B', description: 'duże tętnice', value: 90),
        BarItem(label: 'C', description: 'tętniczki', value: 60),
        BarItem(label: 'D', description: 'naczynia włosowate', value: 25),
        BarItem(label: 'E', description: 'żyłki', value: 12),
        BarItem(label: 'F', description: 'żyły główne', value: 3),
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k3_cis_1',
        prompt: 'Największy spadek średniego ciśnienia krwi następuje między:',
        options: ['Aortą a dużymi tętnicami', 'Tętniczkami a naczyniami włosowatymi', 'Naczyniami włosowatymi a żyłkami', 'Żyłkami a żyłami głównymi'],
        correctIndex: 1,
        explanation: 'Ciśnienie spada tam z 60 do 25 mm Hg, czyli o 35 mm Hg — bardziej niż między pozostałymi naczyniami.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k3_cis_2',
        prompt: 'Ze względu na niskie ciśnienie krwi w żyłach kończyn dolnych jej powrót do serca wspomagają:',
        options: [
          'Zastawki żylne i skurcze otaczających mięśni szkieletowych',
          'Skurcze mięśni gładkich w ścianach tętnic',
          'Naczynia włosowate tłoczące krew do żył',
          'Zastawki półksiężycowate u wylotu aorty',
        ],
        correctIndex: 0,
        explanation: 'Mięśnie uciskają żyły, a zastawki nie pozwalają krwi się cofać.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k3_cis_3',
        prompt: 'Prawda czy fałsz: według wykresu średnie ciśnienie krwi w żyłach głównych jest wyższe niż w naczyniach włosowatych.',
        options: ['Prawda', 'Fałsz'],
        correctIndex: 1,
        explanation: 'W żyłach głównych wynosi około 3 mm Hg, a w naczyniach włosowatych około 25 mm Hg.',
      ),
    ],
  ),
  DataTask(
    id: 'dt_k3_potencjal',
    title: 'Potencjał czynnościowy neuronu',
    topicId: 'k3_nerwowy_impuls',
    intro: 'Wykres przedstawia zmiany potencjału błony aksonu w miejscu, w którym przez błonę przechodził impuls nerwowy.',
    caption: 'Potencjał błony aksonu w czasie przejścia impulsu nerwowego.',
    visual: LineChartVisual(
      xLabel: 'Czas [ms]',
      yLabel: 'Potencjał błony [mV]',
      minX: 0,
      maxX: 6,
      minY: -90,
      maxY: 50,
      xInterval: 1,
      yInterval: 20,
      straight: true,
      series: [
        LineSeries(name: 'Potencjał błony', points: [
          ChartPoint(0, -70), ChartPoint(1, -70), ChartPoint(1.5, -55), ChartPoint(2, 30), ChartPoint(3, -80),
          ChartPoint(4, -75), ChartPoint(5, -70), ChartPoint(6, -70),
        ]),
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k3_pot_1',
        prompt: 'Potencjał spoczynkowy tego neuronu wynosi:',
        options: ['−80 mV', '−70 mV', '−55 mV', '+30 mV'],
        correctIndex: 1,
        explanation: 'Przed impulsem i po jego przejściu potencjał błony utrzymuje się na poziomie −70 mV.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k3_pot_2',
        prompt: 'Wzrost potencjału z −55 mV do +30 mV jest spowodowany:',
        options: [
          'Napływem jonów Na+ do wnętrza aksonu',
          'Wypływem jonów K+ z aksonu',
          'Pracą pompy sodowo-potasowej',
          'Napływem jonów Cl− do aksonu',
        ],
        correctIndex: 0,
        explanation: 'Po przekroczeniu progu otwierają się kanały sodowe i jony Na+ napływają do komórki — to depolaryzacja.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k3_pot_3',
        prompt: 'Prawda czy fałsz: obniżenie potencjału poniżej wartości spoczynkowej (do −80 mV) wynika z wypływu jonów potasu z aksonu.',
        options: ['Prawda', 'Fałsz'],
        correctIndex: 0,
        explanation: 'Kanały potasowe zamykają się z opóźnieniem, więc przez chwilę wypływa więcej jonów K+ — to hiperpolaryzacja.',
      ),
    ],
  ),
  DataTask(
    id: 'dt_k3_cykl',
    title: 'Hormony w cyklu menstruacyjnym',
    topicId: 'k3_rozmnazanie_czlowiek',
    intro: 'Wykres przedstawia (w uproszczeniu) zmiany stężenia lutropiny (LH) i progesteronu we krwi kobiety w czasie 28-dniowego cyklu menstruacyjnego.',
    caption: 'Stężenie LH i progesteronu w kolejnych dniach cyklu (jednostki względne).',
    visual: LineChartVisual(
      xLabel: 'Dzień cyklu',
      yLabel: 'Stężenie hormonu [jednostki względne]',
      minX: 1,
      maxX: 28,
      minY: 0,
      maxY: 100,
      xInterval: 3,
      yInterval: 20,
      series: [
        LineSeries(name: 'LH', points: [
          ChartPoint(1, 10), ChartPoint(5, 10), ChartPoint(10, 15), ChartPoint(13, 30), ChartPoint(14, 100),
          ChartPoint(15, 30), ChartPoint(17, 12), ChartPoint(21, 10), ChartPoint(28, 8),
        ]),
        LineSeries(name: 'Progesteron', points: [
          ChartPoint(1, 5), ChartPoint(5, 5), ChartPoint(10, 5), ChartPoint(14, 8), ChartPoint(17, 40),
          ChartPoint(21, 100), ChartPoint(25, 50), ChartPoint(28, 8),
        ]),
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k3_cyk_1',
        prompt: 'Owulacja nastąpiła najprawdopodobniej około:',
        options: ['1. dnia cyklu', '7. dnia cyklu', '14. dnia cyklu', '21. dnia cyklu'],
        correctIndex: 2,
        explanation: 'Owulację wywołuje gwałtowny wzrost stężenia LH, który przypada na 14. dzień.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k3_cyk_2',
        prompt: 'Wysokie stężenie progesteronu około 21. dnia cyklu jest wynikiem wydzielania tego hormonu przez:',
        options: ['Ciałko żółte', 'Dojrzewający pęcherzyk jajnikowy', 'Przedni płat przysadki', 'Łożysko'],
        correctIndex: 0,
        explanation: 'Po owulacji z pęcherzyka powstaje ciałko żółte, które wydziela progesteron.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k3_cyk_3',
        prompt: 'Prawda czy fałsz: spadek stężenia progesteronu pod koniec cyklu poprzedza złuszczenie się błony śluzowej macicy, czyli miesiączkę.',
        options: ['Prawda', 'Fałsz'],
        correctIndex: 0,
        explanation: 'Gdy nie dochodzi do zapłodnienia, ciałko żółte zanika, stężenie progesteronu spada i błona śluzowa macicy się złuszcza.',
      ),
    ],
  ),
  DataTask(
    id: 'dt_k3_azot',
    title: 'Azotowe produkty przemiany materii',
    topicId: 'k3_wydalanie_zwierzeta',
    intro: 'W tabeli zestawiono główne azotowe produkty przemiany materii wydalane przez wybrane zwierzęta.',
    caption: 'Główny azotowy produkt wydalania wybranych zwierząt.',
    visual: TableVisual(
      headers: ['Zwierzę', 'Środowisko życia', 'Główny produkt'],
      rows: [
        ['Karp', 'woda słodka', 'amoniak'],
        ['Kijanka żaby', 'woda słodka', 'amoniak'],
        ['Dorosła żaba', 'ląd i woda', 'mocznik'],
        ['Jaszczurka zwinka', 'ląd', 'kwas moczowy'],
        ['Gołąb', 'ląd', 'kwas moczowy'],
        ['Człowiek', 'ląd', 'mocznik'],
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k3_azot_1',
        prompt: 'Na podstawie tabeli można stwierdzić, że amoniak wydalają zwierzęta:',
        options: ['Żyjące w wodzie', 'Żyjące na lądzie', 'Latające', 'Stałocieplne'],
        correctIndex: 0,
        explanation: 'Amoniak wydalają karp i kijanka — oba zwierzęta żyją w wodzie, w której łatwo rozcieńczyć toksyczny amoniak.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k3_azot_2',
        prompt: 'Wydalanie kwasu moczowego przez jaszczurkę i gołębia jest przystosowaniem do:',
        options: ['Oszczędzania wody', 'Szybkiego oddawania ciepła', 'Życia w wodzie słodkiej', 'Trawienia białek'],
        correctIndex: 0,
        explanation: 'Kwas moczowy słabo rozpuszcza się w wodzie i jest usuwany w postaci półstałej, przy minimalnej utracie wody.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k3_azot_3',
        prompt: 'Prawda czy fałsz: zmiana produktu wydalania podczas przeobrażenia kijanki w dorosłą żabę wiąże się z przejściem do życia częściowo na lądzie.',
        options: ['Prawda', 'Fałsz'],
        correctIndex: 0,
        explanation: 'Kijanka żyje w wodzie i wydala amoniak, a dorosła żaba przebywa też na lądzie i wydala mniej toksyczny mocznik.',
      ),
    ],
  ),

  // ---------------------------------------------------------------- klasa 4
  DataTask(
    id: 'dt_k4_mendel',
    title: 'Krzyżówka dwugenowa u grochu',
    topicId: 'k4_dziedziczenie_mendel',
    intro:
        'Skrzyżowano ze sobą dwie rośliny grochu o nasionach żółtych i gładkich. Barwę nasion warunkuje gen A (żółte dominują nad zielonymi), a kształt — gen B (gładkie dominują nad pomarszczonymi). W potomstwie otrzymano rośliny o fenotypach podanych w tabeli.',
    caption: 'Liczba nasion o poszczególnych fenotypach w potomstwie.',
    visual: TableVisual(
      headers: ['Fenotyp nasion', 'Liczba'],
      rows: [
        ['żółte, gładkie', '315'],
        ['żółte, pomarszczone', '101'],
        ['zielone, gładkie', '108'],
        ['zielone, pomarszczone', '32'],
        ['razem', '556'],
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k4_men_1',
        prompt: 'Stosunek fenotypów w potomstwie jest najbliższy stosunkowi:',
        options: ['3 : 1', '1 : 1 : 1 : 1', '9 : 3 : 3 : 1', '1 : 2 : 1'],
        correctIndex: 2,
        explanation: '315 : 101 : 108 : 32 ≈ 9,8 : 3,2 : 3,4 : 1, czyli w przybliżeniu 9 : 3 : 3 : 1.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k4_men_2',
        prompt: 'Genotypy skrzyżowanych roślin to:',
        options: ['AaBb × AaBb', 'AABB × aabb', 'AaBb × aabb', 'AABb × AaBB'],
        correctIndex: 0,
        explanation: 'Stosunek 9 : 3 : 3 : 1 powstaje w krzyżówce dwóch heterozygot podwójnych.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k4_men_3',
        prompt: 'Prawda czy fałsz: wyniki wskazują, że geny barwy i kształtu nasion dziedziczą się niezależnie.',
        options: ['Prawda', 'Fałsz'],
        correctIndex: 0,
        explanation: 'Stosunek 9 : 3 : 3 : 1 jest zgodny z II prawem Mendla — geny leżą w różnych parach chromosomów.',
      ),
    ],
  ),
  DataTask(
    id: 'dt_k4_kariotypy',
    title: 'Analiza kariotypów',
    topicId: 'k4_zmiennosc_aberracje',
    intro: 'W tabeli zapisano wyniki badania kariotypu czterech osób.',
    caption: 'Kariotypy badanych osób.',
    visual: TableVisual(
      headers: ['Osoba', 'Kariotyp'],
      rows: [
        ['1', '47,XY,+21'],
        ['2', '45,X'],
        ['3', '47,XXY'],
        ['4', '46,XX'],
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k4_kar_1',
        prompt: 'Zespół Turnera stwierdzono u:',
        options: ['Osoby 1', 'Osoby 2', 'Osoby 3', 'Osoby 4'],
        correctIndex: 1,
        explanation: 'Kariotyp 45,X oznacza brak jednego chromosomu płci u kobiety — zespół Turnera.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k4_kar_2',
        prompt: 'Osoba 3 to:',
        options: ['Mężczyzna z zespołem Klinefeltera', 'Kobieta z zespołem Turnera', 'Mężczyzna z zespołem Downa', 'Kobieta bez aberracji chromosomowej'],
        correctIndex: 0,
        explanation: 'Kariotyp 47,XXY oznacza mężczyznę z dodatkowym chromosomem X.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k4_kar_3',
        prompt: 'Prawda czy fałsz: na podstawie prawidłowego kariotypu osoby 4 można wykluczyć, że choruje ona na mukowiscydozę.',
        options: ['Prawda', 'Fałsz'],
        correctIndex: 1,
        explanation: 'Mukowiscydoza to choroba genowa — mutacja zmienia sekwencję nukleotydów i nie jest widoczna w kariotypie.',
      ),
    ],
  ),
  DataTask(
    id: 'dt_k4_krepak',
    title: 'Melanizm przemysłowy',
    topicId: 'k4_ewolucja_dobor',
    intro:
        'Wykres przedstawia (w uproszczeniu) zmiany udziału ciemnej formy krępaka nabrzozaka w populacji tej ćmy w okolicach dużego ośrodka przemysłowego. W połowie XX wieku wprowadzono przepisy ograniczające zanieczyszczenie powietrza.',
    caption: 'Udział ciemnej formy krępaka nabrzozaka w populacji.',
    visual: LineChartVisual(
      xLabel: 'Rok',
      yLabel: 'Udział formy ciemnej [%]',
      minX: 1850,
      maxX: 2000,
      minY: 0,
      maxY: 100,
      xInterval: 25,
      yInterval: 20,
      series: [
        LineSeries(name: 'Forma ciemna', points: [
          ChartPoint(1850, 2), ChartPoint(1870, 20), ChartPoint(1890, 60), ChartPoint(1910, 85), ChartPoint(1930, 90),
          ChartPoint(1950, 90), ChartPoint(1970, 80), ChartPoint(1990, 40), ChartPoint(2000, 15),
        ]),
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k4_krep_1',
        prompt: 'Wzrost udziału formy ciemnej w latach 1850–1910 był spowodowany tym, że:',
        options: [
          'Ciemne ćmy były słabiej widoczne dla ptaków na okopconych pniach i rzadziej je zjadano',
          'Skrzydła ciem ciemniały w ciągu życia pod wpływem osadzającej się sadzy',
          'Zanieczyszczenia wywoływały mutację u wszystkich osobników w populacji',
          'Jasne ćmy celowo przeniosły się w rejony o czystszym powietrzu',
        ],
        correctIndex: 0,
        explanation: 'To dobór naturalny: ciemne osobniki częściej przeżywały i przekazywały swoje allele potomstwu.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k4_krep_2',
        prompt: 'Zmiany przedstawione na wykresie są przykładem doboru:',
        options: ['Kierunkowego', 'Stabilizującego', 'Różnicującego', 'Płciowego'],
        correctIndex: 0,
        explanation: 'Średnia wartość cechy w populacji przesuwała się w jedną stronę — najpierw ku formie ciemnej, później ku jasnej.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k4_krep_3',
        prompt: 'Prawda czy fałsz: spadek udziału formy ciemnej po 1950 roku może być związany z ograniczeniem zanieczyszczenia powietrza.',
        options: ['Prawda', 'Fałsz'],
        correctIndex: 0,
        explanation: 'Pnie drzew stawały się jaśniejsze, więc to jasne ćmy znów były lepiej zamaskowane.',
      ),
    ],
  ),
  DataTask(
    id: 'dt_k4_biomy',
    title: 'Różnorodność drzew w biomach',
    topicId: 'k4_roznorodnosc_poziomy',
    intro: 'Wykres przedstawia przybliżoną liczbę gatunków drzew na powierzchni 1 ha w wybranych biomach.',
    caption: 'Przybliżona liczba gatunków drzew na 1 ha.',
    visual: BarChartVisual(
      yLabel: 'Liczba gatunków drzew na 1 ha',
      maxY: 300,
      yInterval: 50,
      bars: [
        BarItem(label: 'A', description: 'wilgotny las równikowy', value: 250),
        BarItem(label: 'B', description: 'las liściasty strefy umiarkowanej', value: 20),
        BarItem(label: 'C', description: 'tajga', value: 5),
        BarItem(label: 'D', description: 'tundra', value: 0),
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k4_bio_1',
        prompt: 'Najwięcej gatunków drzew na 1 ha rośnie w:',
        options: ['Wilgotnym lesie równikowym', 'Lesie liściastym strefy umiarkowanej', 'Tajdze', 'Tundrze'],
        correctIndex: 0,
        explanation: 'W wilgotnym lesie równikowym na 1 ha rośnie około 250 gatunków drzew.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k4_bio_2',
        prompt: 'Czynnikiem, który w największym stopniu wyjaśnia różnice przedstawione na wykresie, jest:',
        options: ['Klimat — temperatura i ilość opadów', 'Wiek skał podłoża', 'Liczba gatunków roślinożerców', 'Odległość od najbliższego morza'],
        correctIndex: 0,
        explanation: 'Rozmieszczenie biomów i ich bogactwo gatunkowe zależą przede wszystkim od klimatu.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k4_bio_3',
        prompt: 'Prawda czy fałsz: brak drzew w tundrze wiąże się m.in. z krótkim latem i wieczną zmarzliną.',
        options: ['Prawda', 'Fałsz'],
        correctIndex: 0,
        explanation: 'Krótki okres wegetacji i zmarznięte podłoże uniemożliwiają wzrost drzew.',
      ),
    ],
  ),
];
