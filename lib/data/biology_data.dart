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
            id: 'k1_chemizm_nieorganiczne',
            name: 'Składniki nieorganiczne',
            theory: '''
MAKROELEMENTY I PIERWIASTKI BIOGENNE
Makroelementy to pierwiastki występujące w organizmach w większych ilościach (powyżej 0,01% masy ciała). Pierwiastki biogenne (C, H, O, N, P, S) budują podstawowe związki organiczne — węglowodany, białka, lipidy i kwasy nukleinowe. Inne ważne makroelementy to Ca (budowa kości i zębów, krzepnięcie krwi, skurcz mięśni), K (potencjał błonowy, praca serca), Na (ciśnienie osmotyczne, przewodnictwo nerwowe), Mg (kofaktor enzymów, składnik chlorofilu).

MIKROELEMENTY
Występują w organizmie w śladowych ilościach, ale są niezbędne do prawidłowego funkcjonowania. Fe (żelazo) wchodzi w skład hemoglobiny i mioglobiny — uczestniczy w transporcie tlenu; jego niedobór powoduje anemię. I (jod) jest niezbędny do syntezy hormonów tarczycy (tyroksyny), reguluje tempo metabolizmu; niedobór prowadzi do wola tarczycowego. F (fluor) wzmacnia szkliwo zębów i kości, zapobiegając próchnicy.

WODA — WŁAŚCIWOŚCI I ZNACZENIE
Cząsteczka wody jest polarna, co umożliwia tworzenie wiązań wodorowych między cząsteczkami. Dzięki temu woda ma wysokie ciepło właściwe i ciepło parowania — stabilizuje temperaturę organizmu (termoregulacja) i środowiska. Jest uniwersalnym rozpuszczalnikiem substancji polarnych i środowiskiem, w którym zachodzi większość reakcji biochemicznych. Stanowi 60-70% masy ciała człowieka. Bierze udział w transporcie substancji, procesach osmotycznych oraz jest reagentem lub produktem wielu reakcji (np. hydroliza, fotosynteza).
''',
            flashcards: [
              Flashcard(id: 'f_k1_1', front: 'Jaki procent masy ciała człowieka stanowi woda?', back: '60-70% masy ciała.'),
              Flashcard(id: 'f_k1_8', front: 'Dlaczego woda jest dobrym termoregulatorem?', back: 'Ma wysokie ciepło właściwe i ciepło parowania, więc stabilizuje temperaturę organizmu.'),
            ],
            questions: [
              QuizQuestion(id: 'q_k1_1', question: 'Ile procent masy ciała człowieka stanowi woda?', options: ['20-30%', '40-50%', '60-70%', '90-95%'], correctIndex: 2, explanation: 'Woda stanowi około 60-70% masy ciała dorosłego człowieka.'),
              QuizQuestion(id: 'q_k1_12', question: 'Niedobór którego pierwiastka prowadzi do anemii?', options: ['Fe', 'I', 'F', 'Ca'], correctIndex: 0, explanation: 'Żelazo jest składnikiem hemoglobiny, jego niedobór powoduje anemię.'),
              QuizQuestion(id: 'q_k1_13', question: 'Jod (I) jest niezbędny do syntezy:', options: ['Hemoglobiny', 'Hormonów tarczycy', 'Szkliwa zębów', 'Chlorofilu'], correctIndex: 1, explanation: 'Jod wchodzi w skład hormonów tarczycy, np. tyroksyny.'),
              QuizQuestion(id: 'q_k1_14', question: 'Do pierwiastków biogennych (budujących związki organiczne) zaliczamy:', options: ['Na, Cl, K, Ca', 'C, H, O, N, P, S', 'Fe, I, F, Mg', 'Ca, Mg, Fe, Na'], correctIndex: 1, explanation: 'Pierwiastki biogenne to C, H, O, N, P, S — budują związki organiczne.'),
              QuizQuestion(id: 'q_k1_15', question: 'Dlaczego woda ma wysokie ciepło parowania?', options: ['Ze względu na wiązania wodorowe między cząsteczkami', 'Ze względu na wiązania jonowe', 'Bo cząsteczka wody nie ma ładunku', 'Ze względu na wiązania kowalencyjne w tlenie'], correctIndex: 0, explanation: 'Polarność wody i wiązania wodorowe odpowiadają za jej wysokie ciepło parowania.'),
            ],
          ),
          Topic(
            id: 'k1_chemizm_weglowodany_lipidy',
            name: 'Węglowodany i lipidy',
            theory: '''
WĘGLOWODANY — BUDOWA I PODZIAŁ
Węglowodany zbudowane są z węgla, wodoru i tlenu. Łączą się wiązaniami glikozydowymi, które mogą mieć konfigurację α (np. w skrobi i glikogenie) lub β (np. w celulozie i chitynie) — ta różnica decyduje o strawności i funkcji polisacharydu (człowiek trawi skrobię, ale nie celulozę).
Monosacharydy (cukry proste): glukoza, fruktoza, galaktoza (heksozy) oraz ryboza i deoksyryboza (pentozy, budujące RNA i DNA).
Disacharydy: sacharoza (glukoza + fruktoza), laktoza (glukoza + galaktoza), maltoza (glukoza + glukoza).
Polisacharydy: skrobia (zapasowa u roślin, wiązania α), glikogen (zapasowy u zwierząt i grzybów, wiązania α, silnie rozgałęziony), celuloza (budulcowa w ścianach komórkowych roślin, wiązania β), chityna (budulcowa u grzybów i stawonogów).
ZNACZENIE: główne źródło energii oraz funkcja budulcowa (celuloza, chityna).
DOŚWIADCZENIE: obecność skrobi w materiale biologicznym wykrywa się płynem Lugola (jodyna) — w obecności skrobi roztwór zmienia barwę na granatowo-czarną.

LIPIDY — BUDOWA I PODZIAŁ
Lipidy proste (tłuszcze właściwe, woski) powstają z połączenia glicerolu i kwasów tłuszczowych wiązaniami estrowymi. Lipidy złożone zawierają dodatkowo inne grupy, np. fosfolipidy (kwas fosforowy — budują błony komórkowe), glikolipidy (reszta cukrowa) czy steroidy (np. cholesterol, hormony płciowe — budowa pierścieniowa).
WŁAŚCIWOŚCI: nierozpuszczalne w wodzie (hydrofobowe), rozpuszczalne w rozpuszczalnikach organicznych. Kwasy tłuszczowe nasycone (bez wiązań podwójnych, stałe w temp. pokojowej) i nienasycone (z wiązaniami podwójnymi, ciekłe — oleje).
ZNACZENIE: magazynowanie energii (2x więcej na gram niż węglowodany), budowa błon komórkowych (fosfolipidy), izolacja termiczna i mechaniczna, prekursory hormonów steroidowych.
''',
            flashcards: [
              Flashcard(id: 'f_k1_4', front: 'Co to jest glikogen?', back: 'Wielocukier zapasowy magazynowany w wątrobie i mięśniach zwierząt.'),
              Flashcard(id: 'f_k1_5', front: 'Która grupa związków magazynuje najwięcej energii na gram?', back: 'Tłuszcze (lipidy) — ok. 2 razy więcej niż węglowodany.'),
              Flashcard(id: 'f_k1_7', front: 'Jaką funkcję pełni celuloza u roślin?', back: 'Buduje ściany komórkowe (funkcja strukturalna).'),
            ],
            questions: [
              QuizQuestion(id: 'q_k1_3', question: 'Który związek pełni funkcję zapasową u zwierząt?', options: ['Celuloza', 'Skrobia', 'Glikogen', 'Chityna'], correctIndex: 2, explanation: 'Glikogen to zapasowy wielocukier magazynowany w wątrobie i mięśniach zwierząt.'),
              QuizQuestion(id: 'q_k1_4', question: 'Fosfolipidy są głównym składnikiem:', options: ['Błon komórkowych', 'Chromosomów', 'Rybosomów', 'Ściany komórkowej roślin'], correctIndex: 0, explanation: 'Dwuwarstwa fosfolipidowa buduje błony komórkowe.'),
              QuizQuestion(id: 'q_k1_16', question: 'Wiązanie α-glikozydowe występuje w:', options: ['Celulozie', 'Skrobi i glikogenie', 'Chitynie', 'DNA'], correctIndex: 1, explanation: 'Skrobia i glikogen zbudowane są z glukozy połączonej wiązaniami α-glikozydowymi.'),
              QuizQuestion(id: 'q_k1_17', question: 'Do wykrywania obecności skrobi w materiale biologicznym stosuje się:', options: ['Wodorotlenek miedzi', 'Płyn Lugola', 'Wodę bromową', 'Sudan III'], correctIndex: 1, explanation: 'Płyn Lugola (jodyna) z skrobią daje granatowo-czarne zabarwienie.'),
              QuizQuestion(id: 'q_k1_18', question: 'Lipidy łączą się z glicerolem wiązaniem:', options: ['Peptydowym', 'Glikozydowym', 'Estrowym', 'Wodorowym'], correctIndex: 2, explanation: 'Kwasy tłuszczowe łączą się z glicerolem wiązaniami estrowymi.'),
              QuizQuestion(id: 'q_k1_19', question: 'Cholesterol należy do grupy:', options: ['Monosacharydów', 'Steroidów', 'Disacharydów', 'Polisacharydów'], correctIndex: 1, explanation: 'Cholesterol to lipid złożony z grupy steroidów.'),
            ],
          ),
          Topic(
            id: 'k1_chemizm_bialka',
            name: 'Białka',
            theory: '''
BUDOWA BIAŁEK
Białka to polimery aminokwasów połączonych wiązaniami peptydowymi. Białka proste zbudowane są wyłącznie z aminokwasów (np. albuminy, globuliny), białka złożone zawierają dodatkowo grupę niebiałkową — np. hemoglobina (grupa hemowa z żelazem).

STRUKTURY PRZESTRZENNE BIAŁEK
Struktura I-rzędowa — liniowa sekwencja aminokwasów w łańcuchu polipeptydowym.
Struktura II-rzędowa — lokalne pofałdowanie łańcucha stabilizowane wiązaniami wodorowymi (α-helisa, harmonijka β).
Struktura III-rzędowa — trójwymiarowe zwinięcie całego łańcucha, stabilizowane m.in. mostkami disiarczkowymi, wiązaniami jonowymi i oddziaływaniami hydrofobowymi.
Struktura IV-rzędowa — połączenie kilku podjednostek (łańcuchów polipeptydowych) w jeden kompleks białkowy (np. hemoglobina — 4 podjednostki).

WPŁYW CZYNNIKÓW NA BIAŁKO
Denaturacja — nieodwracalna zwykle utrata struktury przestrzennej białka pod wpływem wysokiej temperatury, skrajnego pH, metali ciężkich lub promieniowania UV — białko traci swoją funkcję biologiczną, choć sekwencja aminokwasów pozostaje niezmieniona.
Koagulacja — łączenie się (agregacja) zdenaturowanych cząsteczek białka w większe struktury, np. ścinanie się białka jaja kurzego pod wpływem temperatury.

ZNACZENIE BIOLOGICZNE BIAŁEK
Albuminy i globuliny — białka osocza krwi (transport, odporność). Histony — białka strukturalne, wokół których nawija się DNA w chromatynie. Kolagen — białko budulcowe tkanki łącznej, skóry, kości i ścięgien. Keratyna — białko budulcowe naskórka, włosów i paznokci. Hemoglobina — transport tlenu we krwi. Mioglobina — magazynowanie tlenu w mięśniach.
''',
            flashcards: [
              Flashcard(id: 'f_k1_2', front: 'Z czego zbudowane są białka?', back: 'Z aminokwasów połączonych wiązaniami peptydowymi.'),
              Flashcard(id: 'f_k1_3', front: 'Wymień trzy funkcje białek.', back: 'Budulcowa, enzymatyczna, transportowa (także odpornościowa i regulacyjna).'),
            ],
            questions: [
              QuizQuestion(id: 'q_k1_2', question: 'Monomerem białek jest:', options: ['Glukoza', 'Aminokwas', 'Nukleotyd', 'Kwas tłuszczowy'], correctIndex: 1, explanation: 'Białka zbudowane są z aminokwasów połączonych wiązaniami peptydowymi.'),
              QuizQuestion(id: 'q_k1_6', question: 'Które wiązanie łączy ze sobą aminokwasy w białku?', options: ['Glikozydowe', 'Peptydowe', 'Wodorowe', 'Estrowe'], correctIndex: 1, explanation: 'Aminokwasy łączą się wiązaniami peptydowymi.'),
              QuizQuestion(id: 'q_k1_20', question: 'Struktura IV-rzędowa białka to:', options: ['Sekwencja aminokwasów', 'Połączenie kilku podjednostek białkowych', 'Pojedyncza α-helisa', 'Wiązanie peptydowe'], correctIndex: 1, explanation: 'Struktura IV-rzędowa to kompleks kilku łańcuchów polipeptydowych, np. hemoglobina.'),
              QuizQuestion(id: 'q_k1_21', question: 'Denaturacja białka polega na:', options: ['Rozerwaniu wiązań peptydowych', 'Utracie struktury przestrzennej białka', 'Powstaniu nowego aminokwasu', 'Połączeniu dwóch białek wiązaniem glikozydowym'], correctIndex: 1, explanation: 'Denaturacja to utrata struktury przestrzennej (II-IV rzędowej) bez zrywania wiązań peptydowych.'),
              QuizQuestion(id: 'q_k1_22', question: 'Które białko odpowiada za magazynowanie tlenu w mięśniach?', options: ['Hemoglobina', 'Mioglobina', 'Keratyna', 'Kolagen'], correctIndex: 1, explanation: 'Mioglobina magazynuje tlen w tkance mięśniowej.'),
              QuizQuestion(id: 'q_k1_23', question: 'Histony to białka, wokół których nawinięty jest:', options: ['RNA', 'DNA', 'Glikogen', 'Błona komórkowa'], correctIndex: 1, explanation: 'Histony tworzą rdzeń, na który nawija się nić DNA, tworząc nukleosomy.'),
            ],
          ),
          Topic(
            id: 'k1_chemizm_kwasy_nukleinowe',
            name: 'Kwasy nukleinowe',
            theory: '''
BUDOWA KWASÓW NUKLEINOWYCH
Monomerem kwasów nukleinowych jest nukleotyd, zbudowany z cukru pięciowęglowego (pentozy), reszty fosforanowej i zasady azotowej. Nukleotydy łączą się w łańcuch wiązaniami fosfodiestrowymi.

DNA (kwas deoksyrybonukleinowy)
Cukier: deoksyryboza. Zasady azotowe: adenina (A), guanina (G), cytozyna (C), tymina (T). Struktura: podwójna helisa — dwie nici antyrównoległe połączone wiązaniami wodorowymi między komplementarnymi zasadami (A-T dwa wiązania wodorowe, G-C trzy wiązania wodorowe). Funkcja: przechowywanie i przekazywanie informacji genetycznej.

RNA (kwas rybonukleinowy)
Cukier: ryboza. Zasady azotowe: adenina, guanina, cytozyna, uracyl (U) zamiast tyminy. Struktura: zazwyczaj pojedyncza nić. Rodzaje: mRNA (matrycowy — przenosi informację z DNA do rybosomu), tRNA (transportujący — dostarcza aminokwasy podczas translacji), rRNA (rybosomalny — buduje rybosomy).

ZNACZENIE BIOLOGICZNE
Kwasy nukleinowe warunkują przechowywanie, powielanie (replikacja) i ekspresję informacji genetycznej (transkrypcja i translacja), co decyduje o dziedziczeniu cech i syntezie białek w komórce.
''',
            flashcards: [
              Flashcard(id: 'f_k1_6', front: 'Z czego zbudowany jest nukleotyd?', back: 'Z cukru, reszty fosforanowej i zasady azotowej.'),
            ],
            questions: [
              QuizQuestion(id: 'q_k1_5', question: 'Kwasy nukleinowe pełnią funkcję:', options: ['Energetyczną', 'Przechowywania informacji genetycznej', 'Termoregulacyjną', 'Strukturalną w ścianach komórkowych'], correctIndex: 1, explanation: 'DNA i RNA przechowują i przekazują informację genetyczną.'),
              QuizQuestion(id: 'q_k1_24', question: 'Cukrem budującym RNA jest:', options: ['Deoksyryboza', 'Ryboza', 'Glukoza', 'Fruktoza'], correctIndex: 1, explanation: 'RNA zawiera rybozę, DNA — deoksyrybozę.'),
              QuizQuestion(id: 'q_k1_25', question: 'W miejsce tyminy w RNA występuje:', options: ['Cytozyna', 'Uracyl', 'Adenina', 'Guanina'], correctIndex: 1, explanation: 'W RNA tyminę zastępuje uracyl.'),
              QuizQuestion(id: 'q_k1_26', question: 'Ile wiązań wodorowych łączy parę zasad guanina-cytozyna?', options: ['1', '2', '3', '4'], correctIndex: 2, explanation: 'Parę G-C łączą trzy wiązania wodorowe, parę A-T — dwa.'),
              QuizQuestion(id: 'q_k1_27', question: 'Nici DNA w podwójnej helisie są względem siebie:', options: ['Równoległe', 'Antyrównoległe', 'Prostopadłe', 'Skręcone pojedynczo'], correctIndex: 1, explanation: 'Dwie nici DNA biegną w przeciwnych kierunkach (antyrównolegle).'),
            ],
          ),
        ],
      ),
      Chapter(
        id: 'k1_komorka',
        name: 'Komórka',
        topics: [
          Topic(
            id: 'k1_komorka_blona_transport',
            name: 'Błona komórkowa i transport',
            theory: '''
BUDOWA I FUNKCJE BŁONY KOMÓRKOWEJ
Błona komórkowa zbudowana jest z dwuwarstwy fosfolipidowej, w którą wbudowane są białka, cholesterol (stabilizuje płynność błony) oraz glikoproteiny i glikolipidy (rozpoznawanie komórek, receptory). Model płynnej mozaiki opisuje błonę jako strukturę dynamiczną. Budowa ta warunkuje funkcje błony: selektywną przepuszczalność, transport substancji, komunikację międzykomórkową i rozpoznawanie immunologiczne.

RODZAJE TRANSPORTU BŁONOWEGO
Dyfuzja prosta — bierny transport małych, niepolarnych cząsteczek (O2, CO2) zgodnie z gradientem stężeń, bez udziału białek.
Dyfuzja wspomagana — transport bierny z udziałem białek transportowych, zgodnie z gradientem stężeń, bez zużycia ATP (np. transport glukozy).
Transport aktywny — przenoszenie substancji wbrew gradientowi stężeń, wymaga ATP (np. pompa sodowo-potasowa).
Endocytoza — wchłanianie materiału do komórki (fagocytoza — cząstki stałe, pinocytoza — płyny).
Egzocytoza — wydalanie materiału z komórki poprzez zlanie się pęcherzyka z błoną komórkową.

OSMOZA I ROLA TONOPLASTU
Osmoza to dyfuzja wody przez błonę półprzepuszczalną z roztworu o niższym stężeniu do roztworu o wyższym stężeniu substancji rozpuszczonej. Błona komórkowa oraz tonoplast (błona wakuoli roślinnej) regulują ruch wody do i z komórki. W środowisku hipertonicznym komórka roślinna traci wodę, co prowadzi do plazmolizy — odklejenia protoplastu od ściany komórkowej. W środowisku hipotonicznym komórka pobiera wodę (u roślin powstaje turgor, u zwierząt może dojść do lizy).
DOŚWIADCZENIE: zjawisko osmozy obserwuje się, umieszczając tkankę roślinną w roztworach o różnym stężeniu i obserwując zmiany objętości lub plazmolizę pod mikroskopem.
''',
            flashcards: [
              Flashcard(id: 'f_k1_13', front: 'Z czego zbudowana jest błona komórkowa?', back: 'Z dwuwarstwy fosfolipidowej z białkami.'),
            ],
            questions: [
              QuizQuestion(id: 'q_k1_28', question: 'Transport przez błonę wymagający nakładu energii ATP to:', options: ['Dyfuzja prosta', 'Dyfuzja wspomagana', 'Transport aktywny', 'Osmoza'], correctIndex: 2, explanation: 'Transport aktywny przenosi substancje wbrew gradientowi stężeń kosztem ATP.'),
              QuizQuestion(id: 'q_k1_29', question: 'Plazmoliza to:', options: ['Pękanie ściany komórkowej', 'Odklejenie protoplastu od ściany komórkowej wskutek utraty wody', 'Pobieranie wody przez komórkę', 'Rozpad błony komórkowej'], correctIndex: 1, explanation: 'Plazmoliza zachodzi w środowisku hipertonicznym, gdy komórka traci wodę.'),
              QuizQuestion(id: 'q_k1_30', question: 'Fagocytoza jest przykładem:', options: ['Dyfuzji prostej', 'Transportu aktywnego jonów', 'Endocytozy', 'Egzocytozy'], correctIndex: 2, explanation: 'Fagocytoza to wchłanianie cząstek stałych — rodzaj endocytozy.'),
              QuizQuestion(id: 'q_k1_31', question: 'Model błony komórkowej nazywany jest modelem:', options: ['Sztywnej struktury', 'Płynnej mozaiki', 'Podwójnej helisy', 'Jednolitej warstwy'], correctIndex: 1, explanation: 'Model płynnej mozaiki opisuje dynamiczną naturę błony komórkowej.'),
              QuizQuestion(id: 'q_k1_32', question: 'Tonoplast to błona otaczająca:', options: ['Jądro komórkowe', 'Mitochondrium', 'Wakuolę', 'Chloroplast'], correctIndex: 2, explanation: 'Tonoplast otacza wakuolę i reguluje ruch wody do i z niej.'),
            ],
          ),
          Topic(
            id: 'k1_komorka_jadro_rybosomy',
            name: 'Jądro komórkowe i rybosomy',
            theory: '''
JĄDRO KOMÓRKOWE
Otoczone otoczką jądrową (dwie błony z porami jądrowymi umożliwiającymi transport substancji między jądrem a cytoplazmą). Wewnątrz znajduje się chromatyna (DNA połączone z białkami histonowymi) oraz jąderko — miejsce syntezy rRNA i składania podjednostek rybosomów. Jądro kontroluje procesy komórkowe poprzez regulację ekspresji genów oraz przechowuje i replikuje materiał genetyczny.

RYBOSOMY
Zbudowane z dwóch podjednostek (małej i dużej), złożonych z rRNA i białek. Powstają w jąderku, a następnie są transportowane do cytoplazmy przez pory jądrowe. Pełnią funkcję miejsca syntezy białek (translacji). Występują swobodnie w cytoplazmie lub związane z błonami retikulum endoplazmatycznego szorstkiego. Występują też w mitochondriach i chloroplastach (własne rybosomy, mniejsze, podobne do bakteryjnych — argument za endosymbiozą).
''',
            flashcards: [],
            questions: [
              QuizQuestion(id: 'q_k1_33', question: 'Jąderko jest miejscem:', options: ['Produkcji ATP', 'Składania podjednostek rybosomów', 'Syntezy lipidów', 'Replikacji DNA'], correctIndex: 1, explanation: 'W jąderku syntetyzowane jest rRNA i składane są podjednostki rybosomów.'),
              QuizQuestion(id: 'q_k1_34', question: 'Rybosomy zbudowane są z:', options: ['DNA i białek', 'rRNA i białek', 'Fosfolipidów', 'mRNA i DNA'], correctIndex: 1, explanation: 'Rybosomy składają się z rRNA i białek.'),
              QuizQuestion(id: 'q_k1_35', question: 'Pory jądrowe umożliwiają:', options: ['Produkcję ATP', 'Transport substancji między jądrem a cytoplazmą', 'Fotosyntezę', 'Replikację DNA'], correctIndex: 1, explanation: 'Pory jądrowe pozwalają na wymianę substancji między jądrem a cytoplazmą.'),
              QuizQuestion(id: 'q_k1_36', question: 'Chromatyna to połączenie DNA z:', options: ['Lipidami', 'Białkami histonowymi', 'rRNA', 'Glikoproteinami'], correctIndex: 1, explanation: 'Chromatyna to kompleks DNA i białek histonowych.'),
            ],
          ),
          Topic(
            id: 'k1_komorka_system_blon',
            name: 'System błon wewnątrzkomórkowych',
            theory: '''
SYSTEM BŁON WEWNĄTRZKOMÓRKOWYCH
Retikulum endoplazmatyczne szorstkie (z rybosomami na powierzchni) syntetyzuje białka przeznaczone do transportu, wbudowania w błony lub wydzielania. Retikulum endoplazmatyczne gładkie (bez rybosomów) syntetyzuje lipidy, metabolizuje węglowodany i unieszkodliwia toksyny.
Aparat Golgiego odbiera pęcherzyki z ER, modyfikuje, sortuje i pakuje białka oraz lipidy do transportu.
Lizosomy powstają z pęcherzyków odczłonkowanych od aparatu Golgiego, zawierają enzymy hydrolityczne trawiące zbędne lub uszkodzone organelle (autofagia) oraz materiał pobrany na drodze endocytozy.
Wszystkie te struktury tworzą zintegrowany system błon wewnątrzkomórkowych — pęcherzyki transportowe przemieszczają materiał między poszczególnymi elementami tego systemu. Dzięki temu komórka jest podzielona na przedziały (kompartmenty) o odrębnych warunkach chemicznych i funkcjach, co umożliwia jednoczesne zachodzenie różnych, czasem przeciwstawnych procesów metabolicznych.
''',
            flashcards: [
              Flashcard(id: 'f_k1_12', front: 'Jaką funkcję pełnią lizosomy?', back: 'Trawią zużyte organelle i materiał wchłonięty przez komórkę (enzymy trawienne).'),
            ],
            questions: [
              QuizQuestion(id: 'q_k1_10', question: 'Za modyfikację i pakowanie białek odpowiada:', options: ['Aparat Golgiego', 'Lizosom', 'Rybosom', 'Wakuola'], correctIndex: 0, explanation: 'Aparat Golgiego modyfikuje, sortuje i pakuje białka do transportu.'),
              QuizQuestion(id: 'q_k1_11', question: 'Retikulum endoplazmatyczne szorstkie zawdzięcza nazwę obecności:', options: ['Chlorofilu', 'Rybosomów', 'Lizosomów', 'DNA'], correctIndex: 1, explanation: 'ER szorstkie ma na powierzchni rybosomy syntetyzujące białka.'),
              QuizQuestion(id: 'q_k1_37', question: 'Kompartmentacja komórki oznacza:', options: ['Brak organelli', 'Podział komórki na przedziały o odrębnych funkcjach', 'Łączenie się komórek w tkanki', 'Rozpad błony komórkowej'], correctIndex: 1, explanation: 'Kompartmentacja to podział komórki na wyspecjalizowane przedziały.'),
              QuizQuestion(id: 'q_k1_38', question: 'Lizosomy powstają z pęcherzyków pochodzących od:', options: ['Jądra komórkowego', 'Aparatu Golgiego', 'Mitochondrium', 'Ściany komórkowej'], correctIndex: 1, explanation: 'Lizosomy odczłonkowują się od aparatu Golgiego.'),
            ],
          ),
          Topic(
            id: 'k1_komorka_mitochondria_plastydy',
            name: 'Mitochondria i plastydy',
            theory: '''
BUDOWA MITOCHONDRIUM
Otoczone dwiema błonami: zewnętrzną (gładką) i wewnętrzną (silnie pofałdowaną w grzebienie mitochondrialne). Wnętrze wypełnia matriks, zawierająca własne DNA, rybosomy oraz enzymy cyklu Krebsa. Miejsce zachodzenia oddychania komórkowego i produkcji ATP.

BUDOWA PLASTYDÓW (chloroplasty)
Chloroplasty otoczone są dwiema błonami, wewnątrz znajduje się stroma (faza niezależna od światła) oraz system błon tylakoidów (ułożonych w grana), zawierających chlorofil — tu zachodzi faza zależna od światła. Chloroplasty posiadają własne DNA i rybosomy. Inne plastydy: chromoplasty (barwniki, np. w owocach), leukoplasty (bezbarwne, magazynowanie skrobi — amyloplasty).

TEORIA ENDOSYMBIOZY
Mitochondria i chloroplasty prawdopodobnie powstały z wolno żyjących bakterii, wchłoniętych przez większą komórkę prekursorową i przetrwałych jako endosymbionty. Argumenty: własne, koliste DNA, własne rybosomy typu 70S, podwójna błona, zdolność do samodzielnego podziału, podobna wielkość do bakterii.
''',
            flashcards: [
              Flashcard(id: 'f_k1_10', front: 'Jaka jest funkcja mitochondrium?', back: 'Produkcja ATP w procesie oddychania komórkowego.'),
              Flashcard(id: 'f_k1_11', front: 'Co znajduje się w chloroplastach?', back: 'Chlorofil i własne DNA — miejsce zachodzenia fotosyntezy.'),
            ],
            questions: [
              QuizQuestion(id: 'q_k1_7', question: 'Które organellum jest nazywane "elektrownią komórki"?', options: ['Jądro', 'Mitochondrium', 'Aparat Golgiego', 'Lizosom'], correctIndex: 1, explanation: 'Mitochondrium produkuje ATP w procesie oddychania komórkowego.'),
              QuizQuestion(id: 'q_k1_9', question: 'Fotosynteza zachodzi w:', options: ['Mitochondriach', 'Chloroplastach', 'Lizosomach', 'Jądrze'], correctIndex: 1, explanation: 'Chloroplasty zawierają chlorofil i są miejscem fotosyntezy.'),
              QuizQuestion(id: 'q_k1_39', question: 'Grzebienie mitochondrialne zwiększają powierzchnię dla:', options: ['Fotosyntezy', 'Reakcji łańcucha oddechowego', 'Replikacji DNA', 'Syntezy białek'], correctIndex: 1, explanation: 'Grzebienie zwiększają powierzchnię błony wewnętrznej dla łańcucha oddechowego.'),
              QuizQuestion(id: 'q_k1_40', question: 'Argumentem za endosymbiotycznym pochodzeniem mitochondriów NIE jest:', options: ['Własne koliste DNA', 'Rybosomy 70S', 'Brak błony', 'Zdolność do samodzielnego podziału'], correctIndex: 2, explanation: 'Mitochondria mają podwójną błonę — brak błony nie jest cechą prawdziwą ani argumentem.'),
              QuizQuestion(id: 'q_k1_41', question: 'Amyloplasty to plastydy magazynujące:', options: ['Chlorofil', 'Skrobię', 'Barwniki kwiatów', 'DNA'], correctIndex: 1, explanation: 'Amyloplasty to leukoplasty magazynujące skrobię.'),
            ],
          ),
          Topic(
            id: 'k1_komorka_sciana_wakuola_cytoszkielet',
            name: 'Ściana komórkowa, wakuola i cytoszkielet',
            theory: '''
ŚCIANA KOMÓRKOWA
Sztywna struktura zewnętrzna, nadająca kształt komórce i chroniąca ją przed uszkodzeniami mechanicznymi oraz nadmiernym pęcznieniem. Występuje u roślin (celuloza), grzybów (chityna) oraz bakterii (mureina). Komórki zwierzęce nie mają ściany komórkowej.

WAKUOLA
Duży, otoczony tonoplastem zbiornik wypełniony sokiem komórkowym, charakterystyczny zwłaszcza dla dojrzałych komórek roślinnych. Funkcje: magazynowanie wody, jonów, barwników i produktów przemiany materii, utrzymywanie turgoru komórki, a czasem trawienie wewnątrzkomórkowe.

CYTOSZKIELET
Sieć białkowych włókien w cytoplazmie: mikrofilamenty (aktynowe — ruch komórki, skurcz), mikrotubule (najgrubsze — wrzeciono podziałowe, rzęski i wici, transport wewnątrzkomórkowy) oraz filamenty pośrednie (stabilizacja mechaniczna). Cytoszkielet odpowiada za kształt komórki, jej ruch, transport wewnątrzkomórkowy organelli oraz rozdział chromosomów podczas podziału.
OBSERWACJA: ruchy cytoplazmy (cyklozę) można zaobserwować pod mikroskopem np. w komórkach liścia moczarki kanadyjskiej.
''',
            flashcards: [],
            questions: [
              QuizQuestion(id: 'q_k1_42', question: 'Główny składnik ściany komórkowej grzybów to:', options: ['Celuloza', 'Chityna', 'Mureina', 'Keratyna'], correctIndex: 1, explanation: 'Ściana komórkowa grzybów zbudowana jest z chityny.'),
              QuizQuestion(id: 'q_k1_43', question: 'Wakuola u dojrzałej komórki roślinnej odpowiada głównie za:', options: ['Fotosyntezę', 'Utrzymanie turgoru komórki', 'Produkcję ATP', 'Syntezę białek'], correctIndex: 1, explanation: 'Wakuola magazynuje wodę i utrzymuje ciśnienie turgorowe.'),
              QuizQuestion(id: 'q_k1_44', question: 'Za budowę wrzeciona podziałowego odpowiadają:', options: ['Mikrofilamenty', 'Mikrotubule', 'Filamenty pośrednie', 'Rybosomy'], correctIndex: 1, explanation: 'Mikrotubule budują wrzeciono podziałowe.'),
              QuizQuestion(id: 'q_k1_45', question: 'Komórki zwierzęce nie posiadają:', options: ['Błony komórkowej', 'Mitochondriów', 'Ściany komórkowej', 'Cytoszkieletu'], correctIndex: 2, explanation: 'Komórki zwierzęce nie mają ściany komórkowej.'),
            ],
          ),
          Topic(
            id: 'k1_komorka_prokariotyczna_eukariotyczna',
            name: 'Komórka prokariotyczna i eukariotyczna',
            theory: '''
KOMÓRKA PROKARIOTYCZNA A EUKARIOTYCZNA
Komórka prokariotyczna (bakterie, archeowce): brak jądra komórkowego otoczonego błoną (materiał genetyczny w nukleoidzie), brak organelli błoniastych, mniejsze rybosomy (70S), zazwyczaj mniejsze rozmiary.
Komórka eukariotyczna (rośliny, zwierzęta, grzyby, protisty): posiada jądro komórkowe otoczone otoczką jądrową, liczne organelle błoniaste, większe rybosomy (80S), liniowe DNA związane z histonami w chromatynę.

RÓŻNICE MIĘDZY KOMÓRKĄ ROŚLINNĄ, GRZYBOWĄ I ZWIERZĘCĄ
Komórka roślinna: ściana komórkowa (celuloza), duża centralna wakuola, chloroplasty, zapasowy węglowodan — skrobia.
Komórka grzybowa: ściana komórkowa (chityna), zwykle mniejsze wakuole, brak chloroplastów, zapasowy węglowodan — glikogen.
Komórka zwierzęca: brak ściany komórkowej, małe, liczne wakuole lub ich brak, brak chloroplastów, zapasowy węglowodan — glikogen, obecne centriole.
''',
            flashcards: [
              Flashcard(id: 'f_k1_9', front: 'Czym różni się komórka prokariotyczna od eukariotycznej?', back: 'Prokariotyczna nie ma jądra komórkowego otoczonego błoną ani organelli błoniastych.'),
            ],
            questions: [
              QuizQuestion(id: 'q_k1_8', question: 'Komórka prokariotyczna NIE posiada:', options: ['Rybosomów', 'Błony komórkowej', 'Jądra komórkowego', 'Cytoplazmy'], correctIndex: 2, explanation: 'Prokariota nie mają jądra otoczonego błoną — materiał genetyczny jest w nukleoidzie.'),
              QuizQuestion(id: 'q_k1_46', question: 'Rybosomy komórki prokariotycznej mają współczynnik sedymentacji:', options: ['80S', '70S', '60S', '40S'], correctIndex: 1, explanation: 'Rybosomy prokariotyczne to 70S, eukariotyczne — 80S.'),
              QuizQuestion(id: 'q_k1_47', question: 'Zapasowym węglowodanem u grzybów jest:', options: ['Skrobia', 'Celuloza', 'Glikogen', 'Chityna'], correctIndex: 2, explanation: 'Grzyby magazynują glikogen, podobnie jak zwierzęta.'),
              QuizQuestion(id: 'q_k1_48', question: 'Centriole, biorące udział w organizacji wrzeciona podziałowego, występują typowo w komórce:', options: ['Roślinnej', 'Grzybowej', 'Zwierzęcej', 'Bakteryjnej'], correctIndex: 2, explanation: 'Centriole są typowe dla komórek zwierzęcych.'),
            ],
          ),
        ],
      ),
      Chapter(
        id: 'k1_metabolizm',
        name: 'Energia i metabolizm',
        topics: [
          Topic(
            id: 'k1_metabolizm_podstawy',
            name: 'Podstawy metabolizmu i przenośniki energii',
            theory: '''
PODSTAWOWE POJĘCIA METABOLIZMU
Metabolizm to ogół reakcji chemicznych zachodzących w komórce, zorganizowanych w szlaki metaboliczne (liniowe ciągi reakcji) i cykle metaboliczne (szlak, w którym produkt ostatniej reakcji regeneruje substrat pierwszej, np. cykl Krebsa).
Katabolizm — rozkład związków złożonych na prostsze, z uwolnieniem energii (np. oddychanie komórkowe).
Anabolizm — synteza związków złożonych z prostszych, z wykorzystaniem energii (np. fotosynteza, synteza białek).
Procesy te są ze sobą powiązane: energia uwolniona w reakcjach katabolicznych (zmagazynowana w ATP) napędza reakcje anaboliczne.

PRZENOŚNIKI ENERGII ORAZ PROTONÓW I ELEKTRONÓW
ATP (adenozynotrifosforan) zbudowany jest z adeniny, rybozy i trzech reszt fosforanowych połączonych wiązaniami wysokoenergetycznymi. Hydroliza końcowego wiązania fosforanowego (do ADP + Pi) uwalnia energię wykorzystywaną w reakcjach komórkowych.
NAD+, FAD i NADP+ to przenośniki elektronów i protonów, biorące udział w reakcjach utleniania i redukcji. Przyjmując elektrony i protony, przechodzą w formę zredukowaną (NADH, FADH2, NADPH), która przekazuje je dalej, magazynując energię chemiczną.
''',
            flashcards: [],
            questions: [
              QuizQuestion(id: 'q_k1_49', question: 'Katabolizm to procesy:', options: ['Syntezy złożonych związków', 'Rozkładu związków z uwolnieniem energii', 'Wyłącznie zachodzące w chloroplastach', 'Niezwiązane z ATP'], correctIndex: 1, explanation: 'Katabolizm rozkłada złożone związki, uwalniając energię.'),
              QuizQuestion(id: 'q_k1_50', question: 'ATP zbudowany jest z adeniny, rybozy i:', options: ['Jednej reszty fosforanowej', 'Dwóch reszt fosforanowych', 'Trzech reszt fosforanowych', 'Czterech reszt fosforanowych'], correctIndex: 2, explanation: 'ATP zawiera trzy reszty fosforanowe połączone wiązaniami wysokoenergetycznymi.'),
              QuizQuestion(id: 'q_k1_51', question: 'NAD+ i FAD pełnią funkcję:', options: ['Enzymów trawiennych', 'Przenośników elektronów i protonów', 'Hormonów', 'Białek strukturalnych'], correctIndex: 1, explanation: 'To przenośniki biorące udział w reakcjach redoks.'),
              QuizQuestion(id: 'q_k1_52', question: 'Cykl metaboliczny różni się od szlaku liniowego tym, że:', options: ['Nie zachodzi w komórce', 'Produkt ostatniej reakcji regeneruje substrat pierwszej', 'Nie wymaga enzymów', 'Zachodzi wyłącznie w jądrze'], correctIndex: 1, explanation: 'W cyklu metabolicznym substrat początkowy jest odtwarzany na końcu, np. w cyklu Krebsa.'),
            ],
          ),
          Topic(
            id: 'k1_metabolizm_enzymy',
            name: 'Enzymy',
            theory: '''
BUDOWA I DZIAŁANIE ENZYMÓW
Enzymy to białkowe biokatalizatory przyspieszające reakcje chemiczne poprzez obniżenie energii aktywacji. Posiadają centrum aktywne — miejsce o specyficznym kształcie, do którego dopasowuje się substrat. Ta komplementarność kształtu odpowiada za swoistość substratową enzymu.

REGULACJA AKTYWNOŚCI ENZYMÓW
Aktywacja — zwiększenie aktywności enzymu przez aktywator. Inhibicja — zmniejszenie aktywności enzymu: kompetycyjna (inhibitor rywalizuje o centrum aktywne) oraz niekompetycyjna (inhibitor wiąże się w innym miejscu, zmieniając kształt centrum aktywnego).
Sprzężenie zwrotne ujemne — końcowy produkt szlaku metabolicznego hamuje enzym katalizujący wcześniejszy etap tego szlaku — zapobiega nadprodukcji i utrzymuje homeostazę komórki.

WPŁYW CZYNNIKÓW FIZYKOCHEMICZNYCH NA KATALIZĘ ENZYMATYCZNĄ
Temperatura — aktywność rośnie do optimum, powyżej którego enzym ulega denaturacji.
pH — każdy enzym ma optymalne pH (np. pepsyna działa w kwaśnym środowisku żołądka, trypsyna w zasadowym środowisku jelita).
Stężenie substratu — wzrost stężenia zwiększa szybkość reakcji do wysycenia enzymu.
DOŚWIADCZENIE: aktywność katalazy (rozkładającej nadtlenek wodoru) bada się, obserwując intensywność pienienia w różnych warunkach; podobnie bada się aktywność proteinazy, obserwując tempo trawienia białka.
''',
            flashcards: [],
            questions: [
              QuizQuestion(id: 'q_k1_53', question: 'Miejsce enzymu, do którego dopasowuje się substrat, nazywamy:', options: ['Centrum aktywnym', 'Rdzeniem katalitycznym', 'Mostkiem disiarczkowym', 'Centrum regulatorowym'], correctIndex: 0, explanation: 'Centrum aktywne to miejsce wiązania substratu.'),
              QuizQuestion(id: 'q_k1_54', question: 'Inhibicja kompetycyjna polega na tym, że inhibitor:', options: ['Wiąże się z produktem reakcji', 'Rywalizuje z substratem o centrum aktywne', 'Zwiększa temperaturę reakcji', 'Jest identyczny z enzymem'], correctIndex: 1, explanation: 'Inhibitor kompetycyjny przypomina substrat i konkuruje o centrum aktywne.'),
              QuizQuestion(id: 'q_k1_55', question: 'Sprzężenie zwrotne ujemne w szlaku metabolicznym polega na tym, że:', options: ['Produkt końcowy aktywuje pierwszy enzym szlaku', 'Produkt końcowy hamuje enzym wcześniejszego etapu szlaku', 'Substrat hamuje własny rozkład', 'Enzymy nie podlegają regulacji'], correctIndex: 1, explanation: 'To mechanizm zapobiegający nadprodukcji produktu końcowego.'),
              QuizQuestion(id: 'q_k1_56', question: 'Pepsyna osiąga najwyższą aktywność w środowisku:', options: ['Silnie kwaśnym', 'Obojętnym', 'Silnie zasadowym', 'Zależnym wyłącznie od temperatury'], correctIndex: 0, explanation: 'Pepsyna działa w kwaśnym środowisku żołądka.'),
              QuizQuestion(id: 'q_k1_57', question: 'Powyżej optymalnej temperatury aktywność enzymu spada, ponieważ:', options: ['Substrat się rozkłada', 'Enzym ulega denaturacji', 'Produkt hamuje reakcję', 'Enzym zmienia swoistość substratową'], correctIndex: 1, explanation: 'Zbyt wysoka temperatura powoduje denaturację enzymu.'),
            ],
          ),
          Topic(
            id: 'k1_metabolizm_fotosynteza',
            name: 'Fotosynteza',
            theory: '''
FOTOSYNTEZA — ZWIĄZEK BUDOWY Z FUNKCJĄ
Fotosynteza zachodzi w chloroplastach — błony tylakoidów (ułożone w grana) zawierają barwniki i białka fotosystemów, co umożliwia zachodzenie tu fazy zależnej od światła; stroma zawiera enzymy cyklu Calvina (faza niezależna od światła).

BARWNIKI I FOTOSYSTEMY
Chlorofil a i b oraz karotenoidy pochłaniają energię światła o różnych długościach fali (karotenoidy dodatkowo chronią przed nadmiarem energii — fotoprotekcja). Barwniki są zorganizowane w fotosystemy (I i II), które wychwytują energię świetlną i przekazują ją do centrum reakcji.

FAZA ZALEŻNA OD ŚWIATŁA (faza jasna)
Zachodzi w błonach tylakoidów. W fotosystemie II energia świetlna wybija elektrony z chlorofilu, a fotoliza wody uzupełnia ich ubytek, uwalniając tlen. Elektrony przemieszczają się łańcuchem przenośników (fotofosforylacja niecykliczna), tworząc gradient protonowy wykorzystywany do syntezy ATP w procesie chemiosmozy. Elektrony trafiają do fotosystemu I, skąd redukują NADP+ do NADPH. Produkty: ATP, NADPH i tlen.

FAZA NIEZALEŻNA OD ŚWIATŁA (cykl Calvina)
Zachodzi w stromie. Wykorzystuje ATP i NADPH (siłę asymilacyjną) z fazy jasnej do związania CO2 i przekształcenia go w glukozę.

RÓWNANIE SUMARYCZNE FOTOSYNTEZY
6CO2 + 6H2O + energia świetlna → C6H12O6 + 6O2
''',
            flashcards: [
              Flashcard(id: 'f_k1_17', front: 'Jakie produkty daje faza jasna fotosyntezy?', back: 'ATP, NADPH i tlen (z rozkładu wody).'),
              Flashcard(id: 'f_k1_18', front: 'Gdzie zachodzi cykl Calvina?', back: 'W stromie chloroplastu (faza ciemna fotosyntezy).'),
              Flashcard(id: 'f_k1_19', front: 'Podaj sumaryczne równanie fotosyntezy.', back: '6CO2 + 6H2O + energia świetlna → C6H12O6 + 6O2'),
            ],
            questions: [
              QuizQuestion(id: 'q_k1_58', question: 'Faza jasna fotosyntezy zachodzi w:', options: ['Stromie chloroplastu', 'Błonach tylakoidów', 'Mitochondrium', 'Cytoplazmie'], correctIndex: 1, explanation: 'Reakcje fazy jasnej zachodzą w błonach tylakoidów.'),
              QuizQuestion(id: 'q_k1_59', question: 'Substratami fotosyntezy są:', options: ['Glukoza i tlen', 'CO2 i woda', 'ATP i NADPH', 'Kwas mlekowy i CO2'], correctIndex: 1, explanation: 'Fotosynteza wykorzystuje CO2 i wodę do produkcji glukozy i tlenu.'),
              QuizQuestion(id: 'q_k1_60', question: 'Fotoliza wody zachodzi w fotosystemie:', options: ['I', 'II', 'Obu jednocześnie w stromie', 'Nie dotyczy fotosystemów'], correctIndex: 1, explanation: 'Fotoliza wody uzupełnia elektrony wybite z fotosystemu II.'),
              QuizQuestion(id: 'q_k1_61', question: 'Siła asymilacyjna to:', options: ['ATP i NADPH wytworzone w fazie jasnej', 'Tylko ATP', 'Tylko chlorofil', 'CO2 i woda'], correctIndex: 0, explanation: 'Siłą asymilacyjną nazywamy ATP i NADPH wykorzystywane w cyklu Calvina.'),
              QuizQuestion(id: 'q_k1_62', question: 'Karotenoidy w fotosyntezie pełnią rolę:', options: ['Wyłącznie strukturalną', 'Dodatkowych barwników i ochrony przed nadmiarem światła', 'Enzymów cyklu Calvina', 'Przenośników elektronów w mitochondrium'], correctIndex: 1, explanation: 'Karotenoidy poszerzają zakres pochłanianego światła i chronią przed jego nadmiarem.'),
            ],
          ),
          Topic(
            id: 'k1_metabolizm_oddychanie',
            name: 'Oddychanie komórkowe i fermentacje',
            theory: '''
ODDYCHANIE KOMÓRKOWE — ETAPY
Glikoliza — zachodzi w cytoplazmie, nie wymaga tlenu. Substrat: glukoza. Produkty: 2 pirogroniany, 2 ATP (netto) i 2 NADH.
Reakcja pomostowa — zachodzi w matriks mitochondrium; pirogronian przekształcany jest w acetylo-CoA, z uwolnieniem CO2 i wytworzeniem NADH.
Cykl Krebsa — zachodzi w matriks mitochondrium. Substrat: acetylo-CoA. Produkty (na jeden obrót): 2 CO2, 3 NADH, 1 FADH2 oraz 1 ATP powstały w procesie fosforylacji substratowej (bezpośrednie przeniesienie grupy fosforanowej na ADP, bez łańcucha oddechowego).
Łańcuch oddechowy i fosforylacja oksydacyjna — zachodzi na błonie wewnętrznej mitochondrium. Elektrony z NADH i FADH2 są przekazywane wzdłuż łańcucha przenośników, a energia pompuje protony do przestrzeni międzybłonowej. Protony wracają do matriks przez syntazę ATP (chemiosmoza), napędzając syntezę ATP — łącznie ok. 36-38 ATP z jednej cząsteczki glukozy.

FERMENTACJE A ODDYCHANIE TLENOWE
Bez tlenu pirogronian z glikolizy jest przekształcany w fermentacji: mleczanowej (mięśnie, bakterie) — kwas mlekowy; alkoholowej (drożdże) — etanol i CO2. Obie regenerują NAD+ dla glikolizy, ale nie dają dodatkowego ATP poza tym z glikolizy.
Oddychanie tlenowe dostarcza więcej energii, ponieważ substrat energetyczny zostaje całkowicie utleniony do CO2 i wody, a tlen jako końcowy akceptor elektronów umożliwia pełne wykorzystanie NADH/FADH2; w warunkach beztlenowych proces kończy się na glikolizie.

GLUKONEOGENEZA I GLIKOGENOLIZA
Glukoneogeneza — synteza glukozy z substratów niecukrowych (mleczan, aminokwasy, glicerol), głównie w wątrobie. Glikogenoliza — rozkład zapasowego glikogenu do glukozy, uruchamiany np. przez glukagon. Oba procesy utrzymują stały poziom glukozy we krwi.
''',
            flashcards: [
              Flashcard(id: 'f_k1_14', front: 'Ile ATP powstaje w glikolizie?', back: '2 cząsteczki ATP (netto), w cytoplazmie, bez udziału tlenu.'),
              Flashcard(id: 'f_k1_15', front: 'Gdzie zachodzi cykl Krebsa?', back: 'W matriks mitochondrium.'),
              Flashcard(id: 'f_k1_16', front: 'Jaki jest produkt fermentacji mleczanowej?', back: 'Kwas mlekowy.'),
              Flashcard(id: 'f_k1_20', front: 'Ile ATP powstaje łącznie w pełnym oddychaniu tlenowym glukozy?', back: 'Ok. 36-38 ATP.'),
            ],
            questions: [
              QuizQuestion(id: 'q_k1_63', question: 'Glikoliza zachodzi w:', options: ['Mitochondrium', 'Cytoplazmie', 'Chloroplaście', 'Jądrze komórkowym'], correctIndex: 1, explanation: 'Glikoliza to proces cytoplazmatyczny, niewymagający tlenu.'),
              QuizQuestion(id: 'q_k1_64', question: 'Produktem fermentacji alkoholowej jest:', options: ['Kwas mlekowy i CO2', 'Etanol i CO2', 'Glukoza i tlen', 'ATP i woda'], correctIndex: 1, explanation: 'Drożdże w warunkach beztlenowych produkują etanol i CO2.'),
              QuizQuestion(id: 'q_k1_65', question: 'Największa ilość ATP w oddychaniu tlenowym powstaje w:', options: ['Glikolizie', 'Cyklu Krebsa', 'Łańcuchu oddechowym', 'Fermentacji'], correctIndex: 2, explanation: 'Łańcuch oddechowy (fosforylacja oksydacyjna) generuje najwięcej ATP.'),
              QuizQuestion(id: 'q_k1_66', question: 'Fosforylacja substratowa zachodzi w:', options: ['Łańcuchu oddechowym', 'Cyklu Krebsa i glikolizie', 'Fazie jasnej fotosyntezy', 'Wyłącznie w reakcji pomostowej'], correctIndex: 1, explanation: 'Fosforylacja substratowa to bezpośrednie wytworzenie ATP w glikolizie i cyklu Krebsa.'),
              QuizQuestion(id: 'q_k1_67', question: 'Glukoneogeneza to proces:', options: ['Rozkładu glikogenu do glukozy', 'Syntezy glukozy z substratów niecukrowych', 'Rozkładu glukozy w glikolizie', 'Syntezy glikogenu z glukozy'], correctIndex: 1, explanation: 'Glukoneogeneza tworzy glukozę np. z mleczanu, aminokwasów czy glicerolu.'),
              QuizQuestion(id: 'q_k1_68', question: 'Dlaczego oddychanie tlenowe dostarcza więcej energii niż fermentacja?', options: ['Bo zachodzi szybciej', 'Bo substrat energetyczny zostaje całkowicie utleniony do CO2 i wody', 'Bo nie wymaga enzymów', 'Bo zachodzi w cytoplazmie'], correctIndex: 1, explanation: 'Pełne utlenienie substratu w obecności tlenu uwalnia znacznie więcej energii.'),
            ],
          ),
        ],
      ),
      Chapter(
        id: 'k1_podzialy',
        name: 'Podziały komórkowe',
        topics: [
          Topic(
            id: 'k1_podzialy_dna_cykl',
            name: 'Materiał genetyczny, replikacja DNA i cykl komórkowy',
            theory: '''
ORGANIZACJA MATERIAŁU GENETYCZNEGO
DNA w komórce eukariotycznej występuje jako chromatyna — kompleks DNA z białkami histonowymi. Nić DNA nawija się na oktamery histonowe, tworząc nukleosomy, które ulegają dalszej kondensacji, tworząc włókno chromatynowe, a przed podziałem komórki — silnie skondensowane chromosomy.

REPLIKACJA DNA
Replikacja to powielanie DNA, zachodzące w fazie S cyklu komórkowego. Helikaza rozplata podwójną helisę, rozrywając wiązania wodorowe między niciami; prymaza syntetyzuje starter RNA; polimeraza DNA dobudowuje nową nić komplementarną do nici matrycowej; ligaza łączy fragmenty Okazaki na nici opóźnionej w ciągłą nić. Replikacja jest semikonserwatywna — każda z dwóch powstałych cząsteczek DNA zawiera jedną nić starą i jedną nowo zsyntetyzowaną.

CYKL KOMÓRKOWY
Interfaza: faza G1 (wzrost komórki, ilość DNA = 2n), faza S (replikacja DNA, ilość DNA rośnie do 4n), faza G2 (przygotowanie do podziału, ilość DNA nadal 4n). Faza M (mitotyczna): podział jądra i cytoplazmy, po którym ilość DNA w komórkach potomnych wraca do 2n.
Replikacja DNA musi poprzedzać podział komórki, ponieważ tylko wtedy każda komórka potomna może otrzymać pełny, identyczny zestaw materiału genetycznego.
''',
            flashcards: [],
            questions: [
              QuizQuestion(id: 'q_k1_69', question: 'Enzym rozplatający podwójną helisę DNA podczas replikacji to:', options: ['Polimeraza DNA', 'Helikaza', 'Ligaza', 'Prymaza'], correctIndex: 1, explanation: 'Helikaza rozrywa wiązania wodorowe między niciami DNA.'),
              QuizQuestion(id: 'q_k1_70', question: 'Fragmenty Okazaki są łączone przez:', options: ['Helikazę', 'Prymazę', 'Ligazę', 'Polimerazę RNA'], correctIndex: 2, explanation: 'Ligaza zszywa fragmenty Okazaki w ciągłą nić.'),
              QuizQuestion(id: 'q_k1_71', question: 'Replikacja DNA zachodzi w fazie cyklu komórkowego:', options: ['G1', 'S', 'G2', 'M'], correctIndex: 1, explanation: 'Faza S to faza syntezy (replikacji) DNA.'),
              QuizQuestion(id: 'q_k1_72', question: 'Replikację DNA nazywamy semikonserwatywną, ponieważ:', options: ['Powstaje z niej wyłącznie RNA', 'Każda nowa cząsteczka DNA zawiera jedną nić starą i jedną nową', 'Zachodzi tylko raz w życiu komórki', 'Nie wymaga enzymów'], correctIndex: 1, explanation: 'Każda z dwóch cząsteczek potomnych ma jedną nić matczyną i jedną nowo zsyntetyzowaną.'),
              QuizQuestion(id: 'q_k1_73', question: 'Ilość DNA w komórce jest największa w fazie:', options: ['G1', 'S (w trakcie)', 'G2', 'Telofazie po podziale'], correctIndex: 2, explanation: 'Po zakończeniu fazy S ilość DNA (4n) utrzymuje się przez fazę G2, aż do podziału.'),
            ],
          ),
          Topic(
            id: 'k1_podzialy_mitoza_mejoza',
            name: 'Mitoza, mejoza i ich znaczenie',
            theory: '''
MITOZA
Podział jądra prowadzący do powstania dwóch identycznych komórek potomnych (2n → 2n). Etapy: profaza (kondensacja chromosomów, zanik otoczki jądrowej, formowanie wrzeciona), metafaza (chromosomy w płaszczyźnie równikowej), anafaza (chromatydy siostrzane rozchodzą się do biegunów), telofaza (dekondensacja, odtworzenie otoczek jądrowych, cytokineza). Znaczenie: wzrost i regeneracja tkanek, rozmnażanie bezpłciowe, zachowanie liczby chromosomów w komórkach somatycznych.

MEJOZA
Podział redukcyjny prowadzący do powstania czterech komórek z połową liczby chromosomów (2n → n) — podstawa produkcji gamet. Mejoza I — podział redukcyjny, rozdzielenie chromosomów homologicznych, w profazie I zachodzi crossing-over. Mejoza II — podział ekwacyjny (jak mitoza), rozdzielenie chromatyd siostrzanych. Znaczenie: utrzymanie stałej liczby chromosomów gatunku oraz generowanie zmienności genetycznej.

ŹRÓDŁA ZMIENNOŚCI REKOMBINACYJNEJ
Crossing-over — wymiana odcinków chromatyd między chromosomami homologicznymi w profazie I mejozy.
Niezależna segregacja chromosomów — losowe rozdzielenie par chromosomów homologicznych w mejozie I, generujące wiele kombinacji chromosomów w gametach.
Oba mechanizmy są głównym źródłem zmienności rekombinacyjnej, zwiększającej różnorodność potomstwa.

APOPTOZA
Zaprogramowana, kontrolowana śmierć komórki, przebiegająca bez uszkadzania sąsiednich komórek. Warunkuje prawidłowy rozwój (np. zanik błon międzypalcowych) i funkcjonowanie organizmów wielokomórkowych (eliminacja komórek zainfekowanych lub nowotworowych).
''',
            flashcards: [],
            questions: [
              QuizQuestion(id: 'q_k1_74', question: 'W wyniku mitozy powstają komórki:', options: ['Haploidalne, różne genetycznie', 'Diploidalne, identyczne genetycznie', '4 komórki haploidalne', 'Wyłącznie gamety'], correctIndex: 1, explanation: 'Mitoza daje dwie identyczne genetycznie komórki diploidalne.'),
              QuizQuestion(id: 'q_k1_75', question: 'Crossing-over zachodzi w:', options: ['Profazie mitozy', 'Profazie I mejozy', 'Telofazie mitozy', 'Anafazie II mejozy'], correctIndex: 1, explanation: 'Crossing-over zachodzi między chromosomami homologicznymi w profazie I mejozy.'),
              QuizQuestion(id: 'q_k1_76', question: 'Chromatydy siostrzane rozdzielają się do przeciwległych biegunów komórki w:', options: ['Profazie', 'Metafazie', 'Anafazie', 'Telofazie'], correctIndex: 2, explanation: 'W anafazie chromatydy siostrzane rozchodzą się do biegunów komórki.'),
              QuizQuestion(id: 'q_k1_77', question: 'Mejoza prowadzi do powstania:', options: ['2 komórek diploidalnych', '4 komórek haploidalnych', '2 komórek haploidalnych', '4 komórek diploidalnych'], correctIndex: 1, explanation: 'Mejoza daje cztery komórki haploidalne (gamety).'),
              QuizQuestion(id: 'q_k1_78', question: 'Apoptoza różni się od martwicy tym, że:', options: ['Jest procesem niekontrolowanym', 'Uszkadza sąsiednie komórki', 'Jest kontrolowanym, zaprogramowanym procesem', 'Zachodzi wyłącznie w komórkach nowotworowych'], correctIndex: 2, explanation: 'Apoptoza to zaprogramowana, kontrolowana śmierć komórki.'),
              QuizQuestion(id: 'q_k1_79', question: 'Niezależna segregacja chromosomów homologicznych zachodzi w:', options: ['Metafazie i anafazie I mejozy', 'Profazie mitozy', 'Telofazie II mejozy', 'Interfazie'], correctIndex: 0, explanation: 'Niezależna segregacja chromosomów homologicznych zachodzi podczas mejozy I.'),
            ],
          ),
        ],
      ),
      Chapter(
        id: 'k1_klasyfikacja',
        name: 'Zasady klasyfikacji i identyfikacji organizmów',
        topics: [
          Topic(
            id: 'k1_klasyfikacja_filogenetyka',
            name: 'Kladogramy, filogenetyka i rangi taksonomiczne',
            theory: '''
KLADOGRAMY I POKREWIEŃSTWO EWOLUCYJNE
Kladogram to drzewiaste, schematyczne przedstawienie pokrewieństwa filogenetycznego organizmów, w którym punkty rozgałęzień (węzły) reprezentują wspólnych przodków. Im bliżej wspólnego węzła znajdują się dwie grupy, tym są bliżej spokrewnione ewolucyjnie — o pokrewieństwie świadczy kolejność i układ rozgałęzień, a nie kolejność gatunków na końcach gałęzi.

GRUPY MONOFILETYCZNE, PARAFILETYCZNE I POLIFILETYCZNE
Grupa monofiletyczna (klad) — obejmuje wspólnego przodka i WSZYSTKICH jego potomków.
Grupa parafiletyczna — obejmuje wspólnego przodka i tylko CZĘŚĆ jego potomków (np. tradycyjnie wydzielane „gady” bez ptaków).
Grupa polifiletyczna — obejmuje organizmy o podobnych cechach, niewywodzące się od bezpośredniego wspólnego przodka należącego do tej grupy (podobieństwo wynika ze zbieżnej ewolucji).
Współczesna klasyfikacja dąży do wyodrębniania wyłącznie grup monofiletycznych, ponieważ tylko taka klasyfikacja rzetelnie odzwierciedla filogenezę organizmów.

HIERARCHIA RANG TAKSONOMICZNYCH
Podstawowe rangi taksonomiczne, uporządkowane hierarchicznie od najszerszej do najwęższej: domena → królestwo → typ → gromada/klasa → rząd → rodzina → rodzaj → gatunek.
''',
            flashcards: [],
            questions: [
              QuizQuestion(id: 'q_k1_80', question: 'Grupa monofiletyczna obejmuje:', options: ['Tylko część potomków wspólnego przodka', 'Wspólnego przodka i wszystkich jego potomków', 'Organizmy o podobnych cechach bez wspólnego przodka', 'Wyłącznie gatunki wymarłe'], correctIndex: 1, explanation: 'Grupa monofiletyczna to przodek wraz ze wszystkimi jego potomkami.'),
              QuizQuestion(id: 'q_k1_81', question: 'Tradycyjne "gady" (bez ptaków) są przykładem grupy:', options: ['Monofiletycznej', 'Parafiletycznej', 'Polifiletycznej', 'Niehierarchicznej'], correctIndex: 1, explanation: 'Wykluczenie ptaków (potomków gadów) z grupy czyni ją parafiletyczną.'),
              QuizQuestion(id: 'q_k1_82', question: 'Na kladogramie o bliskim pokrewieństwie dwóch grup świadczy:', options: ['Ich kolejność alfabetyczna', 'Bliskość wspólnego węzła rozgałęzienia', 'Liczba gatunków w grupie', 'Kolor gałęzi'], correctIndex: 1, explanation: 'Bliskość wspólnego węzła wskazuje na bliskie pokrewieństwo ewolucyjne.'),
              QuizQuestion(id: 'q_k1_83', question: 'Poprawna kolejność rang taksonomicznych, od najszerszej do najwęższej, to:', options: ['Gatunek → rodzaj → rodzina → królestwo', 'Królestwo → typ → rodzina → gatunek', 'Rodzaj → gatunek → typ → królestwo', 'Gatunek → królestwo → typ → rodzaj'], correctIndex: 1, explanation: 'Hierarchia biegnie od królestwa, przez typ, rodzinę, aż po gatunek.'),
              QuizQuestion(id: 'q_k1_84', question: 'Współczesna klasyfikacja dąży do wyodrębniania grup:', options: ['Polifiletycznych', 'Parafiletycznych', 'Monofiletycznych', 'Dowolnych, bez znaczenia'], correctIndex: 2, explanation: 'Grupy monofiletyczne najlepiej odzwierciedlają rzeczywistą filogenezę.'),
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
