import '../models.dart';

/// Materiał klasy 4 liceum — zakres rozszerzony.
///
/// Pokrywa działy podstawy programowej (nowelizacja 2024):
///   XIII.  Ekspresja informacji genetycznej
///   XIV.   Genetyka klasyczna — dziedziczenie cech i zmienność organizmów
///   XV.    Biotechnologia. Podstawy inżynierii genetycznej
///   XVI.   Ewolucja
///   XVII.  Ekologia
///   XVIII. Różnorodność biologiczna, jej zagrożenia i ochrona
final List<Chapter> klasa4Chapters = [
  // ===========================================================================
  // XIII. EKSPRESJA INFORMACJI GENETYCZNEJ
  // ===========================================================================
  Chapter(
    id: 'k4_ekspresja',
    name: 'Ekspresja informacji genetycznej',
    topics: [
      Topic(
        id: 'k4_ekspresja_gen_kod',
        name: 'Budowa genu i kod genetyczny',
        theory: '''
GEN I JEGO EKSPRESJA
Gen to odcinek DNA zawierający informację o budowie cząsteczki RNA lub łańcucha polipeptydowego. Ekspresja genu obejmuje transkrypcję, czyli przepisanie informacji z DNA na RNA, oraz — w przypadku genów kodujących białka — translację, czyli syntezę łańcucha polipeptydowego na podstawie mRNA. Niektóre geny kodują wyłącznie RNA, na przykład tRNA i rRNA.

STRUKTURA GENU PROKARIOTYCZNEGO
Gen prokariotyczny składa się z promotora — miejsca przyłączenia polimerazy RNA, od którego rozpoczyna się transkrypcja — sekwencji kodującej oraz terminatora, który wyznacza koniec transkrypcji. Sekwencja kodująca jest ciągła, czyli nie zawiera intronów. Geny o powiązanych funkcjach są często zgrupowane, przepisywane razem na jedną cząsteczkę mRNA i wspólnie regulowane — taki zespół genów nazywamy operonem.

STRUKTURA GENU EUKARIOTYCZNEGO
Gen eukariotyczny ma budowę nieciągłą: odcinki kodujące, czyli egzony, przedzielone są odcinkami niekodującymi — intronami. Oprócz promotora gen ma sekwencje regulatorowe, na przykład wzmacniacze (enhancery), które mogą leżeć daleko od genu i zwiększają intensywność jego transkrypcji. Geny eukariotyczne są zwykle przepisywane pojedynczo, a znaczna część DNA eukariontów w ogóle nie koduje białek.

KOD GENETYCZNY I JEGO CECHY
Kod genetyczny to sposób zapisu informacji o kolejności aminokwasów w białku za pomocą sekwencji nukleotydów. Jest trójkowy — jeden aminokwas kodują trzy kolejne nukleotydy, tworzące kodon. Jest jednoznaczny — dany kodon oznacza zawsze tylko jeden aminokwas. Jest zdegenerowany — ten sam aminokwas może być kodowany przez kilka różnych kodonów, ponieważ na 20 aminokwasów przypada 61 kodonów sensownych. Jest bezprzecinkowy — kodony odczytywane są jeden po drugim, bez przerw — oraz niezachodzący, bo każdy nukleotyd należy tylko do jednego kodonu. Jest też niemal uniwersalny — ten sam kod stosują prawie wszystkie organizmy, a nieliczne wyjątki występują m.in. w mitochondriach.

KODONY START I STOP
Spośród 64 kodonów 61 koduje aminokwasy. Kodon AUG rozpoczyna translację i koduje metioninę. Kodony UAA, UAG i UGA nie kodują żadnego aminokwasu i kończą translację — to kodony stop.
''',
        flashcards: [
          Flashcard(id: 'f_k4_eksp_1', front: 'Czym jest gen?', back: 'Odcinkiem DNA zawierającym informację o budowie cząsteczki RNA lub łańcucha polipeptydowego.'),
          Flashcard(id: 'f_k4_eksp_2', front: 'Czym różni się gen prokariotyczny od eukariotycznego?', back: 'Prokariotyczny ma ciągłą sekwencję kodującą, a eukariotyczny jest nieciągły — egzony przedzielają introny.'),
          Flashcard(id: 'f_k4_eksp_3', front: 'Czym są egzony, a czym introny?', back: 'Egzony to odcinki kodujące genu, introny — niekodujące odcinki wycinane z pre-mRNA.'),
          Flashcard(id: 'f_k4_eksp_4', front: 'Jaką rolę pełni promotor?', back: 'Jest miejscem przyłączenia polimerazy RNA, od którego zaczyna się transkrypcja.'),
          Flashcard(id: 'f_k4_eksp_5', front: 'Czym jest operon?', back: 'Zespołem genów prokariotycznych o powiązanych funkcjach, przepisywanych razem na jeden mRNA i wspólnie regulowanych.'),
          Flashcard(id: 'f_k4_eksp_6', front: 'Co oznacza, że kod genetyczny jest zdegenerowany?', back: 'Ten sam aminokwas może być kodowany przez kilka różnych kodonów.'),
          Flashcard(id: 'f_k4_eksp_7', front: 'Co oznacza, że kod genetyczny jest jednoznaczny?', back: 'Dany kodon oznacza zawsze tylko jeden aminokwas.'),
          Flashcard(id: 'f_k4_eksp_8', front: 'Co oznacza, że kod jest bezprzecinkowy i niezachodzący?', back: 'Kodony odczytywane są bez przerw, a każdy nukleotyd należy tylko do jednego kodonu.'),
          Flashcard(id: 'f_k4_eksp_9', front: 'Jaki kodon rozpoczyna translację i jaki aminokwas koduje?', back: 'AUG — koduje metioninę.'),
          Flashcard(id: 'f_k4_eksp_10', front: 'Wymień kodony stop.', back: 'UAA, UAG i UGA.'),
          Flashcard(id: 'f_k4_eksp_11', front: 'Ile kodonów koduje aminokwasy?', back: '61 spośród 64.'),
          Flashcard(id: 'f_k4_eksp_12', front: 'Czym są wzmacniacze (enhancery)?', back: 'Sekwencjami regulatorowymi genów eukariotycznych, które zwiększają intensywność transkrypcji, nawet z dużej odległości.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k4_eksp_1', question: 'Cecha kodu genetycznego, zgodnie z którą jeden aminokwas może być kodowany przez kilka kodonów, to:', options: ['Jednoznaczność', 'Degeneracja', 'Uniwersalność', 'Trójkowość'], correctIndex: 1, explanation: 'Na 20 aminokwasów przypada 61 kodonów sensownych.'),
          QuizQuestion(id: 'q_k4_eksp_2', question: 'Kodon AUG:', options: ['Kończy translację', 'Rozpoczyna translację i koduje metioninę', 'Nie koduje żadnego aminokwasu', 'Występuje wyłącznie u prokariontów'], correctIndex: 1, explanation: 'AUG to kodon start.'),
          QuizQuestion(id: 'q_k4_eksp_3', question: 'Introny występują w genach:', options: ['Prokariotycznych', 'Eukariotycznych', 'Wyłącznie wirusowych', 'Wyłącznie kodujących tRNA'], correctIndex: 1, explanation: 'Geny prokariotyczne mają ciągłą sekwencję kodującą.'),
          QuizQuestion(id: 'q_k4_eksp_4', question: 'Liczba kodonów kodujących aminokwasy wynosi:', options: ['20', '61', '64', '3'], correctIndex: 1, explanation: 'Trzy z 64 kodonów to kodony stop.'),
          QuizQuestion(id: 'q_k4_eksp_5', question: 'Wzmacniacze (enhancery) to sekwencje:', options: ['Kodujące białka enzymatyczne', 'Regulatorowe, zwiększające intensywność transkrypcji', 'Kończące translację na rybosomie', 'Wycinane z pre-mRNA podczas splicingu'], correctIndex: 1, explanation: 'Wzmacniacze wiążą czynniki transkrypcyjne i mogą leżeć daleko od genu.'),
          QuizQuestion(id: 'q_k4_eksp_6', question: 'Operon to:', options: ['Pojedynczy intron wycinany z pre-mRNA eukariontów', 'Zespół genów prokariotycznych przepisywanych razem i wspólnie regulowanych', 'Enzym syntetyzujący cząsteczkę RNA na matrycy DNA', 'Fragment rybosomu wiążący tRNA podczas translacji'], correctIndex: 1, explanation: 'Geny operonu dają jedną cząsteczkę mRNA.'),
          QuizQuestion(id: 'q_k4_eksp_7', question: 'Uniwersalność kodu genetycznego oznacza, że:', options: ['Każdy kodon koduje kilka aminokwasów', 'Niemal wszystkie organizmy stosują ten sam kod', 'Kod nie zawiera kodonów stop', 'Wszystkie geny mają introny'], correctIndex: 1, explanation: 'Wyjątki są nieliczne, np. w mitochondriach.'),
          QuizQuestion(id: 'q_k4_eksp_8', question: 'Sekwencja mRNA AUG UUU UAA koduje:', options: ['Trzy aminokwasy, w tym metioninę i fenyloalaninę', 'Dwa aminokwasy (metioninę i fenyloalaninę), po czym translacja się kończy', 'Jeden aminokwas — metioninę, po czym translacja się kończy', 'Żadnego aminokwasu, bo sekwencja zawiera kodon stop'], correctIndex: 1, explanation: 'UUU koduje fenyloalaninę, a UAA jest kodonem stop.'),
        ],
      ),
      Topic(
        id: 'k4_ekspresja_procesy',
        name: 'Transkrypcja, translacja i regulacja ekspresji genów',
        theory: '''
TRANSKRYPCJA
Polimeraza RNA przyłącza się do promotora, rozplata fragment podwójnej helisy i syntetyzuje cząsteczkę RNA komplementarną do nici matrycowej DNA, dobudowując kolejne nukleotydy w kierunku od końca 5' do końca 3'. Naprzeciw adeniny w DNA wbudowywany jest uracyl. W odróżnieniu od polimerazy DNA polimeraza RNA nie potrzebuje startera. Transkrypcja kończy się po dotarciu polimerazy do terminatora.

OBRÓBKA POTRANSKRYPCYJNA U EUKARIONTÓW
U eukariontów pierwotny transkrypt (pre-mRNA) jest modyfikowany w jądrze, zanim trafi do cytoplazmy. Na jego końcu 5' dołączana jest czapeczka ze zmodyfikowanego nukleotydu guaninowego, a na końcu 3' ogon poli(A) złożony z wielu nukleotydów adeninowych. Obie modyfikacje chronią mRNA przed rozkładem i ułatwiają rozpoczęcie translacji. W procesie składania (splicingu) introny są wycinane, a egzony łączone ze sobą. Dzięki alternatywnemu splicingowi z jednego genu mogą powstawać różne cząsteczki mRNA, a w konsekwencji różne białka. Dojrzały mRNA opuszcza jądro przez pory jądrowe.

TRANSLACJA
Translacja zachodzi na rybosomach. Cząsteczka tRNA ma antykodon, komplementarny do kodonu mRNA, oraz przyłączony odpowiadający mu aminokwas — przyłącza go swoisty enzym przy nakładzie energii z ATP. W inicjacji mała podjednostka rybosomu wiąże mRNA i odnajduje kodon start AUG, z którym łączy się tRNA niosący metioninę, po czym przyłącza się duża podjednostka. W elongacji kolejne tRNA dostarczają aminokwasy zgodnie z kodonami, rybosom tworzy między nimi wiązania peptydowe i przesuwa się wzdłuż mRNA o jeden kodon. Terminacja następuje, gdy rybosom natrafi na kodon stop — przyłącza się wówczas czynnik uwalniający, łańcuch polipeptydowy zostaje uwolniony, a rybosom rozpada się na podjednostki. Tę samą cząsteczkę mRNA może jednocześnie odczytywać wiele rybosomów, tworząc polisom.

MODYFIKACJE POTRANSLACYJNE
Świeżo zsyntetyzowany łańcuch polipeptydowy zwykle nie jest jeszcze funkcjonalnym białkiem. Musi przyjąć właściwą strukturę przestrzenną, w czym pomagają mu białka opiekuńcze (chaperony), i często zostaje zmodyfikowany: przyłączane są do niego reszty cukrowe (glikozylacja w retikulum endoplazmatycznym i aparacie Golgiego) lub grupy fosforanowe (fosforylacja, która włącza lub wyłącza aktywność wielu enzymów), łańcuch bywa przycinany — w ten sposób insulina powstaje z dłuższego prekursora, a enzymy trawienne uaktywniają się po odcięciu fragmentu — lub łączony z innymi łańcuchami w białko o strukturze czwartorzędowej. Bez tych zmian białko nie mogłoby pełnić swojej funkcji.

EKSPRESJA GENÓW U PROKARIONTÓW I EUKARIONTÓW
U prokariontów transkrypcja i translacja zachodzą w cytoplazmie i są ze sobą sprzężone — rybosomy zaczynają odczytywać mRNA, zanim jego synteza się zakończy. Geny nie mają intronów, więc mRNA nie wymaga obróbki, a jedna cząsteczka mRNA często niesie informację o kilku białkach. U eukariontów transkrypcja zachodzi w jądrze, a translacja w cytoplazmie, więc oba procesy są rozdzielone w przestrzeni i w czasie. Pre-mRNA przechodzi obróbkę, a dojrzały mRNA koduje zwykle jedno białko.

REGULACJA EKSPRESJI GENÓW U EUKARIONTÓW
Wszystkie komórki organizmu zawierają ten sam zestaw genów, ale w komórkach różnych tkanek aktywne są różne geny — na tym polega różnicowanie się komórek. Ekspresja genów jest regulowana na wielu poziomach. Na poziomie chromatyny: silnie skondensowana chromatyna jest nieaktywna, metylacja DNA wycisza geny, a acetylacja histonów rozluźnia chromatynę i ułatwia transkrypcję. Na poziomie transkrypcji: czynniki transkrypcyjne wiążą się z promotorem i wzmacniaczami, umożliwiając lub utrudniając przyłączenie polimerazy RNA — ich aktywność kontrolują m.in. hormony. Na poziomie obróbki: alternatywny splicing decyduje, jakie białko powstanie. W cytoplazmie: liczba cząsteczek białka zależy od czasu życia mRNA, a małe cząsteczki RNA, takie jak mikroRNA, wiążą się z mRNA i blokują jego translację lub powodują jego rozkład. Na poziomie białka: o jego aktywności decydują modyfikacje potranslacyjne i kontrolowany rozkład.
''',
        flashcards: [
          Flashcard(id: 'f_k4_eksp_13', front: 'Który enzym przeprowadza transkrypcję i czy potrzebuje startera?', back: 'Polimeraza RNA — nie potrzebuje startera.'),
          Flashcard(id: 'f_k4_eksp_14', front: 'Jaki nukleotyd wbudowywany jest do RNA naprzeciw adeniny w DNA?', back: 'Nukleotyd z uracylem.'),
          Flashcard(id: 'f_k4_eksp_15', front: 'Wymień etapy obróbki potranskrypcyjnej pre-mRNA.', back: 'Dołączenie czapeczki, dołączenie ogona poli(A) i wycięcie intronów (splicing).'),
          Flashcard(id: 'f_k4_eksp_16', front: 'Jaką funkcję pełnią czapeczka i ogon poli(A)?', back: 'Chronią mRNA przed rozkładem i ułatwiają rozpoczęcie translacji.'),
          Flashcard(id: 'f_k4_eksp_17', front: 'Na czym polega alternatywny splicing?', back: 'Na różnym łączeniu egzonów tego samego pre-mRNA, dzięki czemu z jednego genu powstają różne białka.'),
          Flashcard(id: 'f_k4_eksp_18', front: 'Czym jest antykodon?', back: 'Trójką nukleotydów w tRNA komplementarną do kodonu w mRNA.'),
          Flashcard(id: 'f_k4_eksp_19', front: 'Wymień etapy translacji.', back: 'Inicjacja, elongacja i terminacja.'),
          Flashcard(id: 'f_k4_eksp_20', front: 'Co dzieje się podczas terminacji translacji?', back: 'Rybosom natrafia na kodon stop, przyłącza się czynnik uwalniający, łańcuch zostaje uwolniony, a rybosom rozpada się na podjednostki.'),
          Flashcard(id: 'f_k4_eksp_21', front: 'Czym jest polisom?', back: 'Grupą rybosomów odczytujących jednocześnie tę samą cząsteczkę mRNA.'),
          Flashcard(id: 'f_k4_eksp_22', front: 'Podaj przykłady modyfikacji potranslacyjnych.', back: 'Glikozylacja, fosforylacja, przycinanie łańcucha (np. powstawanie insuliny), łączenie podjednostek.'),
          Flashcard(id: 'f_k4_eksp_23', front: 'Czym różni się ekspresja genów u prokariontów i eukariontów?', back: 'U prokariontów transkrypcja i translacja są sprzężone w cytoplazmie; u eukariontów transkrypcja zachodzi w jądrze, translacja w cytoplazmie, a pre-mRNA przechodzi obróbkę.'),
          Flashcard(id: 'f_k4_eksp_24', front: 'Jak metylacja DNA i acetylacja histonów wpływają na ekspresję genów?', back: 'Metylacja DNA wycisza geny, a acetylacja histonów rozluźnia chromatynę i ułatwia transkrypcję.'),
          Flashcard(id: 'f_k4_eksp_25', front: 'Jak działają mikroRNA?', back: 'Wiążą się z mRNA i blokują jego translację lub powodują jego rozkład.'),
          Flashcard(id: 'f_k4_eksp_26', front: 'Dlaczego komórki różnych tkanek się różnią, choć mają te same geny?', back: 'Aktywne są w nich różne zestawy genów — ekspresja genów jest regulowana.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k4_eksp_9', question: 'Obróbka potranskrypcyjna pre-mRNA zachodzi u eukariontów w:', options: ['Cytoplazmie', 'Jądrze komórkowym', 'Rybosomie', 'Aparacie Golgiego'], correctIndex: 1, explanation: 'Dopiero dojrzały mRNA opuszcza jądro przez pory jądrowe.'),
          QuizQuestion(id: 'q_k4_eksp_10', question: 'Splicing polega na:', options: ['Dołączaniu czapeczki', 'Wycinaniu intronów i łączeniu egzonów', 'Przyłączaniu aminokwasów do tRNA', 'Tworzeniu wiązań peptydowych'], correctIndex: 1, explanation: 'To jeden z etapów obróbki potranskrypcyjnej.'),
          QuizQuestion(id: 'q_k4_eksp_11', question: 'Fragment nici matrycowej DNA ma sekwencję TAC. Odpowiadający mu kodon mRNA to:', options: ['ATG', 'AUG', 'UAC', 'TUG'], correctIndex: 1, explanation: 'Naprzeciw T staje A, naprzeciw A — U, naprzeciw C — G.'),
          QuizQuestion(id: 'q_k4_eksp_12', question: 'Wiązania peptydowe podczas translacji tworzone są przez:', options: ['tRNA', 'Rybosom', 'Polimerazę RNA', 'Czynnik uwalniający'], correctIndex: 1, explanation: 'Wiązanie peptydowe powstaje w dużej podjednostce rybosomu.'),
          QuizQuestion(id: 'q_k4_eksp_13', question: 'U prokariontów translacja może się rozpocząć przed zakończeniem transkrypcji, ponieważ:', options: ['Ich geny mają introny', 'Oba procesy zachodzą w cytoplazmie', 'Mają jądro komórkowe', 'Nie mają rybosomów'], correctIndex: 1, explanation: 'Brak otoczki jądrowej sprawia, że procesy nie są rozdzielone przestrzennie.'),
          QuizQuestion(id: 'q_k4_eksp_14', question: 'Acetylacja histonów:', options: ['Kondensuje chromatynę i wycisza geny', 'Rozluźnia chromatynę i ułatwia transkrypcję', 'Wycina introny z cząsteczki pre-mRNA', 'Kończy translację na kodonie stop'], correctIndex: 1, explanation: 'Rozluźniona chromatyna jest dostępna dla polimerazy RNA.'),
          QuizQuestion(id: 'q_k4_eksp_15', question: 'Aktywna insulina powstaje z dłuższego prekursora w wyniku:', options: ['Alternatywnego splicingu pre-mRNA', 'Przycinania łańcucha — modyfikacji potranslacyjnej', 'Odwrotnej transkrypcji mRNA na DNA', 'Replikacji fragmentu DNA z genem'], correctIndex: 1, explanation: 'Z prekursora wycinany jest fragment łańcucha.'),
          QuizQuestion(id: 'q_k4_eksp_16', question: 'Czynnik uwalniający przyłącza się do rybosomu, gdy ten natrafi na:', options: ['Kodon AUG', 'Kodon stop', 'Promotor', 'Intron'], correctIndex: 1, explanation: 'Kodony stop nie mają odpowiadających im tRNA.'),
          QuizQuestion(id: 'q_k4_eksp_17', question: 'Alternatywny splicing umożliwia:', options: ['Powstanie różnych białek z jednego genu', 'Odwrotną transkrypcję', 'Replikację DNA', 'Przyłączanie aminokwasów do tRNA'], correctIndex: 0, explanation: 'Różne kombinacje egzonów dają różne mRNA.'),
        ],
      ),
    ],
  ),

  // ===========================================================================
  // XIV.1 DZIEDZICZENIE CECH
  // ===========================================================================
  Chapter(
    id: 'k4_dziedziczenie',
    name: 'Dziedziczenie cech',
    topics: [
      Topic(
        id: 'k4_dziedziczenie_mendel',
        name: 'Prawa Mendla i krzyżówki genetyczne',
        theory: '''
PODSTAWOWE POJĘCIA
Allele to warianty tego samego genu, a locus — miejsce genu w chromosomie. Homozygota ma dwa identyczne allele danego genu (AA lub aa), a heterozygota dwa różne (Aa). Allel dominujący ujawnia się w fenotypie zarówno u homozygoty, jak i u heterozygoty; allel recesywny genu autosomalnego ujawnia się tylko u homozygoty recesywnej. Genotyp to zestaw alleli organizmu, a fenotyp — zespół jego cech, będący wynikiem działania genotypu i środowiska.

I PRAWO MENDLA
Prawo czystości gamet mówi, że każda gameta otrzymuje tylko jeden allel z pary alleli danego genu. W krzyżówce jednogenowej heterozygot (Aa × Aa) przy dominacji pełnej genotypy potomstwa występują w stosunku AA : Aa : aa = 1 : 2 : 1, a fenotypy w stosunku 3 : 1. Prawdopodobieństwo uzyskania homozygoty recesywnej wynosi 1/4, czyli 25%.

KRZYŻÓWKA TESTOWA
Krzyżówka testowa pozwala ustalić genotyp osobnika o fenotypie dominującym. Krzyżuje się go z homozygotą recesywną (aa). Jeżeli całe potomstwo ma fenotyp dominujący, badany osobnik jest homozygotą dominującą (AA). Jeżeli w potomstwie fenotyp dominujący i recesywny występują w stosunku 1 : 1, badany osobnik jest heterozygotą (Aa).

II PRAWO MENDLA
Prawo niezależnej segregacji mówi, że allele różnych genów, leżących w różnych parach chromosomów, dziedziczą się niezależnie od siebie. Heterozygota podwójna AaBb wytwarza w równych ilościach cztery rodzaje gamet: AB, Ab, aB i ab. W krzyżówce AaBb × AaBb przy dominacji pełnej obu genów fenotypy potomstwa występują w stosunku 9 : 3 : 3 : 1. Ponieważ geny dziedziczą się niezależnie, prawdopodobieństwa dla każdego z nich można liczyć osobno i mnożyć — prawdopodobieństwo uzyskania genotypu aabb wynosi 1/4 · 1/4 = 1/16.

DOMINACJA NIEPEŁNA I KODOMINACJA
Przy dominacji niepełnej heterozygota ma fenotyp pośredni. U lwiej paszczy skrzyżowanie roślin o kwiatach czerwonych i białych daje w pokoleniu F1 rośliny o kwiatach różowych, a w pokoleniu F2 fenotypy czerwony : różowy : biały występują w stosunku 1 : 2 : 1 — takim samym jak stosunek genotypów. Przy kodominacji oba allele ujawniają się w fenotypie heterozygoty jednocześnie i w pełni.

ALLELE WIELOKROTNE — GRUPY KRWI UKŁADU AB0
Gen może występować w populacji w więcej niż dwóch wariantach, choć każdy organizm diploidalny ma najwyżej dwa z nich. Grupy krwi układu AB0 warunkują trzy allele: IA, IB oraz i (w podręcznikach A i B zapisuje się w indeksie górnym). Allele IA i IB są względem siebie kodominujące, a oba dominują nad allelem i. Grupę krwi A mają osoby o genotypie IA IA lub IA i, grupę B — IB IB lub IB i, grupę AB — IA IB, a grupę 0 — ii. Rodzice o genotypach IA i oraz IB i mogą mieć dziecko z każdą z czterech grup krwi, każdą z prawdopodobieństwem 1/4.

WSPÓŁDZIAŁANIE GENÓW
Niektóre cechy zależą od kilku genów. Przy epistazie allel jednego genu maskuje działanie alleli innego genu — na przykład homozygota recesywna pod względem genu warunkującego wytwarzanie barwnika jest albinosem niezależnie od tego, jaki allel koloru sierści posiada. Zmienia to klasyczny stosunek 9 : 3 : 3 : 1 w krzyżówce dwugenowej, na przykład na 9 : 3 : 4. Przy dziedziczeniu wielogenowym wiele genów działa addytywnie — każdy allel „dodatni” w podobnym stopniu wzmacnia cechę. Tak dziedziczą się cechy ilościowe, na przykład wzrost, masa ciała i barwa skóry człowieka, które wykazują zmienność ciągłą, dodatkowo kształtowaną przez środowisko.
''',
        flashcards: [
          Flashcard(id: 'f_k4_dzie_1', front: 'Czym jest allel?', back: 'Wariantem danego genu.'),
          Flashcard(id: 'f_k4_dzie_2', front: 'Czym różni się homozygota od heterozygoty?', back: 'Homozygota ma dwa identyczne allele danego genu, heterozygota — dwa różne.'),
          Flashcard(id: 'f_k4_dzie_3', front: 'Co mówi I prawo Mendla?', back: 'Każda gameta otrzymuje tylko jeden allel z pary alleli danego genu (prawo czystości gamet).'),
          Flashcard(id: 'f_k4_dzie_4', front: 'Jaki jest stosunek fenotypów i genotypów w potomstwie Aa × Aa przy dominacji pełnej?', back: 'Fenotypy 3 : 1, genotypy 1 : 2 : 1.'),
          Flashcard(id: 'f_k4_dzie_5', front: 'Na czym polega krzyżówka testowa?', back: 'Na skrzyżowaniu osobnika o fenotypie dominującym z homozygotą recesywną w celu ustalenia jego genotypu.'),
          Flashcard(id: 'f_k4_dzie_6', front: 'Jaki wynik krzyżówki testowej wskazuje na heterozygotę?', back: 'Potomstwo o fenotypie dominującym i recesywnym w stosunku 1 : 1.'),
          Flashcard(id: 'f_k4_dzie_7', front: 'Co mówi II prawo Mendla?', back: 'Allele genów leżących w różnych parach chromosomów dziedziczą się niezależnie od siebie.'),
          Flashcard(id: 'f_k4_dzie_8', front: 'Jakie gamety wytwarza heterozygota AaBb (geny na różnych chromosomach)?', back: 'AB, Ab, aB i ab — w równych ilościach.'),
          Flashcard(id: 'f_k4_dzie_9', front: 'Jaki jest stosunek fenotypów w potomstwie AaBb × AaBb?', back: '9 : 3 : 3 : 1 (przy dominacji pełnej obu genów).'),
          Flashcard(id: 'f_k4_dzie_10', front: 'Czym różni się dominacja niepełna od kodominacji?', back: 'Przy dominacji niepełnej heterozygota ma fenotyp pośredni; przy kodominacji oba allele ujawniają się jednocześnie i w pełni.'),
          Flashcard(id: 'f_k4_dzie_11', front: 'Jakie genotypy odpowiadają grupie krwi A?', back: 'IA IA lub IA i.'),
          Flashcard(id: 'f_k4_dzie_12', front: 'Czy rodzice o grupach krwi A i B mogą mieć dziecko z grupą 0?', back: 'Tak — jeśli oboje są heterozygotami (IA i × IB i); prawdopodobieństwo wynosi 1/4.'),
          Flashcard(id: 'f_k4_dzie_13', front: 'Czym jest epistaza?', back: 'Maskowaniem działania alleli jednego genu przez allel innego genu.'),
          Flashcard(id: 'f_k4_dzie_14', front: 'Jak dziedziczą się cechy ilościowe, np. wzrost człowieka?', back: 'Wielogenowo — wiele genów działa addytywnie, a cechę dodatkowo kształtuje środowisko; zmienność jest ciągła.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k4_dzie_1', question: 'Prawdopodobieństwo uzyskania homozygoty recesywnej z krzyżówki Aa × Aa wynosi:', options: ['1/2', '1/4', '3/4', '1/16'], correctIndex: 1, explanation: 'Każdy z rodziców przekazuje allel a z prawdopodobieństwem 1/2: 1/2 · 1/2 = 1/4.'),
          QuizQuestion(id: 'q_k4_dzie_2', question: 'W krzyżówce testowej całe potomstwo ma fenotyp dominujący. Badany osobnik jest:', options: ['Heterozygotą', 'Homozygotą dominującą', 'Homozygotą recesywną', 'Nie da się tego ustalić'], correctIndex: 1, explanation: 'Heterozygota dałaby także potomstwo o fenotypie recesywnym.'),
          QuizQuestion(id: 'q_k4_dzie_3', question: 'Prawdopodobieństwo uzyskania genotypu aabb z krzyżówki AaBb × AaBb wynosi:', options: ['1/4', '1/8', '1/16', '9/16'], correctIndex: 2, explanation: '1/4 (aa) · 1/4 (bb) = 1/16.'),
          QuizQuestion(id: 'q_k4_dzie_4', question: 'Skrzyżowanie dwóch roślin lwiej paszczy o kwiatach różowych daje fenotypy w stosunku:', options: ['3 : 1', '1 : 2 : 1', '9 : 3 : 3 : 1', '1 : 1'], correctIndex: 1, explanation: 'Przy dominacji niepełnej stosunek fenotypów odpowiada stosunkowi genotypów.'),
          QuizQuestion(id: 'q_k4_dzie_5', question: 'Grupa krwi AB jest przykładem:', options: ['Dominacji niepełnej', 'Kodominacji', 'Epistazy', 'Sprzężenia z płcią'], correctIndex: 1, explanation: 'Allele IA i IB ujawniają się jednocześnie i w pełni.'),
          QuizQuestion(id: 'q_k4_dzie_6', question: 'Rodzice o genotypach IA i oraz IB i mogą mieć dzieci o grupach krwi:', options: ['Tylko A i B', 'Tylko AB', 'A, B, AB i 0', 'Tylko 0'], correctIndex: 2, explanation: 'Możliwe genotypy dzieci to IA IB, IA i, IB i oraz ii.'),
          QuizQuestion(id: 'q_k4_dzie_7', question: 'Stosunek fenotypów 9 : 3 : 4 w krzyżówce dwugenowej wskazuje na:', options: ['Dominację niepełną', 'Epistazę', 'Całkowite sprzężenie genów', 'Kodominację'], correctIndex: 1, explanation: 'Allel jednego genu maskuje działanie drugiego genu, więc dwie klasy fenotypowe łączą się w jedną.'),
          QuizQuestion(id: 'q_k4_dzie_8', question: 'Cechą dziedziczącą się wielogenowo jest:', options: ['Grupa krwi AB0', 'Barwa skóry człowieka', 'Hemofilia', 'Mukowiscydoza'], correctIndex: 1, explanation: 'Barwa skóry zależy od wielu genów działających addytywnie i od środowiska.'),
          QuizQuestion(id: 'q_k4_dzie_9', question: 'Heterozygota podwójna AaBb (geny w różnych parach chromosomów) wytwarza rodzajów gamet:', options: ['2', '4', '8', '16'], correctIndex: 1, explanation: 'AB, Ab, aB i ab.'),
          QuizQuestion(id: 'q_k4_dzie_10', question: 'Allel recesywny genu autosomalnego ujawnia się w fenotypie:', options: ['Zawsze', 'Tylko u homozygoty recesywnej', 'Tylko u heterozygoty', 'Nigdy'], correctIndex: 1, explanation: 'U heterozygoty maskuje go allel dominujący.'),
        ],
      ),
      Topic(
        id: 'k4_dziedziczenie_sprzezenia',
        name: 'Chromosomowa teoria dziedziczności i dziedziczenie pozajądrowe',
        theory: '''
CHROMOSOMOWA TEORIA DZIEDZICZNOŚCI MORGANA
Na podstawie badań nad muszką owocową Thomas Morgan sformułował następujące założenia. Geny znajdują się w chromosomach, a każdy gen zajmuje w chromosomie określone miejsce, czyli locus. Geny ułożone są w chromosomie liniowo, jeden za drugim. Geny leżące w jednym chromosomie tworzą grupę sprzężeniową i dziedziczą się razem, a liczba grup sprzężeniowych odpowiada liczbie par chromosomów homologicznych. Geny sprzężone mogą zostać rozdzielone wskutek crossing-over, a częstość tego zjawiska zależy od odległości między genami.

GENY SPRZĘŻONE I CROSSING-OVER
Geny sprzężone leżą w tym samym chromosomie, dlatego nie podlegają II prawu Mendla — nie segregują niezależnie. Heterozygota podwójna, której geny są całkowicie sprzężone, wytwarza tylko dwa rodzaje gamet — takie jak u rodziców. Crossing-over w profazie I mejozy powoduje wymianę odcinków chromatyd między chromosomami homologicznymi i powstawanie gamet zrekombinowanych. Jest ich zawsze mniej niż połowa, ponieważ crossing-over w danym odcinku chromosomu nie zachodzi w każdej komórce, a gdy zachodzi, obejmuje tylko dwie z czterech chromatyd.

MAPOWANIE GENÓW
Częstość crossing-over między dwoma genami jest proporcjonalna do odległości między nimi. Odległość tę wyraża się w centymorganach (cM): 1 cM odpowiada 1% osobników zrekombinowanych w potomstwie. Oblicza się ją, dzieląc liczbę osobników zrekombinowanych przez liczbę wszystkich osobników i mnożąc wynik przez 100%. W krzyżówce testowej heterozygoty podwójnej osobnikami zrekombinowanymi są te, które mają nową, nierodzicielską kombinację cech — zawsze jest ich mniej. Jeżeli wśród 1000 potomków 80 ma układ zrekombinowany, geny są odległe o 8 cM. Znając odległości między trzema genami, można ustalić ich kolejność w chromosomie: gdy odległość A–B wynosi 8 cM, B–C 12 cM, a A–C 20 cM, gen B leży między genami A i C.

DZIEDZICZENIE POZAJĄDROWE
Własne DNA mają także mitochondria i chloroplasty. Komórka jajowa zawiera dużo cytoplazmy z organellami, a plemnik wnosi do zygoty praktycznie wyłącznie jądro, dlatego geny mitochondrialne człowieka dziedziczą się po matce. Cechy dziedziczone pozajądrowo nie podlegają prawom Mendla: chora matka może przekazać schorzenie mitochondrialne dzieciom obu płci, a chory ojciec go nie przekazuje. U roślin w podobny sposób, po roślinie matecznej, dziedziczy się na przykład pstrokatość liści związana z uszkodzeniem chloroplastów.
''',
        flashcards: [
          Flashcard(id: 'f_k4_dzie_15', front: 'Wymień założenia chromosomowej teorii dziedziczności.', back: 'Geny leżą w chromosomach liniowo, w określonych loci; geny jednego chromosomu tworzą grupę sprzężeniową; crossing-over rozdziela geny sprzężone z częstością zależną od ich odległości.'),
          Flashcard(id: 'f_k4_dzie_16', front: 'Czym są geny sprzężone?', back: 'Genami leżącymi w tym samym chromosomie — nie segregują niezależnie.'),
          Flashcard(id: 'f_k4_dzie_17', front: 'Ile rodzajów gamet wytwarza heterozygota podwójna przy całkowitym sprzężeniu genów?', back: 'Dwa — wyłącznie gamety rodzicielskie.'),
          Flashcard(id: 'f_k4_dzie_18', front: 'Dlaczego gamet zrekombinowanych jest zawsze mniej niż połowa?', back: 'Crossing-over w danym odcinku nie zachodzi w każdej komórce, a gdy zachodzi, obejmuje tylko dwie z czterech chromatyd.'),
          Flashcard(id: 'f_k4_dzie_19', front: 'Czemu odpowiada 1 centymorgan?', back: '1% osobników zrekombinowanych w potomstwie.'),
          Flashcard(id: 'f_k4_dzie_20', front: 'Jak obliczyć odległość między genami sprzężonymi?', back: 'Liczba osobników zrekombinowanych / liczba wszystkich osobników × 100%.'),
          Flashcard(id: 'f_k4_dzie_21', front: 'A–B = 8 cM, B–C = 12 cM, A–C = 20 cM. Jaka jest kolejność genów?', back: 'A – B – C (gen B leży między A i C).'),
          Flashcard(id: 'f_k4_dzie_22', front: 'Dlaczego geny mitochondrialne dziedziczą się po matce?', back: 'Zygota otrzymuje cytoplazmę z mitochondriami praktycznie wyłącznie z komórki jajowej.'),
          Flashcard(id: 'f_k4_dzie_23', front: 'Czy cechy dziedziczone pozajądrowo podlegają prawom Mendla?', back: 'Nie.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k4_dzie_11', question: 'Geny sprzężone to geny, które:', options: ['Leżą w różnych chromosomach', 'Leżą w tym samym chromosomie', 'Występują wyłącznie w mitochondriach', 'Zawsze dziedziczą się zgodnie z II prawem Mendla'], correctIndex: 1, explanation: 'Dziedziczą się razem, chyba że rozdzieli je crossing-over.'),
          QuizQuestion(id: 'q_k4_dzie_12', question: 'W potomstwie krzyżówki testowej na 500 osobników 45 miało układ zrekombinowany. Odległość między genami wynosi:', options: ['4,5 cM', '9 cM', '45 cM', '90 cM'], correctIndex: 1, explanation: '45 / 500 · 100% = 9%, czyli 9 cM.'),
          QuizQuestion(id: 'q_k4_dzie_13', question: 'Zjawiskiem rozdzielającym geny sprzężone jest:', options: ['Replikacja', 'Crossing-over', 'Mitoza', 'Transkrypcja'], correctIndex: 1, explanation: 'Crossing-over zachodzi w profazie I mejozy.'),
          QuizQuestion(id: 'q_k4_dzie_14', question: 'Odległości między genami wynoszą: A–B 5 cM, B–C 2 cM, A–C 7 cM. Kolejność genów w chromosomie to:', options: ['A–B–C', 'B–A–C', 'A–C–B', 'C–A–B'], correctIndex: 0, explanation: 'Odległości sumują się: 5 + 2 = 7, więc B leży między A i C.'),
          QuizQuestion(id: 'q_k4_dzie_15', question: 'Liczba grup sprzężeniowych odpowiada:', options: ['Liczbie wszystkich chromosomów', 'Liczbie par chromosomów homologicznych', 'Liczbie genów', 'Liczbie mitochondriów'], correctIndex: 1, explanation: 'Każda para chromosomów homologicznych to jedna grupa sprzężeniowa.'),
          QuizQuestion(id: 'q_k4_dzie_16', question: 'Kobieta z chorobą mitochondrialną i zdrowy mężczyzna. Choroba może wystąpić u:', options: ['Wyłącznie synów', 'Wyłącznie córek', 'Dzieci obu płci', 'Żadnego dziecka'], correctIndex: 2, explanation: 'Mitochondria wszystkie dzieci otrzymują od matki.'),
          QuizQuestion(id: 'q_k4_dzie_17', question: 'Organizmem modelowym w badaniach, na podstawie których powstała chromosomowa teoria dziedziczności, była:', options: ['Groch jadalny', 'Muszka owocowa', 'Pałeczka okrężnicy', 'Mysz domowa'], correctIndex: 1, explanation: 'Morgan prowadził badania na muszce owocowej.'),
          QuizQuestion(id: 'q_k4_dzie_18', question: 'Heterozygota podwójna z całkowicie sprzężonymi genami wytwarza:', options: ['1 rodzaj gamet', '2 rodzaje gamet', '4 rodzaje gamet', '8 rodzajów gamet'], correctIndex: 1, explanation: 'Bez crossing-over powstają wyłącznie gamety rodzicielskie.'),
        ],
      ),
      Topic(
        id: 'k4_dziedziczenie_plec',
        name: 'Dziedziczenie płci, cechy sprzężone z płcią i rodowody',
        theory: '''
DETERMINACJA PŁCI
U człowieka i większości ssaków płeć wyznaczają chromosomy płci: kobieta ma chromosomy XX, a mężczyzna XY. Płeć dziecka zależy od plemnika, który niesie chromosom X albo Y, dlatego prawdopodobieństwo urodzenia córki lub syna wynosi 1/2. O rozwoju cech męskich decyduje gen SRY leżący na chromosomie Y. U ptaków samica ma dwa różne chromosomy płci (ZW), a samiec dwa jednakowe (ZZ). U pszczół płeć zależy od liczby zestawów chromosomów: samice rozwijają się z jaj zapłodnionych i są diploidalne, a trutnie z niezapłodnionych i są haploidalne. U niektórych gadów, na przykład żółwi i krokodyli, płeć zależy od temperatury inkubacji jaj.

CECHY SPRZĘŻONE Z PŁCIĄ
Geny leżące na chromosomie X, niemające odpowiednika na chromosomie Y, dziedziczą się w sposób sprzężony z płcią. Mężczyzna ma tylko jeden chromosom X, jest więc hemizygotą — ujawnia się u niego każdy allel z tego chromosomu, także recesywny. Tak dziedziczą się hemofilia, czyli zaburzenie krzepnięcia krwi, i daltonizm, czyli zaburzenie rozróżniania barw; obie choroby znacznie częściej występują u mężczyzn. Kobieta heterozygotyczna (XH Xh, gdzie H oznacza allel prawidłowy, a h allel hemofilii) jest zdrową nosicielką. Syn otrzymuje chromosom X zawsze od matki, a córka po jednym od każdego z rodziców, dlatego chory ojciec nie przekazuje allelu synowi, ale wszystkie jego córki go otrzymują. Jeżeli matka jest nosicielką, a ojciec zdrowy, każdy syn z prawdopodobieństwem 1/2 będzie chory, a każda córka z prawdopodobieństwem 1/2 będzie nosicielką; żadna córka nie zachoruje.

ANALIZA RODOWODÓW
Rodowód przedstawia występowanie cechy w kolejnych pokoleniach rodziny: kwadraty oznaczają mężczyzn, koła kobiety, a symbole zaczernione osoby z daną cechą. Jeżeli dwoje rodziców bez cechy ma dziecko z tą cechą, cecha jest recesywna. Jeżeli cecha recesywna ujawnia się u córki ojca, który tej cechy nie ma, nie może być sprzężona z chromosomem X — jest autosomalna. Cecha autosomalna dominująca występuje w każdym pokoleniu, jest przekazywana zarówno przez matki, jak i przez ojców, a każda osoba z cechą ma co najmniej jednego rodzica z tą cechą; dwoje rodziców z cechą może mieć dziecko bez niej. Cecha recesywna sprzężona z chromosomem X występuje głównie u mężczyzn, często przeskakuje pokolenia i jest przekazywana synom przez zdrowe matki nosicielki. Cecha dominująca sprzężona z chromosomem X przechodzi od ojca z tą cechą na wszystkie córki i na żadnego syna.
''',
        flashcards: [
          Flashcard(id: 'f_k4_dzie_24', front: 'Od którego z rodziców zależy płeć dziecka u człowieka i dlaczego?', back: 'Od ojca — plemnik niesie chromosom X albo Y.'),
          Flashcard(id: 'f_k4_dzie_25', front: 'Który gen na chromosomie Y decyduje o rozwoju cech męskich?', back: 'Gen SRY.'),
          Flashcard(id: 'f_k4_dzie_26', front: 'Jak wyznaczana jest płeć u ptaków?', back: 'Samica ma chromosomy płci ZW, a samiec ZZ.'),
          Flashcard(id: 'f_k4_dzie_27', front: 'Jak wyznaczana jest płeć u pszczół?', back: 'Samice rozwijają się z jaj zapłodnionych (diploidalne), trutnie z niezapłodnionych (haploidalne).'),
          Flashcard(id: 'f_k4_dzie_28', front: 'Dlaczego hemofilia i daltonizm częściej występują u mężczyzn?', back: 'Geny leżą na chromosomie X, a mężczyzna ma tylko jeden X, więc ujawnia się u niego allel recesywny.'),
          Flashcard(id: 'f_k4_dzie_29', front: 'Czym jest hemizygota?', back: 'Osobnikiem mającym tylko jedną kopię genu, np. mężczyzna pod względem genów chromosomu X.'),
          Flashcard(id: 'f_k4_dzie_30', front: 'Czy chory na hemofilię ojciec może przekazać chorobę synowi?', back: 'Nie — syn otrzymuje od ojca chromosom Y.'),
          Flashcard(id: 'f_k4_dzie_31', front: 'Matka nosicielka hemofilii i zdrowy ojciec. Jakie jest ryzyko choroby u syna?', back: '1/2, czyli 50%.'),
          Flashcard(id: 'f_k4_dzie_32', front: 'Jak rozpoznać w rodowodzie cechę recesywną?', back: 'Dwoje rodziców bez cechy ma dziecko z tą cechą.'),
          Flashcard(id: 'f_k4_dzie_33', front: 'Po czym poznać, że cecha recesywna jest autosomalna, a nie sprzężona z X?', back: 'Ujawnia się u córki ojca, który tej cechy nie ma.'),
          Flashcard(id: 'f_k4_dzie_34', front: 'Jak dziedziczy się cecha dominująca sprzężona z X po ojcu z tą cechą?', back: 'Otrzymują ją wszystkie córki i żaden syn.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k4_dzie_19', question: 'U człowieka płeć potomstwa zależy od:', options: ['Komórki jajowej', 'Plemnika', 'Temperatury', 'Liczby zestawów chromosomów'], correctIndex: 1, explanation: 'Komórka jajowa zawsze niesie chromosom X, plemnik — X albo Y.'),
          QuizQuestion(id: 'q_k4_dzie_20', question: 'Kobieta nosicielka daltonizmu ma genotyp:', options: ['XD XD', 'XD Xd', 'Xd Xd', 'Xd Y'], correctIndex: 1, explanation: 'Nosicielka jest heterozygotą — ma allel prawidłowy i allel daltonizmu.'),
          QuizQuestion(id: 'q_k4_dzie_21', question: 'Matka jest nosicielką hemofilii, a ojciec jest zdrowy. Prawdopodobieństwo, że ich córka zachoruje, wynosi:', options: ['0%', '25%', '50%', '100%'], correctIndex: 0, explanation: 'Córka zawsze otrzyma od zdrowego ojca prawidłowy allel.'),
          QuizQuestion(id: 'q_k4_dzie_22', question: 'U ptaków samice mają chromosomy płci:', options: ['XX', 'XY', 'ZW', 'ZZ'], correctIndex: 2, explanation: 'U ptaków to samica ma dwa różne chromosomy płci.'),
          QuizQuestion(id: 'q_k4_dzie_23', question: 'W rodowodzie cecha występuje w każdym pokoleniu, przekazują ją zarówno matki, jak i ojcowie, a każda osoba z cechą ma rodzica z tą cechą. Jest to najprawdopodobniej cecha:', options: ['Autosomalna recesywna', 'Autosomalna dominująca', 'Recesywna sprzężona z X', 'Dziedziczona pozajądrowo'], correctIndex: 1, explanation: 'To typowy obraz dziedziczenia autosomalnego dominującego.'),
          QuizQuestion(id: 'q_k4_dzie_24', question: 'Ojciec chory na hemofilię i matka niebędąca nosicielką. Ich córki będą:', options: ['Chore', 'Nosicielkami', 'Zdrowe i niebędące nosicielkami', 'W połowie chore'], correctIndex: 1, explanation: 'Każda córka otrzymuje od ojca chromosom X z allelem hemofilii.'),
          QuizQuestion(id: 'q_k4_dzie_25', question: 'Trutnie u pszczół rozwijają się z jaj:', options: ['Zapłodnionych', 'Niezapłodnionych', 'Zawierających chromosom Y', 'Inkubowanych w wysokiej temperaturze'], correctIndex: 1, explanation: 'Trutnie są haploidalne.'),
          QuizQuestion(id: 'q_k4_dzie_26', question: 'Dwoje rodziców bez danej cechy ma córkę z tą cechą. Cecha jest:', options: ['Recesywna sprzężona z X', 'Autosomalna recesywna', 'Autosomalna dominująca', 'Dominująca sprzężona z X'], correctIndex: 1, explanation: 'Cecha recesywna sprzężona z X ujawniłaby się u córki tylko wtedy, gdyby miał ją ojciec.'),
          QuizQuestion(id: 'q_k4_dzie_27', question: 'U żółwi płeć potomstwa zależy od:', options: ['Chromosomów ZW', 'Temperatury inkubacji jaj', 'Genu SRY', 'Liczby zestawów chromosomów'], correctIndex: 1, explanation: 'U części gadów płeć wyznacza temperatura, a nie chromosomy.'),
        ],
      ),
    ],
  ),

  // ===========================================================================
  // XIV.2 ZMIENNOŚĆ ORGANIZMÓW
  // ===========================================================================
  Chapter(
    id: 'k4_zmiennosc',
    name: 'Zmienność organizmów',
    topics: [
      Topic(
        id: 'k4_zmiennosc_mutacje',
        name: 'Zmienność, mutacje genowe i nowotwory',
        theory: '''
ZMIENNOŚĆ ORGANIZMÓW
Zmienność to różnorodność fenotypowa osobników w populacji. Zmienność środowiskowa (niedziedziczna) wynika z wpływu środowiska na fenotyp i nie jest przekazywana potomstwu — przykładem są różnice wysokości roślin tego samego gatunku rosnących w cieniu i w słońcu, opalenizna czy rozwój mięśni pod wpływem treningu. Zmienność genetyczna (dziedziczna) wynika z różnic w genotypach i dzieli się na rekombinacyjną oraz mutacyjną.

ZMIENNOŚĆ CIĄGŁA I NIECIĄGŁA
W zmienności ciągłej cecha przyjmuje wiele wartości pośrednich, a jej rozkład w populacji ma kształt krzywej dzwonowej — tak jest z wzrostem, masą ciała czy barwą skóry człowieka. Jej podłożem jest dziedziczenie wielogenowe oraz wpływ środowiska. W zmienności nieciągłej cecha występuje w kilku wyraźnie odrębnych postaciach bez form pośrednich, jak grupy krwi układu AB0 czy albinizm; jest ona warunkowana zwykle jednym genem i w niewielkim stopniu zależy od środowiska.

ŹRÓDŁA ZMIENNOŚCI REKOMBINACYJNEJ
Zmienność rekombinacyjna polega na powstawaniu nowych kombinacji już istniejących alleli. Jej źródłami są crossing-over w profazie I mejozy, niezależna segregacja chromosomów homologicznych w mejozie I oraz losowe łączenie się gamet podczas zapłodnienia. U bakterii nowe kombinacje genów powstają dzięki koniugacji, transformacji i transdukcji.

MUTACJE
Mutacje to nagłe, trwałe zmiany w materiale genetycznym. Mutacje w komórkach somatycznych nie są dziedziczone, ale mogą prowadzić do rozwoju nowotworu, natomiast mutacje w komórkach, z których powstają gamety, są przekazywane potomstwu. Mutacje zachodzą spontanicznie, np. wskutek błędów replikacji, lub są wywoływane przez czynniki mutagenne. Mogą być szkodliwe, obojętne lub — rzadko — korzystne; są jedynym źródłem nowych alleli i surowcem ewolucji.

MUTACJE GENOWE
Mutacje genowe dotyczą pojedynczych nukleotydów lub niewielkich fragmentów genu. Substytucja to zamiana jednej pary nukleotydów na inną. Jeśli zmieniony kodon koduje ten sam aminokwas, jest to mutacja cicha — białko się nie zmienia dzięki degeneracji kodu. Jeśli powstaje kodon innego aminokwasu, jest to mutacja zmiany sensu; przykładem jest anemia sierpowata, w której zamiana jednego aminokwasu w hemoglobinie zmienia kształt erytrocytów. Jeśli powstaje kodon stop, jest to mutacja nonsensowna, prowadząca do skrócenia i zwykle unieczynnienia białka. Delecja, czyli utrata, i insercja, czyli wstawienie nukleotydów, w liczbie niebędącej wielokrotnością trzech przesuwają ramkę odczytu — zmieniają się wszystkie kodony za miejscem mutacji i powstaje zupełnie inne, zwykle niefunkcjonalne białko.

CZYNNIKI MUTAGENNE A RYZYKO CHORÓB
Mutageny fizyczne to promieniowanie jonizujące (rentgenowskie i gamma), uszkadzające nici DNA, oraz promieniowanie ultrafioletowe, zwiększające ryzyko nowotworów skóry. Mutageny chemiczne to m.in. składniki dymu tytoniowego, takie jak benzo(a)piren, a także benzen, niektóre barwniki i aflatoksyny wytwarzane przez pleśnie. Mutageny biologiczne to niektóre wirusy — wirus brodawczaka ludzkiego (HPV) zwiększający ryzyko raka szyjki macicy oraz wirusy zapalenia wątroby typu B i C zwiększające ryzyko raka wątroby — a także bakteria Helicobacter pylori sprzyjająca rakowi żołądka. Im dłuższe i silniejsze narażenie na mutageny, tym większe ryzyko chorób nowotworowych i wad rozwojowych; zmniejszają je niepalenie, ochrona przed promieniowaniem UV, szczepienia przeciw HPV i WZW typu B oraz przestrzeganie zasad bezpieczeństwa w pracy.

TRANSFORMACJA NOWOTWOROWA
Podziały komórek kontrolują dwie grupy genów. Protoonkogeny kodują białka pobudzające podziały — po mutacji stają się onkogenami, które stale wysyłają sygnał do podziału, jak zablokowany pedał gazu. Geny supresorowe hamują cykl komórkowy; na przykład białko p53, kodowane przez gen TP53, przy uszkodzeniu DNA zatrzymuje cykl i kieruje komórkę do naprawy lub apoptozy — mutacja takiego genu przypomina zepsuty hamulec. Geny naprawy DNA usuwają błędy, a ich uszkodzenie powoduje, że w komórce szybko gromadzą się kolejne mutacje. Nowotwór powstaje zwykle wtedy, gdy w jednej komórce nagromadzi się kilka mutacji w tych genach: komórka dzieli się bez kontroli i unika apoptozy, a w nowotworach złośliwych nacieka sąsiednie tkanki i tworzy przerzuty. Dlatego ryzyko nowotworów rośnie z wiekiem i przy długotrwałym narażeniu na mutageny. Odziedziczona mutacja genu supresorowego, np. BRCA1, znacznie zwiększa ryzyko raka piersi i jajnika.
''',
        flashcards: [
          Flashcard(id: 'f_k4_zm_1', front: 'Czym różni się zmienność środowiskowa od genetycznej?', back: 'Środowiskowa wynika z wpływu środowiska i nie jest dziedziczona; genetyczna wynika z różnic w genotypach i jest dziedziczna.'),
          Flashcard(id: 'f_k4_zm_2', front: 'Czym różni się zmienność ciągła od nieciągłej?', back: 'Ciągła ma wiele wartości pośrednich (np. wzrost — dziedziczenie wielogenowe), nieciągła — kilka odrębnych form (np. grupy krwi AB0).'),
          Flashcard(id: 'f_k4_zm_3', front: 'Wymień źródła zmienności rekombinacyjnej.', back: 'Crossing-over, niezależna segregacja chromosomów i losowe łączenie się gamet.'),
          Flashcard(id: 'f_k4_zm_4', front: 'Czy mutacja somatyczna jest dziedziczona?', back: 'Nie — dotyczy komórek ciała, ale może prowadzić do nowotworu.'),
          Flashcard(id: 'f_k4_zm_5', front: 'Czym jest mutacja cicha?', back: 'Substytucją, po której kodon koduje ten sam aminokwas, więc białko się nie zmienia.'),
          Flashcard(id: 'f_k4_zm_6', front: 'Czym jest mutacja nonsensowna?', back: 'Substytucją, która tworzy kodon stop i skraca białko.'),
          Flashcard(id: 'f_k4_zm_7', front: 'Dlaczego delecja jednego nukleotydu jest zwykle groźniejsza od substytucji?', back: 'Przesuwa ramkę odczytu — zmieniają się wszystkie kodony za miejscem mutacji.'),
          Flashcard(id: 'f_k4_zm_8', front: 'Podaj przykład mutacji zmiany sensu.', back: 'Anemia sierpowata — zamiana jednego aminokwasu w hemoglobinie.'),
          Flashcard(id: 'f_k4_zm_9', front: 'Podaj po jednym przykładzie mutagenu fizycznego, chemicznego i biologicznego.', back: 'Promieniowanie UV; benzo(a)piren z dymu tytoniowego; wirus HPV.'),
          Flashcard(id: 'f_k4_zm_10', front: 'Czym są protoonkogeny i onkogeny?', back: 'Protoonkogeny kodują białka pobudzające podziały; po mutacji stają się onkogenami stale pobudzającymi podziały.'),
          Flashcard(id: 'f_k4_zm_11', front: 'Jaką rolę pełni białko p53?', back: 'Przy uszkodzeniu DNA zatrzymuje cykl komórkowy i kieruje komórkę do naprawy lub apoptozy.'),
          Flashcard(id: 'f_k4_zm_12', front: 'Dlaczego mutacje genów naprawy DNA sprzyjają nowotworom?', back: 'W komórce szybko gromadzą się wtedy kolejne mutacje.'),
          Flashcard(id: 'f_k4_zm_13', front: 'Dlaczego ryzyko nowotworu rośnie z wiekiem?', back: 'Nowotwór wymaga nagromadzenia kilku mutacji w jednej komórce, a na to potrzeba czasu.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k4_zm_1', question: 'Opalenizna jest przykładem zmienności:', options: ['Mutacyjnej', 'Rekombinacyjnej', 'Środowiskowej', 'Chromosomowej'], correctIndex: 2, explanation: 'Nie zmienia genotypu i nie jest dziedziczona.'),
          QuizQuestion(id: 'q_k4_zm_2', question: 'Zmienność ciągłą wykazuje:', options: ['Grupa krwi AB0', 'Wzrost człowieka', 'Albinizm', 'Daltonizm'], correctIndex: 1, explanation: 'Wzrost zależy od wielu genów i środowiska.'),
          QuizQuestion(id: 'q_k4_zm_3', question: 'Źródłem zmienności rekombinacyjnej NIE jest:', options: ['Crossing-over', 'Niezależna segregacja chromosomów', 'Mutacja punktowa', 'Losowe łączenie się gamet'], correctIndex: 2, explanation: 'Mutacja tworzy nowy allel — to zmienność mutacyjna.'),
          QuizQuestion(id: 'q_k4_zm_4', question: 'Zamiana kodonu UAU (tyrozyna) na UAA to mutacja:', options: ['Cicha', 'Zmiany sensu', 'Nonsensowna', 'Przesuwająca ramkę odczytu'], correctIndex: 2, explanation: 'UAA jest kodonem stop.'),
          QuizQuestion(id: 'q_k4_zm_5', question: 'Przesunięcie ramki odczytu wywołuje:', options: ['Substytucja jednego nukleotydu', 'Delecja jednego nukleotydu', 'Mutacja cicha', 'Duplikacja całego genu'], correctIndex: 1, explanation: 'Utrata jednego nukleotydu zmienia sposób odczytu wszystkich dalszych kodonów.'),
          QuizQuestion(id: 'q_k4_zm_6', question: 'Mutacja cicha nie zmienia białka dzięki:', options: ['Uniwersalności kodu', 'Degeneracji kodu', 'Obróbce potranskrypcyjnej', 'Naprawie DNA'], correctIndex: 1, explanation: 'Ten sam aminokwas może być kodowany przez kilka kodonów.'),
          QuizQuestion(id: 'q_k4_zm_7', question: 'Mutagenem biologicznym jest:', options: ['Promieniowanie UV', 'Benzo(a)piren', 'Wirus HPV', 'Azbest'], correctIndex: 2, explanation: 'Pozostałe czynniki są fizyczne lub chemiczne.'),
          QuizQuestion(id: 'q_k4_zm_8', question: 'Onkogen powstaje w wyniku mutacji:', options: ['Genu supresorowego', 'Protoonkogenu', 'Genu kodującego tRNA', 'Intronu'], correctIndex: 1, explanation: 'Zmutowany protoonkogen stale pobudza podziały.'),
          QuizQuestion(id: 'q_k4_zm_9', question: 'Białko p53 w komórce z uszkodzonym DNA:', options: ['Przyspiesza podziały komórki mimo uszkodzenia DNA', 'Zatrzymuje cykl komórkowy i kieruje komórkę do naprawy lub apoptozy', 'Wycina introny z genów uszkodzonych przez mutagen', 'Wytwarza przeciwciała niszczące komórki nowotworowe'], correctIndex: 1, explanation: 'Gen TP53 jest genem supresorowym.'),
          QuizQuestion(id: 'q_k4_zm_10', question: 'Mutacje w komórkach somatycznych:', options: ['Są zawsze przekazywane potomstwu', 'Nie są dziedziczone, ale mogą prowadzić do nowotworu', 'Nie mają żadnego wpływu na organizm', 'Dotyczą wyłącznie gamet'], correctIndex: 1, explanation: 'Potomstwo powstaje z gamet, a nie z komórek somatycznych.'),
        ],
      ),
      Topic(
        id: 'k4_zmiennosc_aberracje',
        name: 'Aberracje chromosomowe i choroby genetyczne człowieka',
        theory: '''
ABERRACJE CHROMOSOMOWE STRUKTURALNE
Aberracje strukturalne zmieniają budowę chromosomów. Delecja to utrata fragmentu chromosomu — przykładem jest zespół kociego krzyku, spowodowany utratą fragmentu chromosomu 5. Duplikacja to podwojenie fragmentu, inwersja — odwrócenie fragmentu o 180°, a translokacja — przeniesienie fragmentu na chromosom niehomologiczny; translokacja między chromosomami 9 i 22 prowadzi do przewlekłej białaczki szpikowej. Skutki zależą od wielkości i miejsca zmiany: utrata lub nadmiar materiału genetycznego zwykle powodują wady rozwojowe i niepełnosprawność intelektualną, natomiast nosiciel translokacji zrównoważonej jest zdrowy, ale może mieć potomstwo z wadami lub doświadczać poronień.

ABERRACJE CHROMOSOMOWE LICZBOWE
Aneuploidie to zmiany liczby pojedynczych chromosomów, powstające najczęściej wskutek nieprawidłowego rozejścia się chromosomów podczas mejozy. Trisomia (2n+1) oznacza obecność dodatkowego chromosomu, a monosomia (2n−1) — brak jednego z nich; ryzyko ich wystąpienia rośnie z wiekiem matki. Poliploidie to zwielokrotnienie całych zestawów chromosomów (3n, 4n i więcej). U zwierząt są zwykle śmiertelne, natomiast u roślin występują często i są wykorzystywane w rolnictwie — pszenica zwyczajna jest heksaploidem, a poliploidy mają często większe owoce i nasiona. Poliploidyzacja może też prowadzić do powstania nowego gatunku.

KARIOTYP
Kariotyp to zestaw chromosomów komórki, uporządkowany według ich wielkości i kształtu. Prawidłowy kariotyp człowieka obejmuje 46 chromosomów — 22 pary autosomów i parę chromosomów płci — i zapisuje się go jako 46,XX u kobiety i 46,XY u mężczyzny. Analiza kariotypu pozwala rozpoznać aberracje chromosomowe, ale nie pozwala wykryć chorób genowych, bo te zmieniają sekwencję nukleotydów, a nie liczbę czy budowę chromosomów. Sposób dziedziczenia chorób jednogenowych ustala się natomiast na podstawie analizy rodowodu.

CHOROBY GENOWE
Mukowiscydoza dziedziczy się autosomalnie recesywnie. Mutacja genu CFTR, kodującego kanał chlorkowy w błonach komórek, sprawia, że wydzieliny gruczołów stają się gęste i lepkie — zatykają oskrzela, powodując nawracające zakażenia płuc, oraz przewody trzustki, zaburzając trawienie; w Polsce wykrywa się ją w przesiewowych badaniach noworodków. Fenyloketonuria również dziedziczy się autosomalnie recesywnie: brak aktywnego enzymu przekształcającego fenyloalaninę w tyrozynę powoduje gromadzenie się fenyloalaniny, która uszkadza rozwijający się mózg. Wykrywa się ją w badaniu przesiewowym noworodków, a ścisła dieta uboga w fenyloalaninę zapobiega niepełnosprawności intelektualnej. Pląsawica Huntingtona dziedziczy się autosomalnie dominująco; wywołuje ją wydłużenie ciągu powtórzeń trójki nukleotydów CAG w genie. Objawy — mimowolne ruchy, zaburzenia psychiczne i otępienie — pojawiają się zwykle między 35. a 45. rokiem życia, często już po urodzeniu dzieci, a choroba jest nieuleczalna. Hemofilia dziedziczy się recesywnie w sposób sprzężony z chromosomem X; brak czynnika krzepnięcia (czynnika VIII w hemofilii A) powoduje przedłużone krwawienia i wylewy do stawów, a leczy się ją podawaniem brakującego czynnika. Daltonizm, również recesywny i sprzężony z chromosomem X, polega na zaburzeniu rozróżniania barw, najczęściej czerwonej i zielonej; dotyczy około 8% mężczyzn i poniżej 1% kobiet.

ZESPOŁY WYWOŁANE ABERRACJAMI LICZBOWYMI
Zespół Downa jest wywołany trisomią chromosomu 21 (kariotyp 47,XX,+21 lub 47,XY,+21). Charakteryzuje się niepełnosprawnością intelektualną różnego stopnia, charakterystycznymi rysami twarzy, obniżonym napięciem mięśniowym i częstymi wadami serca. Zespół Turnera dotyczy kobiet z jednym chromosomem X (45,X): cechuje go niski wzrost, niedorozwój jajników i bezpłodność oraz brak samoistnego dojrzewania płciowego, przy zwykle prawidłowej inteligencji. Zespół Klinefeltera dotyczy mężczyzn z dodatkowym chromosomem X (47,XXY): cechuje go wysoki wzrost, niedorozwój jąder i bezpłodność.
''',
        flashcards: [
          Flashcard(id: 'f_k4_zm_14', front: 'Wymień rodzaje aberracji chromosomowych strukturalnych.', back: 'Delecja, duplikacja, inwersja i translokacja.'),
          Flashcard(id: 'f_k4_zm_15', front: 'Czym jest translokacja?', back: 'Przeniesieniem fragmentu chromosomu na chromosom niehomologiczny.'),
          Flashcard(id: 'f_k4_zm_16', front: 'Czym jest aneuploidia i jak powstaje?', back: 'Zmianą liczby pojedynczych chromosomów — najczęściej wskutek nieprawidłowego rozejścia się chromosomów w mejozie.'),
          Flashcard(id: 'f_k4_zm_17', front: 'Czym różni się trisomia od monosomii?', back: 'Trisomia to dodatkowy chromosom (2n+1), monosomia — brak jednego chromosomu (2n−1).'),
          Flashcard(id: 'f_k4_zm_18', front: 'Czym jest poliploidia i gdzie ma znaczenie praktyczne?', back: 'Zwielokrotnieniem całych zestawów chromosomów; wykorzystuje się ją u roślin uprawnych (pszenica jest heksaploidem).'),
          Flashcard(id: 'f_k4_zm_19', front: 'Jaki jest prawidłowy kariotyp człowieka?', back: '46 chromosomów: 22 pary autosomów i para chromosomów płci (46,XX lub 46,XY).'),
          Flashcard(id: 'f_k4_zm_20', front: 'Jak dziedziczy się mukowiscydoza i czym się objawia?', back: 'Autosomalnie recesywnie; gęsty, lepki śluz zatyka oskrzela i przewody trzustki.'),
          Flashcard(id: 'f_k4_zm_21', front: 'Na czym polega fenyloketonuria i jak się ją leczy?', back: 'To choroba autosomalna recesywna — brak enzymu przekształcającego fenyloalaninę, której nadmiar uszkadza mózg; leczy się dietą ubogą w fenyloalaninę.'),
          Flashcard(id: 'f_k4_zm_22', front: 'Jak dziedziczy się pląsawica Huntingtona i kiedy się ujawnia?', back: 'Autosomalnie dominująco; objawy pojawiają się zwykle między 35. a 45. rokiem życia.'),
          Flashcard(id: 'f_k4_zm_23', front: 'Którego czynnika krzepnięcia brakuje w hemofilii A?', back: 'Czynnika VIII.'),
          Flashcard(id: 'f_k4_zm_24', front: 'Jaki kariotyp ma osoba z zespołem Downa?', back: '47 chromosomów z trzema chromosomami 21, np. 47,XY,+21.'),
          Flashcard(id: 'f_k4_zm_25', front: 'Jaki kariotyp i objawy ma zespół Turnera?', back: '45,X — kobieta niskiego wzrostu z niedorozwojem jajników i bezpłodnością.'),
          Flashcard(id: 'f_k4_zm_26', front: 'Jaki kariotyp i objawy ma zespół Klinefeltera?', back: '47,XXY — mężczyzna wysokiego wzrostu z niedorozwojem jąder i bezpłodnością.'),
          Flashcard(id: 'f_k4_zm_27', front: 'Dlaczego mukowiscydozy nie widać w kariotypie?', back: 'To choroba genowa — zmienia sekwencję nukleotydów, a nie liczbę czy budowę chromosomów.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k4_zm_11', question: 'Zespół Downa jest wynikiem:', options: ['Monosomii chromosomu X', 'Trisomii chromosomu 21', 'Delecji fragmentu chromosomu 5', 'Mutacji genu CFTR'], correctIndex: 1, explanation: 'To aberracja chromosomowa liczbowa.'),
          QuizQuestion(id: 'q_k4_zm_12', question: 'Kariotyp 45,X oznacza zespół:', options: ['Downa', 'Klinefeltera', 'Turnera', 'Huntingtona'], correctIndex: 2, explanation: 'To monosomia chromosomu X u kobiety.'),
          QuizQuestion(id: 'q_k4_zm_13', question: 'Chorobą dziedziczoną autosomalnie dominująco jest:', options: ['Mukowiscydoza', 'Fenyloketonuria', 'Pląsawica Huntingtona', 'Hemofilia'], correctIndex: 2, explanation: 'Wystarczy jedna kopia zmutowanego allelu.'),
          QuizQuestion(id: 'q_k4_zm_14', question: 'Fenyloketonurię leczy się:', options: ['Podawaniem czynnika krzepnięcia', 'Dietą ubogą w fenyloalaninę', 'Przeszczepem płuc', 'Podawaniem testosteronu'], correctIndex: 1, explanation: 'Ograniczenie fenyloalaniny chroni rozwijający się mózg.'),
          QuizQuestion(id: 'q_k4_zm_15', question: 'Odwrócenie fragmentu chromosomu o 180° to:', options: ['Delecja', 'Duplikacja', 'Inwersja', 'Translokacja'], correctIndex: 2, explanation: 'Materiał genetyczny nie jest tracony, zmienia się jego ułożenie.'),
          QuizQuestion(id: 'q_k4_zm_16', question: 'Na podstawie kariotypu można rozpoznać:', options: ['Mukowiscydozę', 'Zespół Klinefeltera', 'Fenyloketonurię', 'Daltonizm'], correctIndex: 1, explanation: 'Dodatkowy chromosom X jest widoczny w kariotypie; pozostałe to choroby genowe.'),
          QuizQuestion(id: 'q_k4_zm_17', question: 'Przyczyną mukowiscydozy jest mutacja genu kodującego:', options: ['Hemoglobinę', 'Kanał chlorkowy CFTR', 'Czynnik krzepnięcia VIII', 'Białko p53'], correctIndex: 1, explanation: 'Wadliwy kanał chlorkowy zmienia skład wydzielin gruczołów.'),
          QuizQuestion(id: 'q_k4_zm_18', question: 'Pszenica zwyczajna jest przykładem organizmu:', options: ['Aneuploidalnego', 'Poliploidalnego', 'Haploidalnego', 'Z translokacją'], correctIndex: 1, explanation: 'Pszenica zwyczajna jest heksaploidem.'),
          QuizQuestion(id: 'q_k4_zm_19', question: 'Zdrowi rodzice mają dziecko chore na mukowiscydozę. Prawdopodobieństwo, że kolejne dziecko będzie chore, wynosi:', options: ['0%', '25%', '50%', '100%'], correctIndex: 1, explanation: 'Oboje rodzice są nosicielami (Aa × Aa), więc ryzyko wynosi 1/4.'),
          QuizQuestion(id: 'q_k4_zm_20', question: 'Aneuploidie powstają najczęściej wskutek:', options: ['Crossing-over między chromosomami homologicznymi', 'Nieprawidłowego rozejścia się chromosomów w mejozie', 'Mutacji cichej w sekwencji kodującej genu', 'Odwrotnej transkrypcji wirusowego RNA'], correctIndex: 1, explanation: 'Gameta otrzymuje wtedy o jeden chromosom za dużo lub za mało.'),
        ],
      ),
    ],
  ),

  // ===========================================================================
  // XV. BIOTECHNOLOGIA. PODSTAWY INŻYNIERII GENETYCZNEJ
  // ===========================================================================
  Chapter(
    id: 'k4_biotechnologia',
    name: 'Biotechnologia i inżynieria genetyczna',
    topics: [
      Topic(
        id: 'k4_biotech_techniki',
        name: 'Biotechnologia tradycyjna i techniki inżynierii genetycznej',
        theory: '''
BIOTECHNOLOGIA TRADYCYJNA I MOLEKULARNA
Biotechnologia to wykorzystywanie organizmów, ich części lub procesów biologicznych do wytwarzania produktów i świadczenia usług. Biotechnologia tradycyjna posługuje się organizmami w ich naturalnej postaci — bez zmian w materiale genetycznym — i wykorzystuje ich naturalne zdolności, np. do fermentacji. Biotechnologia molekularna opiera się na inżynierii genetycznej, czyli celowym zmienianiu materiału genetycznego organizmów.

WSPÓŁCZESNE ZASTOSOWANIA BIOTECHNOLOGII TRADYCYJNEJ
W przemyśle spożywczym drożdże wykorzystuje się w piekarnictwie, piwowarstwie i winiarstwie, bakterie fermentacji mlekowej — do produkcji jogurtów, kefirów, serów i kiszonek, a bakterie octowe — do produkcji octu. W przemyśle farmaceutycznym grzyby i bakterie wytwarzają antybiotyki, np. penicylinę, a także witaminy i enzymy. W rolnictwie stosuje się kiszenie pasz, kompostowanie oraz biopreparaty — np. szczepionki z bakteriami brodawkowymi wzbogacającymi glebę w azot czy mikroorganizmy zwalczające szkodniki upraw. W procesach biodegradacji mikroorganizmy rozkładają zanieczyszczenia, np. ropę naftową po wyciekach — ten sposób oczyszczania środowiska nazywamy bioremediacją. W oczyszczalniach ścieków bakterie i protisty tworzące osad czynny rozkładają materię organiczną, a w komorach fermentacyjnych mikroorganizmy beztlenowe przekształcają osady w biogaz.

NARZĘDZIA BIOTECHNOLOGII MOLEKULARNEJ
Enzymy restrykcyjne pochodzą z bakterii, które chronią się nimi przed obcym DNA bakteriofagów. Rozpoznają krótkie, swoiste sekwencje nukleotydów i przecinają DNA w ściśle określonym miejscu, często tworząc lepkie końce — krótkie jednoniciowe odcinki, które łatwo łączą się z komplementarnymi końcami innego DNA pociętego tym samym enzymem. Ligazy łączą fragmenty DNA, tworząc między nimi wiązania fosfodiestrowe, dzięki czemu można wkleić gen do nośnika. Polimerazy DNA syntetyzują nić DNA na matrycy — w metodzie PCR używa się polimeraz termostabilnych, pochodzących z mikroorganizmów żyjących w gorących źródłach. Szczególną polimerazą jest odwrotna transkryptaza, która pozwala uzyskać DNA na podstawie cząsteczki mRNA.

TECHNIKI INŻYNIERII GENETYCZNEJ
Analiza restrykcyjna polega na pocięciu DNA enzymami restrykcyjnymi na fragmenty, których liczba i długość zależą od sekwencji danego DNA. Elektroforeza rozdziela fragmenty DNA w żelu pod wpływem pola elektrycznego: DNA ma ładunek ujemny, więc wędruje w stronę elektrody dodatniej, a krótsze fragmenty przemieszczają się szybciej i dalej niż dłuższe. Hybrydyzacja DNA wykorzystuje zdolność pojedynczych nici DNA do łączenia się z nićmi komplementarnymi — znakowana sonda molekularna odnajduje w badanej próbce poszukiwaną sekwencję, np. zmutowany gen. Łańcuchowa reakcja polimerazy (PCR) pozwala w krótkim czasie powielić wybrany fragment DNA w milionach kopii, nawet z bardzo małej ilości materiału. Każdy jej cykl obejmuje denaturację, czyli rozdzielenie nici DNA w temperaturze około 95°C, przyłączenie starterów do nici matrycowych w niższej temperaturze, około 50–65°C, oraz wydłużanie nowych nici przez termostabilną polimerazę DNA w około 72°C. W każdym cyklu liczba kopii się podwaja, więc po 10 cyklach z jednej cząsteczki powstaje teoretycznie 1024 kopii. Sekwencjonowanie metodą Sangera pozwala ustalić kolejność nukleotydów w DNA: synteza nowej nici jest przerywana w przypadkowych miejscach przez wbudowanie znakowanych, zmodyfikowanych nukleotydów (dideoksynukleotydów), a powstałe fragmenty różnej długości rozdziela się elektroforetycznie i na podstawie ich długości oraz znacznika odczytuje sekwencję.

ZASTOSOWANIA W MEDYCYNIE SĄDOWEJ, KRYMINALISTYCE I DIAGNOSTYCE
Profil genetyczny, zwany odciskiem palca DNA, opiera się na analizie bardzo zmiennych odcinków DNA, które u każdego człowieka — poza bliźniętami jednojajowymi — mają niepowtarzalny układ. Materiał biologiczny z miejsca przestępstwa, np. krew, ślinę, włosy z cebulkami czy naskórek, powiela się metodą PCR i porównuje z profilem podejrzanego, co pozwala wskazać lub wykluczyć sprawcę. Tą samą metodą ustala się ojcostwo — dziecko dziedziczy połowę markerów DNA po matce i połowę po ojcu — oraz identyfikuje ofiary katastrof i szczątki ludzkie. W diagnostyce techniki inżynierii genetycznej pozwalają wykrywać mutacje odpowiedzialne za choroby genetyczne, np. mukowiscydozę, stwierdzać nosicielstwo, prowadzić diagnostykę prenatalną oraz szybko wykrywać materiał genetyczny wirusów i bakterii.
''',
        flashcards: [
          Flashcard(id: 'f_k4_bio_1', front: 'Czym różni się biotechnologia tradycyjna od molekularnej?', back: 'Tradycyjna wykorzystuje organizmy bez zmian w ich materiale genetycznym; molekularna opiera się na inżynierii genetycznej.'),
          Flashcard(id: 'f_k4_bio_2', front: 'Podaj przykłady biotechnologii tradycyjnej w przemyśle spożywczym.', back: 'Drożdże w piekarnictwie i piwowarstwie; bakterie fermentacji mlekowej w produkcji jogurtów, serów i kiszonek.'),
          Flashcard(id: 'f_k4_bio_3', front: 'Czym jest bioremediacja?', back: 'Oczyszczaniem środowiska za pomocą mikroorganizmów rozkładających zanieczyszczenia, np. ropę naftową.'),
          Flashcard(id: 'f_k4_bio_4', front: 'Jaką rolę w oczyszczalni ścieków pełni osad czynny?', back: 'Bakterie i protisty osadu czynnego rozkładają materię organiczną ścieków.'),
          Flashcard(id: 'f_k4_bio_5', front: 'Jak działają enzymy restrykcyjne?', back: 'Rozpoznają swoiste sekwencje DNA i przecinają je w ściśle określonym miejscu, często tworząc lepkie końce.'),
          Flashcard(id: 'f_k4_bio_6', front: 'Czym są lepkie końce?', back: 'Jednoniciowymi odcinkami DNA powstałymi po cięciu, które łączą się z komplementarnymi końcami innego DNA pociętego tym samym enzymem.'),
          Flashcard(id: 'f_k4_bio_7', front: 'Do czego w inżynierii genetycznej służy ligaza?', back: 'Do łączenia fragmentów DNA, np. wklejania genu do nośnika.'),
          Flashcard(id: 'f_k4_bio_8', front: 'Na czym polega elektroforeza DNA?', back: 'Na rozdziale fragmentów DNA w żelu w polu elektrycznym — krótsze fragmenty wędrują dalej w stronę elektrody dodatniej.'),
          Flashcard(id: 'f_k4_bio_9', front: 'Dlaczego DNA wędruje w elektroforezie do elektrody dodatniej?', back: 'Ma ładunek ujemny dzięki resztom fosforanowym.'),
          Flashcard(id: 'f_k4_bio_10', front: 'Wymień etapy cyklu PCR.', back: 'Denaturacja (ok. 95°C), przyłączanie starterów (ok. 50–65°C), wydłużanie nici przez polimerazę (ok. 72°C).'),
          Flashcard(id: 'f_k4_bio_11', front: 'Dlaczego w PCR stosuje się termostabilną polimerazę DNA?', back: 'Nie ulega denaturacji w wysokiej temperaturze etapu rozdzielania nici.'),
          Flashcard(id: 'f_k4_bio_12', front: 'Ile kopii DNA powstaje teoretycznie z jednej cząsteczki po 10 cyklach PCR?', back: '1024 (2 do potęgi 10).'),
          Flashcard(id: 'f_k4_bio_13', front: 'Na czym polega hybrydyzacja DNA?', back: 'Na łączeniu się pojedynczych nici DNA z komplementarnymi — znakowana sonda odnajduje poszukiwaną sekwencję.'),
          Flashcard(id: 'f_k4_bio_14', front: 'Na czym opiera się sekwencjonowanie metodą Sangera?', back: 'Synteza nici przerywana jest przez znakowane dideoksynukleotydy, a fragmenty różnej długości rozdziela się elektroforetycznie i odczytuje sekwencję.'),
          Flashcard(id: 'f_k4_bio_15', front: 'Na czym polega ustalanie ojcostwa na podstawie DNA?', back: 'Dziecko ma połowę markerów DNA od matki i połowę od ojca — porównuje się profile genetyczne.'),
          Flashcard(id: 'f_k4_bio_16', front: 'Dlaczego profil DNA nie odróżni bliźniąt jednojajowych?', back: 'Mają identyczny materiał genetyczny.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k4_bio_1', question: 'W naturze enzymy restrykcyjne chronią bakterie przed:', options: ['Antybiotykami', 'Obcym DNA bakteriofagów', 'Wysoką temperaturą', 'Wysychaniem'], correctIndex: 1, explanation: 'Przecinają DNA wirusa, zanim ten zdąży się namnożyć.'),
          QuizQuestion(id: 'q_k4_bio_2', question: 'Po elektroforezie najdalej od miejsca naniesienia próbki znajdą się fragmenty DNA:', options: ['Najdłuższe', 'Najkrótsze', 'Dwuniciowe', 'Wszystkie w tej samej odległości'], correctIndex: 1, explanation: 'Krótkie fragmenty łatwiej przemieszczają się przez żel.'),
          QuizQuestion(id: 'q_k4_bio_3', question: 'Etapem PCR, w którym rozdzielają się nici DNA, jest:', options: ['Wydłużanie', 'Przyłączanie starterów', 'Denaturacja', 'Ligacja'], correctIndex: 2, explanation: 'Zachodzi w temperaturze około 95°C.'),
          QuizQuestion(id: 'q_k4_bio_4', question: 'Wektor w inżynierii genetycznej to:', options: ['Enzym tnący DNA', 'Nośnik wprowadzający gen do komórki', 'Białko kodowane przez wprowadzony gen', 'Odcinek intronu'], correctIndex: 1, explanation: 'Wektorem jest np. plazmid lub zmodyfikowany wirus.'),
          QuizQuestion(id: 'q_k4_bio_5', question: 'Kiszenie kapusty jest przykładem biotechnologii:', options: ['Molekularnej', 'Tradycyjnej', 'Inżynierii genetycznej', 'Terapii genowej'], correctIndex: 1, explanation: 'Bakterie fermentacji mlekowej nie są modyfikowane genetycznie.'),
          QuizQuestion(id: 'q_k4_bio_6', question: 'Z jednej cząsteczki DNA po 5 cyklach PCR powstaje teoretycznie kopii:', options: ['10', '25', '32', '64'], correctIndex: 2, explanation: 'Liczba kopii podwaja się w każdym cyklu: 2 do potęgi 5 = 32.'),
          QuizQuestion(id: 'q_k4_bio_7', question: 'Metoda Sangera służy do:', options: ['Powielania DNA', 'Ustalania sekwencji nukleotydów', 'Cięcia DNA', 'Łączenia fragmentów DNA'], correctIndex: 1, explanation: 'To metoda sekwencjonowania DNA.'),
          QuizQuestion(id: 'q_k4_bio_8', question: 'Materiałem do ustalenia profilu DNA człowieka NIE może być:', options: ['Krew', 'Ślina', 'Włos z cebulką', 'Dojrzały erytrocyt'], correctIndex: 3, explanation: 'Dojrzałe erytrocyty człowieka nie mają jądra, a więc DNA jądrowego.'),
          QuizQuestion(id: 'q_k4_bio_9', question: 'Łączenie fragmentów DNA wiązaniami fosfodiestrowymi katalizuje:', options: ['Enzym restrykcyjny', 'Ligaza', 'Helikaza', 'Polimeraza RNA'], correctIndex: 1, explanation: 'Ligaza wkleja gen do wektora.'),
        ],
      ),
      Topic(
        id: 'k4_biotech_gmo',
        name: 'GMO, klonowanie, komórki macierzyste i terapia genowa',
        theory: '''
ORGANIZMY ZMODYFIKOWANE GENETYCZNIE I TRANSGENICZNE
Organizm zmodyfikowany genetycznie (GMO) to organizm, którego materiał genetyczny zmieniono metodami inżynierii genetycznej w sposób niezachodzący w warunkach naturalnych. Organizm transgeniczny to taki GMO, do którego genomu wprowadzono gen pochodzący z innego gatunku.

OTRZYMYWANIE ORGANIZMÓW TRANSGENICZNYCH
Gen wprowadza się do komórki za pomocą wektora, czyli nośnika. U bakterii wektorem jest najczęściej plazmid: plazmid i gen tnie się tym samym enzymem restrykcyjnym, łączy ligazą, a następnie wprowadza zrekombinowany plazmid do bakterii i wybiera komórki, które go przyjęły. Do roślin gen wprowadza się za pomocą bakterii Agrobacterium tumefaciens, która w naturze przenosi fragment swojego plazmidu do genomu komórek roślinnych, albo przez wstrzeliwanie DNA osadzonego na mikroskopijnych drobinach złota; z pojedynczej zmodyfikowanej komórki odtwarza się całą roślinę. U zwierząt DNA wstrzykuje się do jądra zapłodnionej komórki jajowej (mikroiniekcja) lub wprowadza za pomocą zmodyfikowanych wirusów.

KORZYŚCI I ZAGROŻENIA ZWIĄZANE Z GMO
W medycynie i przemyśle farmaceutycznym zmodyfikowane bakterie i drożdże wytwarzają ludzką insulinę, hormon wzrostu, czynniki krzepnięcia krwi i szczepionki, m.in. przeciw wirusowemu zapaleniu wątroby typu B. W rolnictwie uzyskuje się rośliny odporne na szkodniki — np. kukurydzę Bt wytwarzającą białko toksyczne dla gąsienic — na herbicydy, suszę i choroby, a także rośliny o większej wartości odżywczej, jak złoty ryż zawierający beta-karoten, z którego organizm wytwarza witaminę A. W przemyśle GMO wytwarzają enzymy stosowane w proszkach do prania i przetwórstwie żywności, a w badaniach naukowych zmodyfikowane myszy służą jako modele chorób człowieka. Wśród zagrożeń wymienia się możliwość przeniesienia wprowadzonych genów do dzikich gatunków pokrewnych, wpływ na organizmy niebędące celem modyfikacji, np. owady zapylające, powstawanie szkodników i chwastów odpornych na stosowane środki, zmniejszenie różnorodności odmian uprawnych, ryzyko alergii na nowe białka oraz uzależnienie rolników od firm nasiennych. Dlatego w Unii Europejskiej GMO podlegają szczegółowym badaniom, kontroli i obowiązkowemu oznakowaniu.

KLONOWANIE ORGANIZMÓW
Klon to organizm identyczny genetycznie z innym organizmem. W metodzie transferu jąder komórkowych z komórki jajowej usuwa się jądro i wprowadza na jego miejsce jądro komórki somatycznej dawcy; powstała komórka dzieli się jak zygota, a zarodek przenosi się do macicy matki zastępczej. Tą metodą w 1996 roku uzyskano owcę Dolly — pierwszego ssaka sklonowanego z komórki dorosłego osobnika. Metoda rozdziału komórek zarodka polega na rozdzieleniu komórek zarodka na bardzo wczesnym etapie rozwoju; każda z nich może rozwinąć się w osobny organizm, co odtwarza naturalny sposób powstawania bliźniąt jednojajowych. Klonowanie wykorzystuje się w hodowli zwierząt do szybkiego powielania osobników o cennych cechach, do uzyskiwania zwierząt transgenicznych wytwarzających leki, w próbach ratowania ginących gatunków i w badaniach naukowych.

KOMÓRKI MACIERZYSTE
Komórki macierzyste to komórki niezróżnicowane, zdolne do wielokrotnych podziałów i przekształcania się w komórki wyspecjalizowane. Zarodkowe komórki macierzyste, pozyskiwane z wczesnego zarodka, mogą dać początek każdemu rodzajowi komórek ciała. Komórki macierzyste dorosłego organizmu, np. ze szpiku kostnego, mają ograniczone możliwości i przekształcają się głównie w komórki określonej tkanki. Cennym ich źródłem jest krew pępowinowa, pobierana bezboleśnie po porodzie. Indukowane pluripotencjalne komórki macierzyste (iPS) uzyskuje się, przeprogramowując zwykłe komórki somatyczne — co pozwala uniknąć zarówno niszczenia zarodków, jak i odrzucenia przeszczepu, bo komórki pochodzą od samego pacjenta. Komórki macierzyste wykorzystuje się w przeszczepach szpiku u chorych na białaczki, w leczeniu rozległych oparzeń oraz w badaniach nad regeneracją uszkodzonych narządów, np. mięśnia sercowego czy rdzenia kręgowego.

PORADNICTWO GENETYCZNE
Z poradnictwa genetycznego warto skorzystać, gdy w rodzinie występowały choroby genetyczne lub wady wrodzone, gdy jedno z partnerów planujących dziecko jest chore lub jest nosicielem choroby, gdy kobieta ma ponad 35 lat, przy nawracających poronieniach i niepłodności, gdy partnerzy są ze sobą spokrewnieni, po narażeniu na czynniki mutagenne przed ciążą lub w jej trakcie oraz przy nieprawidłowym wyniku badań prenatalnych. Genetyk ocenia ryzyko wystąpienia choroby u potomstwa, kieruje na odpowiednie badania i pomaga podjąć świadome decyzje.

TERAPIA GENOWA
Terapia genowa polega na wprowadzeniu do komórek pacjenta prawidłowej kopii genu, która zastępuje lub uzupełnia działanie genu zmutowanego, albo na wyłączeniu lub naprawieniu wadliwego genu. Gen dostarcza się najczęściej za pomocą zmodyfikowanych wirusów, pozbawionych zdolności wywoływania choroby. Można modyfikować komórki pobrane od pacjenta poza jego organizmem i ponownie je podać lub wprowadzać gen bezpośrednio do tkanek. Terapia dotyczy komórek somatycznych, więc wprowadzone zmiany nie są dziedziczone przez potomstwo. Stosuje się ją m.in. w leczeniu niektórych chorób dziedzicznych, np. rdzeniowego zaniku mięśni, i niektórych nowotworów krwi.

SZANSE, ZAGROŻENIA I PROBLEMY ETYCZNE
Biotechnologia molekularna daje szansę na leczenie chorób genetycznych i nowotworów, tanią produkcję bezpiecznych leków, szybką diagnostykę, zwiększenie plonów i ochronę środowiska. Budzi też obawy: przed nieprzewidzianymi skutkami modyfikacji dla zdrowia i ekosystemów, wykorzystaniem technik do celów militarnych lub do „projektowania” cech człowieka, naruszeniem prywatności i dyskryminacją na podstawie danych genetycznych, np. przez pracodawców czy ubezpieczycieli. Kontrowersje etyczne dotyczą zwłaszcza wykorzystywania i niszczenia ludzkich zarodków, klonowania człowieka oraz modyfikowania genów, które byłyby przekazywane kolejnym pokoleniom. Ocena tych problemów wymaga rzetelnej wiedzy i rozważenia argumentów różnych stron, tak aby móc sformułować własną, uzasadnioną opinię.
''',
        flashcards: [
          Flashcard(id: 'f_k4_bio_17', front: 'Czym różni się GMO od organizmu transgenicznego?', back: 'GMO to każdy organizm zmieniony metodami inżynierii genetycznej; organizm transgeniczny ma dodatkowo gen innego gatunku.'),
          Flashcard(id: 'f_k4_bio_18', front: 'Jak wprowadza się gen do bakterii?', back: 'Wkleja się go do plazmidu pociętego tym samym enzymem restrykcyjnym, łączy ligazą i wprowadza plazmid do bakterii.'),
          Flashcard(id: 'f_k4_bio_19', front: 'Jak wprowadza się geny do roślin?', back: 'Za pomocą bakterii Agrobacterium tumefaciens lub przez wstrzeliwanie DNA na drobinach złota.'),
          Flashcard(id: 'f_k4_bio_20', front: 'Jak otrzymuje się zwierzęta transgeniczne?', back: 'Przez mikroiniekcję DNA do jądra zapłodnionej komórki jajowej lub za pomocą zmodyfikowanych wirusów.'),
          Flashcard(id: 'f_k4_bio_21', front: 'Podaj przykłady produktów otrzymywanych dzięki GMO.', back: 'Ludzka insulina, szczepionka przeciw WZW typu B, kukurydza Bt, złoty ryż.'),
          Flashcard(id: 'f_k4_bio_22', front: 'Czym jest złoty ryż?', back: 'Ryżem transgenicznym zawierającym beta-karoten, z którego organizm wytwarza witaminę A.'),
          Flashcard(id: 'f_k4_bio_23', front: 'Wymień zagrożenia związane z uprawą GMO.', back: 'Przeniesienie genów do dzikich gatunków, wpływ na owady zapylające, odporne szkodniki i chwasty, spadek różnorodności odmian, ryzyko alergii.'),
          Flashcard(id: 'f_k4_bio_24', front: 'Na czym polega klonowanie metodą transferu jąder?', back: 'Jądro komórki somatycznej dawcy wprowadza się do komórki jajowej pozbawionej jądra, a zarodek przenosi do matki zastępczej.'),
          Flashcard(id: 'f_k4_bio_25', front: 'Dlaczego owca Dolly była przełomem?', back: 'Była pierwszym ssakiem sklonowanym z komórki dorosłego osobnika (1996).'),
          Flashcard(id: 'f_k4_bio_26', front: 'Na czym polega klonowanie przez rozdział komórek zarodka?', back: 'Komórki wczesnego zarodka rozdziela się, a każda rozwija się w osobny organizm — jak przy powstawaniu bliźniąt jednojajowych.'),
          Flashcard(id: 'f_k4_bio_27', front: 'Czym różnią się zarodkowe komórki macierzyste od komórek macierzystych dorosłych?', back: 'Zarodkowe mogą dać każdy rodzaj komórek, a dorosłe — głównie komórki określonej tkanki.'),
          Flashcard(id: 'f_k4_bio_28', front: 'Czym są komórki iPS i jaka jest ich zaleta?', back: 'Komórkami macierzystymi uzyskanymi przez przeprogramowanie komórek somatycznych; nie wymagają niszczenia zarodków i nie są odrzucane.'),
          Flashcard(id: 'f_k4_bio_29', front: 'Podaj zastosowania komórek macierzystych w medycynie.', back: 'Przeszczepy szpiku przy białaczkach, leczenie oparzeń, badania nad regeneracją narządów.'),
          Flashcard(id: 'f_k4_bio_30', front: 'Kiedy warto skorzystać z poradnictwa genetycznego?', back: 'Przy chorobach genetycznych w rodzinie, nosicielstwie, wieku kobiety powyżej 35 lat, nawracających poronieniach i pokrewieństwie partnerów.'),
          Flashcard(id: 'f_k4_bio_31', front: 'Na czym polega terapia genowa?', back: 'Na wprowadzeniu do komórek pacjenta prawidłowej kopii genu albo wyłączeniu lub naprawie wadliwego genu, najczęściej za pomocą zmodyfikowanych wirusów.'),
          Flashcard(id: 'f_k4_bio_32', front: 'Czy zmiany wprowadzone terapią genową komórek somatycznych są dziedziczone?', back: 'Nie.'),
          Flashcard(id: 'f_k4_bio_33', front: 'Podaj przykład problemu etycznego związanego z inżynierią genetyczną.', back: 'Wykorzystywanie ludzkich zarodków, klonowanie człowieka, dyskryminacja na podstawie danych genetycznych.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k4_bio_10', question: 'Ludzką insulinę produkuje się obecnie głównie za pomocą:', options: ['Wyciągów z trzustek bydła i świń z ubojni', 'Zmodyfikowanych genetycznie bakterii lub drożdży', 'Syntezy chemicznej z pojedynczych aminokwasów', 'Hodowli komórek wysp trzustkowych dawców'], correctIndex: 1, explanation: 'Mikroorganizmy z wprowadzonym ludzkim genem wytwarzają ją w dużych ilościach.'),
          QuizQuestion(id: 'q_k4_bio_11', question: 'Owcę Dolly uzyskano metodą:', options: ['Rozdziału komórek zarodka', 'Transferu jądra komórki somatycznej', 'Mikroiniekcji genu', 'Terapii genowej'], correctIndex: 1, explanation: 'Jądro komórki dorosłej owcy wprowadzono do komórki jajowej pozbawionej jądra.'),
          QuizQuestion(id: 'q_k4_bio_12', question: 'Kukurydza Bt jest odporna na:', options: ['Suszę', 'Owady szkodniki', 'Niskie temperatury', 'Zasolenie gleby'], correctIndex: 1, explanation: 'Wytwarza białko toksyczne dla gąsienic.'),
          QuizQuestion(id: 'q_k4_bio_13', question: 'Do przenoszenia genów do komórek roślinnych wykorzystuje się bakterię:', options: ['Pałeczkę okrężnicy', 'Agrobacterium tumefaciens', 'Helicobacter pylori', 'Bakterię brodawkową'], correctIndex: 1, explanation: 'W naturze przenosi ona fragment swojego plazmidu do genomu rośliny.'),
          QuizQuestion(id: 'q_k4_bio_14', question: 'Komórki macierzyste zdolne do przekształcenia się w każdy rodzaj komórek ciała to komórki:', options: ['Szpiku kostnego dorosłego człowieka', 'Zarodkowe', 'Naskórka', 'Nerwowe'], correctIndex: 1, explanation: 'Komórki macierzyste dorosłych mają ograniczone możliwości różnicowania.'),
          QuizQuestion(id: 'q_k4_bio_15', question: 'Terapia genowa komórek somatycznych:', options: ['Zmienia DNA potomstwa pacjenta', 'Nie wpływa na materiał genetyczny potomstwa', 'Polega na klonowaniu pacjenta', 'Wykorzystuje wyłącznie antybiotyki'], correctIndex: 1, explanation: 'Zmiany nie dotyczą komórek, z których powstają gamety.'),
          QuizQuestion(id: 'q_k4_bio_16', question: 'Rozdzielenie komórek wczesnego zarodka i uzyskanie z nich kilku osobników odtwarza naturalne powstawanie:', options: ['Bliźniąt dwujajowych', 'Bliźniąt jednojajowych', 'Organizmów transgenicznych', 'Hybryd międzygatunkowych'], correctIndex: 1, explanation: 'Wszystkie osobniki mają ten sam materiał genetyczny.'),
          QuizQuestion(id: 'q_k4_bio_17', question: 'Komórki iPS uzyskuje się:', options: ['Z komórek wczesnych zarodków ludzkich', 'Przez przeprogramowanie komórek somatycznych', 'Z krwi pępowinowej pobranej po porodzie', 'Z komórek bakterii modyfikowanych genetycznie'], correctIndex: 1, explanation: 'Dlatego nie wymagają niszczenia zarodków.'),
          QuizQuestion(id: 'q_k4_bio_18', question: 'Wskazaniem do skorzystania z poradnictwa genetycznego jest:', options: ['Przebyte w dzieciństwie złamanie kości przedramienia', 'Mukowiscydoza u rodzeństwa jednego z partnerów planujących dziecko', 'Częste przeziębienia jednego z partnerów w okresie zimowym', 'Niedobór witaminy C stwierdzony u partnerki przed ciążą'], correctIndex: 1, explanation: 'Partner może być nosicielem choroby genetycznej.'),
        ],
      ),
    ],
  ),

  // ===========================================================================
  // XVI. EWOLUCJA
  // ===========================================================================
  Chapter(
    id: 'k4_ewolucja',
    name: 'Ewolucja',
    topics: [
      Topic(
        id: 'k4_ewolucja_dobor',
        name: 'Źródła wiedzy o ewolucji i dobór naturalny',
        theory: '''
EWOLUCJA I ŹRÓDŁA WIEDZY O NIEJ
Ewolucja to proces stopniowych, dziedzicznych zmian organizmów w kolejnych pokoleniach, prowadzący do powstawania nowych gatunków i różnorodności życia. Wiedzy o jej przebiegu i mechanizmach dostarcza wiele dziedzin. Paleontologia bada skamieniałości, które ukazują dawne organizmy i ich zmiany w czasie; szczególnie cenne są formy przejściowe, łączące cechy różnych grup, np. Archaeopteryx z cechami gadów i ptaków czy Tiktaalik, łączący cechy ryb i czworonogów. Anatomia porównawcza wskazuje narządy homologiczne — o wspólnym pochodzeniu i planie budowy, lecz różnych funkcjach, jak kończyny przednie kręgowców — świadczące o pochodzeniu od wspólnego przodka; narządy analogiczne — o podobnej funkcji, ale różnym pochodzeniu, jak skrzydła ptaka i owada — świadczące o upodobnieniu się organizmów żyjących w podobnych warunkach; oraz narządy szczątkowe, np. wyrostek robaczkowy i kość ogonową człowieka, które pełniły funkcje u przodków. Embriologia ukazuje podobieństwo zarodków kręgowców, które na wczesnych etapach rozwoju mają m.in. zawiązki łuków skrzelowych i ogon. Biogeografia pokazuje, że rozmieszczenie gatunków odzwierciedla historię lądów — przykładem są torbacze Australii. Biologia molekularna wykazuje, że im bliżej spokrewnione są gatunki, tym bardziej podobne są ich sekwencje DNA i białek, a uniwersalność kodu genetycznego świadczy o wspólnym pochodzeniu życia. Ewolucję można też obserwować bezpośrednio, np. narastanie oporności bakterii na antybiotyki.

DRZEWO FILOGENETYCZNE
Drzewo filogenetyczne przedstawia pokrewieństwo ewolucyjne gatunków lub większych grup. Każde rozgałęzienie oznacza wspólnego przodka, od którego rozdzieliły się linie rozwojowe. Dwie grupy są tym bliżej spokrewnione, im później rozdzieliły się ich linie, czyli im bliżej końców gałęzi leży ich wspólne rozgałęzienie. O pokrewieństwie nie świadczy kolejność nazw na końcach gałęzi, lecz położenie wspólnego węzła.

ZMIENNOŚĆ JAKO SUROWIEC EWOLUCJI
Dobór naturalny może działać tylko wtedy, gdy osobniki populacji się różnią, a różnice te są dziedziczne. Zmienność środowiskowa nie jest dziedziczona, więc nie ma znaczenia ewolucyjnego. Znaczenie ma zmienność genetyczna: mutacje wprowadzają nowe allele, a rekombinacja — crossing-over, niezależna segregacja chromosomów i losowe łączenie się gamet — tworzy ich nowe kombinacje. Im większa zmienność genetyczna populacji, tym większa szansa, że część osobników przetrwa zmianę warunków środowiska.

MECHANIZM DOBORU NATURALNEGO
Organizmy wydają więcej potomstwa, niż środowisko może utrzymać, dlatego między osobnikami toczy się konkurencja o zasoby. Osobniki różnią się dziedzicznymi cechami, a te, których cechy lepiej odpowiadają warunkom środowiska, częściej przeżywają i wydają potomstwo. Przekazują one swoje allele następnemu pokoleniu częściej niż osobniki gorzej przystosowane, dlatego z pokolenia na pokolenie w populacji wzrasta częstość alleli korzystnych. Dobór naturalny nie tworzy nowej zmienności, lecz wybiera spośród istniejących wariantów. Miarą przystosowania osobnika jest jego dostosowanie, czyli wkład w pulę genową następnego pokolenia.

RODZAJE DOBORU NATURALNEGO
Dobór stabilizujący faworyzuje osobniki o przeciętnych wartościach cechy, a eliminuje skrajne; zachodzi w stabilnym środowisku i utrzymuje populację w obecnym stanie — przykładem jest największa przeżywalność noworodków o przeciętnej masie urodzeniowej. Dobór kierunkowy faworyzuje jedną skrajną postać cechy i przesuwa jej średnią wartość w populacji; zachodzi przy zmianie warunków — przykładami są narastanie oporności bakterii na antybiotyki i owadów na środki owadobójcze czy upowszechnienie się ciemnej formy krępaka nabrzozaka na okopconych drzewach w okresie rozwoju przemysłu. Dobór różnicujący faworyzuje obie skrajne postacie cechy, a eliminuje pośrednie; zachodzi w zróżnicowanym środowisku i może prowadzić do rozdzielenia populacji oraz powstania nowych gatunków — np. gdy w populacji ptaków przewagę mają osobniki o dziobach dużych i małych, przystosowanych do różnych rodzajów nasion.

ADAPTACJE JAKO WYNIK DOBORU NATURALNEGO
Adaptacje to cechy budowy, funkcjonowania lub zachowania, które zwiększają szanse przeżycia i rozrodu w danym środowisku — np. ubarwienie ochronne, odporność na toksyny czy przystosowania do zdobywania pokarmu. Powstają stopniowo, ponieważ dobór naturalny w każdym pokoleniu faworyzuje nosicieli korzystnych alleli. Przystosowanie zawsze odnosi się do określonych warunków: cecha korzystna w jednym środowisku w innym może okazać się niekorzystna.
''',
        flashcards: [
          Flashcard(id: 'f_k4_ew_1', front: 'Wymień źródła wiedzy o ewolucji.', back: 'Skamieniałości i formy przejściowe, anatomia porównawcza, embriologia, biogeografia, biologia molekularna i obserwacje bezpośrednie.'),
          Flashcard(id: 'f_k4_ew_2', front: 'Czym różnią się narządy homologiczne od analogicznych?', back: 'Homologiczne mają wspólne pochodzenie i plan budowy przy różnych funkcjach; analogiczne pełnią podobną funkcję, ale mają różne pochodzenie.'),
          Flashcard(id: 'f_k4_ew_3', front: 'Czym są narządy szczątkowe? Podaj przykład.', back: 'Narządami zredukowanymi, które pełniły funkcje u przodków, np. wyrostek robaczkowy człowieka.'),
          Flashcard(id: 'f_k4_ew_4', front: 'Czym jest forma przejściowa? Podaj przykład.', back: 'Organizmem łączącym cechy dwóch grup, np. Archaeopteryx z cechami gadów i ptaków.'),
          Flashcard(id: 'f_k4_ew_5', front: 'Jak odczytać pokrewieństwo z drzewa filogenetycznego?', back: 'Grupy są tym bliżej spokrewnione, im później rozdzieliły się ich linie od wspólnego przodka.'),
          Flashcard(id: 'f_k4_ew_6', front: 'Dlaczego zmienność środowiskowa nie ma znaczenia ewolucyjnego?', back: 'Nie jest dziedziczona.'),
          Flashcard(id: 'f_k4_ew_7', front: 'Na czym polega dobór naturalny?', back: 'Osobniki lepiej przystosowane częściej przeżywają i wydają potomstwo, więc ich allele stają się częstsze w populacji.'),
          Flashcard(id: 'f_k4_ew_8', front: 'Czy dobór naturalny tworzy zmienność?', back: 'Nie — wybiera spośród istniejących wariantów.'),
          Flashcard(id: 'f_k4_ew_9', front: 'Czym jest dostosowanie?', back: 'Wkładem osobnika w pulę genową następnego pokolenia.'),
          Flashcard(id: 'f_k4_ew_10', front: 'Na czym polega dobór stabilizujący? Podaj przykład.', back: 'Faworyzuje formy przeciętne, eliminuje skrajne — np. przeciętna masa urodzeniowa noworodków.'),
          Flashcard(id: 'f_k4_ew_11', front: 'Na czym polega dobór kierunkowy? Podaj przykład.', back: 'Faworyzuje jedną skrajną postać cechy — np. oporność bakterii na antybiotyki.'),
          Flashcard(id: 'f_k4_ew_12', front: 'Na czym polega dobór różnicujący i do czego może prowadzić?', back: 'Faworyzuje obie skrajne postacie cechy, eliminuje pośrednie; może prowadzić do powstania nowych gatunków.'),
          Flashcard(id: 'f_k4_ew_13', front: 'Czym jest adaptacja?', back: 'Cechą budowy, funkcjonowania lub zachowania zwiększającą szanse przeżycia i rozrodu w danym środowisku.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k4_ew_1', question: 'Skrzydło ptaka i skrzydło owada to narządy:', options: ['Homologiczne', 'Analogiczne', 'Szczątkowe', 'Identyczne genetycznie'], correctIndex: 1, explanation: 'Pełnią tę samą funkcję, ale mają różne pochodzenie.'),
          QuizQuestion(id: 'q_k4_ew_2', question: 'Kończyna przednia kreta i płetwa wieloryba to narządy:', options: ['Analogiczne', 'Homologiczne', 'Szczątkowe', 'Niepowiązane ewolucyjnie'], correctIndex: 1, explanation: 'Mają wspólny plan budowy odziedziczony po przodku.'),
          QuizQuestion(id: 'q_k4_ew_3', question: 'Formą przejściową między gadami a ptakami jest:', options: ['Tiktaalik', 'Archaeopteryx', 'Dziobak', 'Latimeria'], correctIndex: 1, explanation: 'Tiktaalik łączy cechy ryb i czworonogów.'),
          QuizQuestion(id: 'q_k4_ew_4', question: 'Dowodem ewolucji z zakresu biologii molekularnej jest:', options: ['Obecność narządów szczątkowych', 'Podobieństwo sekwencji DNA gatunków spokrewnionych', 'Istnienie skamieniałości', 'Podobieństwo zarodków kręgowców'], correctIndex: 1, explanation: 'Pozostałe odpowiedzi to dowody anatomiczne, paleontologiczne i embriologiczne.'),
          QuizQuestion(id: 'q_k4_ew_5', question: 'Narastanie oporności bakterii na antybiotyki to przykład doboru:', options: ['Stabilizującego', 'Kierunkowego', 'Różnicującego', 'Płciowego'], correctIndex: 1, explanation: 'Faworyzowana jest jedna skrajna postać cechy — oporność.'),
          QuizQuestion(id: 'q_k4_ew_6', question: 'Dobór stabilizujący:', options: ['Faworyzuje formy skrajne', 'Faworyzuje formy przeciętne', 'Tworzy nowe mutacje', 'Zawsze prowadzi do powstania nowego gatunku'], correctIndex: 1, explanation: 'Eliminuje osobniki o skrajnych wartościach cechy.'),
          QuizQuestion(id: 'q_k4_ew_7', question: 'Dobór naturalny działa na:', options: ['Zmienność środowiskową', 'Dziedziczną zmienność osobników', 'Wyłącznie mutacje somatyczne', 'Cechy nabyte w ciągu życia'], correctIndex: 1, explanation: 'Tylko cechy dziedziczne mogą być przekazane potomstwu.'),
          QuizQuestion(id: 'q_k4_ew_8', question: 'Na drzewie filogenetycznym o bliskim pokrewieństwie dwóch gatunków świadczy:', options: ['Sąsiedztwo ich nazw na końcach gałęzi', 'Późne rozdzielenie ich linii rozwojowych', 'Długość gałęzi na rysunku', 'Kolejność alfabetyczna nazw'], correctIndex: 1, explanation: 'Liczy się położenie wspólnego węzła.'),
          QuizQuestion(id: 'q_k4_ew_9', question: 'Wyrostek robaczkowy człowieka jest narządem:', options: ['Analogicznym', 'Szczątkowym', 'Stanowiącym formę przejściową', 'Nowo powstałym w ewolucji'], correctIndex: 1, explanation: 'Jest zredukowaną pozostałością narządu przodków.'),
          QuizQuestion(id: 'q_k4_ew_10', question: 'Dobór różnicujący może prowadzić do:', options: ['Ujednolicenia populacji', 'Rozdzielenia populacji i powstania nowych gatunków', 'Całkowitego zaniku zmienności', 'Utrwalenia form przeciętnych'], correctIndex: 1, explanation: 'Faworyzuje obie skrajne postacie cechy.'),
        ],
      ),
      Topic(
        id: 'k4_ewolucja_populacje',
        name: 'Genetyka populacji i prawo Hardy\'ego–Weinberga',
        theory: '''
POPULACJA I PULA GENOWA
Populacja to grupa osobników jednego gatunku, które zamieszkują ten sam obszar i swobodnie się ze sobą krzyżują. Pula genowa to zbiór wszystkich alleli wszystkich osobników populacji. Ewolucja na poziomie populacji polega na zmianie częstości alleli w puli genowej z pokolenia na pokolenie.

PRZYCZYNY ZMIAN CZĘSTOŚCI ALLELI W POPULACJI
Częstości alleli zmieniają się wskutek mutacji, które wprowadzają nowe allele, doboru naturalnego, który zwiększa częstość alleli korzystnych, dryfu genetycznego, czyli losowych zmian częstości alleli, przepływu genów, czyli migracji osobników między populacjami, wnoszącej nowe allele lub wyrównującej ich częstości, oraz nielosowego kojarzenia się osobników, np. wskutek doboru płciowego lub kojarzenia się krewnych.

DRYF GENETYCZNY
Dryf genetyczny to losowe zmiany częstości alleli, niezależne od tego, czy dany allel jest korzystny. Jego skutki są najsilniejsze w małych populacjach, w których o tym, które osobniki się rozmnożą, decyduje w dużej mierze przypadek — allel może całkowicie zniknąć albo utrwalić się w populacji. Szczególnymi przypadkami dryfu są efekt założyciela i efekt wąskiego gardła. Efekt założyciela występuje, gdy nową populację zakłada niewielka grupa osobników, której pula genowa przypadkowo różni się od puli populacji wyjściowej — dlatego w izolowanych społecznościach niektóre choroby dziedziczne występują częściej niż w innych. Efekt wąskiego gardła występuje, gdy liczebność populacji gwałtownie spada wskutek katastrofy, chorób lub polowań, a ocalałe osobniki mają zubożoną pulę genową — przykładami są żubry, których współczesna populacja wywodzi się od kilkunastu osobników, oraz gepardy. Dryf genetyczny zmniejsza zmienność genetyczną populacji.

PRAWO HARDY'EGO–WEINBERGA
Prawo Hardy'ego–Weinberga mówi, że w populacji idealnej częstości alleli i genotypów pozostają stałe z pokolenia na pokolenie. Populacja idealna jest bardzo liczna (nie zachodzi dryf), jej osobniki kojarzą się losowo, nie zachodzą w niej mutacje, nie ma migracji ani doboru naturalnego. W przyrodzie żadna populacja nie spełnia tych warunków w pełni, dlatego prawo to stanowi punkt odniesienia: odchylenie rzeczywistych częstości od przewidywanych wskazuje, że populacja ewoluuje.

RÓWNANIE HARDY'EGO–WEINBERGA
Dla genu o dwóch allelach — dominującym A o częstości p i recesywnym a o częstości q — zachodzi zależność p + q = 1. Częstości genotypów wynoszą: p² dla homozygot dominujących AA, 2pq dla heterozygot Aa i q² dla homozygot recesywnych aa, a ich suma jest równa jedności: p² + 2pq + q² = 1. Obliczenia rozpoczyna się zwykle od osobników o fenotypie recesywnym, ponieważ tylko ich genotyp jest znany. Jeżeli choroba recesywna występuje u 1 osoby na 10 000, to q² = 0,0001, a więc q = 0,01 i p = 0,99. Częstość heterozygot, czyli nosicieli, wynosi 2pq = 2 · 0,99 · 0,01 ≈ 0,02 — około 2% populacji, a więc nosicieli jest wielokrotnie więcej niż chorych.
''',
        flashcards: [
          Flashcard(id: 'f_k4_ew_14', front: 'Czym jest pula genowa?', back: 'Zbiorem wszystkich alleli wszystkich osobników populacji.'),
          Flashcard(id: 'f_k4_ew_15', front: 'Na czym polega ewolucja na poziomie populacji?', back: 'Na zmianie częstości alleli w puli genowej z pokolenia na pokolenie.'),
          Flashcard(id: 'f_k4_ew_16', front: 'Wymień przyczyny zmian częstości alleli w populacji.', back: 'Mutacje, dobór naturalny, dryf genetyczny, przepływ genów i nielosowe kojarzenie się osobników.'),
          Flashcard(id: 'f_k4_ew_17', front: 'Czym jest dryf genetyczny i gdzie działa najsilniej?', back: 'Losowymi zmianami częstości alleli; działa najsilniej w małych populacjach.'),
          Flashcard(id: 'f_k4_ew_18', front: 'Na czym polega efekt założyciela?', back: 'Nową populację zakłada mała grupa osobników, której pula genowa przypadkowo różni się od puli populacji wyjściowej.'),
          Flashcard(id: 'f_k4_ew_19', front: 'Na czym polega efekt wąskiego gardła? Podaj przykład.', back: 'Gwałtowny spadek liczebności zubaża pulę genową ocalałych osobników — np. żubry i gepardy.'),
          Flashcard(id: 'f_k4_ew_20', front: 'Jakie cechy ma populacja idealna w rozumieniu prawa Hardy\'ego–Weinberga?', back: 'Jest bardzo liczna, kojarzy się losowo, nie ma w niej mutacji, migracji ani doboru naturalnego.'),
          Flashcard(id: 'f_k4_ew_21', front: 'Zapisz równanie Hardy\'ego–Weinberga.', back: 'p² + 2pq + q² = 1, przy czym p + q = 1.'),
          Flashcard(id: 'f_k4_ew_22', front: 'Co oznaczają wyrażenia p², 2pq i q²?', back: 'Częstości genotypów AA, Aa i aa.'),
          Flashcard(id: 'f_k4_ew_23', front: 'Od której grupy osobników zaczyna się obliczenia z równania Hardy\'ego–Weinberga i dlaczego?', back: 'Od osobników o fenotypie recesywnym — tylko ich genotyp (aa) jest znany.'),
          Flashcard(id: 'f_k4_ew_24', front: 'Choroba recesywna występuje u 1 na 10 000 osób. Jaka jest częstość nosicieli?', back: 'q = 0,01, p = 0,99, więc 2pq ≈ 0,02 — około 2%.'),
          Flashcard(id: 'f_k4_ew_25', front: 'Po co stosować prawo Hardy\'ego–Weinberga, skoro populacje idealne nie istnieją?', back: 'Jako punkt odniesienia — odchylenie od przewidywanych częstości wskazuje, że populacja ewoluuje.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k4_ew_11', question: 'Dryf genetyczny najsilniej wpływa na populacje:', options: ['Bardzo liczne', 'Małe', 'O dużej migracji', 'Pozbawione mutacji'], correctIndex: 1, explanation: 'W małych populacjach przypadek ma większy wpływ na przekazywanie alleli.'),
          QuizQuestion(id: 'q_k4_ew_12', question: 'Efekt wąskiego gardła jest przykładem:', options: ['Doboru kierunkowego', 'Dryfu genetycznego', 'Przepływu genów', 'Specjacji'], correctIndex: 1, explanation: 'O tym, które allele przetrwają, decyduje przypadek.'),
          QuizQuestion(id: 'q_k4_ew_13', question: 'Warunkiem stałości częstości alleli według prawa Hardy\'ego–Weinberga NIE jest:', options: ['Duża liczebność populacji', 'Losowe kojarzenie się osobników', 'Silny dobór naturalny', 'Brak migracji'], correctIndex: 2, explanation: 'Dobór naturalny zmienia częstości alleli.'),
          QuizQuestion(id: 'q_k4_ew_14', question: 'Częstość allelu recesywnego q wynosi 0,3. Częstość homozygot recesywnych wynosi:', options: ['0,3', '0,09', '0,42', '0,49'], correctIndex: 1, explanation: 'q² = 0,3 · 0,3 = 0,09.'),
          QuizQuestion(id: 'q_k4_ew_15', question: 'Częstość allelu recesywnego q wynosi 0,3. Częstość heterozygot wynosi:', options: ['0,21', '0,42', '0,49', '0,09'], correctIndex: 1, explanation: 'p = 0,7, więc 2pq = 2 · 0,7 · 0,3 = 0,42.'),
          QuizQuestion(id: 'q_k4_ew_16', question: 'W populacji 16% osobników ma fenotyp recesywny. Częstość allelu dominującego wynosi:', options: ['0,4', '0,6', '0,84', '0,16'], correctIndex: 1, explanation: 'q² = 0,16, więc q = 0,4 i p = 1 − 0,4 = 0,6.'),
          QuizQuestion(id: 'q_k4_ew_17', question: 'Przepływ genów między populacjami wynika z:', options: ['Mutacji', 'Migracji osobników', 'Dryfu genetycznego', 'Doboru stabilizującego'], correctIndex: 1, explanation: 'Migrujące osobniki wnoszą swoje allele do innej populacji.'),
          QuizQuestion(id: 'q_k4_ew_18', question: 'Pula genowa to:', options: ['Zestaw wszystkich genów jednego osobnika', 'Zbiór wszystkich alleli wszystkich osobników populacji', 'Liczba osobników w populacji w danym roku', 'Zestaw chromosomów w pojedynczej gamecie'], correctIndex: 1, explanation: 'Ewolucja zmienia właśnie skład puli genowej.'),
          QuizQuestion(id: 'q_k4_ew_19', question: 'Losowe zmiany częstości alleli, niezależne od ich wartości przystosowawczej, to:', options: ['Dobór naturalny', 'Dryf genetyczny', 'Adaptacja', 'Konwergencja'], correctIndex: 1, explanation: 'Dobór naturalny faworyzuje allele korzystne, a dryf działa losowo.'),
          QuizQuestion(id: 'q_k4_ew_20', question: 'Częstość homozygot dominujących wynosi 0,49. Częstość allelu recesywnego wynosi:', options: ['0,7', '0,3', '0,51', '0,21'], correctIndex: 1, explanation: 'p² = 0,49, więc p = 0,7 i q = 0,3.'),
        ],
      ),
      Topic(
        id: 'k4_ewolucja_specjacja',
        name: 'Gatunek i powstawanie nowych gatunków',
        theory: '''
GATUNEK JAKO IZOLOWANA PULA GENOWA
Według biologicznej koncepcji gatunku gatunek to grupa populacji, których osobniki w warunkach naturalnych mogą się ze sobą krzyżować i wydawać płodne potomstwo, a które są izolowane rozrodczo od innych takich grup. Każdy gatunek ma więc własną, odrębną pulę genową — między nią a pulami genowymi innych gatunków nie zachodzi przepływ genów. Odrębność tę utrzymują mechanizmy izolacji rozrodczej.

MECHANIZMY IZOLACJI ROZRODCZEJ
Mechanizmy prezygotyczne zapobiegają powstaniu zygoty. Należą do nich izolacja siedliskowa, gdy gatunki zajmują różne siedliska; czasowa, gdy rozmnażają się w innym okresie, np. kwitną w różnych porach roku; behawioralna, gdy różnią się zachowaniami godowymi, np. śpiewem czy sygnałami świetlnymi; mechaniczna, gdy nie pasuje do siebie budowa narządów rozrodczych lub kwiatów i ich zapylaczy; oraz gametyczna, gdy gamety nie mogą się połączyć. Mechanizmy postzygotyczne działają po powstaniu zygoty: hybrydy obumierają, są bezpłodne — jak muł, potomek klaczy i osła — albo ich potomstwo jest słabe lub bezpłodne.

SPECJACJA ALLOPATRYCZNA
Specjacja allopatryczna zachodzi, gdy populacje zostają rozdzielone barierą geograficzną, np. łańcuchem górskim, rzeką, morzem, a w przypadku wysp — wodą oddzielającą je od lądu. Rozdzielone populacje nie wymieniają genów, a w każdej z nich niezależnie zachodzą mutacje, dryf genetyczny i dobór naturalny działający w odmiennych warunkach. Po wielu pokoleniach ich pule genowe różnią się tak bardzo, że nawet po zniknięciu bariery osobniki nie mogą się skutecznie krzyżować — powstały dwa odrębne gatunki. To najczęstszy sposób powstawania gatunków.

SPECJACJA SYMPATRYCZNA
Specjacja sympatryczna zachodzi bez izolacji geograficznej, na tym samym obszarze. U roślin najczęściej prowadzi do niej poliploidyzacja: gdy wskutek zaburzeń podziału powstaje osobnik tetraploidalny, jego krzyżówka z rośliną diploidalną daje bezpłodne potomstwo triploidalne, więc osobnik poliploidalny od razu jest izolowany rozrodczo i może dać początek nowemu gatunkowi. U zwierząt specjacja sympatryczna może zachodzić, gdy część populacji zaczyna korzystać z innej niszy ekologicznej na tym samym obszarze — np. owady zaczynają żerować i kojarzyć się na innym gatunku rośliny żywicielskiej — lub wskutek doboru płciowego.

RADIACJA ADAPTACYJNA
Radiacja adaptacyjna to szybkie powstanie z jednej grupy przodków wielu gatunków przystosowanych do różnych nisz ekologicznych. Zachodzi, gdy organizmy trafiają do środowiska z wieloma niezajętymi niszami i bez konkurentów — np. po skolonizowaniu odizolowanego archipelagu albo po wymarciu dominującej wcześniej grupy. Przykładami są zięby Darwina z wysp Galapagos, które wyewoluowały z jednego przodka i różnią się kształtem dzioba zależnie od rodzaju pokarmu, różnorodne torbacze Australii oraz ssaki łożyskowe, które zróżnicowały się po wymarciu dinozaurów.

KONWERGENCJA I DYWERGENCJA
Dywergencja, czyli ewolucja rozbieżna, polega na stopniowym różnicowaniu się spokrewnionych grup, pochodzących od wspólnego przodka, które przystosowują się do różnych warunków; jej wynikiem są narządy homologiczne, np. kończyny przednie kreta, nietoperza, konia i wieloryba. Radiacja adaptacyjna jest szczególnym, szybkim przypadkiem dywergencji. Konwergencja, czyli ewolucja zbieżna, polega na upodabnianiu się niespokrewnionych organizmów żyjących w podobnych warunkach i poddanych podobnemu doborowi naturalnemu; jej wynikiem są narządy analogiczne i podobny kształt ciała — np. opływowe ciało rekina, wymarłego gada ichtiozaura i delfina. Rozpoznając te zjawiska na schemacie lub w opisie, sprawdza się, czy podobne organizmy mają bliskiego wspólnego przodka: jeśli tak, a różnią się budową, jest to dywergencja; jeśli nie, a są do siebie podobne — konwergencja.
''',
        flashcards: [
          Flashcard(id: 'f_k4_ew_26', front: 'Jak definiuje się gatunek w biologicznej koncepcji gatunku?', back: 'Jako grupę populacji, których osobniki mogą się krzyżować i wydawać płodne potomstwo, izolowaną rozrodczo od innych takich grup.'),
          Flashcard(id: 'f_k4_ew_27', front: 'Dlaczego gatunek nazywa się izolowaną pulą genową?', back: 'Między nim a innymi gatunkami nie zachodzi przepływ genów.'),
          Flashcard(id: 'f_k4_ew_28', front: 'Wymień prezygotyczne mechanizmy izolacji rozrodczej.', back: 'Izolacja siedliskowa, czasowa, behawioralna, mechaniczna i gametyczna.'),
          Flashcard(id: 'f_k4_ew_29', front: 'Podaj przykład izolacji postzygotycznej.', back: 'Bezpłodność hybryd, np. muła — potomka klaczy i osła.'),
          Flashcard(id: 'f_k4_ew_30', front: 'Na czym polega specjacja allopatryczna?', back: 'Populacje rozdzielone barierą geograficzną ewoluują niezależnie, aż stają się izolowane rozrodczo.'),
          Flashcard(id: 'f_k4_ew_31', front: 'Na czym polega specjacja sympatryczna u roślin?', back: 'Najczęściej na poliploidyzacji — osobnik poliploidalny od razu jest izolowany rozrodczo od diploidalnych.'),
          Flashcard(id: 'f_k4_ew_32', front: 'Czym jest radiacja adaptacyjna? Podaj przykład.', back: 'Szybkim powstaniem z jednego przodka wielu gatunków przystosowanych do różnych nisz — np. zięby Darwina.'),
          Flashcard(id: 'f_k4_ew_33', front: 'W jakich warunkach zachodzi radiacja adaptacyjna?', back: 'Gdy organizmy trafiają do środowiska z wolnymi niszami i bez konkurentów, np. na wyspy lub po wymarciu dominującej grupy.'),
          Flashcard(id: 'f_k4_ew_34', front: 'Czym różni się dywergencja od konwergencji?', back: 'Dywergencja to różnicowanie się grup spokrewnionych (narządy homologiczne); konwergencja — upodabnianie się niespokrewnionych w podobnych warunkach (narządy analogiczne).'),
          Flashcard(id: 'f_k4_ew_35', front: 'Podaj przykład konwergencji.', back: 'Opływowy kształt ciała rekina, ichtiozaura i delfina.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k4_ew_21', question: 'Bezpłodność muła jest przykładem izolacji:', options: ['Czasowej', 'Behawioralnej', 'Postzygotycznej', 'Siedliskowej'], correctIndex: 2, explanation: 'Zygota powstaje, ale hybryda nie może się rozmnażać.'),
          QuizQuestion(id: 'q_k4_ew_22', question: 'Rozdzielenie populacji łańcuchem górskim może prowadzić do specjacji:', options: ['Sympatrycznej', 'Allopatrycznej', 'Poliploidalnej', 'Konwergentnej'], correctIndex: 1, explanation: 'Bariera geograficzna uniemożliwia przepływ genów.'),
          QuizQuestion(id: 'q_k4_ew_23', question: 'Poliploidyzacja jest najczęstszą przyczyną specjacji sympatrycznej u:', options: ['Ssaków', 'Roślin', 'Ptaków', 'Ryb'], correctIndex: 1, explanation: 'U roślin poliploidy są częste i często płodne.'),
          QuizQuestion(id: 'q_k4_ew_24', question: 'Zięby Darwina są przykładem:', options: ['Konwergencji', 'Radiacji adaptacyjnej', 'Izolacji czasowej', 'Efektu wąskiego gardła'], correctIndex: 1, explanation: 'Z jednego przodka powstało wiele gatunków o różnych dziobach.'),
          QuizQuestion(id: 'q_k4_ew_25', question: 'Podobny kształt ciała delfina i rekina jest wynikiem:', options: ['Dywergencji', 'Konwergencji', 'Radiacji adaptacyjnej', 'Bliskiego pokrewieństwa'], correctIndex: 1, explanation: 'To niespokrewnione zwierzęta żyjące w podobnym środowisku.'),
          QuizQuestion(id: 'q_k4_ew_26', question: 'Kwitnienie dwóch pokrewnych gatunków roślin w różnych porach roku to izolacja:', options: ['Mechaniczna', 'Czasowa', 'Gametyczna', 'Postzygotyczna'], correctIndex: 1, explanation: 'Pyłek jednego gatunku nie trafia na kwitnące kwiaty drugiego.'),
          QuizQuestion(id: 'q_k4_ew_27', question: 'Wynikiem dywergencji są narządy:', options: ['Analogiczne', 'Homologiczne', 'Konwergentne', 'Wyłącznie szczątkowe'], correctIndex: 1, explanation: 'Mają wspólne pochodzenie, ale różne funkcje.'),
        ],
      ),
      Topic(
        id: 'k4_ewolucja_czlowiek',
        name: 'Pochodzenie i ewolucja człowieka',
        theory: '''
MIEJSCE CZŁOWIEKA W ŚWIECIE ZWIERZĄT
Człowiek należy do strunowców, kręgowców, ssaków łożyskowych, rzędu naczelnych i rodziny człowiekowatych, do której zalicza się także orangutany, goryle, szympansy i bonobo. Analiza drzewa rodowego i sekwencji DNA wskazuje, że najbliżej spokrewnione z człowiekiem są szympansy i bonobo — sekwencje ich DNA są w około 98–99% zgodne z ludzkimi — a linia rozwojowa prowadząca do człowieka oddzieliła się od linii szympansów około 6–7 milionów lat temu. Człowiek nie pochodzi od współczesnych małp; człowiek i szympans mają wspólnego przodka.

PODOBIEŃSTWA CZŁOWIEKA I INNYCH NACZELNYCH
Człowieka łączą z innymi naczelnymi: chwytne kończyny z pięcioma palcami i przeciwstawnym kciukiem, płaskie paznokcie zamiast pazurów, oczy skierowane do przodu, umożliwiające widzenie przestrzenne i barwne, duży mózg w stosunku do masy ciała, rodzenie zwykle jednego młodego i długi okres opieki nad potomstwem oraz złożone życie społeczne. Z małpami człekokształtnymi łączą go dodatkowo brak ogona, podobne grupy krwi i zbliżony kariotyp.

CECHY ODRÓŻNIAJĄCE CZŁOWIEKA OD MAŁP CZŁEKOKSZTAŁTNYCH
Człowiek porusza się stale na dwóch nogach, z czym wiąże się szereg cech szkieletu: kręgosłup wygięty w kształt litery S, amortyzujący wstrząsy; szeroka, miskowata miednica podtrzymująca narządy wewnętrzne; kończyny dolne dłuższe od górnych; sklepiona stopa z dużym palcem nieprzeciwstawnym, ustawionym równolegle do pozostałych; oraz otwór wielki czaszki położony centralnie pod czaszką. Człowiek ma znacznie większy mózg — średnio około 1350 cm³, wobec około 400 cm³ u szympansa — część mózgowa czaszki przeważa u niego nad częścią twarzową, szczęki są słabo wysunięte, łuk zębowy ma kształt paraboliczny, kły są niewielkie, a podbródek wydatny. Człowiek ma też rękę zdolną do precyzyjnych chwytów, słabo owłosione ciało, mowę artykułowaną, zdolność myślenia abstrakcyjnego i tworzenia kultury.

FORMY KOPALNE CZŁOWIEKOWATYCH W KOLEJNOŚCI CHRONOLOGICZNEJ
Sahelanthropus tchadensis (około 7 milionów lat temu) jest jednym z najstarszych znanych przedstawicieli linii prowadzącej do człowieka; miał mózg wielkości mózgu szympansa. Ardipithecus (około 4,4 miliona lat temu) łączył chodzenie na dwóch nogach z umiejętnością wspinania się na drzewa. Australopiteki (około 4–2 milionów lat temu), np. Australopithecus afarensis, do którego należy słynna „Lucy”, poruszały się na dwóch nogach, ale miały mały mózg, około 400–500 cm³, i wysunięte szczęki. Homo habilis, człowiek zręczny (około 2,4–1,4 miliona lat temu), miał większy mózg, około 600–700 cm³, i wytwarzał proste narzędzia kamienne. Homo erectus, człowiek wyprostowany (od około 1,9 miliona do około 100 tysięcy lat temu), miał proporcje ciała zbliżone do współczesnego człowieka i mózg zwykle o objętości 800–1100 cm³, posługiwał się ogniem, wytwarzał bardziej zaawansowane narzędzia i jako pierwszy opuścił Afrykę. Homo neanderthalensis, neandertalczyk (około 400–40 tysięcy lat temu), żył w Europie i zachodniej Azji, był krępy i przystosowany do chłodnego klimatu, miał duży mózg, grzebał zmarłych i krzyżował się z człowiekiem rozumnym. Homo sapiens, człowiek rozumny, pojawił się w Afryce około 300 tysięcy lat temu i rozprzestrzenił się na wszystkie kontynenty; ma wysoko sklepioną czaszkę i podbródek, tworzy sztukę i złożoną kulturę.

TENDENCJE W EWOLUCJI CZŁOWIEKA
W ewolucji człowieka widoczne są: utrwalenie dwunożności, stopniowy wzrost objętości mózgu, zmniejszanie się szczęk i zębów, doskonalenie ręki do precyzyjnych chwytów oraz rozwój umiejętności wytwarzania narzędzi, posługiwania się ogniem, mowy i kultury.
''',
        flashcards: [
          Flashcard(id: 'f_k4_ew_36', front: 'Do jakiego rzędu i rodziny należy człowiek?', back: 'Do rzędu naczelnych i rodziny człowiekowatych.'),
          Flashcard(id: 'f_k4_ew_37', front: 'Z którymi zwierzętami człowiek jest najbliżej spokrewniony?', back: 'Z szympansami i bonobo.'),
          Flashcard(id: 'f_k4_ew_38', front: 'Czy człowiek pochodzi od szympansa?', back: 'Nie — człowiek i szympans mają wspólnego przodka.'),
          Flashcard(id: 'f_k4_ew_39', front: 'Kiedy linia człowieka oddzieliła się od linii szympansów?', back: 'Około 6–7 milionów lat temu.'),
          Flashcard(id: 'f_k4_ew_40', front: 'Wymień cechy łączące człowieka z innymi naczelnymi.', back: 'Chwytne kończyny z przeciwstawnym kciukiem, płaskie paznokcie, widzenie przestrzenne i barwne, duży mózg, długa opieka nad potomstwem.'),
          Flashcard(id: 'f_k4_ew_41', front: 'Jakie cechy szkieletu człowieka wiążą się z dwunożnością?', back: 'Esowaty kręgosłup, szeroka miska miednicy, dłuższe kończyny dolne, sklepiona stopa, centralnie położony otwór wielki czaszki.'),
          Flashcard(id: 'f_k4_ew_42', front: 'Czym różni się czaszka człowieka od czaszki szympansa?', back: 'Człowiek ma znacznie większą część mózgową, słabo wysunięte szczęki, małe kły i wydatny podbródek.'),
          Flashcard(id: 'f_k4_ew_43', front: 'Uporządkuj chronologicznie: Homo erectus, australopiteki, Homo sapiens, Homo habilis.', back: 'Australopiteki → Homo habilis → Homo erectus → Homo sapiens.'),
          Flashcard(id: 'f_k4_ew_44', front: 'Czym charakteryzował się Homo habilis?', back: 'Większym mózgiem niż australopiteki i wytwarzaniem prostych narzędzi kamiennych.'),
          Flashcard(id: 'f_k4_ew_45', front: 'Czym wyróżniał się Homo erectus?', back: 'Proporcjami ciała zbliżonymi do współczesnych, posługiwaniem się ogniem; jako pierwszy opuścił Afrykę.'),
          Flashcard(id: 'f_k4_ew_46', front: 'Kim była „Lucy”?', back: 'Samicą Australopithecus afarensis — dwunożnego australopiteka o małym mózgu.'),
          Flashcard(id: 'f_k4_ew_47', front: 'Gdzie i kiedy pojawił się Homo sapiens?', back: 'W Afryce, około 300 tysięcy lat temu.'),
          Flashcard(id: 'f_k4_ew_48', front: 'Wymień tendencje w ewolucji człowieka.', back: 'Utrwalenie dwunożności, wzrost mózgu, zmniejszanie się szczęk i zębów, rozwój narzędzi, mowy i kultury.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k4_ew_28', question: 'Najbliżej spokrewnione z człowiekiem są:', options: ['Goryle', 'Szympansy i bonobo', 'Orangutany', 'Gibony'], correctIndex: 1, explanation: 'Wskazuje na to podobieństwo sekwencji DNA.'),
          QuizQuestion(id: 'q_k4_ew_29', question: 'Z dwunożnością człowieka NIE jest związany:', options: ['Esowato wygięty kręgosłup', 'Centralnie położony otwór wielki czaszki', 'Przeciwstawny duży palec stopy', 'Sklepiona stopa'], correctIndex: 2, explanation: 'Duży palec stopy człowieka jest nieprzeciwstawny.'),
          QuizQuestion(id: 'q_k4_ew_30', question: 'Najstarszą z wymienionych form jest:', options: ['Homo erectus', 'Australopithecus afarensis', 'Homo neanderthalensis', 'Homo habilis'], correctIndex: 1, explanation: 'Australopiteki żyły około 4–2 milionów lat temu.'),
          QuizQuestion(id: 'q_k4_ew_31', question: 'Jako pierwszy posługiwał się ogniem i opuścił Afrykę:', options: ['Homo habilis', 'Homo erectus', 'Australopithecus afarensis', 'Ardipithecus'], correctIndex: 1, explanation: 'Człowiek wyprostowany rozprzestrzenił się do Azji i Europy.'),
          QuizQuestion(id: 'q_k4_ew_32', question: 'Neandertalczyk żył głównie w:', options: ['Australii', 'Europie i zachodniej Azji', 'Ameryce Południowej', 'Wyłącznie w Afryce'], correctIndex: 1, explanation: 'Był przystosowany do chłodnego klimatu.'),
          QuizQuestion(id: 'q_k4_ew_33', question: 'Cechą łączącą człowieka z innymi naczelnymi jest:', options: ['Mowa artykułowana', 'Przeciwstawny kciuk ręki', 'Esowato wygięty kręgosłup', 'Wydatny podbródek'], correctIndex: 1, explanation: 'Pozostałe cechy odróżniają człowieka od małp.'),
          QuizQuestion(id: 'q_k4_ew_34', question: 'Człowiek rozumny (Homo sapiens) pojawił się w:', options: ['Europie', 'Azji', 'Afryce', 'Australii'], correctIndex: 2, explanation: 'Z Afryki rozprzestrzenił się na pozostałe kontynenty.'),
        ],
      ),
    ],
  ),

  // ===========================================================================
  // XVII. EKOLOGIA
  // ===========================================================================
  Chapter(
    id: 'k4_ekologia',
    name: 'Ekologia',
    topics: [
      Topic(
        id: 'k4_ekologia_organizmy',
        name: 'Ekologia organizmów — nisza i tolerancja ekologiczna',
        theory: '''
CZYNNIKI ŚRODOWISKA
Na organizmy działają czynniki abiotyczne, czyli nieożywione — światło, temperatura, woda i wilgotność, zasolenie, odczyn i skład gleby, stężenie tlenu i dwutlenku węgla, wiatr — oraz czynniki biotyczne, wynikające z obecności innych organizmów, takie jak konkurencja, drapieżnictwo, pasożytnictwo, symbioza czy dostępność pokarmu.

SIEDLISKO I NISZA EKOLOGICZNA
Siedlisko to miejsce życia organizmu, określone przez warunki środowiska — można je porównać do adresu. Nisza ekologiczna to rola gatunku w ekosystemie, porównywana do zawodu: obejmuje wymagania wobec czynników środowiska, np. zakres tolerowanych temperatur i wilgotności, rodzaj pokarmu i sposób jego zdobywania, czas i miejsce aktywności, zależności od innych gatunków oraz wpływ na środowisko. W jednym siedlisku może żyć wiele gatunków o różnych niszach — w lesie liściastym dzięcioł wydobywa owady spod kory, sikora zbiera je z liści i gałązek, a puszczyk poluje nocą na gryzonie. Dwa gatunki o identycznych niszach nie mogą trwale współistnieć, ponieważ silniejszy konkurent wypiera słabszego.

TOLERANCJA EKOLOGICZNA
Tolerancja ekologiczna to zakres natężenia danego czynnika środowiska, w którym organizm może przeżyć. Wyróżnia się w nim optimum — natężenie najkorzystniejsze — oraz minimum i maksimum, poza którymi organizm ginie. Między optimum a granicami tolerancji leżą strefy pesymalne, w których organizm przeżywa, ale gorzej się rozwija i rozmnaża. Zgodnie z prawem tolerancji Shelforda o występowaniu organizmu decyduje zarówno niedobór, jak i nadmiar każdego czynnika, a zgodnie z prawem minimum Liebiga czynnikiem ograniczającym jest ten, którego jest najmniej w stosunku do potrzeb. Organizmy o szerokim zakresie tolerancji wobec danego czynnika to eurybionty (np. wróbel, szczur wędrowny, trzcina pospolita), a o wąskim — stenobionty (np. porosty krzaczkowate wobec czystości powietrza czy pstrąg wobec zawartości tlenu w wodzie).

ZNACZENIE ORGANIZMÓW O WĄSKIEJ TOLERANCJI W BIOINDYKACJI
Stenobionty, reagujące nawet na niewielkie zmiany warunków, są dobrymi bioindykatorami — organizmami, których obecność, brak lub stan świadczy o warunkach środowiska. Porosty wskazują czystość powietrza, zwłaszcza zawartość dwutlenku siarki: w powietrzu silnie zanieczyszczonym nie rosną wcale, a formy krzaczkowate występują tylko w czystym powietrzu, na czym opiera się skala porostowa. Larwy jętek, widelnic i chruścików żyją jedynie w czystych, dobrze natlenionych wodach, a masowe występowanie rureczników i larw ochotkowatych świadczy o silnym zanieczyszczeniu wody. Pokrzywa zwyczajna i bez czarny wskazują glebę bogatą w azot, a wrzos i borówka — glebę kwaśną. Bioindykacja jest tania i pokazuje długotrwały wpływ zanieczyszczeń na organizmy.

OKREŚLANIE ŚRODOWISKA ŻYCIA NA PODSTAWIE TOLERANCJI
Znając zakres tolerancji organizmu wobec danego czynnika, można określić środowisko, w którym może on żyć. Gatunek wymagający dużej zawartości tlenu i niskiej temperatury wody zamieszkuje górskie potoki, organizm znoszący duże wahania zasolenia może żyć w słonawych wodach przy ujściach rzek, a roślina znosząca silne nasłonecznienie i niedobór wody — siedliska suche i otwarte. Na wykresie tolerancji organizm może występować tam, gdzie natężenie czynnika mieści się między minimum a maksimum, a najliczniej występuje w pobliżu optimum.

FORMY EKOLOGICZNE ROŚLIN
Rośliny przystosowały się do życia w różnych siedliskach. Hydrofity, czyli rośliny wodne, np. grzybienie i moczarka, mają dobrze rozwinięty miękisz powietrzny, słabo rozwinięte tkanki wzmacniające i przewodzące, cienką kutykulę lub jej brak, a gatunki o liściach pływających — aparaty szparkowe po górnej stronie liści. Higrofity, rośliny miejsc wilgotnych i cienistych, np. niecierpek i knieć błotna, mają duże, cienkie liście o cienkiej kutykuli i liczne aparaty szparkowe, bo nie muszą oszczędzać wody. Mezofity, rośliny siedlisk umiarkowanie wilgotnych, do których należy większość roślin łąk i lasów strefy umiarkowanej, mają cechy pośrednie. Kserofity, rośliny siedlisk suchych, oszczędzają wodę: sukulenty, np. kaktusy i rozchodniki, gromadzą ją w miękiszu wodnym łodyg lub liści i mają grubą kutykulę, a u kaktusów liście przekształcone są w ciernie; sklerofity mają twarde liście o grubej kutykuli, często zwinięte lub pokryte włoskami, z aparatami szparkowymi zagłębionymi w skórce, oraz silnie rozbudowany system korzeniowy. Halofity, rośliny siedlisk zasolonych, np. soliród, gromadzą sole w soku komórkowym, co umożliwia im pobieranie wody z zasolonej gleby, lub usuwają nadmiar soli przez gruczoły. Rośliny światłolubne mają liście z grubym miękiszem palisadowym, a cieniolubne — duże, cienkie liście o dużej zawartości chlorofilu.
''',
        flashcards: [
          Flashcard(id: 'f_k4_eko_1', front: 'Czym różnią się czynniki abiotyczne od biotycznych?', back: 'Abiotyczne to nieożywione warunki środowiska (światło, temperatura, woda); biotyczne wynikają z obecności innych organizmów.'),
          Flashcard(id: 'f_k4_eko_2', front: 'Czym różni się siedlisko od niszy ekologicznej?', back: 'Siedlisko to miejsce życia organizmu (adres), a nisza — jego rola i wymagania w ekosystemie (zawód).'),
          Flashcard(id: 'f_k4_eko_3', front: 'Co obejmuje nisza ekologiczna?', back: 'Wymagania wobec czynników środowiska, sposób odżywiania, czas i miejsce aktywności oraz zależności od innych gatunków.'),
          Flashcard(id: 'f_k4_eko_4', front: 'Czym jest tolerancja ekologiczna?', back: 'Zakresem natężenia czynnika środowiska, w którym organizm może przeżyć.'),
          Flashcard(id: 'f_k4_eko_5', front: 'Czym są strefy pesymalne?', back: 'Zakresami między optimum a granicami tolerancji, w których organizm przeżywa, ale gorzej się rozwija i rozmnaża.'),
          Flashcard(id: 'f_k4_eko_6', front: 'Czym różnią się eurybionty od stenobiontów?', back: 'Eurybionty mają szeroki zakres tolerancji, a stenobionty — wąski.'),
          Flashcard(id: 'f_k4_eko_7', front: 'Co mówi prawo minimum Liebiga?', back: 'Czynnikiem ograniczającym jest ten, którego jest najmniej w stosunku do potrzeb organizmu.'),
          Flashcard(id: 'f_k4_eko_8', front: 'Dlaczego stenobionty są dobrymi bioindykatorami?', back: 'Reagują nawet na niewielkie zmiany warunków środowiska.'),
          Flashcard(id: 'f_k4_eko_9', front: 'Na co wskazuje obecność larw jętek i widelnic w rzece?', back: 'Na czystą, dobrze natlenioną wodę.'),
          Flashcard(id: 'f_k4_eko_10', front: 'Jakie przystosowania mają hydrofity?', back: 'Miękisz powietrzny, słabe tkanki wzmacniające, cienką kutykulę, a przy liściach pływających — szparki po górnej stronie.'),
          Flashcard(id: 'f_k4_eko_11', front: 'Czym różnią się sukulenty od sklerofitów?', back: 'Sukulenty gromadzą wodę w miękiszu wodnym; sklerofity mają twarde liście z grubą kutykulą i zagłębionymi aparatami szparkowymi.'),
          Flashcard(id: 'f_k4_eko_12', front: 'Jak halofity radzą sobie z zasoloną glebą?', back: 'Gromadzą sole w soku komórkowym lub usuwają ich nadmiar przez gruczoły.'),
          Flashcard(id: 'f_k4_eko_13', front: 'Jakie liście mają higrofity i dlaczego?', back: 'Duże i cienkie, z cienką kutykulą — w wilgotnym siedlisku nie muszą oszczędzać wody.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k4_eko_1', question: 'Czynnikiem biotycznym jest:', options: ['Temperatura', 'Konkurencja', 'Zasolenie', 'Nasłonecznienie'], correctIndex: 1, explanation: 'Wynika z obecności innych organizmów.'),
          QuizQuestion(id: 'q_k4_eko_2', question: 'Nisza ekologiczna to:', options: ['Wyłącznie miejsce życia organizmu', 'Rola gatunku i jego wymagania w ekosystemie', 'Liczba osobników populacji', 'Obszar chroniony'], correctIndex: 1, explanation: 'Samo miejsce życia to siedlisko.'),
          QuizQuestion(id: 'q_k4_eko_3', question: 'Organizm o szerokim zakresie tolerancji to:', options: ['Stenobiont', 'Eurybiont', 'Endemit', 'Bioindykator'], correctIndex: 1, explanation: 'Stenobionty mają wąski zakres tolerancji.'),
          QuizQuestion(id: 'q_k4_eko_4', question: 'Obecność porostów krzaczkowatych wskazuje na:', options: ['Silne zanieczyszczenie powietrza', 'Czyste powietrze', 'Glebę bogatą w azot', 'Wodę słoną'], correctIndex: 1, explanation: 'Są najbardziej wrażliwe na dwutlenek siarki.'),
          QuizQuestion(id: 'q_k4_eko_5', question: 'Aparaty szparkowe zagłębione w skórce i gruba kutykula to cechy:', options: ['Hydrofitów', 'Higrofitów', 'Sklerofitów', 'Roślin cieniolubnych'], correctIndex: 2, explanation: 'To przystosowania do ograniczania utraty wody.'),
          QuizQuestion(id: 'q_k4_eko_6', question: 'Masowe występowanie rureczników w rzece świadczy o:', options: ['Czystej wodzie', 'Silnym zanieczyszczeniu wody', 'Wysokiej zawartości tlenu', 'Niskim zasoleniu'], correctIndex: 1, explanation: 'Rureczniki znoszą niedobór tlenu w zanieczyszczonej wodzie.'),
          QuizQuestion(id: 'q_k4_eko_7', question: 'Miękisz powietrzny jest szczególnie dobrze rozwinięty u:', options: ['Kserofitów', 'Hydrofitów', 'Halofitów', 'Sukulentów'], correctIndex: 1, explanation: 'Ułatwia wymianę gazową i utrzymywanie się roślin w wodzie.'),
          QuizQuestion(id: 'q_k4_eko_8', question: 'Zgodnie z prawem tolerancji Shelforda o występowaniu organizmu decyduje:', options: ['Wyłącznie niedobór czynnika', 'Zarówno niedobór, jak i nadmiar czynnika', 'Wyłącznie nadmiar czynnika', 'Wyłącznie temperatura'], correctIndex: 1, explanation: 'Organizm może żyć tylko w określonym zakresie natężenia czynnika.'),
        ],
      ),
      Topic(
        id: 'k4_ekologia_populacje',
        name: 'Ekologia populacji',
        theory: '''
CECHY POPULACJI
Populacja to grupa osobników jednego gatunku zajmujących określony obszar i mogących się ze sobą krzyżować. Ma ona cechy, których nie mają pojedyncze osobniki. Liczebność to liczba osobników w populacji, a zagęszczenie — liczba osobników przypadająca na jednostkę powierzchni lub objętości. Rozrodczość to liczba osobników przybywających w wyniku rozrodu, a śmiertelność — liczba osobników ginących w określonym czasie; na liczebność wpływają też imigracja i emigracja. Struktura wiekowa to udział osobników w różnym wieku: przewaga osobników młodych oznacza populację rozwijającą się, której piramida wieku ma szeroką podstawę, zbliżony udział klas wiekowych — populację stabilną, a przewaga osobników starych — populację wymierającą. Struktura płciowa to stosunek liczby samic do liczby samców. Struktura przestrzenna opisuje rozmieszczenie osobników. Rozmieszczenie skupiskowe, najczęstsze w przyrodzie, wynika z nierównomiernego rozmieszczenia zasobów lub życia w grupach, jak w przypadku stad czy kęp roślin. Rozmieszczenie równomierne wynika z silnej konkurencji lub terytorializmu, np. u ptaków morskich broniących miejsc gniazdowych w kolonii. Rozmieszczenie losowe występuje przy równomiernie rozmieszczonych zasobach i braku silnych oddziaływań między osobnikami, np. u mniszka lekarskiego na jednorodnej łące.

WZROST LICZEBNOŚCI POPULACJI
Przy nieograniczonych zasobach i braku wrogów liczebność populacji rośnie wykładniczo — coraz szybciej — co opisuje krzywa w kształcie litery J; zdarza się to np. po zasiedleniu nowego terenu. W rzeczywistości zasoby są ograniczone, dlatego wzrost ma zwykle przebieg logistyczny, opisywany krzywą w kształcie litery S: po początkowym przyspieszeniu tempo wzrostu maleje, a liczebność stabilizuje się na poziomie pojemności środowiska, czyli maksymalnej liczby osobników, jaką dane środowisko może trwale utrzymać. Liczebność populacji ograniczają czynniki zależne od zagęszczenia, takie jak konkurencja, choroby, drapieżnictwo i dostępność pokarmu, oraz czynniki od niego niezależne, np. susze, powodzie i silne mrozy.

METAPOPULACJA I ZNACZENIE MIGRACJI
Metapopulacja to zespół lokalnych populacji jednego gatunku, zajmujących oddzielone od siebie płaty odpowiedniego siedliska — np. stawy, polany czy fragmenty łąk wśród lasów — i połączonych migracjami osobników. Lokalne populacje, zwłaszcza małe, mogą wymierać wskutek przypadkowych zdarzeń, ale opustoszałe płaty siedliska są ponownie zasiedlane przez osobniki przybywające z innych płatów. Migracje zapewniają przepływ genów, który zapobiega zubożeniu puli genowej i krzyżowaniu się spokrewnionych osobników w małych populacjach. Dzięki temu gatunek może przetrwać w krajobrazie, nawet jeśli poszczególne populacje lokalne okresowo zanikają. Z tego powodu w ochronie przyrody tak ważne są korytarze ekologiczne łączące siedliska, np. przejścia dla zwierząt nad drogami i pod nimi.

OBSERWACJA CECH POPULACJI
Liczebność i zagęszczenie populacji roślin lub mało ruchliwych zwierząt szacuje się metodą powierzchni próbnych: na kilku losowo wybranych kwadratach o znanej powierzchni liczy się osobniki, oblicza średnie zagęszczenie i przelicza je na całą powierzchnię badanego terenu. Liczebność zwierząt ruchliwych szacuje się metodą wielokrotnych odłowów: odławia się pewną liczbę osobników, znakuje je i wypuszcza, a po pewnym czasie przeprowadza ponowny odłów. Liczebność populacji oblicza się ze wzoru N = (M · C) / R, gdzie M to liczba osobników oznakowanych w pierwszym odłowie, C — liczba wszystkich osobników złowionych w drugim odłowie, a R — liczba osobników oznakowanych wśród złowionych w drugim odłowie. Jeżeli oznakowano 50 chrząszczy, a w drugim odłowie złowiono 40, w tym 10 oznakowanych, liczebność populacji wynosi 50 · 40 / 10 = 200 osobników. Obserwując wybraną populację, można także określić jej strukturę przestrzenną, wiekową i płciową.
''',
        flashcards: [
          Flashcard(id: 'f_k4_eko_14', front: 'Czym różni się liczebność od zagęszczenia populacji?', back: 'Liczebność to liczba osobników, a zagęszczenie — liczba osobników na jednostkę powierzchni lub objętości.'),
          Flashcard(id: 'f_k4_eko_15', front: 'Jak wygląda piramida wieku populacji rozwijającej się?', back: 'Ma szeroką podstawę — przeważają osobniki młode.'),
          Flashcard(id: 'f_k4_eko_16', front: 'Wymień typy rozmieszczenia osobników w populacji.', back: 'Skupiskowe, równomierne i losowe.'),
          Flashcard(id: 'f_k4_eko_17', front: 'Co powoduje równomierne rozmieszczenie osobników?', back: 'Silna konkurencja lub terytorializm.'),
          Flashcard(id: 'f_k4_eko_18', front: 'Czym różni się wzrost wykładniczy od logistycznego?', back: 'Wykładniczy (krzywa J) zachodzi przy nieograniczonych zasobach; logistyczny (krzywa S) zwalnia i stabilizuje się na poziomie pojemności środowiska.'),
          Flashcard(id: 'f_k4_eko_19', front: 'Czym jest pojemność środowiska?', back: 'Maksymalną liczbą osobników, jaką środowisko może trwale utrzymać.'),
          Flashcard(id: 'f_k4_eko_20', front: 'Podaj przykłady czynników zależnych i niezależnych od zagęszczenia.', back: 'Zależne: konkurencja, choroby, drapieżnictwo; niezależne: susze, powodzie, mrozy.'),
          Flashcard(id: 'f_k4_eko_21', front: 'Czym jest metapopulacja?', back: 'Zespołem lokalnych populacji na oddzielonych płatach siedliska, połączonych migracjami osobników.'),
          Flashcard(id: 'f_k4_eko_22', front: 'Dlaczego migracje są ważne dla przetrwania gatunku?', back: 'Zapewniają przepływ genów, zapobiegają krzyżowaniu się krewnych i umożliwiają ponowne zasiedlanie płatów siedliska.'),
          Flashcard(id: 'f_k4_eko_23', front: 'Jak szacuje się zagęszczenie populacji roślin?', back: 'Metodą powierzchni próbnych — liczy się osobniki na losowych kwadratach i przelicza na cały teren.'),
          Flashcard(id: 'f_k4_eko_24', front: 'Jaki wzór stosuje się w metodzie wielokrotnych odłowów?', back: 'N = (M · C) / R: M — oznakowane w 1. odłowie, C — złowione w 2. odłowie, R — oznakowane wśród złowionych w 2. odłowie.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k4_eko_9', question: 'Populacja, w której przeważają osobniki stare, jest populacją:', options: ['Rozwijającą się', 'Stabilną', 'Wymierającą', 'Losową'], correctIndex: 2, explanation: 'Mała liczba młodych osobników nie zastąpi ginących starszych.'),
          QuizQuestion(id: 'q_k4_eko_10', question: 'Rozmieszczenie skupiskowe wynika najczęściej z:', options: ['Terytorializmu', 'Nierównomiernego rozmieszczenia zasobów', 'Silnej konkurencji', 'Braku oddziaływań między osobnikami'], correctIndex: 1, explanation: 'Osobniki gromadzą się tam, gdzie zasoby są obfite.'),
          QuizQuestion(id: 'q_k4_eko_11', question: 'Krzywa wzrostu liczebności w kształcie litery S odpowiada wzrostowi:', options: ['Wykładniczemu', 'Logistycznemu', 'Liniowemu', 'Losowemu'], correctIndex: 1, explanation: 'Uwzględnia ograniczenie wynikające z pojemności środowiska.'),
          QuizQuestion(id: 'q_k4_eko_12', question: 'Oznakowano 60 osobników. W drugim odłowie złowiono 50, w tym 15 oznakowanych. Liczebność populacji wynosi:', options: ['125', '200', '300', '900'], correctIndex: 1, explanation: '60 · 50 / 15 = 200.'),
          QuizQuestion(id: 'q_k4_eko_13', question: 'Czynnikiem niezależnym od zagęszczenia populacji jest:', options: ['Konkurencja o pokarm', 'Choroba zakaźna', 'Powódź', 'Drapieżnictwo'], correctIndex: 2, explanation: 'Powódź dotyka populację bez względu na jej zagęszczenie.'),
          QuizQuestion(id: 'q_k4_eko_14', question: 'Korytarze ekologiczne służą przede wszystkim:', options: ['Zwiększeniu śmiertelności', 'Umożliwieniu migracji i przepływu genów', 'Oddzieleniu populacji', 'Wprowadzaniu gatunków obcych'], correctIndex: 1, explanation: 'Łączą płaty siedlisk zajmowane przez populacje lokalne.'),
          QuizQuestion(id: 'q_k4_eko_15', question: 'Zagęszczenie populacji to:', options: ['Całkowita liczba osobników w populacji', 'Liczba osobników na jednostkę powierzchni lub objętości', 'Stosunek liczby samic do liczby samców', 'Liczba osobników urodzonych w ciągu roku'], correctIndex: 1, explanation: 'Liczebność to całkowita liczba osobników.'),
        ],
      ),
      Topic(
        id: 'k4_ekologia_zaleznosci',
        name: 'Zależności międzygatunkowe',
        theory: '''
RODZAJE ZALEŻNOŚCI MIĘDZY ORGANIZMAMI
Zależności nieantagonistyczne nie przynoszą żadnej ze stron szkody — należą do nich mutualizm i komensalizm. Zależności antagonistyczne przynoszą korzyść jednej stronie kosztem drugiej lub szkodzą obu stronom — należą do nich konkurencja, drapieżnictwo, roślinożerność i pasożytnictwo.

MUTUALIZM
Mutualizm to zależność korzystna dla obu partnerów. W mutualizmie obligatoryjnym partnerzy nie mogą żyć bez siebie. Przykładami są porosty, w których grzyb dostarcza glonowi wody i soli mineralnych, a glon lub sinica dostarcza grzybowi związków organicznych; termity i żyjące w ich jelicie protisty, trawiące celulozę; oraz storczyki, których nasiona kiełkują tylko w obecności grzybów mikoryzowych. W mutualizmie fakultatywnym, zwanym też protokooperacją, partnerzy odnoszą korzyść ze współpracy, ale mogą żyć osobno. Przykładami są mrówki i mszyce — mrówki chronią mszyce, zjadając ich słodką wydzielinę — rak pustelnik i ukwiał, który chroni raka parzydełkami, a sam korzysta z resztek jego pokarmu i jest przenoszony w nowe miejsca, a także owady zapylające i rośliny kwiatowe.

KOMENSALIZM
Komensalizm to zależność, w której jeden organizm, zwany komensalem, odnosi korzyść, a drugi nie odnosi ani korzyści, ani szkody. Podnawki przyczepiają się do rekinów, dzięki czemu przemieszczają się bez wysiłku i zjadają resztki ich pokarmu. Rośliny epifityczne, np. niektóre storczyki i bromelie, rosną na gałęziach drzew, uzyskując lepszy dostęp do światła, ale nie pobierają od nich substancji.

KONKURENCJA
Konkurencja zachodzi, gdy organizmy korzystają z tych samych, ograniczonych zasobów, takich jak pokarm, woda, światło, miejsce czy partnerzy do rozrodu, i szkodzi obu stronom. Konkurencja wewnątrzgatunkowa zachodzi między osobnikami tego samego gatunku i jest zwykle najsilniejsza, ponieważ mają one identyczne wymagania; reguluje liczebność populacji i jest siłą napędową doboru naturalnego. Konkurencja międzygatunkowa zachodzi między osobnikami różnych gatunków o podobnych niszach. Jej skutkiem może być wyparcie słabszego konkurenta — w doświadczeniu Gausego, gdy dwa gatunki pantofelków hodowano razem, jeden z nich wypierał drugi — lub zróżnicowanie nisz, które pozwala gatunkom współistnieć, np. różne gatunki ptaków żerują na różnych częściach tego samego drzewa. Rośliny konkurują o światło, wodę i sole mineralne, a niektóre wydzielają substancje hamujące wzrost innych roślin.

DRAPIEŻNICTWO I CYKLICZNE ZMIANY LICZEBNOŚCI
Drapieżnik zabija i zjada ofiarę. Liczebność populacji drapieżników i ofiar zmienia się cyklicznie: gdy ofiar jest dużo, drapieżniki mają pod dostatkiem pokarmu i ich liczebność rośnie; coraz liczniejsze drapieżniki zmniejszają liczebność ofiar, co po pewnym czasie powoduje spadek liczebności drapieżników, a to umożliwia ponowny wzrost liczebności ofiar. Wzrost i spadek liczebności drapieżników następuje z opóźnieniem względem zmian liczebności ofiar, a liczebność drapieżników jest mniejsza niż ofiar. Klasycznym przykładem są cykliczne zmiany liczebności rysia kanadyjskiego i zająca amerykańskiego. Drapieżniki eliminują zwykle osobniki chore, stare i słabe, dlatego poprawiają kondycję populacji ofiar i ograniczają szerzenie się chorób, a przez to działają jak czynnik doboru naturalnego.

ADAPTACJE DRAPIEŻNIKÓW I OFIAR
Drapieżniki mają dobrze rozwinięte narządy zmysłów, np. skierowane do przodu oczy umożliwiające widzenie przestrzenne, ostre kły i pazury, jady (węże, pająki), zdolność szybkiego biegu lub zaskakującego ataku z ukrycia, ubarwienie maskujące, a niektóre polują zespołowo, jak wilki. Pająki budują sieci łowne. Wśród roślin drapieżnych rosiczka i dzbanecznik chwytają owady w pułapki. Ofiary bronią się ucieczką i czujnością — roślinożercy mają zwykle oczy po bokach głowy, zapewniające szerokie pole widzenia — życiem w stadach, kolcami i pancerzami (jeż, żółw), a także substancjami trującymi i odstraszającymi. Ubarwienie ochronne (kryptyczne) zlewa się z tłem, a mimetyzm polega na upodobnieniu się do elementów otoczenia, np. patyczaki przypominają gałązki. Ubarwienie ostrzegawcze, jaskrawe i kontrastowe, informuje o jadowitości lub niesmaczności — mają je np. osy, biedronki i salamandra plamista. Mimikra batesowska polega na upodobnieniu się gatunku bezbronnego do gatunku niebezpiecznego, np. muchówki bzygi przypominają osy; w mimikrze müllerowskiej kilka gatunków niebezpiecznych ma podobne ubarwienie ostrzegawcze, dzięki czemu drapieżnik szybciej uczy się ich unikać.

ROŚLINOŻERNOŚĆ I OBRONA ROŚLIN
Roślinożercy mają zęby przystosowane do rozcierania twardego pokarmu — szerokie zęby trzonowe o guzkowatej lub listwowatej powierzchni, a u gryzoni i zajęczaków stale rosnące siekacze. Mają długi przewód pokarmowy, a celulozę trawią dzięki symbiotycznym mikroorganizmom, u przeżuwaczy żyjącym w wielokomorowym żołądku. Owady roślinożerne mają aparaty gębowe gryzące lub kłująco-ssące. Rośliny bronią się przed zgryzaniem za pomocą cierni i kolców (róża, głóg), włosków parzących (pokrzywa), twardych, zawierających krzemionkę liści (trawy), trujących lub gorzkich substancji, takich jak alkaloidy i garbniki, a trawy odrastają od nasady po zgryzieniu, ponieważ ich merystemy leżą przy ziemi.

PASOŻYTNICTWO
Pasożyt żyje kosztem żywiciela, zwykle go nie zabijając. Pasożyty zewnętrzne, np. wesz, pchła, kleszcz i pijawka, żyją na powierzchni ciała żywiciela; mają narządy czepne, np. pazurki i przyssawki, aparaty gębowe kłująco-ssące, spłaszczone ciało, a pijawki i kleszcze wydzielają substancje przeciwkrzepliwe. Pasożyty wewnętrzne, np. tasiemce, glista i przywry, żyją w organizmie żywiciela; mają haczyki i przyssawki, oskórek odporny na działanie enzymów trawiennych, silnie rozwinięty układ rozrodczy i ogromną płodność, często są obojnakami, oddychają beztlenowo, a ich układy — zwłaszcza pokarmowy i nerwowy oraz narządy zmysłów — są uproszczone lub zanikły, jak przewód pokarmowy tasiemców. Złożone cykle rozwojowe z żywicielami pośrednimi zwiększają szansę dotarcia do żywiciela ostatecznego. Wśród roślin występują półpasożyty, np. jemioła, która prowadzi fotosyntezę, ale pobiera od żywiciela wodę i sole mineralne, oraz pasożyty całkowite, np. kanianka, pozbawione chlorofilu i pobierające wszystkie substancje za pomocą ssawek. Żywiciele bronią się przed pasożytami za pomocą układu odpornościowego i zachowań, takich jak iskanie się czy kąpiele piaskowe u ptaków.
''',
        flashcards: [
          Flashcard(id: 'f_k4_eko_25', front: 'Wymień zależności antagonistyczne i nieantagonistyczne.', back: 'Antagonistyczne: konkurencja, drapieżnictwo, roślinożerność, pasożytnictwo. Nieantagonistyczne: mutualizm, komensalizm.'),
          Flashcard(id: 'f_k4_eko_26', front: 'Czym różni się mutualizm obligatoryjny od fakultatywnego?', back: 'W obligatoryjnym partnerzy nie mogą żyć bez siebie (porosty), w fakultatywnym mogą żyć osobno (mrówki i mszyce).'),
          Flashcard(id: 'f_k4_eko_27', front: 'Na czym polega współpraca raka pustelnika z ukwiałem?', back: 'Ukwiał chroni raka parzydełkami, a sam jest przenoszony i korzysta z resztek pokarmu.'),
          Flashcard(id: 'f_k4_eko_28', front: 'Czym jest komensalizm? Podaj przykład.', back: 'Zależnością korzystną dla jednej strony i obojętną dla drugiej — np. podnawki i rekiny, epifity na drzewach.'),
          Flashcard(id: 'f_k4_eko_29', front: 'Dlaczego konkurencja wewnątrzgatunkowa jest zwykle najsilniejsza?', back: 'Osobniki tego samego gatunku mają identyczne wymagania.'),
          Flashcard(id: 'f_k4_eko_30', front: 'Jakie mogą być skutki konkurencji międzygatunkowej?', back: 'Wyparcie słabszego konkurenta lub zróżnicowanie nisz umożliwiające współistnienie.'),
          Flashcard(id: 'f_k4_eko_31', front: 'Jak zmienia się liczebność drapieżników względem ofiar?', back: 'Cyklicznie, z opóźnieniem względem zmian liczebności ofiar.'),
          Flashcard(id: 'f_k4_eko_32', front: 'Jakie znaczenie dla populacji ofiar mają drapieżniki?', back: 'Eliminują osobniki chore i słabe, ograniczają choroby i działają jako czynnik doboru naturalnego.'),
          Flashcard(id: 'f_k4_eko_33', front: 'Czym różni się mimikra batesowska od müllerowskiej?', back: 'Batesowska — bezbronny gatunek naśladuje niebezpieczny (bzyg i osa); müllerowska — kilka niebezpiecznych gatunków ma podobne ubarwienie ostrzegawcze.'),
          Flashcard(id: 'f_k4_eko_34', front: 'Czym różni się ubarwienie ochronne od ostrzegawczego?', back: 'Ochronne zlewa się z tłem; ostrzegawcze jest jaskrawe i sygnalizuje jadowitość lub niesmaczność.'),
          Flashcard(id: 'f_k4_eko_35', front: 'Jak rośliny bronią się przed roślinożercami?', back: 'Cierniami, kolcami, włoskami parzącymi, krzemionką, trującymi substancjami i zdolnością odrastania.'),
          Flashcard(id: 'f_k4_eko_36', front: 'Jakie przystosowania mają roślinożercy do trawienia celulozy?', back: 'Symbiotyczne mikroorganizmy, długi przewód pokarmowy, u przeżuwaczy — wielokomorowy żołądek.'),
          Flashcard(id: 'f_k4_eko_37', front: 'Wymień przystosowania pasożytów wewnętrznych.', back: 'Narządy czepne, oskórek odporny na enzymy, duża płodność, obojnactwo, oddychanie beztlenowe, uproszczenie układów.'),
          Flashcard(id: 'f_k4_eko_38', front: 'Czym różni się jemioła od kanianki?', back: 'Jemioła jest półpasożytem (prowadzi fotosyntezę), kanianka — pasożytem całkowitym bez chlorofilu.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k4_eko_16', question: 'Przykładem mutualizmu obligatoryjnego jest:', options: ['Rak pustelnik i ukwiał', 'Mrówki i mszyce', 'Grzyb i glon w plesze porostu', 'Podnawka i rekin'], correctIndex: 2, explanation: 'Partnerzy tworzący porost nie mogą żyć w tej formie osobno.'),
          QuizQuestion(id: 'q_k4_eko_17', question: 'Zależność, w której jedna strona odnosi korzyść, a druga nie odnosi korzyści ani szkody, to:', options: ['Mutualizm', 'Komensalizm', 'Pasożytnictwo', 'Konkurencja'], correctIndex: 1, explanation: 'Przykładem są rośliny epifityczne.'),
          QuizQuestion(id: 'q_k4_eko_18', question: 'W cyklicznych zmianach liczebności drapieżników i ofiar maksimum liczebności drapieżników:', options: ['Wyprzedza maksimum liczebności ofiar', 'Występuje z opóźnieniem względem maksimum liczebności ofiar', 'Zawsze pokrywa się z maksimum ofiar', 'Nie zależy od liczebności ofiar'], correctIndex: 1, explanation: 'Drapieżniki potrzebują czasu, by rozmnożyć się po wzroście ilości pokarmu.'),
          QuizQuestion(id: 'q_k4_eko_19', question: 'Bzyg o ubarwieniu podobnym do osy jest przykładem:', options: ['Mimikry batesowskiej', 'Mimikry müllerowskiej', 'Mimetyzmu', 'Ubarwienia kryptycznego'], correctIndex: 0, explanation: 'Bezbronna muchówka naśladuje niebezpieczny gatunek.'),
          QuizQuestion(id: 'q_k4_eko_20', question: 'Przystosowaniem pasożytów wewnętrznych NIE jest:', options: ['Oskórek odporny na enzymy trawienne', 'Duża płodność', 'Silnie rozwinięte narządy zmysłów', 'Narządy czepne'], correctIndex: 2, explanation: 'Narządy zmysłów pasożytów wewnętrznych są zwykle uproszczone.'),
          QuizQuestion(id: 'q_k4_eko_21', question: 'Doświadczenie Gausego z dwoma gatunkami pantofelków wykazało, że:', options: ['Gatunki o podobnych niszach współistnieją bez przeszkód', 'Silniejszy konkurent wypiera słabszego', 'Konkurencja nie wpływa na liczebność', 'Pantofelki są drapieżnikami'], correctIndex: 1, explanation: 'Gatunki o identycznych wymaganiach nie mogą trwale współistnieć.'),
          QuizQuestion(id: 'q_k4_eko_22', question: 'Kanianka jest:', options: ['Półpasożytem', 'Pasożytem całkowitym', 'Epifitem', 'Rośliną drapieżną'], correctIndex: 1, explanation: 'Nie ma chlorofilu i pobiera od żywiciela wszystkie substancje.'),
          QuizQuestion(id: 'q_k4_eko_23', question: 'Obroną roślin przed roślinożercami jest m.in.:', options: ['Mikoryza', 'Obecność alkaloidów', 'Transpiracja', 'Wiązanie azotu'], correctIndex: 1, explanation: 'Alkaloidy nadają roślinom gorzki smak lub są trujące.'),
          QuizQuestion(id: 'q_k4_eko_24', question: 'Protokooperacja to inaczej:', options: ['Mutualizm obligatoryjny', 'Mutualizm fakultatywny', 'Komensalizm', 'Pasożytnictwo'], correctIndex: 1, explanation: 'Partnerzy odnoszą korzyść, ale mogą żyć osobno.'),
        ],
      ),
      Topic(
        id: 'k4_ekologia_ekosystem',
        name: 'Ekosystem — przepływ energii, obieg materii i sukcesja',
        theory: '''
STRUKTURA EKOSYSTEMU
Ekosystem tworzą biocenoza, czyli zespół populacji wszystkich gatunków zamieszkujących dany obszar, oraz biotop — nieożywione środowisko, w którym ona żyje — powiązane przepływem energii i krążeniem materii. Pod względem funkcji organizmy dzielą się na producentów, konsumentów i destruentów. Producenci — rośliny, glony, sinice i bakterie chemosyntetyzujące — wytwarzają związki organiczne ze związków nieorganicznych. Konsumenci odżywiają się innymi organizmami: konsumenci I rzędu to roślinożercy, a konsumenci II i wyższych rzędów — drapieżniki i pasożyty. Destruenci, głównie bakterie i grzyby, rozkładają martwą materię organiczną do związków nieorganicznych, które mogą być ponownie wykorzystane przez producentów. W rozkładzie uczestniczą także detrytusofagi, np. dżdżownice i stonogi, rozdrabniające martwe szczątki.

ŁAŃCUCHY I SIECI POKARMOWE
Łańcuch pokarmowy to szereg organizmów, w którym każde ogniwo jest pokarmem dla następnego, a kolejne ogniwa tworzą poziomy troficzne. Łańcuchy spasania rozpoczynają się od żywych producentów (np. trawa → zając → lis), a łańcuchy detrytusowe — od martwej materii organicznej (np. opadłe liście → dżdżownica → kret). Łańcuchy są ze sobą powiązane, ponieważ większość organizmów odżywia się różnymi rodzajami pokarmu i sama jest pokarmem dla wielu gatunków — tworzą więc sieć pokarmową. Im bardziej złożona sieć pokarmowa, tym stabilniejszy ekosystem, bo zanik jednego gatunku może zostać zrównoważony przez inne.

PRZEPŁYW ENERGII
Energia przepływa przez ekosystem jednokierunkowo — od Słońca, przez producentów, do kolejnych poziomów troficznych — i jest ostatecznie rozpraszana w postaci ciepła, więc nie może krążyć. Produkcja pierwotna brutto to całkowita ilość energii związanej przez producentów w fotosyntezie, a produkcja pierwotna netto — ta jej część, która pozostaje po odliczeniu energii zużytej przez producentów na oddychanie; tylko ona jest dostępna dla konsumentów. Na każdym poziomie troficznym większość energii jest tracona: zużywana na oddychanie i wydzielana jako ciepło, a także pozostaje w częściach niezjedzonych i niestrawionych. Na kolejny poziom troficzny przechodzi zwykle tylko około 10% energii. Dlatego łańcuchy pokarmowe są krótkie, liczą najczęściej 4–5 ogniw, a organizmów na wyższych poziomach troficznych jest mniej. Piramidy ekologiczne przedstawiają liczebność, biomasę lub energię na kolejnych poziomach troficznych. Piramida energii zawsze ma szeroką podstawę i zwęża się ku górze, natomiast piramidy liczebności i biomasy mogą być odwrócone — np. jedno drzewo jest pokarmem dla tysięcy owadów, a w morzu biomasa szybko namnażającego się fitoplanktonu bywa w danej chwili mniejsza niż biomasa zooplanktonu. Ze zmniejszaniem się ilości energii na kolejnych poziomach troficznych wiąże się kumulowanie w łańcuchu pokarmowym substancji trudno rozkładalnych, np. pestycydów czy metali ciężkich — ich stężenie w organizmach rośnie na kolejnych poziomach troficznych, dlatego najsilniej narażone są drapieżniki szczytowe.

KRĄŻENIE MATERII
W przeciwieństwie do energii materia w ekosystemie krąży — pierwiastki przechodzą ze środowiska do organizmów i z powrotem. W obiegu węgla producenci pobierają dwutlenek węgla z atmosfery lub wody i wbudowują go w fotosyntezie w związki organiczne, które przekazywane są w łańcuchach pokarmowych. Oddychanie wszystkich organizmów i rozkład martwej materii przez destruentów uwalniają węgiel z powrotem w postaci CO2. Część węgla zostaje na długo wyłączona z obiegu w złożach węgla, ropy naftowej i gazu ziemnego, powstałych ze szczątków organizmów, oraz w skałach wapiennych. Spalanie paliw kopalnych i wycinanie lasów zwiększa stężenie CO2 w atmosferze, co nasila efekt cieplarniany. W obiegu azotu azot atmosferyczny (N2), niedostępny dla większości organizmów, wiązany jest przez bakterie wolno żyjące w glebie, bakterie brodawkowe żyjące w symbiozie z roślinami motylkowymi i sinice, a także w niewielkim stopniu podczas wyładowań atmosferycznych i w procesach przemysłowych, np. przy produkcji nawozów. W procesie amonifikacji destruenci rozkładają białka i inne związki azotowe martwych szczątków i wydalin, uwalniając amoniak, który w glebie tworzy jony amonowe. Bakterie nitryfikacyjne, prowadzące chemosyntezę, utleniają jony amonowe do azotanów(III), a następnie do azotanów(V). Rośliny pobierają azotany(V) i jony amonowe i wbudowują azot w aminokwasy, białka i kwasy nukleinowe, które przechodzą do konsumentów. Bakterie denitryfikacyjne, w warunkach beztlenowych, redukują azotany(V) do azotu cząsteczkowego, który wraca do atmosfery — proces ten zmniejsza żyzność gleby.

SUKCESJA EKOLOGICZNA
Sukcesja to proces kierunkowych zmian w składzie gatunkowym i strukturze biocenozy, zachodzący w danym miejscu w czasie. Każde stadium zmienia warunki środowiska — np. wzbogaca podłoże w próchnicę, zwiększa zacienienie i wilgotność — przez co umożliwia wkroczenie kolejnych gatunków, które wypierają wcześniejsze. Sukcesja pierwotna zachodzi na terenie, na którym wcześniej nie było życia ani gleby, np. na zastygłej lawie, odsłoniętych skałach, wydmach czy hałdach. Rozpoczynają ją organizmy pionierskie — sinice, porosty i mchy — które wytwarzają pierwszą warstwę gleby; po nich pojawiają się rośliny zielne, krzewy i drzewa. Sukcesja wtórna zachodzi na terenie, na którym istniała biocenoza zniszczona np. przez pożar, wycinkę lasu czy powódź, lub na porzuconym polu; ponieważ gleba i część organizmów pozostały, przebiega znacznie szybciej. Na porzuconym polu po roślinach jednorocznych pojawiają się byliny i trawy, później krzewy, a wreszcie drzewa. Przykładem sukcesji jest też zarastanie jeziora, które stopniowo wypełnia się osadami i szczątkami roślin, przekształcając się w torfowisko, a następnie w las. W trakcie sukcesji zwykle rośnie różnorodność gatunkowa, biomasa i złożoność sieci pokarmowych. Sukcesja zmierza do stadium końcowego, zwanego klimaksem — stosunkowo stabilnej biocenozy, dostosowanej do warunków klimatycznych i glebowych; w Polsce na większości obszaru są to lasy.
''',
        flashcards: [
          Flashcard(id: 'f_k4_eko_39', front: 'Czym różni się biocenoza od biotopu?', back: 'Biocenoza to zespół populacji organizmów, a biotop — nieożywione środowisko, w którym żyją.'),
          Flashcard(id: 'f_k4_eko_40', front: 'Jaką rolę w ekosystemie pełnią destruenci?', back: 'Rozkładają martwą materię organiczną do związków nieorganicznych dostępnych dla producentów.'),
          Flashcard(id: 'f_k4_eko_41', front: 'Czym różni się łańcuch spasania od detrytusowego?', back: 'Spasania zaczyna się od żywych producentów, detrytusowy — od martwej materii organicznej.'),
          Flashcard(id: 'f_k4_eko_42', front: 'Dlaczego złożona sieć pokarmowa zwiększa stabilność ekosystemu?', back: 'Zanik jednego gatunku może zostać zrównoważony przez inne źródła pokarmu.'),
          Flashcard(id: 'f_k4_eko_43', front: 'Dlaczego energia w ekosystemie nie krąży?', back: 'Przepływa jednokierunkowo i jest ostatecznie rozpraszana jako ciepło.'),
          Flashcard(id: 'f_k4_eko_44', front: 'Czym różni się produkcja pierwotna brutto od netto?', back: 'Brutto to cała energia związana przez producentów, netto — to, co pozostaje po odliczeniu ich oddychania.'),
          Flashcard(id: 'f_k4_eko_45', front: 'Jaka część energii przechodzi zwykle na kolejny poziom troficzny?', back: 'Około 10%.'),
          Flashcard(id: 'f_k4_eko_46', front: 'Dlaczego łańcuchy pokarmowe są krótkie?', back: 'Na każdym poziomie troficznym tracona jest większość energii.'),
          Flashcard(id: 'f_k4_eko_47', front: 'Która piramida ekologiczna nigdy nie jest odwrócona?', back: 'Piramida energii.'),
          Flashcard(id: 'f_k4_eko_48', front: 'Dlaczego drapieżniki szczytowe są najbardziej narażone na pestycydy i metale ciężkie?', back: 'Substancje trudno rozkładalne kumulują się, a ich stężenie rośnie na kolejnych poziomach troficznych.'),
          Flashcard(id: 'f_k4_eko_49', front: 'Jakie procesy uwalniają węgiel do atmosfery?', back: 'Oddychanie organizmów, rozkład martwej materii i spalanie paliw kopalnych.'),
          Flashcard(id: 'f_k4_eko_50', front: 'Kto wiąże azot atmosferyczny?', back: 'Bakterie wolno żyjące, bakterie brodawkowe roślin motylkowych i sinice.'),
          Flashcard(id: 'f_k4_eko_51', front: 'Czym są amonifikacja, nitryfikacja i denitryfikacja?', back: 'Amonifikacja — rozkład związków azotowych do amoniaku; nitryfikacja — utlenianie jonów amonowych do azotanów; denitryfikacja — redukcja azotanów do N2.'),
          Flashcard(id: 'f_k4_eko_52', front: 'Czym różni się sukcesja pierwotna od wtórnej?', back: 'Pierwotna zachodzi na terenie bez gleby i życia, wtórna — po zniszczeniu istniejącej biocenozy, gdy gleba pozostała; wtórna jest szybsza.'),
          Flashcard(id: 'f_k4_eko_53', front: 'Jakie organizmy są pionierami sukcesji pierwotnej?', back: 'Sinice, porosty i mchy.'),
          Flashcard(id: 'f_k4_eko_54', front: 'Czym jest klimaks?', back: 'Końcowym, stosunkowo stabilnym stadium sukcesji, dostosowanym do klimatu i gleby.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k4_eko_25', question: 'Konsumentem I rzędu jest:', options: ['Lis', 'Zając', 'Trawa', 'Grzyb saprotroficzny'], correctIndex: 1, explanation: 'Konsumenci I rzędu to roślinożercy.'),
          QuizQuestion(id: 'q_k4_eko_26', question: 'Łańcuchem detrytusowym jest:', options: ['Trawa → zając → lis', 'Opadłe liście → dżdżownica → kret', 'Fitoplankton → zooplankton → ryba', 'Liść → gąsienica → sikora'], correctIndex: 1, explanation: 'Rozpoczyna się od martwej materii organicznej.'),
          QuizQuestion(id: 'q_k4_eko_27', question: 'Jeżeli producenci związali 10 000 kJ energii, konsumenci II rzędu otrzymają około:', options: ['1000 kJ', '100 kJ', '10 kJ', '5000 kJ'], correctIndex: 1, explanation: 'Na każdy kolejny poziom przechodzi około 10% energii: 10 000 → 1000 → 100.'),
          QuizQuestion(id: 'q_k4_eko_28', question: 'Azotany(V) do azotu cząsteczkowego redukują bakterie:', options: ['Nitryfikacyjne', 'Denitryfikacyjne', 'Brodawkowe', 'Amonifikacyjne'], correctIndex: 1, explanation: 'Denitryfikacja zachodzi w warunkach beztlenowych.'),
          QuizQuestion(id: 'q_k4_eko_29', question: 'Bakterie nitryfikacyjne:', options: ['Wiążą N2 z atmosfery', 'Utleniają jony amonowe do azotanów', 'Redukują azotany do N2', 'Rozkładają białka do aminokwasów'], correctIndex: 1, explanation: 'Energię z tych reakcji wykorzystują w chemosyntezie.'),
          QuizQuestion(id: 'q_k4_eko_30', question: 'Sukcesja pierwotna zachodzi np.:', options: ['Na porzuconym polu', 'Na zastygłej lawie', 'Na zrębie leśnym', 'Po pożarze lasu'], correctIndex: 1, explanation: 'Wcześniej nie było tam życia ani gleby.'),
          QuizQuestion(id: 'q_k4_eko_31', question: 'Produkcja pierwotna netto to:', options: ['Energia zużyta przez konsumentów', 'Produkcja brutto pomniejszona o oddychanie producentów', 'Energia docierająca od Słońca', 'Suma energii wszystkich poziomów troficznych'], correctIndex: 1, explanation: 'Tylko ona jest dostępna dla konsumentów.'),
          QuizQuestion(id: 'q_k4_eko_32', question: 'Zawsze regularny kształt (szeroka podstawa) ma piramida:', options: ['Liczebności', 'Biomasy', 'Energii', 'Wszystkie wymienione'], correctIndex: 2, explanation: 'Piramidy liczebności i biomasy mogą być odwrócone.'),
          QuizQuestion(id: 'q_k4_eko_33', question: 'W trakcie sukcesji zwykle:', options: ['Maleje różnorodność gatunkowa', 'Rośnie różnorodność gatunkowa i biomasa', 'Znika gleba', 'Upraszcza się sieć pokarmowa'], correctIndex: 1, explanation: 'Biocenoza staje się coraz bardziej złożona aż do klimaksu.'),
        ],
      ),
    ],
  ),

  // ===========================================================================
  // XVIII. RÓŻNORODNOŚĆ BIOLOGICZNA
  // ===========================================================================
  Chapter(
    id: 'k4_roznorodnosc',
    name: 'Różnorodność biologiczna',
    topics: [
      Topic(
        id: 'k4_roznorodnosc_poziomy',
        name: 'Poziomy i rozmieszczenie różnorodności biologicznej',
        theory: '''
POZIOMY RÓŻNORODNOŚCI BIOLOGICZNEJ
Różnorodność biologiczna (bioróżnorodność) to zróżnicowanie życia na Ziemi na wszystkich poziomach jego organizacji. Różnorodność genetyczna to zróżnicowanie genów i alleli w obrębie gatunku — między populacjami i osobnikami. Duża różnorodność genetyczna zwiększa zdolność populacji do przystosowania się do zmian środowiska i odporność na choroby, a jej utrata, np. w małych, izolowanych populacjach, zwiększa ryzyko wyginięcia. Różnorodność gatunkowa to liczba gatunków występujących na danym obszarze i ich względna liczebność. Różnorodność ekosystemowa to zróżnicowanie ekosystemów, siedlisk i biocenoz na danym obszarze — im więcej różnych ekosystemów, tym więcej gatunków może tam żyć. Wszystkie te poziomy są ze sobą powiązane.

CZYNNIKI KSZTAŁTUJĄCE RÓŻNORODNOŚĆ
Na różnorodność gatunkową wpływają czynniki geograficzne i klimatyczne. Różnorodność maleje wraz z oddalaniem się od równika ku biegunom, ponieważ w strefie międzyzwrotnikowej panują wysoka temperatura, duża ilość światła i wody przez cały rok, co sprzyja wysokiej produkcji pierwotnej, a klimat był tam stabilny przez długi czas, co umożliwiło powstanie wielu gatunków. Różnorodność maleje także wraz z wysokością nad poziomem morza, ponieważ warunki stają się coraz surowsze. Na obszarach o urozmaiconej rzeźbie terenu, np. w górach, występuje wiele różnych siedlisk, co sprzyja różnorodności. Wyspy mają zwykle mniej gatunków niż lądy o podobnej powierzchni — im wyspa mniejsza i bardziej oddalona od lądu, tym mniej gatunków — ale izolacja sprzyja powstawaniu gatunków endemicznych. Na różnorodność wpływają też historia geologiczna obszaru, np. zlodowacenia, oraz działalność człowieka.

ENDEMITY I RELIKTY
Endemity to gatunki występujące wyłącznie na określonym, zwykle niewielkim obszarze. Powstają najczęściej w wyniku długotrwałej izolacji geograficznej — dlatego szczególnie wiele endemitów występuje na wyspach, np. na Madagaskarze (lemury) i na Wyspach Galapagos, na długo izolowanym kontynencie australijskim (większość torbaczy), a także w wysokich górach i w starych, izolowanych jeziorach, np. w Bajkale. W Polsce endemitami są m.in. warzucha polska w Pieninach i przytulia krakowska. Relikty to gatunki, które przetrwały na danym obszarze z dawnych epok, gdy panowały tam inne warunki — np. relikty glacjalne, takie jak brzoza karłowata, przetrwały w Polsce od epoki lodowcowej na torfowiskach i w górach.

GORĄCE PUNKTY RÓŻNORODNOŚCI
Gorące punkty różnorodności biologicznej (hotspoty) to obszary o wyjątkowo dużej liczbie gatunków, w tym gatunków endemicznych, które jednocześnie są silnie zagrożone działalnością człowieka i utraciły już dużą część pierwotnej roślinności. Należą do nich m.in. Madagaskar, basen Morza Śródziemnego, Andy tropikalne, lasy atlantyckie Brazylii i Filipiny. W środowisku morskim podobnie bogate i zagrożone są rafy koralowe. Zajmują niewielką część powierzchni lądów, a żyje w nich znaczna część wszystkich gatunków roślin i kręgowców, dlatego ich ochrona pozwala zachować dużą część różnorodności biologicznej Ziemi przy stosunkowo niewielkich nakładach.

BIOMY
Biomy to rozległe ekosystemy lądowe, których rozmieszczenie zależy głównie od klimatu — temperatury i ilości opadów. Wilgotny las równikowy rośnie w klimacie gorącym i wilgotnym przez cały rok; ma wielowarstwową budowę, najwyższą różnorodność gatunkową i produkcję pierwotną, ale ubogą glebę, ponieważ materia organiczna jest szybko rozkładana. Sawanna to trawiaste obszary z pojedynczymi drzewami, w klimacie gorącym z porą suchą i deszczową, zamieszkane przez duże stada roślinożerców. Pustynie mają bardzo małe opady i duże dobowe wahania temperatury; żyją na nich sukulenty i zwierzęta aktywne nocą, oszczędzające wodę. Stepy to bezdrzewne obszary trawiaste klimatu umiarkowanego o małych opadach, z żyzną glebą. Lasy liściaste strefy umiarkowanej rosną w klimacie o wyraźnych porach roku; drzewa zrzucają liście na zimę. Tajga, czyli borealny las iglasty, rośnie w klimacie chłodnym z długą, mroźną zimą; dominują w niej drzewa iglaste. Tundra występuje w klimacie zimnym, z krótkim latem i wieczną zmarzliną; rosną tam mchy, porosty, niskie krzewinki i trawy. Strefowość biomów odpowiada także piętrom roślinności w górach.
''',
        flashcards: [
          Flashcard(id: 'f_k4_roz_1', front: 'Wymień poziomy różnorodności biologicznej.', back: 'Genetyczny, gatunkowy i ekosystemowy.'),
          Flashcard(id: 'f_k4_roz_2', front: 'Dlaczego różnorodność genetyczna jest ważna dla populacji?', back: 'Zwiększa zdolność przystosowania się do zmian środowiska i odporność na choroby.'),
          Flashcard(id: 'f_k4_roz_3', front: 'Jak zmienia się różnorodność gatunkowa od równika ku biegunom i dlaczego?', back: 'Maleje — przy równiku jest ciepło, dużo światła i wody, wysoka produkcja pierwotna i długo stabilny klimat.'),
          Flashcard(id: 'f_k4_roz_4', front: 'Dlaczego na wyspach występuje wiele endemitów?', back: 'Długotrwała izolacja geograficzna sprzyja powstawaniu odrębnych gatunków.'),
          Flashcard(id: 'f_k4_roz_5', front: 'Czym różni się endemit od reliktu?', back: 'Endemit występuje tylko na określonym obszarze; relikt przetrwał z dawnych epok o innych warunkach.'),
          Flashcard(id: 'f_k4_roz_6', front: 'Podaj przykłady endemitów i reliktów w Polsce.', back: 'Endemity: warzucha polska, przytulia krakowska. Relikt glacjalny: brzoza karłowata.'),
          Flashcard(id: 'f_k4_roz_7', front: 'Czym są gorące punkty różnorodności biologicznej?', back: 'Obszarami o dużej liczbie gatunków, w tym endemicznych, silnie zagrożonymi przez człowieka — np. Madagaskar, basen Morza Śródziemnego.'),
          Flashcard(id: 'f_k4_roz_8', front: 'Co decyduje o rozmieszczeniu biomów?', back: 'Głównie klimat — temperatura i ilość opadów.'),
          Flashcard(id: 'f_k4_roz_9', front: 'Dlaczego gleba wilgotnego lasu równikowego jest uboga?', back: 'Materia organiczna jest bardzo szybko rozkładana, a składniki pobierane przez rośliny.'),
          Flashcard(id: 'f_k4_roz_10', front: 'Scharakteryzuj tundrę.', back: 'Klimat zimny, krótkie lato, wieczna zmarzlina; mchy, porosty, krzewinki i trawy.'),
          Flashcard(id: 'f_k4_roz_11', front: 'Czym różni się tajga od lasu liściastego strefy umiarkowanej?', back: 'Tajga to las iglasty klimatu chłodnego z długą zimą; las liściasty rośnie w klimacie o wyraźnych porach roku i zrzuca liście.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k4_roz_1', question: 'Zróżnicowanie alleli w obrębie gatunku to różnorodność:', options: ['Gatunkowa', 'Genetyczna', 'Ekosystemowa', 'Krajobrazowa'], correctIndex: 1, explanation: 'Dotyczy różnic między osobnikami i populacjami jednego gatunku.'),
          QuizQuestion(id: 'q_k4_roz_2', question: 'Największą różnorodnością gatunkową charakteryzuje się:', options: ['Tundra arktyczna', 'Tajga syberyjska', 'Wilgotny las równikowy', 'Pustynia gorąca'], correctIndex: 2, explanation: 'Sprzyjają temu wysoka temperatura i wilgotność przez cały rok.'),
          QuizQuestion(id: 'q_k4_roz_3', question: 'Gatunek występujący wyłącznie na niewielkim, określonym obszarze to:', options: ['Relikt', 'Endemit', 'Gatunek inwazyjny', 'Kosmopolita'], correctIndex: 1, explanation: 'Endemity powstają zwykle wskutek izolacji.'),
          QuizQuestion(id: 'q_k4_roz_4', question: 'Brzoza karłowata w Polsce jest przykładem:', options: ['Endemitu', 'Reliktu glacjalnego', 'Gatunku obcego', 'Gatunku inwazyjnego'], correctIndex: 1, explanation: 'Przetrwała od epoki lodowcowej.'),
          QuizQuestion(id: 'q_k4_roz_5', question: 'Wieczna zmarzlina jest charakterystyczna dla:', options: ['Stepu', 'Tundry', 'Sawanny', 'Lasu liściastego'], correctIndex: 1, explanation: 'Krótkie lato nie pozwala na rozmarznięcie głębszych warstw gleby.'),
          QuizQuestion(id: 'q_k4_roz_6', question: 'Gorącym punktem różnorodności biologicznej jest:', options: ['Madagaskar', 'Antarktyda', 'Sahara', 'Grenlandia'], correctIndex: 0, explanation: 'Występuje tam wiele endemitów zagrożonych przez działalność człowieka.'),
          QuizQuestion(id: 'q_k4_roz_7', question: 'Wraz ze wzrostem wysokości nad poziomem morza różnorodność gatunkowa zwykle:', options: ['Rośnie', 'Maleje', 'Nie zmienia się', 'Najpierw maleje, potem gwałtownie rośnie'], correctIndex: 1, explanation: 'Warunki stają się coraz surowsze.'),
        ],
      ),
      Topic(
        id: 'k4_roznorodnosc_ochrona',
        name: 'Zagrożenia i ochrona różnorodności biologicznej',
        theory: '''
WPŁYW CZŁOWIEKA NA RÓŻNORODNOŚĆ BIOLOGICZNĄ
Działalność człowieka jest główną przyczyną współczesnego, bardzo szybkiego wymierania gatunków. Najpoważniejszym zagrożeniem jest niszczenie i fragmentacja siedlisk — wycinanie lasów, osuszanie mokradeł, zamiana terenów naturalnych w pola uprawne, zabudowę i drogi. Przyczyniają się do tego urbanizacja, czyli rozrastanie się miast, industrializacja, związana z budową zakładów przemysłowych i wydobyciem surowców, rozwój komunikacji — drogi i linie kolejowe rozcinają siedliska, a zwierzęta giną pod kołami pojazdów — oraz masowa turystyka, prowadząca do wydeptywania roślinności, płoszenia zwierząt i zaśmiecania cennych przyrodniczo terenów, zwłaszcza w górach i nad morzem. Fragmentacja dzieli siedliska na małe, izolowane płaty, w których żyją małe populacje narażone na utratę różnorodności genetycznej i wyginięcie. Nadmierna eksploatacja zasobów — nadmierne połowy ryb, kłusownictwo i handel dzikimi gatunkami — doprowadziła do wyginięcia m.in. tura i gołębia wędrownego. Zanieczyszczenie środowiska powoduje m.in. eutrofizację wód, kwaśne deszcze i kumulowanie się toksyn w łańcuchach pokarmowych. Globalne zmiany klimatu przesuwają zasięgi gatunków, powodują blaknięcie raf koralowych i zagrażają gatunkom, które nie zdążą się przystosować lub przemieścić. Gatunki obce inwazyjne, wprowadzone celowo lub przypadkowo przez człowieka, wypierają gatunki rodzime, konkurując z nimi, zjadając je lub przenosząc choroby — w Polsce są to m.in. barszcz Sosnowskiego, nawłoć kanadyjska, norka amerykańska i szop pracz. Rolnictwo intensywne, oparte na monokulturach i środkach ochrony roślin, zmniejsza różnorodność na terenach rolniczych, a wypieranie tradycyjnych odmian roślin i ras zwierząt zmniejsza różnorodność genetyczną organizmów użytkowych.

RESTYTUCJA I REINTRODUKCJA
Restytucja to odtwarzanie zanikającej populacji gatunku na obszarze, na którym jeszcze występuje, np. przez hodowlę i wsiedlanie osobników, ochronę miejsc rozrodu czy dokarmianie. Reintrodukcja to ponowne wprowadzenie gatunku na obszar, z którego wcześniej całkowicie zniknął. W Polsce przykładami są żubr, uratowany dzięki hodowli w ogrodach zoologicznych i wypuszczony do Puszczy Białowieskiej, bóbr europejski, sokół wędrowny oraz ryś w Puszczy Kampinoskiej. Aby reintrodukcja się powiodła, trzeba najpierw usunąć przyczynę wyginięcia i zapewnić odpowiednie siedlisko. Ochronie gatunków służą też banki genów — przechowujące nasiona, tkanki i gamety — oraz ogrody botaniczne i zoologiczne prowadzące hodowle zachowawcze.

FORMY OCHRONY PRZYRODY W POLSCE
Ochrona przyrody może być ścisła — polegająca na całkowitym powstrzymaniu się od ingerencji człowieka, by procesy przyrodnicze przebiegały naturalnie — lub czynna, polegająca na zabiegach ochronnych, np. koszeniu łąk, usuwaniu krzewów czy gatunków inwazyjnych, gdy bez nich ekosystem lub gatunek by zanikł. Ochrona może dotyczyć miejsca występowania gatunku (ochrona in situ) lub odbywać się poza nim, np. w ogrodach zoologicznych i bankach genów (ochrona ex situ). Ustawa o ochronie przyrody wymienia formy ochrony obszarowej i indywidualnej. Park narodowy to obszar o powierzchni co najmniej 1000 ha, wyróżniający się szczególnymi wartościami przyrodniczymi, na którym ochronie podlega cała przyroda. Rezerwat przyrody obejmuje obszar zachowany w stanie naturalnym lub mało zmienionym, z cennymi ekosystemami, siedliskami lub gatunkami. Park krajobrazowy chroni wartości przyrodnicze, historyczne i kulturowe, a gospodarka jest w nim dozwolona w ograniczonym zakresie. Obszar chronionego krajobrazu chroni wyróżniające się krajobrazy i pełni funkcję korytarzy ekologicznych. Obszary Natura 2000 to europejska sieć obszarów chroniących najcenniejsze siedliska przyrodnicze oraz gatunki zagrożone w skali Unii Europejskiej; obejmują obszary specjalnej ochrony ptaków i specjalne obszary ochrony siedlisk. Do form ochrony indywidualnej należą pomniki przyrody (np. stare drzewa, głazy narzutowe), stanowiska dokumentacyjne, użytki ekologiczne i zespoły przyrodniczo-krajobrazowe. Ochrona gatunkowa obejmuje gatunki roślin, zwierząt i grzybów zagrożone wyginięciem — ścisłą lub częściową. Informacje o zagrożonych gatunkach zawierają czerwone listy i czerwone księgi.

MIĘDZYNARODOWE FORMY OCHRONY
Ochrona różnorodności biologicznej wymaga współpracy międzynarodowej, ponieważ wiele gatunków migruje, a zanieczyszczenia i zmiany klimatu nie znają granic. Konwencja o różnorodności biologicznej (CBD), przyjęta w 1992 roku na Szczycie Ziemi w Rio de Janeiro, zobowiązuje państwa do ochrony różnorodności biologicznej, zrównoważonego użytkowania jej elementów oraz sprawiedliwego podziału korzyści z wykorzystania zasobów genetycznych. Na tym samym szczycie przyjęto Agendę 21 — program działań na rzecz zrównoważonego rozwoju w XXI wieku, realizowany na poziomie globalnym, krajowym i lokalnym. Konwencja waszyngtońska (CITES) reguluje międzynarodowy handel dzikimi gatunkami zwierząt i roślin zagrożonymi wyginięciem oraz ich częściami i produktami, np. kością słoniową, zakazując go lub uzależniając od zezwoleń. Konwencja ramsarska chroni mokradła, zwłaszcza jako siedliska ptaków wodnych, konwencja bońska — wędrowne gatunki dzikich zwierząt, a konwencja berneńska — dziką florę i faunę Europy oraz ich siedliska. UNESCO tworzy rezerwaty biosfery, w Polsce m.in. Puszczę Białowieską, która jest też wpisana na Listę Światowego Dziedzictwa.

ZRÓWNOWAŻONY ROZWÓJ
Zrównoważony rozwój to rozwój gospodarczy i społeczny, który zaspokaja potrzeby obecnego pokolenia, nie ograniczając możliwości zaspokojenia potrzeb przyszłych pokoleń. Łączy on troskę o środowisko, gospodarkę i sprawiedliwość społeczną. Jego zasady obejmują korzystanie z zasobów odnawialnych w tempie nieprzekraczającym ich odnawiania się, oszczędne gospodarowanie zasobami nieodnawialnymi, rozwój odnawialnych źródeł energii, ograniczanie zanieczyszczeń i ilości odpadów, recykling, rolnictwo ekologiczne, ochronę różnorodności biologicznej i edukację ekologiczną. Każdy może się do niego przyczyniać, np. oszczędzając wodę i energię, segregując odpady, wybierając transport publiczny i ograniczając marnowanie żywności.
''',
        flashcards: [
          Flashcard(id: 'f_k4_roz_12', front: 'Jakie jest najpoważniejsze zagrożenie dla różnorodności biologicznej?', back: 'Niszczenie i fragmentacja siedlisk.'),
          Flashcard(id: 'f_k4_roz_13', front: 'Dlaczego fragmentacja siedlisk zagraża gatunkom?', back: 'Tworzy małe, izolowane populacje, które tracą różnorodność genetyczną i łatwiej wymierają.'),
          Flashcard(id: 'f_k4_roz_14', front: 'Czym są gatunki obce inwazyjne? Podaj przykłady z Polski.', back: 'Gatunkami wprowadzonymi przez człowieka, wypierającymi rodzime — np. barszcz Sosnowskiego, nawłoć kanadyjska, norka amerykańska.'),
          Flashcard(id: 'f_k4_roz_15', front: 'Czym różni się restytucja od reintrodukcji?', back: 'Restytucja odtwarza zanikającą populację tam, gdzie gatunek jeszcze żyje; reintrodukcja wprowadza go ponownie tam, gdzie całkowicie wyginął.'),
          Flashcard(id: 'f_k4_roz_16', front: 'Podaj przykłady gatunków restytuowanych lub reintrodukowanych w Polsce.', back: 'Żubr, bóbr europejski, sokół wędrowny, ryś.'),
          Flashcard(id: 'f_k4_roz_17', front: 'Czym różni się ochrona ścisła od czynnej?', back: 'Ścisła wyklucza ingerencję człowieka; czynna polega na zabiegach ochronnych, np. koszeniu łąk.'),
          Flashcard(id: 'f_k4_roz_18', front: 'Czym różni się ochrona in situ od ex situ?', back: 'In situ — w miejscu naturalnego występowania; ex situ — poza nim, np. w zoo i bankach genów.'),
          Flashcard(id: 'f_k4_roz_19', front: 'Czym różni się park narodowy od parku krajobrazowego?', back: 'W parku narodowym chroniona jest cała przyroda; w krajobrazowym dozwolona jest ograniczona gospodarka.'),
          Flashcard(id: 'f_k4_roz_20', front: 'Czym są obszary Natura 2000?', back: 'Europejską siecią obszarów chroniących najcenniejsze siedliska i gatunki zagrożone w UE.'),
          Flashcard(id: 'f_k4_roz_21', front: 'Wymień formy ochrony indywidualnej przyrody.', back: 'Pomniki przyrody, stanowiska dokumentacyjne, użytki ekologiczne, zespoły przyrodniczo-krajobrazowe.'),
          Flashcard(id: 'f_k4_roz_22', front: 'Czego dotyczy konwencja CITES?', back: 'Międzynarodowego handlu zagrożonymi gatunkami dzikich zwierząt i roślin oraz ich produktami.'),
          Flashcard(id: 'f_k4_roz_23', front: 'Czym jest Konwencja o różnorodności biologicznej?', back: 'Umową z Rio de Janeiro (1992) zobowiązującą państwa do ochrony i zrównoważonego użytkowania różnorodności biologicznej.'),
          Flashcard(id: 'f_k4_roz_24', front: 'Czym jest Agenda 21?', back: 'Programem działań na rzecz zrównoważonego rozwoju w XXI wieku, przyjętym na Szczycie Ziemi w Rio.'),
          Flashcard(id: 'f_k4_roz_25', front: 'Czym jest zrównoważony rozwój?', back: 'Rozwojem zaspokajającym potrzeby obecnego pokolenia bez ograniczania możliwości przyszłych pokoleń.'),
          Flashcard(id: 'f_k4_roz_26', front: 'Jak urbanizacja, rozwój komunikacji i turystyka wpływają na różnorodność biologiczną?', back: 'Niszczą i rozcinają siedliska, drogi powodują śmierć zwierząt, a masowa turystyka niszczy roślinność, płoszy zwierzęta i zaśmieca tereny.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k4_roz_8', question: 'Ponowne wprowadzenie gatunku na obszar, z którego całkowicie wyginął, to:', options: ['Restytucja', 'Reintrodukcja', 'Introdukcja gatunku obcego', 'Ochrona ścisła'], correctIndex: 1, explanation: 'Restytucja dotyczy zanikającej, ale wciąż istniejącej populacji.'),
          QuizQuestion(id: 'q_k4_roz_9', question: 'Gatunkiem obcym inwazyjnym w Polsce jest:', options: ['Żubr', 'Barszcz Sosnowskiego', 'Brzoza karłowata', 'Bóbr europejski'], correctIndex: 1, explanation: 'Wypiera rodzime rośliny i jest groźny dla zdrowia człowieka.'),
          QuizQuestion(id: 'q_k4_roz_10', question: 'Międzynarodowy handel zagrożonymi gatunkami reguluje konwencja:', options: ['Ramsarska', 'CITES', 'Bońska', 'Berneńska'], correctIndex: 1, explanation: 'Nazywana jest też konwencją waszyngtońską.'),
          QuizQuestion(id: 'q_k4_roz_11', question: 'Koszenie łąk w celu zachowania ich bioróżnorodności to przykład ochrony:', options: ['Ścisłej', 'Czynnej', 'Ex situ', 'Gatunkowej ścisłej'], correctIndex: 1, explanation: 'Bez koszenia łąka zarosłaby krzewami w wyniku sukcesji.'),
          QuizQuestion(id: 'q_k4_roz_12', question: 'Bank genów jest formą ochrony:', options: ['In situ', 'Ex situ', 'Obszarowej', 'Krajobrazowej'], correctIndex: 1, explanation: 'Materiał genetyczny przechowywany jest poza naturalnym środowiskiem.'),
          QuizQuestion(id: 'q_k4_roz_13', question: 'Obszary Natura 2000 tworzone są w celu ochrony:', options: ['Zabytków architektury i kultury', 'Najcenniejszych siedlisk i gatunków w skali UE', 'Wyłącznie lasów gospodarczych', 'Terenów rekreacyjnych w miastach'], correctIndex: 1, explanation: 'Obejmują obszary specjalnej ochrony ptaków i siedlisk.'),
          QuizQuestion(id: 'q_k4_roz_14', question: 'Konwencję o różnorodności biologicznej przyjęto w:', options: ['Waszyngtonie', 'Rio de Janeiro', 'Ramsarze', 'Bonn'], correctIndex: 1, explanation: 'Na Szczycie Ziemi w 1992 roku.'),
          QuizQuestion(id: 'q_k4_roz_15', question: 'Zasadą zrównoważonego rozwoju jest:', options: ['Korzystanie z zasobów odnawialnych szybciej, niż się odnawiają', 'Rozwój odnawialnych źródeł energii', 'Zwiększanie ilości odpadów', 'Zastępowanie lasów monokulturami'], correctIndex: 1, explanation: 'Ogranicza zużycie zasobów nieodnawialnych i zanieczyszczenia.'),
          QuizQuestion(id: 'q_k4_roz_16', question: 'Park narodowy w Polsce musi mieć powierzchnię co najmniej:', options: ['100 ha', '1000 ha', '10 000 ha', '50 ha'], correctIndex: 1, explanation: 'Tak określa ustawa o ochronie przyrody.'),
        ],
      ),
    ],
  ),
];
