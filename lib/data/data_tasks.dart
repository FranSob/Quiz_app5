import '../task_models.dart';

/// Zadania z materiałem źródłowym, ułożone w kolejności programu (klasy 1–4).
///
/// Dane liczbowe są przykładowe (hipotetyczne), ale zgodne z przebiegiem
/// opisywanych procesów, a każdą odpowiedź da się wyczytać z materiału.
const List<DataTask> dataTasks = [
  // ===========================================================================
  // KLASA 1
  // ===========================================================================
  DataTask(
    id: 'dt_k1_katalaza',
    title: 'Wpływ temperatury na aktywność katalazy',
    topicId: 'k1_metabolizm_enzymy',
    intro:
        'Uczniowie badali aktywność katalazy z bulwy ziemniaka. Do jednakowych porcji rozdrobnionego miąższu dodawali roztwór nadtlenku wodoru o tym samym stężeniu i mierzyli objętość tlenu wydzielonego w ciągu 2 minut. Każdą próbę prowadzono w innej temperaturze.',
    caption: 'Objętość tlenu wydzielonego w ciągu 2 minut w zależności od temperatury.',
    visual: LineChartVisual(
      xLabel: 'Temperatura [°C]',
      yLabel: 'Objętość tlenu [cm³]',
      minX: 0,
      maxX: 70,
      minY: 0,
      maxY: 20,
      xInterval: 10,
      yInterval: 4,
      series: [
        LineSeries(name: 'Katalaza', points: [
          ChartPoint(0, 2), ChartPoint(10, 6), ChartPoint(20, 11), ChartPoint(30, 16),
          ChartPoint(40, 18), ChartPoint(50, 9), ChartPoint(60, 3), ChartPoint(70, 0),
        ]),
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k1_kat_1',
        prompt: 'W której z badanych temperatur aktywność katalazy była najwyższa?',
        options: ['20°C', '30°C', '40°C', '60°C'],
        correctIndex: 2,
        explanation: 'W 40°C wydzieliło się najwięcej tlenu — 18 cm³.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k1_kat_2',
        prompt: 'Spadek aktywności katalazy powyżej 40°C wynika przede wszystkim z:',
        options: [
          'Zużycia całego substratu jeszcze przed pomiarem',
          'Denaturacji enzymu, który traci strukturę przestrzenną',
          'Przekształcenia enzymu w inhibitor tej reakcji',
          'Zbyt małej energii kinetycznej cząsteczek substratu',
        ],
        correctIndex: 1,
        explanation: 'Wysoka temperatura niszczy strukturę przestrzenną białka, w tym centrum aktywne enzymu.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k1_kat_3',
        prompt: 'Prawda czy fałsz: niska aktywność katalazy w 10°C świadczy o tym, że enzym uległ w tej temperaturze denaturacji.',
        options: ['Prawda', 'Fałsz'],
        correctIndex: 1,
        explanation: 'Niska temperatura spowalnia reakcję, bo cząsteczki poruszają się wolniej, ale nie powoduje denaturacji enzymu.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k1_kat_4',
        prompt: 'Zmienną niezależną w tym doświadczeniu jest:',
        options: ['Objętość wydzielonego tlenu', 'Stężenie nadtlenku wodoru', 'Temperatura', 'Masa porcji miąższu'],
        correctIndex: 2,
        explanation: 'Badacz celowo zmieniał temperaturę; objętość tlenu to zmienna zależna, a pozostałe czynniki były stałe.',
      ),
    ],
  ),
  DataTask(
    id: 'dt_k1_osmoza',
    title: 'Osmoza w komórkach bulwy ziemniaka',
    topicId: 'k1_komorka_blona_transport',
    intro:
        'Jednakowe walce wycięte z bulwy ziemniaka zważono, umieszczono na godzinę w roztworach sacharozy o różnym stężeniu, a następnie osuszono i zważono ponownie. Wyniki przedstawiono jako procentową zmianę masy.',
    caption: 'Zmiana masy walców ziemniaka po godzinie w roztworach sacharozy.',
    visual: TableVisual(
      headers: ['Stężenie sacharozy [mol/dm³]', 'Zmiana masy [%]'],
      rows: [
        ['0,0', '+12'],
        ['0,1', '+7'],
        ['0,2', '+3'],
        ['0,3', '−1'],
        ['0,4', '−6'],
        ['0,5', '−10'],
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k1_osm_1',
        prompt: 'Stężenie roztworu izotonicznego względem soku komórkowego miąższu ziemniaka mieści się między:',
        options: ['0,0 a 0,1 mol/dm³', '0,2 a 0,3 mol/dm³', '0,3 a 0,4 mol/dm³', '0,4 a 0,5 mol/dm³'],
        correctIndex: 1,
        explanation: 'Masa rośnie przy 0,2 mol/dm³, a maleje przy 0,3 mol/dm³ — brak zmiany masy przypada między tymi stężeniami.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k1_osm_2',
        prompt: 'W roztworze sacharozy o stężeniu 0,5 mol/dm³ komórki miąższu:',
        options: [
          'Pobierały wodę i zwiększały turgor',
          'Traciły wodę i mogły ulegać plazmolizie',
          'Nie wymieniały wody z roztworem',
          'Pobierały sacharozę na drodze osmozy',
        ],
        correctIndex: 1,
        explanation: 'Roztwór był hipertoniczny, więc woda wypływała z komórek i masa walców zmalała o 10%.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k1_osm_3',
        prompt: 'Wyniki podano jako procentową zmianę masy, a nie zmianę w gramach, ponieważ:',
        options: [
          'Walce mogły różnić się masą początkową, a procenty pozwalają porównać wyniki',
          'Zmiany masy w gramach nie da się zmierzyć wagą laboratoryjną',
          'Procentowa zmiana masy eliminuje wpływ temperatury na osmozę',
          'Wyrażenie w procentach sprawia, że wszystkie wartości są dodatnie',
        ],
        correctIndex: 0,
        explanation: 'Przeliczenie na procent masy początkowej pozwala porównywać walce, nawet jeśli nie były idealnie jednakowe.',
      ),
    ],
  ),
  DataTask(
    id: 'dt_k1_cykl',
    title: 'Ilość DNA w cyklu komórkowym',
    topicId: 'k1_podzialy_dna_cykl',
    intro:
        'Wykres przedstawia zmiany ilości DNA w jądrze diploidalnej komórki somatycznej w czasie jednego cyklu komórkowego zakończonego podziałem mitotycznym. Ilość DNA wyrażono w jednostkach c, gdzie 1c to ilość DNA w jądrze gamety.',
    caption: 'Ilość DNA w jądrze komórki w kolejnych godzinach cyklu komórkowego.',
    visual: LineChartVisual(
      xLabel: 'Czas [h]',
      yLabel: 'Ilość DNA [c]',
      minX: 0,
      maxX: 24,
      minY: 0,
      maxY: 5,
      xInterval: 4,
      yInterval: 1,
      straight: true,
      series: [
        LineSeries(name: 'DNA', points: [
          ChartPoint(0, 2), ChartPoint(10, 2), ChartPoint(18, 4), ChartPoint(22, 4), ChartPoint(23, 2), ChartPoint(24, 2),
        ]),
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k1_cyk_1',
        prompt: 'Replikacja DNA zachodziła w przedziale czasu:',
        options: ['0–10 h', '10–18 h', '18–22 h', '22–24 h'],
        correctIndex: 1,
        explanation: 'W fazie S ilość DNA stopniowo podwaja się z 2c do 4c.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k1_cyk_2',
        prompt: 'Komórka w 20. godzinie cyklu (faza G2) ma:',
        options: ['2n 2c', '2n 4c', 'n 2c', '4n 4c'],
        correctIndex: 1,
        explanation: 'Po replikacji liczba chromosomów się nie zmienia (2n), ale każdy składa się z dwóch chromatyd, więc DNA jest 4c.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k1_cyk_3',
        prompt: 'Prawda czy fałsz: spadek ilości DNA z 4c do 2c w 22.–23. godzinie jest wynikiem mejozy.',
        options: ['Prawda', 'Fałsz'],
        correctIndex: 1,
        explanation: 'To podział mitotyczny komórki somatycznej — każda komórka potomna otrzymuje 2c DNA. Mejoza prowadziłaby do komórek o 1c.',
      ),
    ],
  ),

  // ===========================================================================
  // KLASA 2
  // ===========================================================================
  DataTask(
    id: 'dt_k2_drozdze',
    title: 'Fermentacja alkoholowa drożdży',
    topicId: 'k2_grzyby_budowa',
    intro:
        'Do kolb z roztworem glukozy o różnym stężeniu dodano jednakową ilość drożdży i mierzono objętość dwutlenku węgla wydzielonego w ciągu 20 minut w temperaturze 30°C. Jedna kolba zawierała roztwór glukozy bez drożdży.',
    caption: 'Objętość CO2 wydzielonego w ciągu 20 minut w poszczególnych kolbach.',
    visual: BarChartVisual(
      yLabel: 'Objętość CO2 [cm³]',
      maxY: 10,
      yInterval: 2,
      bars: [
        BarItem(label: 'A', description: '10% glukozy, bez drożdży', value: 0),
        BarItem(label: 'B', description: 'drożdże, bez glukozy (0%)', value: 0.4),
        BarItem(label: 'C', description: 'drożdże, 2% glukozy', value: 3.5),
        BarItem(label: 'D', description: 'drożdże, 5% glukozy', value: 7.8),
        BarItem(label: 'E', description: 'drożdże, 10% glukozy', value: 8.1),
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k2_dro_1',
        prompt: 'Która kolba pozwala wykazać, że dwutlenek węgla wydzielały drożdże, a nie sam roztwór glukozy?',
        options: ['Kolba A', 'Kolba B', 'Kolba C', 'Kolba E'],
        correctIndex: 0,
        explanation: 'W kolbie A była glukoza, ale nie było drożdży — i nie wydzielił się CO2.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k2_dro_2',
        prompt: 'Wzrost stężenia glukozy z 5% do 10% prawie nie zwiększył ilości CO2, ponieważ:',
        options: [
          'Czynnikiem ograniczającym stała się ilość drożdży i ich enzymów, a nie ilość substratu',
          'Glukoza w stężeniu 10% jest dla drożdży całkowicie niedostępna',
          'Drożdże w kolbie E przestały prowadzić fermentację alkoholową',
          'W wyższym stężeniu glukozy dwutlenek węgla nie może się wydzielać',
        ],
        correctIndex: 0,
        explanation: 'Enzymy drożdży były już wysycone substratem, więc dalszy wzrost stężenia glukozy nie przyspieszał fermentacji.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k2_dro_3',
        prompt: 'Prawda czy fałsz: niewielka ilość CO2 w kolbie B może pochodzić z rozkładu substancji zapasowych zgromadzonych w komórkach drożdży.',
        options: ['Prawda', 'Fałsz'],
        correctIndex: 0,
        explanation: 'Drożdże magazynują glikogen, który mogą rozkładać, nawet gdy w roztworze nie ma glukozy.',
      ),
    ],
  ),
  DataTask(
    id: 'dt_k2_transpiracja',
    title: 'Czynniki wpływające na transpirację',
    topicId: 'k2_rosliny_woda',
    intro:
        'Jednakowe pędy rośliny umieszczono w cylindrach z wodą, której powierzchnię pokryto olejem. Po 3 godzinach odczytano ubytek wody w każdym zestawie. Zestawy różniły się tylko jednym warunkiem.',
    caption: 'Ubytek wody z cylindrów po 3 godzinach.',
    visual: BarChartVisual(
      yLabel: 'Ubytek wody [cm³]',
      maxY: 4,
      yInterval: 1,
      bars: [
        BarItem(label: 'A', description: 'próba kontrolna — światło, 22°C, bez wiatru', value: 2.0),
        BarItem(label: 'B', description: 'jak A, ale ruch powietrza (wentylator)', value: 3.6),
        BarItem(label: 'C', description: 'jak A, ale wysoka wilgotność powietrza', value: 0.8),
        BarItem(label: 'D', description: 'jak A, ale ciemność', value: 0.6),
        BarItem(label: 'E', description: 'jak A, ale pęd bez liści', value: 0.2),
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k2_tra_1',
        prompt: 'Który czynnik w największym stopniu zwiększył transpirację w porównaniu z próbą kontrolną?',
        options: ['Wysoka wilgotność powietrza', 'Ruch powietrza', 'Brak światła', 'Usunięcie liści'],
        correctIndex: 1,
        explanation: 'Przy wentylatorze ubytek wody wyniósł 3,6 cm³, wobec 2,0 cm³ w próbie kontrolnej.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k2_tra_2',
        prompt: 'Mała utrata wody w ciemności wynika głównie z:',
        options: [
          'Zamknięcia aparatów szparkowych',
          'Zaniku kutykuli na liściach',
          'Wzrostu parcia korzeniowego',
          'Rozkładu chlorofilu w liściach',
        ],
        correctIndex: 0,
        explanation: 'W ciemności aparaty szparkowe się zamykają, a transpiracja szparkowa jest główną drogą utraty wody.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k2_tra_3',
        prompt: 'Prawda czy fałsz: wynik zestawu E wskazuje, że woda paruje z pędu głównie przez liście.',
        options: ['Prawda', 'Fałsz'],
        correctIndex: 0,
        explanation: 'Pęd bez liści stracił tylko 0,2 cm³ wody, dziesięć razy mniej niż pęd ulistniony.',
      ),
    ],
  ),
  DataTask(
    id: 'dt_k2_fotosynteza',
    title: 'Światło i dwutlenek węgla a fotosynteza',
    topicId: 'k2_rosliny_odzywianie',
    intro:
        'Mierzono intensywność fotosyntezy netto (wydzielanie tlenu pomniejszone o tlen zużyty w oddychaniu) liści rośliny przy różnym natężeniu światła i dwóch stężeniach CO2 w powietrzu. Temperatura we wszystkich próbach wynosiła 25°C.',
    caption: 'Intensywność fotosyntezy netto w zależności od natężenia światła.',
    visual: LineChartVisual(
      xLabel: 'Natężenie światła [klx]',
      yLabel: 'Fotosynteza netto [jednostki względne]',
      minX: 0,
      maxX: 10,
      minY: -4,
      maxY: 20,
      xInterval: 2,
      yInterval: 4,
      series: [
        LineSeries(name: '0,04% CO2', points: [
          ChartPoint(0, -2), ChartPoint(1, 2), ChartPoint(2, 5), ChartPoint(3, 7),
          ChartPoint(4, 8), ChartPoint(6, 8.5), ChartPoint(8, 8.5), ChartPoint(10, 8.5),
        ]),
        LineSeries(name: '0,1% CO2', points: [
          ChartPoint(0, -2), ChartPoint(1, 3), ChartPoint(2, 7), ChartPoint(3, 10),
          ChartPoint(4, 12.5), ChartPoint(6, 15), ChartPoint(8, 16), ChartPoint(10, 16),
        ]),
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k2_fot_1',
        prompt: 'Przy stężeniu CO2 0,04% i natężeniu światła 8 klx czynnikiem ograniczającym fotosyntezę jest:',
        options: ['Natężenie światła', 'Stężenie CO2', 'Temperatura', 'Brak wody w liściach'],
        correctIndex: 1,
        explanation: 'Przy 0,04% CO2 krzywa wypłaszcza się, a przy 0,1% CO2 i tym samym świetle fotosynteza jest wyraźnie intensywniejsza.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k2_fot_2',
        prompt: 'Przy natężeniu światła 0 klx fotosynteza netto ma wartość ujemną, ponieważ:',
        options: [
          'Roślina tylko oddycha, zużywając tlen',
          'Chlorofil ulega w ciemności rozkładowi',
          'Aparaty szparkowe są wtedy szeroko otwarte',
          'Stężenie CO2 w liściu spada do zera',
        ],
        correctIndex: 0,
        explanation: 'Bez światła fotosynteza nie zachodzi, a oddychanie trwa — bilans wymiany tlenu jest ujemny.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k2_fot_3',
        prompt: 'Prawda czy fałsz: przy natężeniu światła 2 klx zwiększenie stężenia CO2 z 0,04% do 0,1% zwiększyło intensywność fotosyntezy netto.',
        options: ['Prawda', 'Fałsz'],
        correctIndex: 0,
        explanation: 'Przy 2 klx intensywność wzrosła z 5 do 7 jednostek.',
      ),
    ],
  ),
  DataTask(
    id: 'dt_k2_kielkowanie',
    title: 'Warunki kiełkowania nasion',
    topicId: 'k2_rosliny_wzrost',
    intro:
        'Na ligninie w czterech zestawach umieszczono po 50 nasion tego samego gatunku. Po 5 dniach policzono nasiona, które skiełkowały.',
    caption: 'Liczba skiełkowanych nasion (na 50) w poszczególnych zestawach.',
    visual: TableVisual(
      headers: ['Zestaw', 'Warunki', 'Skiełkowane nasiona'],
      rows: [
        ['A', 'wilgotna lignina, 22°C, światło', '46'],
        ['B', 'sucha lignina, 22°C, światło', '0'],
        ['C', 'wilgotna lignina, 4°C, światło', '3'],
        ['D', 'wilgotna lignina, 22°C, ciemność', '45'],
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k2_kie_1',
        prompt: 'Porównanie zestawów A i D pozwala określić wpływ na kiełkowanie:',
        options: ['Wody', 'Temperatury', 'Światła', 'Rodzaju podłoża'],
        correctIndex: 2,
        explanation: 'Zestawy A i D różnią się tylko dostępem do światła.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k2_kie_2',
        prompt: 'Prawda czy fałsz: wyniki wskazują, że nasiona badanego gatunku wymagają światła do kiełkowania.',
        options: ['Prawda', 'Fałsz'],
        correctIndex: 1,
        explanation: 'W ciemności skiełkowało 45 nasion, prawie tyle samo co na świetle (46).',
      ),
      DataTaskQuestion(
        id: 'q_dt_k2_kie_3',
        prompt: 'Poprawnym wnioskiem z porównania zestawów A i C jest:',
        options: [
          'Niska temperatura hamuje kiełkowanie nasion',
          'Nasiona kiełkują wyłącznie w ciemności',
          'Woda nie jest potrzebna do kiełkowania',
          'Temperatura nie wpływa na kiełkowanie',
        ],
        correctIndex: 0,
        explanation: 'W 4°C skiełkowały tylko 3 nasiona, a w 22°C — 46.',
      ),
    ],
  ),

  // ===========================================================================
  // KLASA 3
  // ===========================================================================
  DataTask(
    id: 'dt_k3_enzymy_ph',
    title: 'Aktywność enzymów trawiennych a pH',
    topicId: 'k3_odzywianie_uklad',
    intro: 'Zbadano aktywność pepsyny i trypsyny w roztworach o różnym pH. Aktywność wyrażono w procentach aktywności maksymalnej każdego enzymu.',
    caption: 'Względna aktywność pepsyny i trypsyny w zależności od pH.',
    visual: LineChartVisual(
      xLabel: 'pH',
      yLabel: 'Aktywność względna [%]',
      minX: 1,
      maxX: 10,
      minY: 0,
      maxY: 100,
      xInterval: 1,
      yInterval: 20,
      series: [
        LineSeries(name: 'Pepsyna', points: [
          ChartPoint(1, 60), ChartPoint(2, 100), ChartPoint(3, 80), ChartPoint(4, 45), ChartPoint(5, 15),
          ChartPoint(6, 2), ChartPoint(7, 0), ChartPoint(8, 0), ChartPoint(9, 0), ChartPoint(10, 0),
        ]),
        LineSeries(name: 'Trypsyna', points: [
          ChartPoint(1, 0), ChartPoint(2, 0), ChartPoint(3, 0), ChartPoint(4, 5), ChartPoint(5, 20),
          ChartPoint(6, 55), ChartPoint(7, 85), ChartPoint(8, 100), ChartPoint(9, 80), ChartPoint(10, 45),
        ]),
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k3_ph_1',
        prompt: 'Optymalne pH dla trypsyny wynosi około:',
        options: ['2', '5', '8', '10'],
        correctIndex: 2,
        explanation: 'Trypsyna osiąga 100% aktywności przy pH 8, co odpowiada środowisku dwunastnicy.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k3_ph_2',
        prompt: 'Pepsyna przestaje działać, gdy treść pokarmowa trafia do dwunastnicy, ponieważ:',
        options: [
          'Wodorowęglany soku trzustkowego podnoszą pH, a powyżej pH 6 pepsyna jest praktycznie nieaktywna',
          'Żółć rozkłada cząsteczki pepsyny do aminokwasów, zanim zdążą zadziałać',
          'W dwunastnicy nie ma już białek, które pepsyna mogłaby rozkładać',
          'Trypsyna działa na pepsynę jak inhibitor kompetycyjny w centrum aktywnym',
        ],
        correctIndex: 0,
        explanation: 'Wykres pokazuje, że przy pH 6 aktywność pepsyny spada do 2%, a przy pH 7 do zera.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k3_ph_3',
        prompt: 'Prawda czy fałsz: przy pH 4 oba enzymy mają aktywność większą niż 40%.',
        options: ['Prawda', 'Fałsz'],
        correctIndex: 1,
        explanation: 'Przy pH 4 pepsyna ma 45% aktywności, ale trypsyna tylko 5%.',
      ),
    ],
  ),
  DataTask(
    id: 'dt_k3_hemoglobina',
    title: 'Wysycenie hemoglobiny tlenem',
    topicId: 'k3_oddychanie_czlowiek',
    intro:
        'Wykres przedstawia stopień wysycenia hemoglobiny tlenem w zależności od ciśnienia parcjalnego tlenu, zmierzony przy dwóch wartościach pH krwi.',
    caption: 'Krzywe wysycenia hemoglobiny tlenem przy pH 7,4 i pH 7,2.',
    visual: LineChartVisual(
      xLabel: 'Ciśnienie parcjalne tlenu [mm Hg]',
      yLabel: 'Wysycenie hemoglobiny [%]',
      minX: 0,
      maxX: 100,
      minY: 0,
      maxY: 100,
      xInterval: 20,
      yInterval: 20,
      series: [
        LineSeries(name: 'pH 7,4', points: [
          ChartPoint(0, 0), ChartPoint(10, 13), ChartPoint(20, 35), ChartPoint(30, 57),
          ChartPoint(40, 75), ChartPoint(60, 89), ChartPoint(80, 95), ChartPoint(100, 97),
        ]),
        LineSeries(name: 'pH 7,2', points: [
          ChartPoint(0, 0), ChartPoint(10, 8), ChartPoint(20, 24), ChartPoint(30, 43),
          ChartPoint(40, 61), ChartPoint(60, 80), ChartPoint(80, 90), ChartPoint(100, 94),
        ]),
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k3_hb_1',
        prompt: 'Przy ciśnieniu parcjalnym tlenu 40 mm Hg wysycenie hemoglobiny przy pH 7,2 jest niższe niż przy pH 7,4 o około:',
        options: ['4 punkty procentowe', '14 punktów procentowych', '40 punktów procentowych', '61 punktów procentowych'],
        correctIndex: 1,
        explanation: 'Przy 40 mm Hg wysycenie wynosi 75% przy pH 7,4 i 61% przy pH 7,2 — różnica to 14 punktów.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k3_hb_2',
        prompt: 'Przesunięcie krzywej wysycenia przy obniżonym pH ma znaczenie przede wszystkim w:',
        options: [
          'Pracujących mięśniach — hemoglobina łatwiej oddaje im tlen',
          'Pęcherzykach płucnych — hemoglobina silniej wiąże tam tlen',
          'Łożysku — hemoglobina płodu oddaje tlen krwi matki',
          'Śledzionie — erytrocyty rozpadają się wtedy szybciej',
        ],
        correctIndex: 0,
        explanation: 'W intensywnie pracujących mięśniach powstaje CO2 i kwas mlekowy, więc pH spada, a hemoglobina oddaje więcej tlenu.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k3_hb_3',
        prompt: 'Prawda czy fałsz: przy ciśnieniu parcjalnym tlenu 100 mm Hg, zbliżonym do panującego w pęcherzykach płucnych, zmiana pH niewiele zmienia wysycenie hemoglobiny.',
        options: ['Prawda', 'Fałsz'],
        correctIndex: 0,
        explanation: 'Przy 100 mm Hg wysycenie wynosi 97% i 94% — różnica jest niewielka, więc krew w płucach wysyca się prawie całkowicie.',
      ),
    ],
  ),
  DataTask(
    id: 'dt_k3_glukoza',
    title: 'Doustny test obciążenia glukozą',
    topicId: 'k3_hormony_regulacja',
    intro:
        'Dwie osoby wypiły na czczo roztwór zawierający 75 g glukozy. Przez 2 godziny co 30 minut mierzono stężenie glukozy we krwi. Jedna z osób jest zdrowa, a druga choruje na nieleczoną cukrzycę.',
    caption: 'Stężenie glukozy we krwi po wypiciu roztworu glukozy.',
    visual: LineChartVisual(
      xLabel: 'Czas od wypicia roztworu [min]',
      yLabel: 'Stężenie glukozy [mg/dl]',
      minX: 0,
      maxX: 120,
      minY: 0,
      maxY: 320,
      xInterval: 30,
      yInterval: 40,
      series: [
        LineSeries(name: 'Osoba zdrowa', points: [
          ChartPoint(0, 85), ChartPoint(30, 140), ChartPoint(60, 120), ChartPoint(90, 100), ChartPoint(120, 90),
        ]),
        LineSeries(name: 'Osoba z cukrzycą', points: [
          ChartPoint(0, 160), ChartPoint(30, 250), ChartPoint(60, 290), ChartPoint(90, 300), ChartPoint(120, 280),
        ]),
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k3_glu_1',
        prompt: 'Po 2 godzinach stężenie glukozy wróciło do wartości zbliżonej do wyjściowej u:',
        options: ['Osoby zdrowej', 'Osoby z cukrzycą', 'Obu osób', 'Żadnej z tych osób'],
        correctIndex: 0,
        explanation: 'U osoby zdrowej stężenie spadło do 90 mg/dl (wyjściowo 85), a u chorej wynosiło 280 mg/dl.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k3_glu_2',
        prompt: 'Spadek stężenia glukozy u osoby zdrowej po 30. minucie jest przede wszystkim skutkiem działania:',
        options: ['Glukagonu', 'Insuliny', 'Adrenaliny', 'Kortyzolu'],
        correctIndex: 1,
        explanation: 'Insulina ułatwia pobieranie glukozy przez komórki i jej magazynowanie w postaci glikogenu.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k3_glu_3',
        prompt: 'Prawda czy fałsz: u osoby z cukrzycą stężenie glukozy na czczo (w chwili 0 min) przekracza wartość prawidłową.',
        options: ['Prawda', 'Fałsz'],
        correctIndex: 0,
        explanation: 'Wynosi 160 mg/dl, a prawidłowe stężenie glukozy na czczo jest niższe niż 100 mg/dl.',
      ),
    ],
  ),
  DataTask(
    id: 'dt_k3_mocz',
    title: 'Skład osocza i moczu',
    topicId: 'k3_wydalanie_czlowiek',
    intro: 'W tabeli przedstawiono średnie stężenie wybranych substancji w osoczu krwi, moczu pierwotnym i moczu ostatecznym zdrowego człowieka.',
    caption: 'Stężenie substancji [g/100 cm³].',
    visual: TableVisual(
      headers: ['Substancja', 'Osocze', 'Mocz pierwotny', 'Mocz ostateczny'],
      rows: [
        ['Białka', '7,5', '0,02', '0'],
        ['Glukoza', '0,1', '0,1', '0'],
        ['Mocznik', '0,03', '0,03', '2,0'],
        ['Jony sodu', '0,32', '0,32', '0,35'],
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k3_moc_1',
        prompt: 'Prawie całkowity brak białek w moczu pierwotnym wynika z tego, że:',
        options: [
          'Białka są zbyt duże, by przejść przez filtr w ciałku nerkowym',
          'Białka są w całości wchłaniane zwrotnie w pętli nefronu',
          'Białka są rozkładane przez enzymy w miedniczce nerkowej',
          'Białka są wydzielane z powrotem do krwi w kanaliku zbiorczym',
        ],
        correctIndex: 0,
        explanation: 'Mocz pierwotny powstaje w wyniku filtracji, a duże cząsteczki białek nie przechodzą przez ściany kłębuszka.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k3_moc_2',
        prompt: 'Stężenie mocznika w moczu ostatecznym jest około 67 razy wyższe niż w moczu pierwotnym, ponieważ:',
        options: [
          'Większość wody wraca do krwi, a mocznik w dużej części zostaje w kanaliku',
          'Mocznik jest wytwarzany w komórkach kanalików nerkowych',
          'Mocznik jest wchłaniany zwrotnie szybciej niż woda',
          'W nerkach glukoza jest przekształcana w mocznik',
        ],
        correctIndex: 0,
        explanation: 'Resorpcja zwrotna odzyskuje około 99% wody, więc pozostające w moczu substancje ulegają zagęszczeniu (2,0 : 0,03 ≈ 67).',
      ),
      DataTaskQuestion(
        id: 'q_dt_k3_moc_3',
        prompt: 'Prawda czy fałsz: obecność glukozy w moczu ostatecznym zdrowej osoby byłaby zgodna z danymi z tabeli.',
        options: ['Prawda', 'Fałsz'],
        correctIndex: 1,
        explanation: 'Stężenie glukozy w moczu ostatecznym wynosi 0 — u zdrowej osoby cała glukoza wraca do krwi.',
      ),
    ],
  ),

  // ===========================================================================
  // KLASA 4
  // ===========================================================================
  DataTask(
    id: 'dt_k4_rodowod',
    title: 'Analiza rodowodu',
    topicId: 'k4_dziedziczenie_plec',
    intro:
        'Rodowód przedstawia występowanie rzadkiej choroby genetycznej w trzech pokoleniach rodziny. Osoba II-1 pochodzi spoza rodziny i nie ma w rodzinie przypadków tej choroby.',
    caption: 'Rodowód rodziny. Symbole zaczernione oznaczają osoby chore.',
    visual: PedigreeVisual(
      slots: 4,
      people: [
        PedigreePerson(id: 'I-1', generation: 0, slot: 1, male: true, affected: true),
        PedigreePerson(id: 'I-2', generation: 0, slot: 2, male: false, affected: false),
        PedigreePerson(id: 'II-1', generation: 1, slot: 0, male: true, affected: false),
        PedigreePerson(id: 'II-2', generation: 1, slot: 1, male: false, affected: false),
        PedigreePerson(id: 'II-3', generation: 1, slot: 3, male: true, affected: false),
        PedigreePerson(id: 'III-1', generation: 2, slot: 0, male: true, affected: true),
        PedigreePerson(id: 'III-2', generation: 2, slot: 1, male: false, affected: false),
        PedigreePerson(id: 'III-3', generation: 2, slot: 2, male: true, affected: false),
      ],
      families: [
        PedigreeFamily(parentA: 'I-1', parentB: 'I-2', children: ['II-2', 'II-3']),
        PedigreeFamily(parentA: 'II-1', parentB: 'II-2', children: ['III-1', 'III-2', 'III-3']),
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k4_rod_1',
        prompt: 'Spośród wymienionych sposobów dziedziczenia z rodowodem zgodny jest tylko sposób:',
        options: ['Autosomalny dominujący', 'Recesywny sprzężony z chromosomem X', 'Dominujący sprzężony z chromosomem X', 'Sprzężony z chromosomem Y'],
        correctIndex: 1,
        explanation:
            'Zdrowi rodzice II-1 i II-2 mają chorego syna, więc cecha jest recesywna. Przy dziedziczeniu związanym z Y chorowałby syn II-3 chorego ojca, a przy dominującym sprzężonym z X — jego córka II-2.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k4_rod_2',
        prompt: 'Genotyp osoby II-2 (allel choroby oznaczono jako Xh) to:',
        options: ['XH XH', 'XH Xh', 'Xh Xh', 'XH Y'],
        correctIndex: 1,
        explanation: 'II-2 jest zdrowa, ale od chorego ojca otrzymała chromosom X z allelem h — jest nosicielką.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k4_rod_3',
        prompt: 'Prawdopodobieństwo, że kolejny syn pary II-1 i II-2 będzie chory, wynosi:',
        options: ['0%', '25%', '50%', '100%'],
        correctIndex: 2,
        explanation: 'Syn otrzymuje chromosom X od matki nosicielki — z allelem h z prawdopodobieństwem 1/2.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k4_rod_4',
        prompt: 'Prawdopodobieństwo, że osoba III-2 jest nosicielką allelu choroby, wynosi:',
        options: ['0%', '25%', '50%', '100%'],
        correctIndex: 2,
        explanation: 'Od zdrowego ojca dostała XH, a od matki nosicielki XH albo Xh — z prawdopodobieństwem 1/2.',
      ),
    ],
  ),
  DataTask(
    id: 'dt_k4_hardy',
    title: 'Częstość alleli w populacji',
    topicId: 'k4_ewolucja_populacje',
    intro:
        'W izolowanej populacji liczącej 1000 osobników zbadano fenotyp warunkowany jednym genem o dwóch allelach: dominującym A i recesywnym a. Przyjmij, że populacja jest w stanie równowagi Hardy\'ego–Weinberga.',
    caption: 'Liczba osobników o poszczególnych fenotypach.',
    visual: TableVisual(
      headers: ['Fenotyp', 'Liczba osobników'],
      rows: [
        ['Dominujący (AA lub Aa)', '910'],
        ['Recesywny (aa)', '90'],
        ['Razem', '1000'],
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k4_hw_1',
        prompt: 'Częstość allelu a w tej populacji wynosi:',
        options: ['0,09', '0,3', '0,7', '0,91'],
        correctIndex: 1,
        explanation: 'q² = 90/1000 = 0,09, więc q = √0,09 = 0,3.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k4_hw_2',
        prompt: 'Oczekiwana liczba heterozygot Aa w tej populacji wynosi:',
        options: ['90', '420', '490', '910'],
        correctIndex: 1,
        explanation: 'p = 0,7, więc 2pq = 2 · 0,7 · 0,3 = 0,42, co w populacji 1000 osobników daje 420 heterozygot.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k4_hw_3',
        prompt: 'Przyjęcie, że populacja jest w stanie równowagi Hardy\'ego–Weinberga, oznacza m.in., że:',
        options: [
          'Osobniki kojarzą się losowo i nie działa dobór naturalny',
          'Na populację działa silny dobór naturalny',
          'Populacja jest bardzo mała i podlega dryfowi',
          'W populacji często zachodzą nowe mutacje',
        ],
        correctIndex: 0,
        explanation: 'Równowaga zakłada dużą populację, losowe kojarzenie oraz brak doboru, mutacji i migracji.',
      ),
    ],
  ),
  DataTask(
    id: 'dt_k4_elektroforeza',
    title: 'Ustalanie ojcostwa na podstawie DNA',
    topicId: 'k4_biotech_techniki',
    intro:
        'Wybrane fragmenty DNA matki, dziecka i dwóch mężczyzn powielono, rozdzielono w żelu metodą elektroforezy i uwidoczniono. Każdy prążek odpowiada fragmentowi DNA o podanej długości (w parach zasad, pz).',
    caption: 'Schemat wyniku elektroforezy. Studzienki z próbkami znajdują się u góry żelu.',
    visual: GelVisual(
      lanes: [
        GelLane(label: 'Matka', bands: [1200, 700, 400]),
        GelLane(label: 'Dziecko', bands: [1200, 900, 400, 200]),
        GelLane(label: 'Mężczyzna A', bands: [900, 550, 200]),
        GelLane(label: 'Mężczyzna B', bands: [1000, 700, 300]),
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k4_gel_1',
        prompt: 'Biologicznym ojcem dziecka może być:',
        options: ['Mężczyzna A', 'Mężczyzna B', 'Każdy z mężczyzn', 'Żaden z mężczyzn'],
        correctIndex: 0,
        explanation: 'Prążki 1200 i 400 pz dziecko ma po matce, a 900 i 200 pz — tylko mężczyzna A ma oba te prążki.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k4_gel_2',
        prompt: 'Fragmenty o długości 200 pz przemieściły się w żelu najdalej od studzienek, ponieważ:',
        options: [
          'Są najkrótsze, więc najłatwiej przechodzą przez pory żelu',
          'Mają ładunek dodatni i są przyciągane przez katodę',
          'Są najdłuższe i przez to najcięższe',
          'Zawierają najwięcej par zasad G–C',
        ],
        correctIndex: 0,
        explanation: 'DNA ma ładunek ujemny i wędruje do anody, a krótsze fragmenty przemieszczają się szybciej.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k4_gel_3',
        prompt: 'Aby uzyskać wystarczającą ilość DNA z niewielkiej próbki, badane fragmenty powielono metodą:',
        options: ['PCR', 'Hybrydyzacji DNA', 'Sekwencjonowania Sangera', 'Odwrotnej transkrypcji'],
        correctIndex: 0,
        explanation: 'Łańcuchowa reakcja polimerazy pozwala powielić wybrany fragment DNA w milionach kopii.',
      ),
    ],
  ),
  DataTask(
    id: 'dt_k4_wzrost_populacji',
    title: 'Wzrost liczebności populacji',
    topicId: 'k4_ekologia_populacje',
    intro:
        'Do naczynia z pożywką wprowadzono pantofelki i przez 14 dni co 2 dni określano ich zagęszczenie. Pożywki nie uzupełniano.',
    caption: 'Zagęszczenie populacji pantofelka w kolejnych dniach hodowli.',
    visual: LineChartVisual(
      xLabel: 'Czas hodowli [dni]',
      yLabel: 'Zagęszczenie [osobniki/cm³]',
      minX: 0,
      maxX: 14,
      minY: 0,
      maxY: 600,
      xInterval: 2,
      yInterval: 100,
      series: [
        LineSeries(name: 'Pantofelek', points: [
          ChartPoint(0, 10), ChartPoint(2, 28), ChartPoint(4, 80), ChartPoint(6, 210),
          ChartPoint(8, 390), ChartPoint(10, 500), ChartPoint(12, 540), ChartPoint(14, 550),
        ]),
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k4_pop_1',
        prompt: 'Pojemność środowiska dla tej populacji wynosi około:',
        options: ['210 osobników/cm³', '390 osobników/cm³', '550 osobników/cm³', '1000 osobników/cm³'],
        correctIndex: 2,
        explanation: 'Liczebność stabilizuje się na poziomie około 550 osobników/cm³.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k4_pop_2',
        prompt: 'Zagęszczenie populacji wzrosło najbardziej między dniami:',
        options: ['0–2', '4–6', '6–8', '10–12'],
        correctIndex: 2,
        explanation: 'Między 6. a 8. dniem przybyło 180 osobników/cm³ — więcej niż w pozostałych przedziałach.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k4_pop_3',
        prompt: 'Zahamowanie wzrostu liczebności po 10. dniu jest przede wszystkim skutkiem:',
        options: [
          'Wyczerpywania się zasobów i konkurencji wewnątrzgatunkowej',
          'Całkowitego braku rozrodu w populacji',
          'Migracji pantofelków do innego naczynia',
          'Pojawienia się w hodowli drapieżników',
        ],
        correctIndex: 0,
        explanation: 'Pożywki nie uzupełniano, więc przy dużym zagęszczeniu nasila się konkurencja o ograniczone zasoby.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k4_pop_4',
        prompt: 'Prawda czy fałsz: wzrost liczebności tej populacji ma przebieg logistyczny.',
        options: ['Prawda', 'Fałsz'],
        correctIndex: 0,
        explanation: 'Krzywa ma kształt litery S — po okresie szybkiego wzrostu liczebność stabilizuje się.',
      ),
    ],
  ),
  DataTask(
    id: 'dt_k4_drapieznik',
    title: 'Zmiany liczebności drapieżnika i ofiary',
    topicId: 'k4_ekologia_zaleznosci',
    intro: 'Wykres przedstawia zmiany liczebności zająca i polującego na niego rysia na tym samym obszarze w ciągu 20 lat.',
    caption: 'Liczebność zająca i rysia w kolejnych latach (tys. osobników).',
    visual: LineChartVisual(
      xLabel: 'Rok obserwacji',
      yLabel: 'Liczebność [tys. osobników]',
      minX: 0,
      maxX: 20,
      minY: 0,
      maxY: 100,
      xInterval: 2,
      yInterval: 20,
      series: [
        LineSeries(name: 'Zając', points: [
          ChartPoint(0, 20), ChartPoint(2, 60), ChartPoint(4, 90), ChartPoint(6, 40), ChartPoint(8, 15), ChartPoint(10, 25),
          ChartPoint(12, 70), ChartPoint(14, 95), ChartPoint(16, 45), ChartPoint(18, 15), ChartPoint(20, 30),
        ]),
        LineSeries(name: 'Ryś', points: [
          ChartPoint(0, 4), ChartPoint(2, 6), ChartPoint(4, 12), ChartPoint(6, 16), ChartPoint(8, 9), ChartPoint(10, 4),
          ChartPoint(12, 6), ChartPoint(14, 12), ChartPoint(16, 17), ChartPoint(18, 9), ChartPoint(20, 5),
        ]),
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k4_drap_1',
        prompt: 'Maksima liczebności rysia występują w porównaniu z maksimami liczebności zająca:',
        options: ['Z opóźnieniem około 2 lat', 'Około 2 lata wcześniej', 'W tych samych latach', 'Bez związku czasowego'],
        correctIndex: 0,
        explanation: 'Zając osiąga maksimum w 4. i 14. roku, a ryś — w 6. i 16. roku.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k4_drap_2',
        prompt: 'Spadek liczebności zająca między 4. a 8. rokiem był spowodowany m.in.:',
        options: [
          'Dużą liczebnością rysi',
          'Małą liczebnością rysi',
          'Brakiem konkurencji o pokarm',
          'Wzrostem rozrodczości zajęcy',
        ],
        correctIndex: 0,
        explanation: 'W tym okresie liczebność rysi osiągała najwyższe wartości (12–16 tys.), więc presja drapieżników była największa.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k4_drap_3',
        prompt: 'Prawda czy fałsz: na podstawie wykresu jeden cykl zmian liczebności zająca trwa około 10 lat.',
        options: ['Prawda', 'Fałsz'],
        correctIndex: 0,
        explanation: 'Kolejne maksima liczebności zająca przypadają na 4. i 14. rok.',
      ),
    ],
  ),
  DataTask(
    id: 'dt_k4_energia',
    title: 'Przepływ energii w ekosystemie',
    topicId: 'k4_ekologia_ekosystem',
    intro: 'W tabeli przedstawiono ilość energii zawartej w biomasie kolejnych poziomów troficznych pewnego ekosystemu.',
    caption: 'Energia zawarta w biomasie poziomów troficznych [kJ/m² na rok].',
    visual: TableVisual(
      headers: ['Poziom troficzny', 'Energia [kJ/m²/rok]'],
      rows: [
        ['Producenci', '20 000'],
        ['Konsumenci I rzędu', '2 000'],
        ['Konsumenci II rzędu', '180'],
        ['Konsumenci III rzędu', '15'],
      ],
    ),
    questions: [
      DataTaskQuestion(
        id: 'q_dt_k4_en_1',
        prompt: 'Efektywność przepływu energii od konsumentów I rzędu do konsumentów II rzędu wynosi:',
        options: ['0,9%', '9%', '10%', '90%'],
        correctIndex: 1,
        explanation: '180 : 2000 · 100% = 9%.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k4_en_2',
        prompt: 'Na kolejnych poziomach troficznych energii jest coraz mniej głównie dlatego, że:',
        options: [
          'Organizmy zużywają energię w oddychaniu i jest ona rozpraszana jako ciepło',
          'Energia przekształca się w związki nieorganiczne w glebie',
          'Destruenci pobierają energię bezpośrednio od producentów',
          'Energia wraca od konsumentów do producentów',
        ],
        correctIndex: 0,
        explanation: 'Energia przepływa jednokierunkowo; większość jest zużywana na procesy życiowe i tracona jako ciepło.',
      ),
      DataTaskQuestion(
        id: 'q_dt_k4_en_3',
        prompt: 'Prawda czy fałsz: na podstawie danych z tabeli można narysować piramidę energii o szerokiej podstawie, zwężającą się ku górze.',
        options: ['Prawda', 'Fałsz'],
        correctIndex: 0,
        explanation: 'Ilość energii maleje na każdym kolejnym poziomie troficznym — od 20 000 do 15 kJ/m²/rok.',
      ),
    ],
  ),
];

DataTask? dataTaskById(String id) {
  for (final t in dataTasks) {
    if (t.id == id) return t;
  }
  return null;
}
