import '../models.dart';

final List<ClassData> biologyData = [
  ClassData(
    level: 1,
    label: 'Kl. 1',
    chapters: [
      Chapter(
        id: 'k1_chemizm',
        name: 'Chemizm życia',
        topics: [
          Topic(
            id: 'k1_chemizm_skladniki',
            name: 'Składniki chemiczne organizmów',
            theory: '''
Organizmy zbudowane są ze związków nieorganicznych i organicznych.

WODA
Stanowi 60-70% masy ciała człowieka. Jest rozpuszczalnikiem, środowiskiem reakcji biochemicznych, bierze udział w termoregulacji (wysokie ciepło parowania) i transportuje substancje w organizmie. Cząsteczka wody jest polarna, co umożliwia tworzenie wiązań wodorowych.

SOLE MINERALNE
Występują w postaci zjonizowanej (Na+, K+, Ca2+, Cl-) lub jako sole nierozpuszczalne (budują kości, muszle). Odpowiadają za ciśnienie osmotyczne, przewodnictwo nerwowe i budowę tkanki kostnej.

BIAŁKA
Zbudowane z aminokwasów połączonych wiązaniami peptydowymi. Pełnią funkcje: budulcową (kolagen), enzymatyczną (katalizują reakcje), transportową (hemoglobina), odpornościową (przeciwciała) i regulacyjną (hormony białkowe, np. insulina).

WĘGLOWODANY (CUKRY)
Dzielą się na proste (glukoza, fruktoza), dwucukry (sacharoza) i wielocukry (skrobia, glikogen, celuloza). Główna funkcja to dostarczanie energii oraz budulec (celuloza w ścianach komórkowych roślin).

TŁUSZCZE (LIPIDY)
Magazynują energię (2x więcej niż węglowodany), budują błony komórkowe (fosfolipidy) i izolują termicznie. Dzielą się na nasycone i nienasycone w zależności od wiązań w łańcuchach kwasów tłuszczowych.

KWASY NUKLEINOWE
DNA i RNA przechowują i przekazują informację genetyczną. Zbudowane są z nukleotydów (cukier + reszta fosforanowa + zasada azotowa).
''',
            flashcards: [
              Flashcard(id: 'f_k1_1', front: 'Jaki procent masy ciała człowieka stanowi woda?', back: '60-70% masy ciała.'),
              Flashcard(id: 'f_k1_2', front: 'Z czego zbudowane są białka?', back: 'Z aminokwasów połączonych wiązaniami peptydowymi.'),
              Flashcard(id: 'f_k1_3', front: 'Wymień trzy funkcje białek.', back: 'Budulcowa, enzymatyczna, transportowa (także odpornościowa i regulacyjna).'),
              Flashcard(id: 'f_k1_4', front: 'Co to jest glikogen?', back: 'Wielocukier zapasowy magazynowany w wątrobie i mięśniach zwierząt.'),
              Flashcard(id: 'f_k1_5', front: 'Która grupa związków magazynuje najwięcej energii na gram?', back: 'Tłuszcze (lipidy) — ok. 2 razy więcej niż węglowodany.'),
              Flashcard(id: 'f_k1_6', front: 'Z czego zbudowany jest nukleotyd?', back: 'Z cukru, reszty fosforanowej i zasady azotowej.'),
              Flashcard(id: 'f_k1_7', front: 'Jaką funkcję pełni celuloza u roślin?', back: 'Buduje ściany komórkowe (funkcja strukturalna).'),
              Flashcard(id: 'f_k1_8', front: 'Dlaczego woda jest dobrym termoregulatorem?', back: 'Ma wysokie ciepło właściwe i ciepło parowania, więc stabilizuje temperaturę organizmu.'),
            ],
            questions: [
              QuizQuestion(id: 'q_k1_1', question: 'Ile procent masy ciała człowieka stanowi woda?', options: ['20-30%', '40-50%', '60-70%', '90-95%'], correctIndex: 2, explanation: 'Woda stanowi około 60-70% masy ciała dorosłego człowieka.'),
              QuizQuestion(id: 'q_k1_2', question: 'Monomerem białek jest:', options: ['Glukoza', 'Aminokwas', 'Nukleotyd', 'Kwas tłuszczowy'], correctIndex: 1, explanation: 'Białka zbudowane są z aminokwasów połączonych wiązaniami peptydowymi.'),
              QuizQuestion(id: 'q_k1_3', question: 'Który związek pełni funkcję zapasową u zwierząt?', options: ['Celuloza', 'Skrobia', 'Glikogen', 'Chityna'], correctIndex: 2, explanation: 'Glikogen to zapasowy wielocukier magazynowany w wątrobie i mięśniach zwierząt.'),
              QuizQuestion(id: 'q_k1_4', question: 'Fosfolipidy są głównym składnikiem:', options: ['Błon komórkowych', 'Chromosomów', 'Rybosomów', 'Ściany komórkowej roślin'], correctIndex: 0, explanation: 'Dwuwarstwa fosfolipidowa buduje błony komórkowe.'),
              QuizQuestion(id: 'q_k1_5', question: 'Kwasy nukleinowe pełnią funkcję:', options: ['Energetyczną', 'Przechowywania informacji genetycznej', 'Termoregulacyjną', 'Strukturalną w ścianach komórkowych'], correctIndex: 1, explanation: 'DNA i RNA przechowują i przekazują informację genetyczną.'),
              QuizQuestion(id: 'q_k1_6', question: 'Które wiązanie łączy ze sobą aminokwasy w białku?', options: ['Glikozydowe', 'Peptydowe', 'Wodorowe', 'Estrowe'], correctIndex: 1, explanation: 'Aminokwasy łączą się wiązaniami peptydowymi.'),
            ],
          ),
        ],
      ),
      Chapter(
        id: 'k1_komorka',
        name: 'Komórka',
        topics: [
          Topic(
            id: 'k1_komorka_budowa',
            name: 'Budowa i funkcje komórki',
            theory: '''
Komórka to podstawowa jednostka strukturalna i funkcjonalna organizmów.

KOMÓRKA PROKARIOTYCZNA
Nie posiada jądra komórkowego otoczonego błoną — materiał genetyczny znajduje się w nukleoidzie. Charakterystyczna dla bakterii i archeowców. Ma rybosomy, ale nie posiada organelli błoniastych.

KOMÓRKA EUKARIOTYCZNA
Posiada jądro komórkowe oraz organelle błoniaste. Występuje u roślin, zwierząt, grzybów i protistów.

BŁONA KOMÓRKOWA
Zbudowana z dwuwarstwy fosfolipidowej z białkami. Reguluje transport substancji (dyfuzja, transport aktywny, osmoza).

JĄDRO KOMÓRKOWE
Przechowuje DNA w postaci chromatyny, kontroluje procesy komórkowe i syntezę białek poprzez jąderko (produkcja rybosomów).

MITOCHONDRIUM
"Elektrownia komórki" — miejsce oddychania komórkowego i produkcji ATP. Posiada własne DNA (dziedziczenie mitochondrialne po matce).

CHLOROPLAST
Organellum roślinne, miejsce fotosyntezy. Zawiera chlorofil i własne DNA.

APARAT GOLGiEGO I RETIKULUM ENDOPLAZMATYCZNE
ER szorstkie (z rybosomami) syntetyzuje białka, ER gładkie syntetyzuje lipidy. Aparat Golgiego modyfikuje, sortuje i pakuje białka do transportu.

LIZOSOMY
Zawierają enzymy trawienne, rozkładają zużyte organelle i materiał wchłonięty przez komórkę.
''',
            flashcards: [
              Flashcard(id: 'f_k1_9', front: 'Czym różni się komórka prokariotyczna od eukariotycznej?', back: 'Prokariotyczna nie ma jądra komórkowego otoczonego błoną ani organelli błoniastych.'),
              Flashcard(id: 'f_k1_10', front: 'Jaka jest funkcja mitochondrium?', back: 'Produkcja ATP w procesie oddychania komórkowego.'),
              Flashcard(id: 'f_k1_11', front: 'Co znajduje się w chloroplastach?', back: 'Chlorofil i własne DNA — miejsce zachodzenia fotosyntezy.'),
              Flashcard(id: 'f_k1_12', front: 'Jaką funkcję pełnią lizosomy?', back: 'Trawią zużyte organelle i materiał wchłonięty przez komórkę (enzymy trawienne).'),
              Flashcard(id: 'f_k1_13', front: 'Z czego zbudowana jest błona komórkowa?', back: 'Z dwuwarstwy fosfolipidowej z białkami.'),
            ],
            questions: [
              QuizQuestion(id: 'q_k1_7', question: 'Które organellum jest nazywane "elektrownią komórki"?', options: ['Jądro', 'Mitochondrium', 'Aparat Golgiego', 'Lizosom'], correctIndex: 1, explanation: 'Mitochondrium produkuje ATP w procesie oddychania komórkowego.'),
              QuizQuestion(id: 'q_k1_8', question: 'Komórka prokariotyczna NIE posiada:', options: ['Rybosomów', 'Błony komórkowej', 'Jądra komórkowego', 'Cytoplazmy'], correctIndex: 2, explanation: 'Prokariota nie mają jądra otoczonego błoną — materiał genetyczny jest w nukleoidzie.'),
              QuizQuestion(id: 'q_k1_9', question: 'Fotosynteza zachodzi w:', options: ['Mitochondriach', 'Chloroplastach', 'Lizosomach', 'Jądrze'], correctIndex: 1, explanation: 'Chloroplasty zawierają chlorofil i są miejscem fotosyntezy.'),
              QuizQuestion(id: 'q_k1_10', question: 'Za modyfikację i pakowanie białek odpowiada:', options: ['Aparat Golgiego', 'Lizosom', 'Rybosom', 'Wakuola'], correctIndex: 0, explanation: 'Aparat Golgiego modyfikuje, sortuje i pakuje białka do transportu.'),
              QuizQuestion(id: 'q_k1_11', question: 'Retikulum endoplazmatyczne szorstkie zawdzięcza nazwę obecności:', options: ['Chlorofilu', 'Rybosomów', 'Lizosomów', 'DNA'], correctIndex: 1, explanation: 'ER szorstkie ma na powierzchni rybosomy syntetyzujące białka.'),
            ],
          ),
        ],
      ),
    ],
  ),
  ClassData(
    level: 2,
    label: 'Kl. 2',
    chapters: [
      Chapter(
        id: 'k2_genetyka',
        name: 'Genetyka',
        topics: [
          Topic(
            id: 'k2_genetyka_podstawy',
            name: 'Podstawy genetyki klasycznej',
            theory: '''
Genetyka bada dziedziczenie cech.

PODSTAWOWE POJĘCIA
Gen — odcinek DNA kodujący cechę. Allel — wariant genu. Genotyp — zestaw alleli organizmu. Fenotyp — zewnętrzny, obserwowalny wyraz genotypu. Homozygota ma identyczne allele danego genu, heterozygota — różne.

I PRAWO MENDLA (zasada czystości gamet)
Każdy organizm posiada parę alleli danej cechy, a gamety otrzymują tylko jeden allel z pary. Krzyżówka jednogenowa Aa x Aa daje w F2 rozszczepienie fenotypowe 3:1 przy pełnej dominacji.

II PRAWO MENDLA (zasada niezależnej segregacji)
Allele różnych genów (na różnych chromosomach) dziedziczą się niezależnie od siebie. Krzyżówka dwugenowa AaBb x AaBb daje rozszczepienie fenotypowe 9:3:3:1.

DOMINACJA NIEPEŁNA I KODOMINACJA
Przy dominacji niepełnej heterozygota ma fenotyp pośredni (np. kwiaty różowe z czerwonych i białych). Przy kodominacji oba allele ujawniają się jednocześnie (np. grupy krwi AB0 — allel IA i IB są kodominujące wobec siebie, a i0 recesywny).

DZIEDZICZENIE SPRZĘŻONE Z PŁCIĄ
Geny na chromosomie X (np. daltonizm, hemofilia) dziedziczą się inaczej u obu płci — mężczyźni (XY) ujawniają cechę recesywną przy jednej kopii allelu.

MUTACJE
Zmiany w materiale genetycznym. Mogą być genowe (punktowe), chromosomowe (zmiana struktury chromosomu) lub genomowe (zmiana liczby chromosomów, np. trisomia 21 — zespół Downa).
''',
            flashcards: [
              Flashcard(id: 'f_k2_1', front: 'Co to jest genotyp?', back: 'Zestaw wszystkich alleli danego organizmu.'),
              Flashcard(id: 'f_k2_2', front: 'Jakie jest rozszczepienie fenotypowe w F2 dla krzyżówki Aa x Aa?', back: '3:1 przy pełnej dominacji.'),
              Flashcard(id: 'f_k2_3', front: 'Jakie rozszczepienie fenotypowe daje krzyżówka AaBb x AaBb?', back: '9:3:3:1 (II prawo Mendla).'),
              Flashcard(id: 'f_k2_4', front: 'Czym jest kodominacja?', back: 'Zjawiskiem, gdy oba allele ujawniają się jednocześnie w fenotypie (np. grupa krwi AB).'),
              Flashcard(id: 'f_k2_5', front: 'Dlaczego mężczyźni częściej chorują na daltonizm?', back: 'Gen jest na chromosomie X, a mężczyźni mają tylko jedną kopię (XY), więc allel recesywny się ujawnia.'),
              Flashcard(id: 'f_k2_6', front: 'Co to jest trisomia 21?', back: 'Mutacja genomowa — obecność dodatkowego chromosomu 21, powodująca zespół Downa.'),
              Flashcard(id: 'f_k2_7', front: 'Czym różni się homozygota od heterozygoty?', back: 'Homozygota ma dwa identyczne allele danego genu, heterozygota — dwa różne.'),
              Flashcard(id: 'f_k2_8', front: 'Na czym polega dominacja niepełna?', back: 'Heterozygota ma fenotyp pośredni między dwoma homozygotami.'),
            ],
            questions: [
              QuizQuestion(id: 'q_k2_1', question: 'Krzyżówka Aa x Aa (pełna dominacja) daje w F2 rozszczepienie fenotypowe:', options: ['1:1', '3:1', '9:3:3:1', '1:2:1'], correctIndex: 1, explanation: 'Zgodnie z I prawem Mendla otrzymujemy 3:1.'),
              QuizQuestion(id: 'q_k2_2', question: 'Grupy krwi AB0 są przykładem:', options: ['Dominacji niepełnej', 'Kodominacji', 'Sprzężenia z płcią', 'Mutacji genomowej'], correctIndex: 1, explanation: 'Allele IA i IB są względem siebie kodominujące.'),
              QuizQuestion(id: 'q_k2_3', question: 'Zespół Downa jest wynikiem:', options: ['Mutacji genowej', 'Mutacji chromosomowej strukturalnej', 'Mutacji genomowej (trisomia 21)', 'Dziedziczenia sprzężonego z płcią'], correctIndex: 2, explanation: 'To dodatkowy chromosom 21 — mutacja genomowa liczbowa.'),
              QuizQuestion(id: 'q_k2_4', question: 'II prawo Mendla dotyczy:', options: ['Czystości gamet', 'Niezależnej segregacji genów', 'Sprzężenia genów', 'Kodominacji'], correctIndex: 1, explanation: 'Mówi o niezależnym dziedziczeniu alleli różnych genów.'),
              QuizQuestion(id: 'q_k2_5', question: 'Daltonizm jest cechą:', options: ['Autosomalną dominującą', 'Sprzężoną z chromosomem X, recesywną', 'Mitochondrialną', 'Kodominującą'], correctIndex: 1, explanation: 'Gen daltonizmu leży na chromosomie X i jest recesywny.'),
              QuizQuestion(id: 'q_k2_6', question: 'Allel to:', options: ['Odcinek DNA kodujący białko', 'Wariant genu', 'Para chromosomów', 'Zestaw genotypów populacji'], correctIndex: 1, explanation: 'Allel to jeden z wariantów danego genu.'),
            ],
          ),
        ],
      ),
      Chapter(
        id: 'k2_metabolizm',
        name: 'Metabolizm',
        topics: [
          Topic(
            id: 'k2_metabolizm_oddychanie',
            name: 'Oddychanie komórkowe i fotosynteza',
            theory: '''
ODDYCHANIE KOMÓRKOWE (katabolizm)
Proces rozkładu glukozy w celu uzyskania energii w postaci ATP. Etapy: glikoliza (cytoplazma, beztlenowa, 2 ATP), cykl Krebsa (matriks mitochondrium) i łańcuch oddechowy (błona wewnętrzna mitochondrium, tlenowy, największa produkcja ATP — ok. 34 ATP). Sumaryczny bilans pełnego oddychania tlenowego to ok. 36-38 ATP z jednej cząsteczki glukozy.

FERMENTACJA
Zachodzi bez tlenu. Fermentacja mleczanowa (mięśnie, bakterie) daje kwas mlekowy, fermentacja alkoholowa (drożdże) daje etanol i CO2. Dużo mniej wydajna niż oddychanie tlenowe (2 ATP).

FOTOSYNTEZA (anabolizm)
Proces produkcji glukozy z CO2 i wody przy użyciu energii świetlnej, zachodzący w chloroplastach. Faza jasna (błony tylakoidów) — rozkład wody, produkcja ATP, NADPH i tlenu. Faza ciemna, cykl Calvina (stroma) — wiązanie CO2 i synteza glukozy z użyciem ATP i NADPH z fazy jasnej.

RÓWNANIE SUMARYCZNE FOTOSYNTEZY
6CO2 + 6H2O + energia świetlna → C6H12O6 + 6O2

ZNACZENIE
Fotosynteza jest podstawą łańcuchów pokarmowych i źródłem tlenu atmosferycznego, oddychanie komórkowe dostarcza energię niezbędną do procesów życiowych wszystkich organizmów.
''',
            flashcards: [
              Flashcard(id: 'f_k2_9', front: 'Ile ATP powstaje w glikolizie?', back: '2 cząsteczki ATP (netto), w cytoplazmie, bez udziału tlenu.'),
              Flashcard(id: 'f_k2_10', front: 'Gdzie zachodzi cykl Krebsa?', back: 'W matriks mitochondrium.'),
              Flashcard(id: 'f_k2_11', front: 'Jaki jest produkt fermentacji mleczanowej?', back: 'Kwas mlekowy.'),
              Flashcard(id: 'f_k2_12', front: 'Jakie produkty daje faza jasna fotosyntezy?', back: 'ATP, NADPH i tlen (z rozkładu wody).'),
              Flashcard(id: 'f_k2_13', front: 'Gdzie zachodzi cykl Calvina?', back: 'W stromie chloroplastu (faza ciemna fotosyntezy).'),
              Flashcard(id: 'f_k2_14', front: 'Podaj sumaryczne równanie fotosyntezy.', back: '6CO2 + 6H2O + energia świetlna → C6H12O6 + 6O2'),
              Flashcard(id: 'f_k2_15', front: 'Ile ATP powstaje łącznie w pełnym oddychaniu tlenowym glukozy?', back: 'Ok. 36-38 ATP.'),
            ],
            questions: [
              QuizQuestion(id: 'q_k2_7', question: 'Glikoliza zachodzi w:', options: ['Mitochondrium', 'Cytoplazmie', 'Chloroplaście', 'Jądrze komórkowym'], correctIndex: 1, explanation: 'Glikoliza to proces cytoplazmatyczny, niewymagający tlenu.'),
              QuizQuestion(id: 'q_k2_8', question: 'Produktem fermentacji alkoholowej jest:', options: ['Kwas mlekowy i CO2', 'Etanol i CO2', 'Glukoza i tlen', 'ATP i woda'], correctIndex: 1, explanation: 'Drożdże w warunkach beztlenowych produkują etanol i CO2.'),
              QuizQuestion(id: 'q_k2_9', question: 'Faza jasna fotosyntezy zachodzi w:', options: ['Stromie chloroplastu', 'Błonach tylakoidów', 'Mitochondrium', 'Cytoplazmie'], correctIndex: 1, explanation: 'Reakcje fazy jasnej zachodzą w błonach tylakoidów.'),
              QuizQuestion(id: 'q_k2_10', question: 'Największa ilość ATP w oddychaniu tlenowym powstaje w:', options: ['Glikolizie', 'Cyklu Krebsa', 'Łańcuchu oddechowym', 'Fermentacji'], correctIndex: 2, explanation: 'Łańcuch oddechowy (fosforylacja oksydacyjna) generuje najwięcej ATP.'),
              QuizQuestion(id: 'q_k2_11', question: 'Substratami fotosyntezy są:', options: ['Glukoza i tlen', 'CO2 i woda', 'ATP i NADPH', 'Kwas mlekowy i CO2'], correctIndex: 1, explanation: 'Fotosynteza wykorzystuje CO2 i wodę do produkcji glukozy i tlenu.'),
            ],
          ),
        ],
      ),
    ],
  ),
  ClassData(
    level: 3,
    label: 'Kl. 3',
    chapters: [
      Chapter(
        id: 'k3_fizjologia',
        name: 'Fizjologia człowieka',
        topics: [
          Topic(
            id: 'k3_fizjologia_krazenie',
            name: 'Układ krążenia i odpornościowy',
            theory: '''
UKŁAD KRĄŻENIA
Serce człowieka ma 4 jamy (2 przedsionki, 2 komory) i pracuje jako podwójna pompa: krążenie płucne (małe) — krew z prawej komory do płuc po natlenienie, oraz krążenie duże (ustrojowe) — krew z lewej komory do całego ciała.

NACZYNIA KRWIONOŚNE
Tętnice prowadzą krew od serca (grube, elastyczne ściany, wysokie ciśnienie), żyły prowadzą krew do serca (mają zastawki zapobiegające cofaniu krwi), naczynia włosowate umożliwiają wymianę gazową i substancji odżywczych z tkankami.

SKŁAD KRWI
Osocze (ok. 55%) transportuje składniki odżywcze, hormony i produkty przemiany materii. Erytrocyty (krwinki czerwone) transportują tlen dzięki hemoglobinie. Leukocyty (krwinki białe) odpowiadają za odporność. Trombocyty (płytki krwi) uczestniczą w krzepnięciu.

UKŁAD ODPORNOŚCIOWY
Odporność nieswoista (wrodzona) — pierwsza linia obrony: skóra, śluzówki, fagocyty, gorączka, stan zapalny. Działa szybko i niespecyficznie.

Odporność swoista (nabyta) — limfocyty B produkują przeciwciała (odporność humoralna), limfocyty T niszczą komórki zakażone lub nowotworowe (odporność komórkowa). Powstają komórki pamięci immunologicznej, dzięki którym organizm szybciej reaguje na powtórny kontakt z patogenem.

SZCZEPIONKI
Zawierają antygeny osłabionego/zabitego patogenu, pobudzają wytworzenie odporności czynnej i komórek pamięci bez wywoływania choroby.
''',
            flashcards: [
              Flashcard(id: 'f_k3_1', front: 'Ile jam ma serce człowieka?', back: '4 jamy — 2 przedsionki i 2 komory.'),
              Flashcard(id: 'f_k3_2', front: 'Czym różnią się tętnice od żył?', back: 'Tętnice prowadzą krew od serca (grube ściany, wysokie ciśnienie), żyły do serca (mają zastawki).'),
              Flashcard(id: 'f_k3_3', front: 'Jaka jest funkcja erytrocytów?', back: 'Transport tlenu dzięki hemoglobinie.'),
              Flashcard(id: 'f_k3_4', front: 'Co produkują limfocyty B?', back: 'Przeciwciała (odporność humoralna).'),
              Flashcard(id: 'f_k3_5', front: 'Jaka jest rola limfocytów T?', back: 'Niszczą komórki zakażone lub nowotworowe (odporność komórkowa).'),
              Flashcard(id: 'f_k3_6', front: 'Co to jest odporność nieswoista?', back: 'Wrodzona, pierwsza linia obrony — skóra, śluzówki, fagocyty, stan zapalny — działa szybko i niespecyficznie.'),
              Flashcard(id: 'f_k3_7', front: 'Jak działają szczepionki?', back: 'Zawierają antygeny osłabionego/zabitego patogenu i pobudzają wytworzenie komórek pamięci bez wywołania choroby.'),
            ],
            questions: [
              QuizQuestion(id: 'q_k3_1', question: 'Krążenie płucne (małe) prowadzi krew z:', options: ['Lewej komory do ciała', 'Prawej komory do płuc', 'Prawego przedsionka do lewego', 'Płuc do lewej komory'], correctIndex: 1, explanation: 'Krążenie małe biegnie z prawej komory przez płuca, gdzie krew się natlenia.'),
              QuizQuestion(id: 'q_k3_2', question: 'Za krzepnięcie krwi odpowiadają:', options: ['Erytrocyty', 'Leukocyty', 'Trombocyty', 'Osocze'], correctIndex: 2, explanation: 'Trombocyty (płytki krwi) uczestniczą w procesie krzepnięcia.'),
              QuizQuestion(id: 'q_k3_3', question: 'Odporność humoralna polega na działaniu:', options: ['Fagocytów', 'Przeciwciał produkowanych przez limfocyty B', 'Limfocytów T cytotoksycznych', 'Skóry i śluzówek'], correctIndex: 1, explanation: 'Odporność humoralna opiera się na przeciwciałach produkowanych przez limfocyty B.'),
              QuizQuestion(id: 'q_k3_4', question: 'Zastawki żylne zapobiegają:', options: ['Krzepnięciu krwi', 'Cofaniu się krwi', 'Wymianie gazowej', 'Produkcji hemoglobiny'], correctIndex: 1, explanation: 'Zastawki w żyłach zapobiegają cofaniu się krwi, zwłaszcza w kończynach.'),
              QuizQuestion(id: 'q_k3_5', question: 'Komórki pamięci immunologicznej powstają w wyniku:', options: ['Odporności nieswoistej', 'Odporności swoistej', 'Krzepnięcia krwi', 'Fagocytozy'], correctIndex: 1, explanation: 'To efekt odporności swoistej (nabytej) — umożliwiają szybszą reakcję przy ponownym kontakcie z patogenem.'),
            ],
          ),
        ],
      ),
      Chapter(
        id: 'k3_ewolucja',
        name: 'Ewolucjonizm',
        topics: [
          Topic(
            id: 'k3_ewolucja_dowody',
            name: 'Dowody i mechanizmy ewolucji',
            theory: '''
TEORIA DOBORU NATURALNEGO (Darwin)
Osobniki lepiej przystosowane do środowiska mają większe szanse przeżycia i wydania potomstwa (dobór naturalny). Zmienność w populacji jest surowcem, na którym działa dobór.

ŹRÓDŁA ZMIENNOŚCI GENETYCZNEJ
Mutacje, rekombinacja genetyczna podczas mejozy (crossing-over, niezależna segregacja chromosomów) oraz przepływ genów między populacjami.

DOWODY EWOLUCJI
- Anatomiczne: narządy homologiczne (ten sam plan budowy, różna funkcja, np. kończyna przednia kręgowców) i analogiczne (podobna funkcja, różne pochodzenie, np. skrzydło ptaka i owada); narządy szczątkowe (wyrostek robaczkowy).
- Embriologiczne: podobieństwo zarodków kręgowców na wczesnych etapach rozwoju.
- Paleontologiczne: skamieniałości i formy przejściowe (np. Archaeopteryx).
- Biochemiczne i molekularne: podobieństwo sekwencji DNA i białek między gatunkami spokrewnionymi.

MECHANIZMY MIKROEWOLUCJI
Dryf genetyczny — losowe zmiany częstości alleli, silniejszy w małych populacjach (efekt założyciela, efekt wąskiego gardła). Dobór naturalny — kierunkowy, stabilizujący lub różnicujący.

SPECJACJA
Powstawanie nowych gatunków, najczęściej w wyniku izolacji geograficznej (specjacja allopatryczna) prowadzącej do izolacji rozrodczej.
''',
            flashcards: [
              Flashcard(id: 'f_k3_8', front: 'Na czym polega dobór naturalny?', back: 'Osobniki lepiej przystosowane mają większe szanse przeżycia i wydania potomstwa.'),
              Flashcard(id: 'f_k3_9', front: 'Podaj przykład narządów homologicznych.', back: 'Kończyna przednia kręgowców — ten sam plan budowy, różne funkcje.'),
              Flashcard(id: 'f_k3_10', front: 'Czym są narządy analogiczne?', back: 'Narządy o podobnej funkcji, ale różnym pochodzeniu ewolucyjnym, np. skrzydło ptaka i owada.'),
              Flashcard(id: 'f_k3_11', front: 'Co to jest dryf genetyczny?', back: 'Losowe zmiany częstości alleli w populacji, silniejsze w małych populacjach.'),
              Flashcard(id: 'f_k3_12', front: 'Co to jest specjacja allopatryczna?', back: 'Powstawanie nowego gatunku w wyniku izolacji geograficznej.'),
              Flashcard(id: 'f_k3_13', front: 'Podaj przykład formy przejściowej znanej z zapisu kopalnego.', back: 'Archaeopteryx — forma przejściowa między gadami a ptakami.'),
            ],
            questions: [
              QuizQuestion(id: 'q_k3_6', question: 'Kończyna przednia człowieka i płetwa wieloryba to narządy:', options: ['Analogiczne', 'Homologiczne', 'Szczątkowe', 'Konwergentne'], correctIndex: 1, explanation: 'Mają ten sam plan budowy odziedziczony po wspólnym przodku — są homologiczne.'),
              QuizQuestion(id: 'q_k3_7', question: 'Głównym źródłem nowej zmienności genetycznej są:', options: ['Mutacje', 'Dobór naturalny', 'Dryf genetyczny', 'Izolacja geograficzna'], correctIndex: 0, explanation: 'Mutacje są pierwotnym źródłem nowych alleli w populacji.'),
              QuizQuestion(id: 'q_k3_8', question: 'Efekt wąskiego gardła jest przykładem:', options: ['Doboru naturalnego', 'Dryfu genetycznego', 'Specjacji sympatrycznej', 'Konwergencji'], correctIndex: 1, explanation: 'To losowa zmiana puli genowej po drastycznym zmniejszeniu liczebności populacji — forma dryfu genetycznego.'),
              QuizQuestion(id: 'q_k3_9', question: 'Podobieństwo zarodków różnych kręgowców to dowód ewolucji typu:', options: ['Anatomicznego', 'Embriologicznego', 'Paleontologicznego', 'Biochemicznego'], correctIndex: 1, explanation: 'To dowód embriologiczny wskazujący na wspólne pochodzenie kręgowców.'),
              QuizQuestion(id: 'q_k3_10', question: 'Specjacja allopatryczna zachodzi w wyniku:', options: ['Izolacji geograficznej', 'Krzyżowania w obrębie tej samej populacji', 'Mutacji punktowej', 'Konwergencji cech'], correctIndex: 0, explanation: 'Izolacja geograficzna prowadzi do niezależnej ewolucji i w konsekwencji do izolacji rozrodczej.'),
            ],
          ),
        ],
      ),
    ],
  ),
  ClassData(
    level: 4,
    label: 'Kl. 4',
    chapters: [
      Chapter(
        id: 'k4_ekologia',
        name: 'Ekologia',
        topics: [
          Topic(
            id: 'k4_ekologia_populacja',
            name: 'Populacja i ekosystem',
            theory: '''
POPULACJA
Zbiór osobników jednego gatunku żyjących na danym terenie w tym samym czasie i mogących się swobodnie krzyżować. Cechy populacji: liczebność, zagęszczenie, rozrodczość, śmiertelność, struktura wiekowa i przestrzenna (skupiskowa, równomierna, losowa).

KRZYWE WZROSTU POPULACJI
Wzrost wykładniczy (J-kształtny) — nieograniczone zasoby, brak czynników ograniczających. Wzrost logistyczny (S-kształtny) — populacja rośnie aż osiąga pojemność środowiska (K), przy której tempo wzrostu spada do zera.

CZYNNIKI OGRANICZAJĄCE
Zależne od zagęszczenia (konkurencja, drapieżnictwo, choroby, dostępność pokarmu) i niezależne od zagęszczenia (klimat, katastrofy naturalne).

BIOCENOZA I EKOSYSTEM
Biocenoza to wszystkie populacje różnych gatunków zamieszkujące dany obszar (biotop). Ekosystem = biocenoza + biotop (środowisko nieożywione) wraz z zachodzącymi między nimi zależnościami.

ODDZIAŁYWANIA MIĘDZYGATUNKOWE
Konkurencja (-,-), drapieżnictwo i pasożytnictwo (+,-), mutualizm/symbioza (+,+), komensalizm (+,0), amensalizm (-,0).

NISZA EKOLOGICZNA
Rola gatunku w ekosystemie — sposób wykorzystania zasobów środowiska (pokarm, przestrzeń, czas aktywności). Zasada Gausego mówi, że dwa gatunki o identycznej niszy nie mogą trwale współistnieć — dochodzi do wykluczenia konkurencyjnego.

SUKCESJA EKOLOGICZNA
Pierwotna — zaczyna się na terenie wcześniej niezasiedlonym (np. skała, wydma). Wtórna — zachodzi na terenie, gdzie biocenoza już istniała, ale została zniszczona (np. po pożarze). Prowadzi do stadium klimaksu — stabilnej zbiorowiska końcowego.
''',
            flashcards: [
              Flashcard(id: 'f_k4_1', front: 'Co to jest populacja?', back: 'Zbiór osobników jednego gatunku żyjących na danym terenie i mogących się swobodnie krzyżować.'),
              Flashcard(id: 'f_k4_2', front: 'Czym różni się wzrost wykładniczy od logistycznego?', back: 'Wykładniczy (J) zachodzi przy nieograniczonych zasobach, logistyczny (S) uwzględnia pojemność środowiska K.'),
              Flashcard(id: 'f_k4_3', front: 'Co oznacza pojemność środowiska (K)?', back: 'Maksymalną liczebność populacji, jaką dane środowisko jest w stanie utrzymać.'),
              Flashcard(id: 'f_k4_4', front: 'Czym jest ekosystem?', back: 'Biocenoza wraz z biotopem (środowiskiem nieożywionym) i zachodzącymi między nimi zależnościami.'),
              Flashcard(id: 'f_k4_5', front: 'Podaj przykład oddziaływania +,+ między gatunkami.', back: 'Mutualizm (symbioza), np. mikoryza — grzyb i korzenie rośliny.'),
              Flashcard(id: 'f_k4_6', front: 'Co mówi zasada Gausego?', back: 'Dwa gatunki o identycznej niszy ekologicznej nie mogą trwale współistnieć — jeden wypiera drugi.'),
              Flashcard(id: 'f_k4_7', front: 'Czym różni się sukcesja pierwotna od wtórnej?', back: 'Pierwotna zaczyna się na terenie niezasiedlonym wcześniej, wtórna — tam gdzie biocenoza istniała, ale została zniszczona.'),
              Flashcard(id: 'f_k4_8', front: 'Co to jest stadium klimaksu?', back: 'Stabilne, końcowe stadium sukcesji ekologicznej.'),
            ],
            questions: [
              QuizQuestion(id: 'q_k4_1', question: 'Wzrost populacji ograniczony pojemnością środowiska nazywamy wzrostem:', options: ['Wykładniczym', 'Logistycznym', 'Liniowym', 'Losowym'], correctIndex: 1, explanation: 'Wzrost logistyczny (krzywa S) uwzględnia ograniczenia środowiska (K).'),
              QuizQuestion(id: 'q_k4_2', question: 'Biocenoza wraz z biotopem tworzy:', options: ['Populację', 'Niszę ekologiczną', 'Ekosystem', 'Sukcesję'], correctIndex: 2, explanation: 'Ekosystem to biocenoza i biotop wraz z ich wzajemnymi zależnościami.'),
              QuizQuestion(id: 'q_k4_3', question: 'Drapieżnictwo jest przykładem oddziaływania:', options: ['(+,+)', '(+,-)', '(0,0)', '(-,-)'], correctIndex: 1, explanation: 'Drapieżnik korzysta (+), ofiara traci (-).'),
              QuizQuestion(id: 'q_k4_4', question: 'Sukcesja rozpoczynająca się na jałowej skale to sukcesja:', options: ['Wtórna', 'Pierwotna', 'Klimaksowa', 'Losowa'], correctIndex: 1, explanation: 'Sukcesja pierwotna zaczyna się na terenie wcześniej niezasiedlonym.'),
              QuizQuestion(id: 'q_k4_5', question: 'Zasada Gausego dotyczy:', options: ['Wykluczenia konkurencyjnego', 'Mutualizmu', 'Komensalizmu', 'Sukcesji wtórnej'], correctIndex: 0, explanation: 'Mówi, że dwa gatunki o tej samej niszy nie mogą trwale współistnieć.'),
              QuizQuestion(id: 'q_k4_6', question: 'Struktura przestrzenna populacji NIE może być:', options: ['Skupiskowa', 'Równomierna', 'Losowa', 'Logistyczna'], correctIndex: 3, explanation: '"Logistyczna" opisuje typ wzrostu, nie strukturę przestrzenną populacji.'),
              QuizQuestion(id: 'q_k4_7', question: 'Konkurencja międzygatunkowa to oddziaływanie typu:', options: ['(+,+)', '(-,-)', '(+,0)', '(+,-)'], correctIndex: 1, explanation: 'Obie konkurujące populacje ponoszą koszty — (-,-).'),
            ],
          ),
          Topic(
            id: 'k4_ekologia_przeplyw',
            name: 'Przepływ energii i krążenie materii',
            theory: '''
POZIOMY TROFICZNE
Producenci (organizmy samożywne, np. rośliny — fotosynteza) → konsumenci I rzędu (roślinożercy) → konsumenci II rzędu (drapieżcy) → konsumenci wyższych rzędów. Reducenci (bakterie, grzyby) rozkładają materię organiczną do nieorganicznej.

ŁAŃCUCH I SIEĆ POKARMOWA
Łańcuch pokarmowy to liniowa sekwencja przepływu energii i materii. W naturze łańcuchy krzyżują się, tworząc sieci troficzne — bardziej stabilne niż pojedyncze łańcuchy.

PRZEPŁYW ENERGII
Energia przepływa przez ekosystem jednokierunkowo (od Słońca, przez producentów, do kolejnych konsumentów) i jest tracona głównie jako ciepło (oddychanie). Reguła 10% (piramida energii) — na kolejny poziom troficzny przechodzi średnio tylko ok. 10% energii z poziomu poprzedniego.

PIRAMIDY EKOLOGICZNE
Piramida liczebności, biomasy i energii — obrazują odpowiednio liczbę osobników, masę materii organicznej i ilość energii na kolejnych poziomach troficznych. Piramida energii zawsze zwężająca się ku górze.

KRĄŻENIE MATERII (obiegi biogeochemiczne)
W przeciwieństwie do energii, materia krąży w przyrodzie w obiegu zamkniętym.
- Obieg węgla: fotosynteza wiąże CO2, oddychanie i spalanie paliw kopalnych je uwalniają.
- Obieg azotu: wiązanie N2 przez bakterie symbiotyczne i wolno żyjące, nitryfikacja, denitryfikacja, asymilacja przez rośliny.
- Obieg wody: parowanie, kondensacja, opady, spływ powierzchniowy.

PRODUKCJA PIERWOTNA
Produkcja pierwotna brutto (PPB) to całkowita ilość materii organicznej wytworzonej przez producentów. Produkcja pierwotna netto (PPN) = PPB minus energia zużyta przez producentów na oddychanie. To właśnie PPN jest dostępna dla konsumentów.
''',
            flashcards: [
              Flashcard(id: 'f_k4_9', front: 'Kim są reducenci i jaka jest ich rola?', back: 'Bakterie i grzyby rozkładające materię organiczną do nieorganicznej.'),
              Flashcard(id: 'f_k4_10', front: 'Jaka jest reguła 10% w piramidzie energii?', back: 'Na kolejny poziom troficzny przechodzi średnio tylko ok. 10% energii z poziomu poprzedniego.'),
              Flashcard(id: 'f_k4_11', front: 'Czym różni się łańcuch od sieci pokarmowej?', back: 'Łańcuch to liniowa sekwencja, sieć to zbiór krzyżujących się łańcuchów — jest bardziej stabilna.'),
              Flashcard(id: 'f_k4_12', front: 'Czy energia krąży w ekosystemie w obiegu zamkniętym?', back: 'Nie — energia przepływa jednokierunkowo i jest tracona jako ciepło; to materia krąży w obiegu zamkniętym.'),
              Flashcard(id: 'f_k4_13', front: 'Co to jest produkcja pierwotna netto (PPN)?', back: 'Produkcja pierwotna brutto minus energia zużyta przez producentów na oddychanie — dostępna dla konsumentów.'),
              Flashcard(id: 'f_k4_14', front: 'Wymień etapy obiegu wody.', back: 'Parowanie, kondensacja, opady, spływ powierzchniowy.'),
              Flashcard(id: 'f_k4_15', front: 'Jaki proces wiąże wolny azot atmosferyczny?', back: 'Wiązanie azotu przez bakterie symbiotyczne i wolno żyjące (azotobakterie, bakterie brodawkowe).'),
              Flashcard(id: 'f_k4_16', front: 'Który poziom troficzny zajmują producenci?', back: 'Pierwszy — organizmy samożywne, np. rośliny prowadzące fotosyntezę.'),
            ],
            questions: [
              QuizQuestion(id: 'q_k4_8', question: 'Zgodnie z regułą 10%, ile energii przechodzi średnio na kolejny poziom troficzny?', options: ['1%', '10%', '50%', '90%'], correctIndex: 1, explanation: 'Średnio tylko ok. 10% energii przechodzi na kolejny poziom troficzny, reszta jest tracona jako ciepło.'),
              QuizQuestion(id: 'q_k4_9', question: 'Materia w ekosystemie krąży:', options: ['W obiegu otwartym, jak energia', 'W obiegu zamkniętym', 'Tylko w jedną stronę', 'Nie krąży wcale'], correctIndex: 1, explanation: 'W przeciwieństwie do energii, materia krąży w obiegu zamkniętym (obiegi biogeochemiczne).'),
              QuizQuestion(id: 'q_k4_10', question: 'Reducentami w ekosystemie są zazwyczaj:', options: ['Rośliny', 'Roślinożercy', 'Bakterie i grzyby', 'Drapieżcy'], correctIndex: 2, explanation: 'Bakterie i grzyby rozkładają materię organiczną do form nieorganicznych.'),
              QuizQuestion(id: 'q_k4_11', question: 'Produkcja pierwotna netto to:', options: ['Cała energia wytworzona przez producentów', 'PPB minus energia zużyta na oddychanie producentów', 'Energia zużyta przez konsumentów II rzędu', 'Suma energii wszystkich poziomów troficznych'], correctIndex: 1, explanation: 'PPN = PPB - R (oddychanie producentów); to ta część jest dostępna dla konsumentów.'),
              QuizQuestion(id: 'q_k4_12', question: 'Piramida energii w ekosystemie:', options: ['Zawsze się zwęża ku górze', 'Zawsze się rozszerza ku górze', 'Jest zawsze prostokątna', 'Nie istnieje w przyrodzie'], correctIndex: 0, explanation: 'Ze względu na straty energii na każdym poziomie, piramida energii zawsze zwęża się ku górze.'),
              QuizQuestion(id: 'q_k4_13', question: 'Sieć pokarmowa w porównaniu do pojedynczego łańcucha pokarmowego jest:', options: ['Mniej stabilna', 'Bardziej stabilna', 'Identyczna pod względem stabilności', 'Nie zawiera reducentów'], correctIndex: 1, explanation: 'Sieć pokarmowa, dzięki wielu powiązaniom, jest bardziej odporna na zaburzenia niż pojedynczy łańcuch.'),
            ],
          ),
        ],
      ),
      Chapter(
        id: 'k4_ochrona',
        name: 'Ochrona środowiska',
        topics: [
          Topic(
            id: 'k4_ochrona_zagrozenia',
            name: 'Zagrożenia i ochrona środowiska',
            theory: '''
GŁÓWNE ZAGROŻENIA ŚRODOWISKA

EFEKT CIEPLARNIANY I ZMIANY KLIMATU
Wzrost stężenia gazów cieplarnianych (CO2, metan, podtlenek azotu) w atmosferze zatrzymuje promieniowanie cieplne Ziemi, powodując globalne ocieplenie, topnienie lodowców, wzrost poziomu mórz i zmiany rozkładu opadów.

DZIURA OZONOWA
Freony (CFC) rozkładają ozon w stratosferze, zmniejszając ochronę przed promieniowaniem UV, co zwiększa ryzyko nowotworów skóry i uszkodzeń wzroku.

ZANIECZYSZCZENIE WÓD I EUTROFIZACJA
Nadmiar związków azotu i fosforu (nawozy, ścieki) prowadzi do przeżyźnienia wód (eutrofizacji), masowego rozwoju glonów (zakwity), a następnie deficytu tlenu i śnięcia organizmów wodnych.

KWAŚNE OPADY
Tlenki siarki i azotu, emitowane głównie przez przemysł i transport, reagują z wodą w atmosferze, tworząc kwasy, które zakwaszają gleby i wody, niszcząc lasy i budowle.

UTRATA RÓŻNORODNOŚCI BIOLOGICZNEJ
Wylesianie, fragmentacja siedlisk, gatunki inwazyjne, nadmierna eksploatacja zasobów i zanieczyszczenia prowadzą do wymierania gatunków i spadku bioróżnorodności.

FORMY OCHRONY PRZYRODY W POLSCE
Parki narodowe (najwyższa forma ochrony, np. Białowieski PN), parki krajobrazowe, rezerwaty przyrody, obszary Natura 2000, pomniki przyrody, ochrona gatunkowa (ścisła i częściowa).

ZRÓWNOWAŻONY ROZWÓJ
Zaspokajanie potrzeb obecnego pokolenia bez ograniczania możliwości zaspokajania potrzeb przyszłych pokoleń — łączy rozwój gospodarczy z ochroną środowiska. Obejmuje m.in. odnawialne źródła energii, recykling i racjonalne gospodarowanie zasobami.
''',
            flashcards: [
              Flashcard(id: 'f_k4_17', front: 'Które gazy są głównymi gazami cieplarnianymi?', back: 'CO2, metan (CH4) i podtlenek azotu (N2O).'),
              Flashcard(id: 'f_k4_18', front: 'Co powoduje powstawanie dziury ozonowej?', back: 'Freony (CFC) rozkładające ozon w stratosferze.'),
              Flashcard(id: 'f_k4_19', front: 'Co to jest eutrofizacja?', back: 'Przeżyźnienie wód związkami azotu i fosforu, prowadzące do zakwitów glonów i deficytu tlenu.'),
              Flashcard(id: 'f_k4_20', front: 'Co powoduje kwaśne opady?', back: 'Tlenki siarki i azotu reagujące z wodą w atmosferze, emitowane głównie przez przemysł i transport.'),
              Flashcard(id: 'f_k4_21', front: 'Jaka jest najwyższa forma ochrony przyrody w Polsce?', back: 'Park narodowy.'),
              Flashcard(id: 'f_k4_22', front: 'Co to jest sieć Natura 2000?', back: 'Europejski system obszarów chronionych utworzony w celu ochrony najcenniejszych siedlisk i gatunków.'),
              Flashcard(id: 'f_k4_23', front: 'Na czym polega zrównoważony rozwój?', back: 'Zaspokajanie potrzeb obecnego pokolenia bez ograniczania możliwości zaspokajania potrzeb przyszłych pokoleń.'),
              Flashcard(id: 'f_k4_24', front: 'Wymień skutek utraty różnorodności biologicznej.', back: 'Wymieranie gatunków, zubożenie ekosystemów, spadek ich odporności na zaburzenia.'),
            ],
            questions: [
              QuizQuestion(id: 'q_k4_14', question: 'Freony przyczyniają się do:', options: ['Efektu cieplarnianego', 'Powstawania dziury ozonowej', 'Eutrofizacji wód', 'Kwaśnych opadów'], correctIndex: 1, explanation: 'Freony (CFC) rozkładają cząsteczki ozonu w stratosferze.'),
              QuizQuestion(id: 'q_k4_15', question: 'Eutrofizacja wód jest spowodowana głównie nadmiarem:', options: ['Tlenków siarki', 'Związków azotu i fosforu', 'Metali ciężkich', 'Freonów'], correctIndex: 1, explanation: 'Nawozy i ścieki dostarczają nadmiar azotu i fosforu, powodując przeżyźnienie wód.'),
              QuizQuestion(id: 'q_k4_16', question: 'Najwyższą rangą formą ochrony przyrody w Polsce jest:', options: ['Rezerwat przyrody', 'Park krajobrazowy', 'Park narodowy', 'Pomnik przyrody'], correctIndex: 2, explanation: 'Park narodowy to najwyższa forma ochrony obszarowej w Polsce.'),
              QuizQuestion(id: 'q_k4_17', question: 'Kwaśne opady powstają w wyniku emisji:', options: ['CO2 i metanu', 'Tlenków siarki i azotu', 'Freonów', 'Pyłów zawieszonych'], correctIndex: 1, explanation: 'Tlenki siarki (SOx) i azotu (NOx) reagują z wodą, tworząc kwasy.'),
              QuizQuestion(id: 'q_k4_18', question: 'Zrównoważony rozwój oznacza:', options: ['Maksymalizację produkcji bez ograniczeń', 'Rozwój gospodarczy przy zachowaniu zasobów dla przyszłych pokoleń', 'Całkowite zaprzestanie rozwoju gospodarczego', 'Wykorzystywanie wyłącznie paliw kopalnych'], correctIndex: 1, explanation: 'Łączy rozwój gospodarczy z ochroną zasobów środowiska dla przyszłych pokoleń.'),
              QuizQuestion(id: 'q_k4_19', question: 'Obszary Natura 2000 to:', options: ['Polska forma ochrony gatunkowej roślin', 'Europejski system obszarów chronionych', 'Rodzaj rezerwatu ścisłego', 'Krajowy program recyklingu'], correctIndex: 1, explanation: 'Natura 2000 to unijna sieć obszarów chroniących cenne siedliska i gatunki.'),
            ],
          ),
        ],
      ),
      Chapter(
        id: 'k4_powtorka',
        name: 'Powtórka maturalna',
        topics: [
          Topic(
            id: 'k4_powtorka_ekologia',
            name: 'Powtórka maturalna — ekologia i środowisko',
            theory: '''
Ten temat podsumowuje kluczowe zagadnienia z ekologii i ochrony środowiska najczęściej pojawiające się na maturze rozszerzonej z biologii.

KLUCZOWE POJĘCIA DO POWTÓRZENIA
- Poziomy organizacji: osobnik → populacja → biocenoza → ekosystem → biom → biosfera.
- Piramidy ekologiczne i reguła 10% przepływu energii.
- Obiegi biogeochemiczne: węgla, azotu, wody — materia krąży, energia przepływa jednokierunkowo.
- Oddziaływania międzygatunkowe i ich klasyfikacja (+,+), (+,-), (-,-), (+,0), (-,0).
- Sukcesja ekologiczna: pierwotna, wtórna, stadium klimaksu.
- Zagrożenia środowiska: efekt cieplarniany, dziura ozonowa, eutrofizacja, kwaśne opady, utrata bioróżnorodności.
- Formy ochrony przyrody w Polsce i ich hierarchia.

TYPOWE PUŁAPKI MATURALNE
- Mylenie przepływu energii (jednokierunkowy) z krążeniem materii (obieg zamknięty).
- Mylenie sukcesji pierwotnej z wtórną — kluczowe jest to, czy wcześniej istniała tam biocenoza.
- Błędne przypisywanie znaku oddziaływań międzygatunkowych (np. traktowanie pasożytnictwa jako (+,+) zamiast (+,-)).
- Zapominanie, że produkcja pierwotna netto to nie to samo co brutto (różnica to oddychanie producentów).

STRATEGIA ROZWIĄZYWANIA ZADAŃ
Czytaj uważnie polecenie — czy pytanie dotyczy przepływu energii, czy krążenia materii. Przy zadaniach z krzyżówek genetycznych zawsze zapisuj genotypy rodziców i gamety. W zadaniach o ekosystemach zwracaj uwagę na kierunek strzałek w łańcuchu pokarmowym — strzałka wskazuje kierunek przepływu energii (od zjadanego do zjadającego).
''',
            flashcards: [
              Flashcard(id: 'f_k4_25', front: 'Wymień poziomy organizacji biologicznej od osobnika do biosfery.', back: 'Osobnik → populacja → biocenoza → ekosystem → biom → biosfera.'),
              Flashcard(id: 'f_k4_26', front: 'Co jest częstym błędem przy opisywaniu przepływu energii i materii?', back: 'Mylenie ich — energia przepływa jednokierunkowo, materia krąży w obiegu zamkniętym.'),
              Flashcard(id: 'f_k4_27', front: 'Jaki znak ma oddziaływanie pasożyt-żywiciel?', back: '(+,-) — pasożyt korzysta, żywiciel traci.'),
              Flashcard(id: 'f_k4_28', front: 'Co odróżnia sukcesję pierwotną od wtórnej?', back: 'To, czy na danym terenie istniała wcześniej biocenoza (wtórna) czy nie (pierwotna).'),
              Flashcard(id: 'f_k4_29', front: 'W którą stronę wskazuje strzałka w łańcuchu pokarmowym?', back: 'Wskazuje kierunek przepływu energii — od organizmu zjadanego do zjadającego.'),
              Flashcard(id: 'f_k4_30', front: 'Jaka jest różnica między PPB a PPN?', back: 'PPN = PPB minus energia zużyta przez producentów na własne oddychanie.'),
              Flashcard(id: 'f_k4_31', front: 'Wymień trzy zagrożenia środowiska omawiane na maturze.', back: 'Np. efekt cieplarniany, eutrofizacja wód, utrata różnorodności biologicznej.'),
              Flashcard(id: 'f_k4_32', front: 'Co warto zapisać, rozwiązując zadanie z krzyżówki genetycznej?', back: 'Genotypy rodziców i wszystkie możliwe gamety przed ustaleniem genotypów potomstwa.'),
            ],
            questions: [
              QuizQuestion(id: 'q_k4_20', question: 'Poprawna kolejność poziomów organizacji to:', options: ['Ekosystem → biocenoza → populacja → osobnik', 'Osobnik → populacja → biocenoza → ekosystem', 'Populacja → osobnik → ekosystem → biocenoza', 'Biocenoza → ekosystem → osobnik → populacja'], correctIndex: 1, explanation: 'Poziomy rosną od najmniejszego (osobnik) do coraz większych struktur.'),
              QuizQuestion(id: 'q_k4_21', question: 'Strzałka w łańcuchu pokarmowym wskazuje kierunek:', options: ['Przepływu materii nieorganicznej', 'Przepływu energii, od zjadanego do zjadającego', 'Malejącej liczebności populacji', 'Sukcesji ekologicznej'], correctIndex: 1, explanation: 'Strzałka pokazuje, w którą stronę płynie energia — od ofiary/rośliny do konsumenta.'),
              QuizQuestion(id: 'q_k4_22', question: 'Pasożytnictwo klasyfikujemy jako oddziaływanie:', options: ['(+,+)', '(+,-)', '(-,-)', '(0,0)'], correctIndex: 1, explanation: 'Pasożyt zyskuje, żywiciel traci — to relacja (+,-), podobnie jak drapieżnictwo.'),
              QuizQuestion(id: 'q_k4_23', question: 'Materia w ekosystemie, w przeciwieństwie do energii:', options: ['Ulega całkowitej utracie', 'Krąży w obiegu zamkniętym', 'Nie bierze udziału w łańcuchach pokarmowych', 'Przepływa tylko w jedną stronę'], correctIndex: 1, explanation: 'To kluczowa różnica: energia przepływa jednokierunkowo, materia krąży.'),
              QuizQuestion(id: 'q_k4_24', question: 'Sukcesja zachodząca po pożarze lasu (tam, gdzie wcześniej istniała biocenoza) to sukcesja:', options: ['Pierwotna', 'Wtórna', 'Klimaksowa', 'Losowa'], correctIndex: 1, explanation: 'Ponieważ biocenoza istniała wcześniej i została zniszczona, to sukcesja wtórna.'),
              QuizQuestion(id: 'q_k4_25', question: 'Produkcja pierwotna netto to:', options: ['Cała energia zaabsorbowana przez producentów', 'Energia dostępna dla konsumentów po odjęciu oddychania producentów', 'Energia zużyta przez reducentów', 'Suma energii wszystkich poziomów troficznych'], correctIndex: 1, explanation: 'PPN = PPB - R; to ta energia trafia dalej do sieci troficznej.'),
            ],
          ),
        ],
      ),
    ],
  ),
];

ClassData classByLevel(int level) =>
    biologyData.firstWhere((c) => c.level == level);

Topic? findTopicById(String topicId) {
  for (final c in biologyData) {
    for (final ch in c.chapters) {
      for (final t in ch.topics) {
        if (t.id == topicId) return t;
      }
    }
  }
  return null;
}

Chapter? chapterOfTopic(String topicId) {
  for (final c in biologyData) {
    for (final ch in c.chapters) {
      for (final t in ch.topics) {
        if (t.id == topicId) return ch;
      }
    }
  }
  return null;
}

List<Chapter> get allChapters =>
    biologyData.expand((c) => c.chapters).toList();
