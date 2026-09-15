import '../models.dart';
import 'biology_k2.dart';
import 'biology_k3.dart';
import 'biology_k4.dart';

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
              Flashcard(id: 'f_k1_nie_1', front: 'Czym różnią się makroelementy od mikroelementów?', back: 'Makroelementy występują w organizmie w większych ilościach (powyżej 0,01% masy ciała), mikroelementy — w ilościach śladowych.'),
              Flashcard(id: 'f_k1_nie_2', front: 'Wymień pierwiastki biogenne.', back: 'C, H, O, N, P i S.'),
              Flashcard(id: 'f_k1_nie_3', front: 'Jaką funkcję pełni wapń w organizmie człowieka?', back: 'Buduje kości i zęby, uczestniczy w krzepnięciu krwi i skurczu mięśni.'),
              Flashcard(id: 'f_k1_nie_4', front: 'Jaką rolę pełni magnez?', back: 'Jest kofaktorem enzymów i składnikiem chlorofilu.'),
              Flashcard(id: 'f_k1_nie_5', front: 'Jakie są skutki niedoboru żelaza i jodu?', back: 'Niedobór żelaza powoduje anemię, a jodu — wole tarczycy.'),
              Flashcard(id: 'f_k1_nie_6', front: 'Dlaczego woda jest dobrym rozpuszczalnikiem?', back: 'Jej cząsteczki są polarne, dzięki czemu rozpuszczają substancje polarne i jonowe.'),
              Flashcard(id: 'f_k1_nie_7', front: 'Co wynika z tworzenia wiązań wodorowych między cząsteczkami wody?', back: 'Wysokie ciepło właściwe i wysokie ciepło parowania wody.'),
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
Lipidy proste to estry kwasów tłuszczowych i alkoholi, w których składniki łączą się wiązaniami estrowymi. Tłuszcze właściwe (triacyloglicerole) zbudowane są z glicerolu i trzech cząsteczek kwasów tłuszczowych, a woski — z kwasów tłuszczowych i alkoholi o długim łańcuchu węglowym; woski chronią np. liście i pióra przed utratą wody i nadmiernym zwilżaniem. Lipidy złożone zawierają oprócz kwasów tłuszczowych i alkoholu dodatkowe składniki: fosfolipidy — resztę kwasu fosforowego (budują błony komórkowe), a glikolipidy — resztę cukrową (występują w błonach i uczestniczą w rozpoznawaniu się komórek). Odrębną grupę lipidów stanowią steroidy, np. cholesterol i hormony płciowe — związki o budowie pierścieniowej, niezawierające glicerolu ani kwasów tłuszczowych.
WŁAŚCIWOŚCI: lipidy są nierozpuszczalne w wodzie (hydrofobowe), a rozpuszczalne w rozpuszczalnikach organicznych. Tłuszcze zawierające głównie nasycone kwasy tłuszczowe (bez wiązań podwójnych) są w temperaturze pokojowej stałe (np. łój), a zawierające głównie nienasycone kwasy tłuszczowe (z wiązaniami podwójnymi) — ciekłe (oleje).
ZNACZENIE: magazynowanie energii (2x więcej na gram niż węglowodany), budowa błon komórkowych (fosfolipidy), izolacja termiczna i mechaniczna, prekursory hormonów steroidowych.
''',
            flashcards: [
              Flashcard(id: 'f_k1_4', front: 'Co to jest glikogen?', back: 'Wielocukier zapasowy magazynowany w wątrobie i mięśniach zwierząt.'),
              Flashcard(id: 'f_k1_5', front: 'Która grupa związków magazynuje najwięcej energii na gram?', back: 'Tłuszcze (lipidy) — ok. 2 razy więcej niż węglowodany.'),
              Flashcard(id: 'f_k1_7', front: 'Jaką funkcję pełni celuloza u roślin?', back: 'Buduje ściany komórkowe (funkcja strukturalna).'),
              Flashcard(id: 'f_k1_wl_1', front: 'Jakie znaczenie ma rodzaj wiązania glikozydowego w polisacharydzie?', back: 'Wiązania α występują w skrobi i glikogenie (trawionych przez człowieka), β — w celulozie i chitynie (nietrawionych, budulcowych).'),
              Flashcard(id: 'f_k1_wl_2', front: 'Wymień ważne biologicznie monosacharydy.', back: 'Glukoza, fruktoza i galaktoza (heksozy) oraz ryboza i deoksyryboza (pentozy).'),
              Flashcard(id: 'f_k1_wl_3', front: 'Z jakich monosacharydów zbudowane są sacharoza, laktoza i maltoza?', back: 'Sacharoza — glukoza i fruktoza, laktoza — glukoza i galaktoza, maltoza — dwie cząsteczki glukozy.'),
              Flashcard(id: 'f_k1_wl_4', front: 'Czym różni się skrobia od glikogenu?', back: 'Skrobia jest materiałem zapasowym roślin, a glikogen — zwierząt i grzybów; glikogen jest silniej rozgałęziony.'),
              Flashcard(id: 'f_k1_wl_5', front: 'Jak wykryć skrobię w materiale biologicznym?', back: 'Płynem Lugola — w obecności skrobi pojawia się granatowe zabarwienie.'),
              Flashcard(id: 'f_k1_wl_6', front: 'Czym różnią się lipidy proste od złożonych?', back: 'Proste to estry kwasów tłuszczowych i alkoholi; złożone zawierają dodatkowo np. resztę fosforanową lub cukrową.'),
              Flashcard(id: 'f_k1_wl_7', front: 'Jaką funkcję pełnią woski?', back: 'Chronią np. liście i pióra przed utratą wody i nadmiernym zwilżaniem.'),
              Flashcard(id: 'f_k1_wl_8', front: 'Dlaczego oleje są ciekłe, a łój jest stały?', back: 'Oleje zawierają głównie nienasycone kwasy tłuszczowe, a łój — nasycone.'),
              Flashcard(id: 'f_k1_wl_9', front: 'Czym są steroidy? Podaj przykłady.', back: 'Lipidami o budowie pierścieniowej, bez glicerolu i kwasów tłuszczowych — np. cholesterol i hormony płciowe.'),
            ],
            questions: [
              QuizQuestion(id: 'q_k1_3', question: 'Który związek pełni funkcję zapasową u zwierząt?', options: ['Celuloza', 'Skrobia', 'Glikogen', 'Chityna'], correctIndex: 2, explanation: 'Glikogen to zapasowy wielocukier magazynowany w wątrobie i mięśniach zwierząt.'),
              QuizQuestion(id: 'q_k1_4', question: 'Fosfolipidy są głównym składnikiem:', options: ['Błon komórkowych', 'Chromosomów', 'Rybosomów', 'Ściany komórkowej roślin'], correctIndex: 0, explanation: 'Dwuwarstwa fosfolipidowa buduje błony komórkowe.'),
              QuizQuestion(id: 'q_k1_16', question: 'Wiązanie α-glikozydowe występuje w:', options: ['Celulozie', 'Skrobi i glikogenie', 'Chitynie', 'DNA'], correctIndex: 1, explanation: 'Skrobia i glikogen zbudowane są z glukozy połączonej wiązaniami α-glikozydowymi.'),
              QuizQuestion(id: 'q_k1_17', question: 'Do wykrywania obecności skrobi w materiale biologicznym stosuje się:', options: ['Wodorotlenek miedzi', 'Płyn Lugola', 'Wodę bromową', 'Sudan III'], correctIndex: 1, explanation: 'Płyn Lugola ze skrobią daje granatowe zabarwienie.'),
              QuizQuestion(id: 'q_k1_18', question: 'Kwasy tłuszczowe łączą się z glicerolem wiązaniem:', options: ['Peptydowym', 'Glikozydowym', 'Estrowym', 'Wodorowym'], correctIndex: 2, explanation: 'Kwasy tłuszczowe łączą się z glicerolem wiązaniami estrowymi.'),
              QuizQuestion(id: 'q_k1_19', question: 'Cholesterol należy do grupy:', options: ['Monosacharydów', 'Steroidów', 'Disacharydów', 'Polisacharydów'], correctIndex: 1, explanation: 'Cholesterol to lipid o budowie pierścieniowej należący do steroidów.'),
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
Koagulacja (wysalanie) — odwracalne wytrącenie białka z roztworu koloidalnego pod wpływem soli metali lekkich, np. chlorku sodu lub siarczanu amonu. Struktura przestrzenna białka nie zostaje trwale naruszona, dlatego po dodaniu wody białko ponownie się rozpuszcza i zachowuje swoje właściwości.
Denaturacja — zazwyczaj nieodwracalna utrata struktury przestrzennej (II-, III- i IV-rzędowej) białka pod wpływem wysokiej temperatury, stężonych kwasów i zasad, soli metali ciężkich, alkoholu lub promieniowania UV. Białko traci funkcję biologiczną, choć sekwencja aminokwasów (struktura I-rzędowa) pozostaje niezmieniona. Przykładem jest ścinanie się białka jaja kurzego podczas gotowania.
OBSERWACJA: do probówek z roztworem białka jaja kurzego dodaje się kolejno stężony roztwór chlorku sodu, roztwór soli metalu ciężkiego (np. siarczanu miedzi(II)) i etanol, a jedną probówkę ogrzewa się. We wszystkich probówkach białko się wytrąca, ale po dodaniu wody osad rozpuszcza się ponownie tylko w probówce z chlorkiem sodu — zaszła tam koagulacja; w pozostałych zaszła nieodwracalna denaturacja.

ZNACZENIE BIOLOGICZNE BIAŁEK
Albuminy i globuliny — białka osocza krwi (transport, odporność). Histony — białka strukturalne, wokół których nawija się DNA w chromatynie. Kolagen — białko budulcowe tkanki łącznej, skóry, kości i ścięgien. Keratyna — białko budulcowe naskórka, włosów i paznokci. Hemoglobina — transport tlenu we krwi. Mioglobina — magazynowanie tlenu w mięśniach.
''',
            flashcards: [
              Flashcard(id: 'f_k1_2', front: 'Z czego zbudowane są białka?', back: 'Z aminokwasów połączonych wiązaniami peptydowymi.'),
              Flashcard(id: 'f_k1_3', front: 'Wymień trzy funkcje białek.', back: 'Budulcowa, enzymatyczna, transportowa (także odpornościowa i regulacyjna).'),
              Flashcard(id: 'f_k1_bia_1', front: 'Czym różni się białko proste od złożonego?', back: 'Proste zbudowane jest wyłącznie z aminokwasów (np. albuminy), złożone zawiera też część niebiałkową (np. hemoglobina z hemem).'),
              Flashcard(id: 'f_k1_bia_2', front: 'Czym jest struktura I-rzędowa białka?', back: 'Kolejnością (sekwencją) aminokwasów w łańcuchu polipeptydowym.'),
              Flashcard(id: 'f_k1_bia_3', front: 'Jakie wiązania stabilizują strukturę II-rzędową białka?', back: 'Wiązania wodorowe — tworzą α-helisę i harmonijkę β.'),
              Flashcard(id: 'f_k1_bia_4', front: 'Czym różni się koagulacja od denaturacji?', back: 'Koagulacja (np. pod wpływem NaCl) jest odwracalna; denaturacja (temperatura, metale ciężkie, alkohol) jest zazwyczaj nieodwracalna.'),
              Flashcard(id: 'f_k1_bia_5', front: 'Które struktury białka niszczy denaturacja?', back: 'II-, III- i IV-rzędową; struktura I-rzędowa pozostaje nienaruszona.'),
              Flashcard(id: 'f_k1_bia_6', front: 'Jak doświadczalnie odróżnić koagulację od denaturacji?', back: 'Po dodaniu wody osad powstały w koagulacji się rozpuszcza, a po denaturacji — nie.'),
              Flashcard(id: 'f_k1_bia_7', front: 'Czym różni się hemoglobina od mioglobiny?', back: 'Hemoglobina transportuje tlen we krwi i ma cztery podjednostki; mioglobina magazynuje tlen w mięśniach.'),
              Flashcard(id: 'f_k1_bia_8', front: 'Gdzie występują kolagen i keratyna?', back: 'Kolagen — w tkance łącznej, kościach i ścięgnach; keratyna — w naskórku, włosach i paznokciach.'),
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
              Flashcard(id: 'f_k1_kn_1', front: 'Jakim wiązaniem łączą się nukleotydy w łańcuchu?', back: 'Wiązaniem fosfodiestrowym.'),
              Flashcard(id: 'f_k1_kn_2', front: 'Czym różni się budowa DNA od RNA?', back: 'DNA zawiera deoksyrybozę i tyminę i zwykle ma dwie nici; RNA zawiera rybozę i uracyl i zwykle ma jedną nić.'),
              Flashcard(id: 'f_k1_kn_3', front: 'Na czym polega komplementarność zasad azotowych?', back: 'Adenina łączy się z tyminą (w RNA z uracylem) dwoma wiązaniami wodorowymi, a guanina z cytozyną — trzema.'),
              Flashcard(id: 'f_k1_kn_4', front: 'Co oznacza, że nici DNA są antyrównoległe?', back: 'Biegną w przeciwnych kierunkach.'),
              Flashcard(id: 'f_k1_kn_5', front: 'Jaką funkcję pełni mRNA?', back: 'Przenosi informację genetyczną z DNA do rybosomu.'),
              Flashcard(id: 'f_k1_kn_6', front: 'Jaką funkcję pełni tRNA?', back: 'Dostarcza aminokwasy do rybosomu podczas translacji.'),
              Flashcard(id: 'f_k1_kn_7', front: 'Jaką funkcję pełni rRNA?', back: 'Buduje rybosomy.'),
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
              Flashcard(id: 'f_k1_bl_1', front: 'Jaką funkcję pełni cholesterol w błonie komórkowej?', back: 'Stabilizuje jej płynność.'),
              Flashcard(id: 'f_k1_bl_2', front: 'Jaką rolę pełnią glikoproteiny i glikolipidy błony komórkowej?', back: 'Uczestniczą w rozpoznawaniu się komórek i pełnią funkcję receptorów.'),
              Flashcard(id: 'f_k1_bl_3', front: 'Co opisuje model płynnej mozaiki?', back: 'Błonę jako dynamiczną dwuwarstwę lipidową, w której mogą przemieszczać się białka i lipidy.'),
              Flashcard(id: 'f_k1_bl_4', front: 'Czym różni się dyfuzja prosta od dyfuzji wspomaganej?', back: 'Obie są bierne i zachodzą zgodnie z gradientem stężeń, ale wspomagana wymaga białek transportowych.'),
              Flashcard(id: 'f_k1_bl_5', front: 'Czym jest transport aktywny? Podaj przykład.', back: 'Transportem wbrew gradientowi stężeń z nakładem ATP — np. pompa sodowo-potasowa.'),
              Flashcard(id: 'f_k1_bl_6', front: 'Czym różni się fagocytoza od pinocytozy?', back: 'Fagocytoza to pobieranie cząstek stałych, a pinocytoza — płynów.'),
              Flashcard(id: 'f_k1_bl_7', front: 'Czym jest osmoza?', back: 'Przenikaniem wody przez błonę półprzepuszczalną z roztworu o niższym do roztworu o wyższym stężeniu substancji rozpuszczonej.'),
              Flashcard(id: 'f_k1_bl_8', front: 'Co dzieje się z komórką roślinną w roztworze hipertonicznym?', back: 'Traci wodę i ulega plazmolizie.'),
              Flashcard(id: 'f_k1_bl_9', front: 'Dlaczego komórka zwierzęca w roztworze hipotonicznym może pęknąć?', back: 'Pobiera wodę, a nie ma ściany komórkowej, która chroniłaby ją przed nadmiernym pęcznieniem.'),
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
            flashcards: [
              Flashcard(id: 'f_k1_jad_1', front: 'Z czego zbudowana jest otoczka jądrowa?', back: 'Z dwóch błon z porami jądrowymi.'),
              Flashcard(id: 'f_k1_jad_2', front: 'Jaką funkcję pełnią pory jądrowe?', back: 'Umożliwiają transport substancji między jądrem a cytoplazmą, np. mRNA i podjednostek rybosomów.'),
              Flashcard(id: 'f_k1_jad_3', front: 'Czym jest chromatyna?', back: 'Kompleksem DNA i białek histonowych.'),
              Flashcard(id: 'f_k1_jad_4', front: 'Jaką funkcję pełni jąderko?', back: 'Syntetyzuje rRNA i składa podjednostki rybosomów.'),
              Flashcard(id: 'f_k1_jad_5', front: 'Jakie funkcje pełni jądro komórkowe?', back: 'Przechowuje i powiela materiał genetyczny oraz kieruje czynnościami komórki przez regulację ekspresji genów.'),
              Flashcard(id: 'f_k1_jad_6', front: 'Z czego zbudowany jest rybosom?', back: 'Z dwóch podjednostek — małej i dużej — złożonych z rRNA i białek.'),
              Flashcard(id: 'f_k1_jad_7', front: 'Gdzie w komórce występują rybosomy?', back: 'Swobodnie w cytoplazmie, na siateczce śródplazmatycznej szorstkiej oraz w mitochondriach i chloroplastach.'),
              Flashcard(id: 'f_k1_jad_8', front: 'Jaką funkcję pełnią rybosomy?', back: 'Są miejscem syntezy białek (translacji).'),
              Flashcard(id: 'f_k1_jad_9', front: 'Dlaczego rybosomy mitochondriów i chloroplastów są argumentem za endosymbiozą?', back: 'Są mniejsze niż rybosomy cytoplazmatyczne i podobne do bakteryjnych (70S).'),
            ],
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
              Flashcard(id: 'f_k1_sb_1', front: 'Jaką funkcję pełni retikulum endoplazmatyczne szorstkie?', back: 'Syntetyzuje białka przeznaczone do wydzielania, wbudowania w błony lub transportu.'),
              Flashcard(id: 'f_k1_sb_2', front: 'Jaką funkcję pełni retikulum endoplazmatyczne gładkie?', back: 'Syntetyzuje lipidy, uczestniczy w przemianach węglowodanów i unieszkodliwia toksyny.'),
              Flashcard(id: 'f_k1_sb_3', front: 'Jaką funkcję pełni aparat Golgiego?', back: 'Modyfikuje, sortuje i pakuje białka oraz lipidy do transportu.'),
              Flashcard(id: 'f_k1_sb_4', front: 'Jak powstają lizosomy?', back: 'Z pęcherzyków odczłonkowanych od aparatu Golgiego.'),
              Flashcard(id: 'f_k1_sb_5', front: 'Czym jest autofagia?', back: 'Trawieniem przez lizosomy zbędnych lub uszkodzonych organelli komórki.'),
              Flashcard(id: 'f_k1_sb_6', front: 'Jak materiał przemieszcza się między elementami systemu błon wewnątrzkomórkowych?', back: 'W pęcherzykach transportowych.'),
              Flashcard(id: 'f_k1_sb_7', front: 'Jakie znaczenie ma kompartmentacja komórki?', back: 'Umożliwia jednoczesne zachodzenie różnych, czasem przeciwstawnych procesów w odrębnych przedziałach.'),
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
Plastydy mogą przekształcać się w siebie nawzajem — np. podczas dojrzewania owoców pomidora chloroplasty przekształcają się w chromoplasty, a bulwy ziemniaka wystawione na światło zielenieją, bo w ich leukoplastach powstaje chlorofil.

OBSERWACJA PLASTYDÓW
Chloroplasty obserwuje się w preparacie z liścia moczarki kanadyjskiej lub mchu, umieszczonego w kropli wody — widoczne są jako liczne zielone ziarna, często przemieszczające się wraz z cytoplazmą. Chromoplasty obserwuje się w preparacie z miąższu dojrzałego owocu pomidora, papryki lub dzikiej róży albo z korzenia marchwi — mają barwę pomarańczową, żółtą lub czerwoną i różne kształty. Leukoplasty zawierające skrobię (amyloplasty) obserwuje się w preparacie z bulwy ziemniaka — po dodaniu płynu Lugola ziarna skrobi barwią się na granatowo.

TEORIA ENDOSYMBIOZY
Mitochondria i chloroplasty prawdopodobnie powstały z wolno żyjących bakterii, wchłoniętych przez większą komórkę prekursorową i przetrwałych jako endosymbionty. Argumenty: własne, koliste DNA, własne rybosomy typu 70S, podwójna błona, zdolność do samodzielnego podziału, podobna wielkość do bakterii.
''',
            flashcards: [
              Flashcard(id: 'f_k1_10', front: 'Jaka jest funkcja mitochondrium?', back: 'Produkcja ATP w procesie oddychania komórkowego.'),
              Flashcard(id: 'f_k1_11', front: 'Co znajduje się w chloroplastach?', back: 'Chlorofil i własne DNA — miejsce zachodzenia fotosyntezy.'),
              Flashcard(id: 'f_k1_mp_1', front: 'Jak zbudowane jest mitochondrium?', back: 'Z błony zewnętrznej, pofałdowanej błony wewnętrznej tworzącej grzebienie i matriks z DNA, rybosomami i enzymami.'),
              Flashcard(id: 'f_k1_mp_2', front: 'Gdzie w chloroplaście zachodzą fazy fotosyntezy?', back: 'Faza zależna od światła — w błonach tylakoidów; faza niezależna od światła — w stromie.'),
              Flashcard(id: 'f_k1_mp_3', front: 'Czym różnią się chloroplasty, chromoplasty i leukoplasty?', back: 'Chloroplasty zawierają chlorofil, chromoplasty — barwniki karotenoidowe, leukoplasty są bezbarwne i magazynują substancje.'),
              Flashcard(id: 'f_k1_mp_4', front: 'Wymień argumenty za endosymbiotycznym pochodzeniem mitochondriów i chloroplastów.', back: 'Własne koliste DNA, rybosomy 70S, dwie błony, samodzielne podziały, wielkość zbliżona do bakterii.'),
              Flashcard(id: 'f_k1_mp_5', front: 'W jakim materiale obserwuje się chromoplasty?', back: 'W miąższu dojrzałego pomidora, papryki lub dzikiej róży albo w korzeniu marchwi.'),
              Flashcard(id: 'f_k1_mp_6', front: 'Jak uwidocznić amyloplasty w bulwie ziemniaka?', back: 'Dodać płyn Lugola — ziarna skrobi barwią się na granatowo.'),
              Flashcard(id: 'f_k1_mp_7', front: 'Podaj przykład przekształcania się plastydów.', back: 'Chloroplasty dojrzewającego pomidora zmieniają się w chromoplasty; leukoplasty bulwy ziemniaka na świetle w chloroplasty.'),
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
            flashcards: [
              Flashcard(id: 'f_k1_sci_1', front: 'Jakie funkcje pełni ściana komórkowa?', back: 'Nadaje komórce kształt oraz chroni ją przed uszkodzeniami mechanicznymi i nadmiernym pęcznieniem.'),
              Flashcard(id: 'f_k1_sci_2', front: 'Z czego zbudowana jest ściana komórkowa roślin, grzybów i bakterii?', back: 'Roślin — z celulozy, grzybów — z chityny, bakterii — z mureiny.'),
              Flashcard(id: 'f_k1_sci_3', front: 'Czym jest tonoplast?', back: 'Błoną otaczającą wakuolę.'),
              Flashcard(id: 'f_k1_sci_4', front: 'Jakie funkcje pełni wakuola?', back: 'Magazynuje wodę, jony, barwniki i produkty przemiany materii oraz utrzymuje turgor komórki.'),
              Flashcard(id: 'f_k1_sci_5', front: 'Z jakich elementów składa się cytoszkielet?', back: 'Z mikrofilamentów, mikrotubul i filamentów pośrednich.'),
              Flashcard(id: 'f_k1_sci_6', front: 'Jaką funkcję pełnią mikrotubule?', back: 'Budują wrzeciono podziałowe, rzęski i wici oraz uczestniczą w transporcie wewnątrzkomórkowym.'),
              Flashcard(id: 'f_k1_sci_7', front: 'Z jakiego białka zbudowane są mikrofilamenty i w czym uczestniczą?', back: 'Z aktyny — uczestniczą w ruchu komórki i skurczu.'),
              Flashcard(id: 'f_k1_sci_8', front: 'Jaką funkcję pełnią filamenty pośrednie?', back: 'Zapewniają komórce wytrzymałość mechaniczną.'),
              Flashcard(id: 'f_k1_sci_9', front: 'Czym jest cykloza i gdzie można ją zaobserwować?', back: 'Ruchem cytoplazmy — np. w komórkach liścia moczarki kanadyjskiej.'),
            ],
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
              Flashcard(id: 'f_k1_pe_1', front: 'Gdzie znajduje się materiał genetyczny komórki prokariotycznej?', back: 'W nukleoidzie, nieoddzielonym błoną od cytoplazmy.'),
              Flashcard(id: 'f_k1_pe_2', front: 'Czym różnią się rybosomy komórek prokariotycznych i eukariotycznych?', back: 'Prokariotyczne są mniejsze (70S), eukariotyczne — większe (80S).'),
              Flashcard(id: 'f_k1_pe_3', front: 'Które organizmy zbudowane są z komórek eukariotycznych?', back: 'Rośliny, zwierzęta, grzyby i protisty.'),
              Flashcard(id: 'f_k1_pe_4', front: 'Jakie struktury odróżniają komórkę roślinną od zwierzęcej?', back: 'Ściana komórkowa z celulozy, duża centralna wakuola i chloroplasty; komórka zwierzęca ma centriole.'),
              Flashcard(id: 'f_k1_pe_5', front: 'Czym różni się komórka grzybowa od roślinnej?', back: 'Ma ścianę komórkową z chityny, nie ma chloroplastów, a materiałem zapasowym jest glikogen, a nie skrobia.'),
              Flashcard(id: 'f_k1_pe_6', front: 'Jaki węglowodan zapasowy gromadzą rośliny, grzyby i zwierzęta?', back: 'Rośliny — skrobię, grzyby i zwierzęta — glikogen.'),
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
            flashcards: [
              Flashcard(id: 'f_k1_met_1', front: 'Czym jest metabolizm?', back: 'Ogółem reakcji chemicznych zachodzących w komórce, zorganizowanych w szlaki i cykle metaboliczne.'),
              Flashcard(id: 'f_k1_met_2', front: 'Czym różni się katabolizm od anabolizmu?', back: 'Katabolizm to rozkład związków złożonych z uwolnieniem energii; anabolizm — synteza związków złożonych z wykorzystaniem energii.'),
              Flashcard(id: 'f_k1_met_3', front: 'Podaj przykłady procesów katabolicznych i anabolicznych.', back: 'Kataboliczne: oddychanie komórkowe. Anaboliczne: fotosynteza, synteza białek.'),
              Flashcard(id: 'f_k1_met_4', front: 'Czym różni się cykl metaboliczny od szlaku liniowego?', back: 'W cyklu produkt ostatniej reakcji odtwarza substrat pierwszej, np. w cyklu Krebsa.'),
              Flashcard(id: 'f_k1_met_5', front: 'Jak powiązane są katabolizm i anabolizm?', back: 'Energia uwolniona w katabolizmie, zmagazynowana w ATP, napędza reakcje anaboliczne.'),
              Flashcard(id: 'f_k1_met_6', front: 'Z czego zbudowany jest ATP?', back: 'Z adeniny, rybozy i trzech reszt fosforanowych.'),
              Flashcard(id: 'f_k1_met_7', front: 'Jak ATP uwalnia energię?', back: 'Przez hydrolizę końcowego wiązania fosforanowego do ADP i fosforanu.'),
              Flashcard(id: 'f_k1_met_8', front: 'Jaką funkcję pełnią NAD+, FAD i NADP+?', back: 'Są przenośnikami elektronów i protonów w reakcjach utleniania i redukcji.'),
              Flashcard(id: 'f_k1_met_9', front: 'Jak nazywają się zredukowane formy NAD+, FAD i NADP+?', back: 'NADH, FADH2 i NADPH.'),
            ],
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
BUDOWA ENZYMÓW
Enzymy to biokatalizatory — przyspieszają reakcje chemiczne, obniżając ich energię aktywacji, i nie zużywają się w reakcji. Większość enzymów to białka, ale niektóre reakcje katalizują cząsteczki RNA, zwane rybozymami (np. rRNA tworzący wiązania peptydowe w rybosomie). Enzymy proste zbudowane są wyłącznie z białka. Enzymy złożone (holoenzymy) składają się z części białkowej — apoenzymu, który decyduje o swoistości — oraz części niebiałkowej, czyli kofaktora, bez którego enzym nie działa. Kofaktorem mogą być jony metali (np. Mg2+, Zn2+, Fe2+) albo związki organiczne: koenzymy, związane z apoenzymem luźno i odwracalnie (np. NAD+, koenzym A — często pochodne witamin), oraz grupy prostetyczne, związane z nim trwale (np. FAD, hem).

DZIAŁANIE ENZYMÓW
Enzym ma centrum aktywne — fragment o specyficznym kształcie i właściwościach chemicznych, do którego przyłącza się substrat. Komplementarność centrum aktywnego i substratu odpowiada za swoistość substratową enzymu: dany enzym katalizuje reakcje tylko określonego substratu lub grupy podobnych substratów. Po przyłączeniu substratu powstaje kompleks enzym–substrat, a centrum aktywne dopasowuje się przy tym do kształtu substratu (model indukowanego dopasowania). Enzym ułatwia przebieg reakcji, np. ustawiając substraty w odpowiednim położeniu lub osłabiając ich wiązania, po czym uwalnia produkty i może katalizować kolejne reakcje.

REGULACJA AKTYWNOŚCI ENZYMÓW
Aktywacja — zwiększenie aktywności enzymu przez aktywator. Inhibicja — zmniejszenie aktywności enzymu: kompetycyjna (inhibitor rywalizuje o centrum aktywne) oraz niekompetycyjna (inhibitor wiąże się w innym miejscu, zmieniając kształt centrum aktywnego).
Sprzężenie zwrotne ujemne — końcowy produkt szlaku metabolicznego hamuje enzym katalizujący wcześniejszy etap tego szlaku — zapobiega nadprodukcji i utrzymuje homeostazę komórki.

WPŁYW CZYNNIKÓW FIZYKOCHEMICZNYCH NA KATALIZĘ ENZYMATYCZNĄ
Temperatura — aktywność rośnie do optimum, powyżej którego enzym ulega denaturacji.
pH — każdy enzym ma optymalne pH (np. pepsyna działa w kwaśnym środowisku żołądka, trypsyna w zasadowym środowisku jelita).
Stężenie substratu — wzrost stężenia zwiększa szybkość reakcji do wysycenia enzymu.
DOŚWIADCZENIE: katalaza zawarta w bulwie ziemniaka rozkłada nadtlenek wodoru do wody i tlenu, co widać jako pienienie. Do probówek z nadtlenkiem wodoru dodaje się jednakowe kawałki surowego ziemniaka (próba badawcza) i ziemniaka ugotowanego, w którym enzym uległ denaturacji (próba kontrolna); tak samo można badać wpływ temperatury lub pH na aktywność katalazy. Aktywność proteinazy, np. pepsyny, bada się, obserwując tempo trawienia białka, np. ściętego białka jaja, w różnych warunkach pH i temperatury.
''',
            flashcards: [
              Flashcard(id: 'f_k1_enz_1', front: 'Jak enzymy wpływają na energię aktywacji reakcji?', back: 'Obniżają ją, dzięki czemu reakcja przebiega szybciej.'),
              Flashcard(id: 'f_k1_enz_2', front: 'Z czego zbudowany jest enzym złożony (holoenzym)?', back: 'Z części białkowej (apoenzymu) i niebiałkowej (kofaktora).'),
              Flashcard(id: 'f_k1_enz_3', front: 'Czym różni się koenzym od grupy prostetycznej?', back: 'Koenzym jest związany z apoenzymem luźno i odwracalnie (np. NAD+), grupa prostetyczna — trwale (np. FAD, hem).'),
              Flashcard(id: 'f_k1_enz_4', front: 'Czym są rybozymy?', back: 'Cząsteczkami RNA o właściwościach katalitycznych.'),
              Flashcard(id: 'f_k1_enz_5', front: 'Na czym polega swoistość substratowa enzymu?', back: 'Enzym katalizuje reakcje tylko określonego substratu, do którego pasuje jego centrum aktywne.'),
              Flashcard(id: 'f_k1_enz_6', front: 'Czym jest kompleks enzym–substrat?', back: 'Połączeniem substratu z centrum aktywnym enzymu, poprzedzającym powstanie produktów.'),
              Flashcard(id: 'f_k1_enz_7', front: 'Czym różni się inhibicja kompetycyjna od niekompetycyjnej?', back: 'Inhibitor kompetycyjny konkuruje z substratem o centrum aktywne; niekompetycyjny wiąże się w innym miejscu i zmienia kształt centrum aktywnego.'),
              Flashcard(id: 'f_k1_enz_8', front: 'Jak można osłabić działanie inhibitora kompetycyjnego?', back: 'Zwiększając stężenie substratu.'),
              Flashcard(id: 'f_k1_enz_9', front: 'Dlaczego powyżej temperatury optymalnej aktywność enzymu gwałtownie spada?', back: 'Enzym ulega denaturacji.'),
              Flashcard(id: 'f_k1_enz_10', front: 'Jak wykazać obecność katalazy w ziemniaku?', back: 'Surowy ziemniak w nadtlenku wodoru powoduje pienienie, a ugotowany (próba kontrolna) — nie.'),
            ],
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

CHEMIOSMOZA W CHLOROPLAŚCIE
Podczas przepływu elektronów przez łańcuch przenośników w błonie tylakoidu protony są przepompowywane ze stromy do wnętrza tylakoidu, a kolejne protony uwalniają się tam podczas fotolizy wody. Powstaje różnica stężeń protonów (gradient protonowy) między wnętrzem tylakoidu a stromą. Protony wracają do stromy przez kanał w enzymie — syntazie ATP — a energia tego przepływu zostaje wykorzystana do syntezy ATP z ADP i reszty fosforanowej. Ponieważ proces ten napędza energia światła, nazywamy go fotofosforylacją.

FAZA NIEZALEŻNA OD ŚWIATŁA (CYKL CALVINA)
Zachodzi w stromie chloroplastu i wykorzystuje siłę asymilacyjną, czyli ATP i NADPH wytworzone w fazie zależnej od światła. Przebiega w trzech etapach. Karboksylacja: enzym RuBisCO przyłącza CO2 do pięciowęglowego związku — rybulozo-1,5-bisfosforanu (RuBP); powstały nietrwały związek rozpada się na dwie cząsteczki trójwęglowego kwasu 3-fosfoglicerynowego. Redukcja: z wykorzystaniem ATP i NADPH kwas 3-fosfoglicerynowy zostaje zredukowany do aldehydu 3-fosfoglicerynowego — cukru trójwęglowego, będącego bezpośrednim produktem fotosyntezy. Regeneracja: większość cząsteczek aldehydu 3-fosfoglicerynowego, przy nakładzie ATP, zostaje przekształcona z powrotem w RuBP, dzięki czemu cykl może trwać; pozostałe służą do syntezy glukozy, sacharozy, skrobi i innych związków organicznych. Do wytworzenia jednej cząsteczki glukozy potrzeba sześciu obrotów cyklu, czyli związania sześciu cząsteczek CO2.

RÓWNANIE SUMARYCZNE FOTOSYNTEZY
6CO2 + 6H2O + energia świetlna → C6H12O6 + 6O2
''',
            flashcards: [
              Flashcard(id: 'f_k1_17', front: 'Jakie produkty daje faza jasna fotosyntezy?', back: 'ATP, NADPH i tlen (z rozkładu wody).'),
              Flashcard(id: 'f_k1_18', front: 'Gdzie zachodzi cykl Calvina?', back: 'W stromie chloroplastu (faza niezależna od światła).'),
              Flashcard(id: 'f_k1_19', front: 'Podaj sumaryczne równanie fotosyntezy.', back: '6CO2 + 6H2O + energia świetlna → C6H12O6 + 6O2'),
              Flashcard(id: 'f_k1_fot_1', front: 'Jaką rolę pełnią fotosystemy?', back: 'Wychwytują energię świetlną i przekazują ją do centrum reakcji, z którego wybijane są elektrony.'),
              Flashcard(id: 'f_k1_fot_2', front: 'Jak powstaje gradient protonowy w chloroplaście?', back: 'Protony są przepompowywane ze stromy do wnętrza tylakoidu podczas transportu elektronów, a dodatkowe uwalniają się przy fotolizie wody.'),
              Flashcard(id: 'f_k1_fot_3', front: 'Jak powstaje ATP w chloroplaście?', back: 'Protony wracają z wnętrza tylakoidu do stromy przez syntazę ATP, a energia tego przepływu napędza syntezę ATP.'),
              Flashcard(id: 'f_k1_fot_4', front: 'Wymień etapy cyklu Calvina.', back: 'Karboksylacja, redukcja i regeneracja RuBP.'),
              Flashcard(id: 'f_k1_fot_5', front: 'Jaką reakcję katalizuje enzym RuBisCO?', back: 'Przyłączenie CO2 do rybulozo-1,5-bisfosforanu (RuBP).'),
              Flashcard(id: 'f_k1_fot_6', front: 'Co jest bezpośrednim produktem cyklu Calvina?', back: 'Aldehyd 3-fosfoglicerynowy — cukier trójwęglowy, z którego powstaje m.in. glukoza.'),
              Flashcard(id: 'f_k1_fot_7', front: 'Do czego w cyklu Calvina zużywane są ATP i NADPH?', back: 'Do redukcji kwasu 3-fosfoglicerynowego; ATP także do regeneracji RuBP.'),
              Flashcard(id: 'f_k1_fot_8', front: 'Ile obrotów cyklu Calvina potrzeba do wytworzenia jednej cząsteczki glukozy?', back: 'Sześć — tyle, ile wiązanych cząsteczek CO2.'),
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
              Flashcard(id: 'f_k1_odd_1', front: 'Jakie są etapy oddychania tlenowego i gdzie zachodzą?', back: 'Glikoliza — w cytoplazmie; reakcja pomostowa i cykl Krebsa — w matriks mitochondrium; łańcuch oddechowy — na błonie wewnętrznej mitochondrium.'),
              Flashcard(id: 'f_k1_odd_2', front: 'Co powstaje w reakcji pomostowej?', back: 'Acetylo-CoA, CO2 i NADH.'),
              Flashcard(id: 'f_k1_odd_3', front: 'Czym jest fosforylacja substratowa?', back: 'Wytworzeniem ATP przez bezpośrednie przeniesienie grupy fosforanowej na ADP — zachodzi w glikolizie i cyklu Krebsa.'),
              Flashcard(id: 'f_k1_odd_4', front: 'Jaką rolę pełni tlen w oddychaniu komórkowym?', back: 'Jest końcowym akceptorem elektronów w łańcuchu oddechowym.'),
              Flashcard(id: 'f_k1_odd_5', front: 'Na czym polega chemiosmoza w mitochondrium?', back: 'Protony przepompowane do przestrzeni międzybłonowej wracają do matriks przez syntazę ATP, napędzając syntezę ATP.'),
              Flashcard(id: 'f_k1_odd_6', front: 'Jakie znaczenie ma fermentacja dla komórki?', back: 'Regeneruje NAD+, dzięki czemu glikoliza może zachodzić bez tlenu.'),
              Flashcard(id: 'f_k1_odd_7', front: 'Czym różni się fermentacja alkoholowa od mleczanowej?', back: 'Alkoholowa (drożdże) daje etanol i CO2, a mleczanowa (mięśnie, bakterie) — kwas mlekowy.'),
              Flashcard(id: 'f_k1_odd_8', front: 'Czym różni się glukoneogeneza od glikogenolizy?', back: 'Glukoneogeneza to synteza glukozy z substratów niecukrowych, a glikogenoliza — rozkład glikogenu do glukozy.'),
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
Liczbę zestawów chromosomów oznacza się literą n, a ilość DNA literą c — komórka diploidalna przed replikacją ma zapis 2n 2c. Interfaza: faza G1 (wzrost komórki i synteza białek, 2n 2c), faza S (replikacja DNA — ilość DNA podwaja się, a każdy chromosom składa się teraz z dwóch chromatyd siostrzanych; liczba chromosomów się nie zmienia, więc zapis to 2n 4c), faza G2 (przygotowanie do podziału, 2n 4c). Faza M (mitotyczna): podział jądra (kariokineza) i cytoplazmy (cytokineza), po którym każda komórka potomna ma ponownie 2n 2c.
Replikacja DNA musi poprzedzać podział komórki, ponieważ tylko wtedy każda komórka potomna może otrzymać pełny, identyczny zestaw materiału genetycznego.
''',
            flashcards: [
              Flashcard(id: 'f_k1_dna_1', front: 'Czym jest nukleosom?', back: 'Odcinkiem DNA nawiniętym na rdzeń z ośmiu cząsteczek histonów — podstawową jednostką chromatyny.'),
              Flashcard(id: 'f_k1_dna_2', front: 'Jaką rolę w replikacji pełni helikaza?', back: 'Rozplata podwójną helisę DNA, rozrywając wiązania wodorowe między niciami.'),
              Flashcard(id: 'f_k1_dna_3', front: 'Jaką rolę w replikacji pełni prymaza?', back: 'Syntetyzuje krótki starter RNA, od którego polimeraza DNA rozpoczyna syntezę.'),
              Flashcard(id: 'f_k1_dna_4', front: 'Jaką rolę w replikacji pełni polimeraza DNA?', back: 'Dobudowuje nową nić DNA komplementarną do nici matrycowej.'),
              Flashcard(id: 'f_k1_dna_5', front: 'Jaką rolę w replikacji pełni ligaza?', back: 'Łączy fragmenty Okazaki w ciągłą nić.'),
              Flashcard(id: 'f_k1_dna_6', front: 'Co oznacza, że replikacja DNA jest semikonserwatywna?', back: 'Każda cząsteczka potomna zawiera jedną nić starą i jedną nowo zsyntetyzowaną.'),
              Flashcard(id: 'f_k1_dna_7', front: 'Co oznaczają symbole n i c?', back: 'n — liczbę zestawów chromosomów, c — ilość DNA w komórce.'),
              Flashcard(id: 'f_k1_dna_8', front: 'Jak zmienia się ilość DNA w cyklu komórkowym komórki diploidalnej?', back: 'W G1 jest 2n 2c, po fazie S i w G2 — 2n 4c, a po podziale każda komórka potomna ma znowu 2n 2c.'),
              Flashcard(id: 'f_k1_dna_9', front: 'W której fazie cyklu komórkowego zachodzi replikacja DNA?', back: 'W fazie S interfazy.'),
              Flashcard(id: 'f_k1_dna_10', front: 'Dlaczego replikacja musi poprzedzać podział komórki?', back: 'Aby każda komórka potomna otrzymała pełny, identyczny zestaw materiału genetycznego.'),
            ],
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
Mejoza to podział redukcyjny, w wyniku którego z jednej komórki diploidalnej powstają cztery komórki haploidalne (2n → n), różniące się genetycznie. U zwierząt prowadzi do powstania gamet, a u roślin — zarodników. Poprzedza ją replikacja DNA, a składa się z dwóch następujących po sobie podziałów.
Mejoza I (podział redukcyjny): w profazie I chromosomy kondensują się, chromosomy homologiczne łączą się w pary (biwalenty) i zachodzi między nimi crossing-over, zanika otoczka jądrowa i tworzy się wrzeciono podziałowe. W metafazie I pary chromosomów homologicznych ustawiają się w płaszczyźnie równikowej komórki. W anafazie I do przeciwległych biegunów rozchodzą się całe chromosomy homologiczne, z których każdy nadal składa się z dwóch chromatyd — o tym, który chromosom z pary trafi do którego bieguna, decyduje przypadek. W telofazie I powstają dwie komórki o haploidalnej liczbie chromosomów (n 2c).
Mejoza II (podział ekwacyjny, przebiegający podobnie jak mitoza, lecz bez wcześniejszej replikacji DNA): w profazie II ponownie tworzy się wrzeciono, w metafazie II chromosomy ustawiają się w płaszczyźnie równikowej, w anafazie II do biegunów rozchodzą się chromatydy siostrzane, a w telofazie II powstają cztery komórki haploidalne (n c).
Znaczenie mejozy: zapewnia stałą liczbę chromosomów w kolejnych pokoleniach organizmów rozmnażających się płciowo (haploidalne gamety łączą się w diploidalną zygotę) i jest źródłem zmienności genetycznej.

ŹRÓDŁA ZMIENNOŚCI REKOMBINACYJNEJ
Crossing-over — wymiana odcinków chromatyd między chromosomami homologicznymi w profazie I mejozy.
Niezależna segregacja chromosomów — losowe rozdzielenie par chromosomów homologicznych w mejozie I, generujące wiele kombinacji chromosomów w gametach.
Oba mechanizmy są głównym źródłem zmienności rekombinacyjnej, zwiększającej różnorodność potomstwa.

APOPTOZA
Zaprogramowana, kontrolowana śmierć komórki, przebiegająca bez uszkadzania sąsiednich komórek. Warunkuje prawidłowy rozwój (np. zanik błon międzypalcowych) i funkcjonowanie organizmów wielokomórkowych (eliminacja komórek zainfekowanych lub nowotworowych).
''',
            flashcards: [
              Flashcard(id: 'f_k1_mit_1', front: 'Wymień kolejne etapy mitozy.', back: 'Profaza, metafaza, anafaza i telofaza.'),
              Flashcard(id: 'f_k1_mit_2', front: 'Co dzieje się w metafazie mitozy?', back: 'Chromosomy ustawiają się w płaszczyźnie równikowej komórki.'),
              Flashcard(id: 'f_k1_mit_3', front: 'Co rozchodzi się do biegunów komórki w anafazie mitozy?', back: 'Chromatydy siostrzane.'),
              Flashcard(id: 'f_k1_mit_4', front: 'Jakie znaczenie ma mitoza?', back: 'Umożliwia wzrost i regenerację tkanek, rozmnażanie bezpłciowe i zachowanie liczby chromosomów w komórkach somatycznych.'),
              Flashcard(id: 'f_k1_mit_5', front: 'Ile komórek i o jakiej ploidalności powstaje w mejozie?', back: 'Cztery komórki haploidalne, różniące się genetycznie.'),
              Flashcard(id: 'f_k1_mit_6', front: 'Co dzieje się w profazie I mejozy?', back: 'Chromosomy homologiczne łączą się w pary i zachodzi między nimi crossing-over.'),
              Flashcard(id: 'f_k1_mit_7', front: 'Czym różni się anafaza I mejozy od anafazy mitozy?', back: 'W anafazie I rozchodzą się chromosomy homologiczne, a w anafazie mitozy — chromatydy siostrzane.'),
              Flashcard(id: 'f_k1_mit_8', front: 'Jaki jest zapis liczby chromosomów i ilości DNA po mejozie I i po mejozie II?', back: 'Po mejozie I: n 2c; po mejozie II: n c.'),
              Flashcard(id: 'f_k1_mit_9', front: 'Dlaczego mejozę I nazywa się podziałem redukcyjnym?', back: 'Liczba chromosomów zmniejsza się w niej z 2n do n.'),
              Flashcard(id: 'f_k1_mit_10', front: 'Czym jest crossing-over i kiedy zachodzi?', back: 'Wymianą odcinków chromatyd między chromosomami homologicznymi w profazie I mejozy.'),
              Flashcard(id: 'f_k1_mit_11', front: 'Na czym polega niezależna segregacja chromosomów?', back: 'Na losowym rozchodzeniu się chromosomów homologicznych do biegunów komórki w mejozie I.'),
              Flashcard(id: 'f_k1_mit_12', front: 'Czym jest apoptoza i jakie ma znaczenie?', back: 'Zaprogramowaną śmiercią komórki — umożliwia np. zanik błon międzypalcowych w rozwoju i usuwanie komórek nowotworowych.'),
            ],
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
            flashcards: [
              Flashcard(id: 'f_k1_kla_1', front: 'Czym jest kladogram?', back: 'Drzewiastym schematem pokrewieństwa ewolucyjnego, w którym węzły reprezentują wspólnych przodków.'),
              Flashcard(id: 'f_k1_kla_2', front: 'Jak na kladogramie odczytać, które grupy są bliżej spokrewnione?', back: 'Po tym, jak blisko znajduje się ich wspólny węzeł — nie po kolejności gatunków na końcach gałęzi.'),
              Flashcard(id: 'f_k1_kla_3', front: 'Czym jest grupa monofiletyczna (klad)?', back: 'Grupą obejmującą wspólnego przodka i wszystkich jego potomków.'),
              Flashcard(id: 'f_k1_kla_4', front: 'Czym jest grupa parafiletyczna? Podaj przykład.', back: 'Grupą obejmującą przodka i tylko część jego potomków — np. tradycyjne gady bez ptaków.'),
              Flashcard(id: 'f_k1_kla_5', front: 'Czym jest grupa polifiletyczna?', back: 'Grupą organizmów o podobnych cechach wynikających ze zbieżnej ewolucji, bez wspólnego przodka należącego do tej grupy.'),
              Flashcard(id: 'f_k1_kla_6', front: 'Dlaczego współczesna klasyfikacja wyróżnia tylko grupy monofiletyczne?', back: 'Tylko one rzetelnie odzwierciedlają filogenezę organizmów.'),
              Flashcard(id: 'f_k1_kla_7', front: 'Wymień rangi taksonomiczne od najszerszej do najwęższej.', back: 'Domena, królestwo, typ, gromada (klasa), rząd, rodzina, rodzaj, gatunek.'),
            ],
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
      // Działy VI-X i XII podstawy programowej — patrz biology_k2.dart
      ...klasa2Chapters,
    ],
  ),
  ClassData(
    level: 3,
    label: 'Kl. 3',
    chapters: [
      // Dział XI podstawy programowej — patrz biology_k3.dart
      ...klasa3Chapters,
    ],
  ),
  ClassData(
    level: 4,
    label: 'Kl. 4',
    chapters: [
      // Działy XIII-XVIII podstawy programowej — patrz biology_k4.dart
      ...klasa4Chapters,
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
