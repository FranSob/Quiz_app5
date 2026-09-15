import '../models.dart';

/// Materiał klasy 3 liceum — zakres rozszerzony.
///
/// Pokrywa dział XI podstawy programowej (nowelizacja 2024):
/// Funkcjonowanie zwierząt, wraz z budową i fizjologią człowieka.
/// Podział na rozdziały odpowiada częściom działu XI; część
/// „Wymiana gazowa i krążenie" rozdzielono na dwa rozdziały.
final List<Chapter> klasa3Chapters = [
  // ===========================================================================
  // XI.1 PODSTAWOWE ZASADY BUDOWY I FUNKCJONOWANIA ORGANIZMU ZWIERZĘCEGO
  // ===========================================================================
  Chapter(
    id: 'k3_zasady',
    name: 'Budowa i funkcjonowanie organizmu',
    topics: [
      Topic(
        id: 'k3_zasady_tkanki',
        name: 'Tkanki zwierzęce i połączenia międzykomórkowe',
        theory: '''
TKANKA NABŁONKOWA (EPITELIALNA)
Komórki nabłonka ściśle do siebie przylegają, a substancji międzykomórkowej jest bardzo mało. Nabłonek leży na błonie podstawnej, nie ma naczyń krwionośnych — odżywia się przez dyfuzję z leżącej pod nim tkanki łącznej — i dobrze się regeneruje. Nabłonek jednowarstwowy płaski wyściela pęcherzyki płucne i naczynia krwionośne (śródbłonek), ułatwiając dyfuzję. Nabłonek jednowarstwowy sześcienny buduje kanaliki nerkowe i przewody gruczołów. Nabłonek jednowarstwowy walcowaty wyściela jelito, a jego komórki mają mikrokosmki zwiększające powierzchnię wchłaniania. Nabłonek migawkowy w drogach oddechowych przesuwa śluz z zanieczyszczeniami, a w jajowodach — komórkę jajową. Nabłonek wielowarstwowy płaski chroni przed uszkodzeniami mechanicznymi: w naskórku jest rogowaciejący, w jamie ustnej i przełyku — nierogowaciejący. Nabłonek przejściowy wyściela pęcherz moczowy i umożliwia jego rozciąganie. Nabłonek gruczołowy tworzy gruczoły zewnątrzwydzielnicze, wydzielające przez przewody (ślinianki, gruczoły potowe), oraz dokrewne, wydzielające hormony bezpośrednio do krwi.

TKANKA ŁĄCZNA
Tkanki łączne mają dużo substancji międzykomórkowej, złożonej z istoty podstawowej i włókien: kolagenowych (wytrzymałość na rozciąganie), sprężystych (elastyczność) i siateczkowych. Tkanka łączna właściwa luźna wypełnia przestrzenie między narządami, magazynuje wodę i zawiera komórki obronne, a zbita tworzy ścięgna i więzadła o ogromnej wytrzymałości. Tkanka tłuszczowa żółta magazynuje energię, izoluje cieplnie i amortyzuje narządy, a brunatna, obecna u noworodków i zwierząt hibernujących, wytwarza ciepło. Tkanka siateczkowata tworzy zrąb szpiku kostnego, śledziony i węzłów chłonnych. Tkanka chrzęstna nie ma naczyń krwionośnych, dlatego słabo się regeneruje; chrząstka szklista pokrywa powierzchnie stawowe i buduje tchawicę, sprężysta — małżowinę uszną i nagłośnię, włóknista — krążki międzykręgowe. Tkanka kostna zawiera komórki kostne oraz istotę międzykomórkową z kolagenu (nadającego sprężystość) i soli wapnia i fosforu (nadających twardość). Osteoblasty budują kość, a osteoklasty ją resorbują. Kość zbita zbudowana jest z osteonów, a gąbczasta z beleczek, między którymi leży szpik czerwony. Krew i limfa to tkanki łączne o płynnej istocie międzykomórkowej.

TKANKA MIĘŚNIOWA
Tkanka mięśniowa gładka składa się z wrzecionowatych, jednojądrowych komórek bez prążkowania; kurczy się wolno, długotrwale i niezależnie od woli, budując ściany narządów wewnętrznych i naczyń. Tkanka mięśniowa poprzecznie prążkowana szkieletowa zbudowana jest z wydłużonych, wielojądrowych włókien z jądrami leżącymi na obwodzie; kurczy się szybko i silnie, zależnie od woli, ale szybko się męczy. Tkanka mięśniowa poprzecznie prążkowana serca składa się z rozgałęzionych komórek z jednym lub dwoma centralnie położonymi jądrami, połączonych wstawkami; kurczy się rytmicznie, niezależnie od woli, i nie ulega zmęczeniu.

TKANKA NERWOWA
Neuron zbudowany jest z ciała komórki, dendrytów przewodzących impuls do ciała komórki oraz aksonu (neurytu) przewodzącego impuls od ciała komórki. Wiele aksonów otacza osłonka mielinowa. Komórki glejowe odżywiają i chronią neurony, stanowią dla nich podporę i wytwarzają osłonki mielinowe — w ośrodkowym układzie nerwowym robią to oligodendrocyty, a w obwodowym komórki Schwanna. Astrocyty uczestniczą w tworzeniu bariery krew–mózg, a mikroglej pełni funkcje obronne.

POŁĄCZENIA MIĘDZYKOMÓRKOWE
Połączenia ścisłe (zamykające) uszczelniają przestrzeń między komórkami nabłonka, dzięki czemu substancje nie mogą przeciekać między komórkami i muszą przejść przez nie — w ten sposób organizm kontroluje wchłanianie w jelicie; połączenia te budują też barierę krew–mózg. Desmosomy (połączenia zakotwiczające) są związane z filamentami pośrednimi cytoszkieletu i nadają tkance wytrzymałość mechaniczną — jest ich dużo w naskórku i mięśniu sercowym. Połączenia szczelinowe (komunikacyjne) tworzą kanały białkowe, przez które między komórkami przepływają jony i drobne cząsteczki; umożliwiają one szybkie przekazywanie pobudzenia, a przez to zsynchronizowany skurcz komórek mięśnia sercowego i mięśni gładkich.
''',
        flashcards: [
          Flashcard(id: 'f_k3_zas_1', front: 'Jak odżywia się nabłonek, skoro nie ma naczyń krwionośnych?', back: 'Przez dyfuzję substancji z leżącej pod nim tkanki łącznej.'),
          Flashcard(id: 'f_k3_zas_2', front: 'Jaki nabłonek wyściela pęcherzyki płucne i dlaczego?', back: 'Jednowarstwowy płaski — jest bardzo cienki, co ułatwia dyfuzję gazów.'),
          Flashcard(id: 'f_k3_zas_3', front: 'Jaką funkcję pełni nabłonek migawkowy w drogach oddechowych?', back: 'Przesuwa śluz z zatrzymanymi zanieczyszczeniami w stronę gardła.'),
          Flashcard(id: 'f_k3_zas_4', front: 'Czym różnią się gruczoły zewnątrzwydzielnicze od dokrewnych?', back: 'Zewnątrzwydzielnicze wydzielają przez przewody (np. ślinianki), dokrewne — hormony bezpośrednio do krwi.'),
          Flashcard(id: 'f_k3_zas_5', front: 'Co nadaje kości twardość, a co sprężystość?', back: 'Twardość — sole wapnia i fosforu, sprężystość — włókna kolagenowe.'),
          Flashcard(id: 'f_k3_zas_6', front: 'Czym różnią się osteoblasty od osteoklastów?', back: 'Osteoblasty budują tkankę kostną, osteoklasty ją resorbują.'),
          Flashcard(id: 'f_k3_zas_7', front: 'Dlaczego chrząstka słabo się regeneruje?', back: 'Nie ma naczyń krwionośnych.'),
          Flashcard(id: 'f_k3_zas_8', front: 'Porównaj tkankę mięśniową szkieletową i serca pod względem zależności od woli i męczliwości.', back: 'Szkieletowa kurczy się zależnie od woli i szybko się męczy; mięsień sercowy — niezależnie od woli i nie ulega zmęczeniu.'),
          Flashcard(id: 'f_k3_zas_9', front: 'Które komórki wytwarzają osłonki mielinowe?', back: 'Oligodendrocyty w ośrodkowym układzie nerwowym i komórki Schwanna w obwodowym.'),
          Flashcard(id: 'f_k3_zas_10', front: 'Jaką rolę pełnią połączenia ścisłe w jelicie?', back: 'Uszczelniają przestrzeń między komórkami, więc substancje muszą przejść przez komórki — wchłanianie jest kontrolowane.'),
          Flashcard(id: 'f_k3_zas_11', front: 'Jakie znaczenie mają połączenia szczelinowe w mięśniu sercowym?', back: 'Umożliwiają przepływ jonów między komórkami i szybkie przekazanie pobudzenia, a więc zsynchronizowany skurcz.'),
          Flashcard(id: 'f_k3_zas_12', front: 'Jaka jest funkcja brunatnej tkanki tłuszczowej?', back: 'Wytwarzanie ciepła — występuje u noworodków i zwierząt hibernujących.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k3_zas_1', question: 'Nabłonek przejściowy wyściela:', options: ['Pęcherzyki płucne', 'Pęcherz moczowy', 'Jelito cienkie', 'Naczynia krwionośne'], correctIndex: 1, explanation: 'Nabłonek przejściowy umożliwia rozciąganie się pęcherza moczowego.'),
          QuizQuestion(id: 'q_k3_zas_2', question: 'Mikrokosmki występują na komórkach nabłonka, który:', options: ['Chroni przed urazami mechanicznymi', 'Wchłania substancje w jelicie', 'Wyściela naczynia krwionośne', 'Buduje naskórek'], correctIndex: 1, explanation: 'Mikrokosmki zwiększają powierzchnię wchłaniania nabłonka jelitowego.'),
          QuizQuestion(id: 'q_k3_zas_3', question: 'Krążki międzykręgowe zbudowane są z chrząstki:', options: ['Szklistej', 'Sprężystej', 'Włóknistej', 'Kostnej'], correctIndex: 2, explanation: 'Chrząstka włóknista jest odporna na ucisk i rozciąganie.'),
          QuizQuestion(id: 'q_k3_zas_4', question: 'Włókna wielojądrowe z jądrami położonymi na obwodzie są cechą tkanki mięśniowej:', options: ['Gładkiej', 'Poprzecznie prążkowanej szkieletowej', 'Poprzecznie prążkowanej serca', 'Wszystkich rodzajów'], correctIndex: 1, explanation: 'Mięsień sercowy ma komórki z jądrami położonymi centralnie, a gładki — jednojądrowe komórki wrzecionowate.'),
          QuizQuestion(id: 'q_k3_zas_5', question: 'Dendryty przewodzą impuls nerwowy:', options: ['Od ciała komórki', 'Do ciała komórki', 'Wyłącznie w osłonce mielinowej', 'Między komórkami glejowymi'], correctIndex: 1, explanation: 'Akson przewodzi impuls od ciała komórki, a dendryty — do niego.'),
          QuizQuestion(id: 'q_k3_zas_6', question: 'Połączenia związane z filamentami pośrednimi, nadające tkance wytrzymałość mechaniczną, to:', options: ['Połączenia szczelinowe', 'Desmosomy', 'Połączenia ścisłe', 'Synapsy chemiczne'], correctIndex: 1, explanation: 'Desmosomy są liczne w tkankach narażonych na rozciąganie, np. w naskórku.'),
          QuizQuestion(id: 'q_k3_zas_7', question: 'Wstawki łączące komórki mięśnia sercowego zawierają połączenia szczelinowe, co umożliwia:', options: ['Skurcz zależny od woli', 'Szybkie przekazanie pobudzenia i zsynchronizowany skurcz', 'Magazynowanie wapnia', 'Wytwarzanie mieliny'], correctIndex: 1, explanation: 'Jony przepływają bezpośrednio między komórkami, więc pobudzenie szybko się rozprzestrzenia.'),
          QuizQuestion(id: 'q_k3_zas_8', question: 'Szpik czerwony znajduje się w kości:', options: ['Zbitej, w osteonach', 'Gąbczastej, między beleczkami', 'Wyłącznie w chrząstce', 'W okostnej'], correctIndex: 1, explanation: 'Przestrzenie między beleczkami kości gąbczastej wypełnia szpik czerwony.'),
        ],
      ),
      Topic(
        id: 'k3_zasady_homeostaza',
        name: 'Organizm jako całość — homeostaza i zapotrzebowanie energetyczne',
        theory: '''
OD KOMÓRKI DO ORGANIZMU
Organizm zwierzęcy ma budowę hierarchiczną: komórki tworzą tkanki, tkanki — narządy, narządy — układy narządów, a układy — organizm. Każdy narząd zbudowany jest z kilku rodzajów tkanek. Ściana żołądka zawiera nabłonek z gruczołami, tkankę łączną z naczyniami krwionośnymi, warstwy mięśni gładkich i sploty nerwowe. Budowa narządów odpowiada ich funkcji: kosmki i mikrokosmki jelita cienkiego zwiększają powierzchnię wchłaniania, cienkie ściany pęcherzyków płucnych ułatwiają dyfuzję gazów, a gruba, sprężysta ściana tętnic wytrzymuje wysokie ciśnienie krwi.

POWIĄZANIA W UKŁADACH I MIĘDZY UKŁADAMI
Narządy jednego układu współpracują ze sobą: w układzie pokarmowym wątroba wytwarza żółć, a trzustka enzymy trawienne, i obie te wydzieliny trafiają do dwunastnicy, gdzie kończy się trawienie. Układy współpracują również między sobą. Układ oddechowy pobiera tlen, układ krwionośny transportuje go wraz z glukozą wchłoniętą w układzie pokarmowym do komórek, a produkty przemiany materii usuwają płuca i nerki. Pracę wszystkich układów koordynują układ nerwowy i hormonalny. Podczas wysiłku fizycznego mięśnie zużywają więcej tlenu i glukozy, dlatego wzrasta częstość oddechów i tętno, a wątroba uwalnia glukozę do krwi.

HOMEOSTAZA
Homeostaza to utrzymywanie względnej stałości środowiska wewnętrznego organizmu — temperatury, pH, stężenia glukozy, ciśnienia osmotycznego i ciśnienia krwi. Środowisko wewnętrzne tworzą płyny ustrojowe: osocze krwi, płyn tkankowy i limfa. Homeostaza opiera się głównie na ujemnym sprzężeniu zwrotnym: odchylenie parametru od normy wykrywają receptory, informacja trafia do ośrodka regulacyjnego, a efektory wywołują reakcję przeciwną do tego odchylenia.

MECHANIZMY HOMEOSTATYCZNE
W termoregulacji ośrodek w podwzgórzu przy przegrzaniu powoduje rozszerzenie naczyń krwionośnych skóry i wydzielanie potu, a przy wychłodzeniu — zwężenie naczyń i drżenie mięśniowe. W osmoregulacji wzrost ciśnienia osmotycznego krwi, np. po utracie wody, pobudza wydzielanie wazopresyny, pod której wpływem nerki zatrzymują wodę, a jednocześnie pojawia się pragnienie. Stężenie glukozy we krwi regulują antagonistycznie insulina i glukagon. Ciśnienie krwi kontrolują baroreceptory w łuku aorty i zatokach szyjnych, które przekazują informacje do ośrodka w rdzeniu przedłużonym, zmieniającego częstość pracy serca i średnicę naczyń krwionośnych.

ZAPOTRZEBOWANIE ENERGETYCZNE ORGANIZMU
Podstawowa przemiana materii to minimalna ilość energii potrzebna do podtrzymania funkcji życiowych w spoczynku. Zapotrzebowanie energetyczne zależy od wielkości ciała: im mniejsze zwierzę, tym większy stosunek powierzchni ciała do jego objętości i tym większe straty ciepła, dlatego w przeliczeniu na jednostkę masy małe zwierzęta mają znacznie wyższe tempo metabolizmu niż duże — ryjówka musi jeść niemal bez przerwy, a słoń nie. Zapotrzebowanie rośnie wraz z aktywnością życiową, na przykład podczas wysiłku, wzrostu czy ciąży. Zależy też od temperatury ciała: zwierzęta stałocieplne zużywają znacznie więcej energii niż zmiennocieplne tej samej masy, bo część energii przeznaczają na wytwarzanie ciepła, a w niskiej temperaturze otoczenia ich wydatek energetyczny dodatkowo rośnie. U zwierząt zmiennocieplnych tempo metabolizmu rośnie wraz z temperaturą otoczenia.
''',
        flashcards: [
          Flashcard(id: 'f_k3_zas_13', front: 'Wymień poziomy organizacji organizmu zwierzęcego.', back: 'Komórka → tkanka → narząd → układ narządów → organizm.'),
          Flashcard(id: 'f_k3_zas_14', front: 'Czym jest homeostaza?', back: 'Utrzymywaniem względnej stałości środowiska wewnętrznego — temperatury, pH, stężenia glukozy, ciśnienia osmotycznego i ciśnienia krwi.'),
          Flashcard(id: 'f_k3_zas_15', front: 'Jakie płyny tworzą środowisko wewnętrzne organizmu?', back: 'Osocze krwi, płyn tkankowy i limfa.'),
          Flashcard(id: 'f_k3_zas_16', front: 'Na czym polega ujemne sprzężenie zwrotne?', back: 'Odchylenie parametru od normy wywołuje reakcję przeciwną, która przywraca wartość prawidłową.'),
          Flashcard(id: 'f_k3_zas_17', front: 'Jak organizm reaguje na przegrzanie?', back: 'Rozszerzeniem naczyń krwionośnych skóry i wydzielaniem potu.'),
          Flashcard(id: 'f_k3_zas_18', front: 'Co dzieje się po wzroście ciśnienia osmotycznego krwi?', back: 'Wydziela się wazopresyna — nerki zatrzymują wodę — i pojawia się pragnienie.'),
          Flashcard(id: 'f_k3_zas_19', front: 'Gdzie leżą baroreceptory kontrolujące ciśnienie krwi?', back: 'W łuku aorty i zatokach szyjnych.'),
          Flashcard(id: 'f_k3_zas_20', front: 'Dlaczego małe zwierzęta mają wyższe tempo metabolizmu na jednostkę masy?', back: 'Mają większy stosunek powierzchni do objętości, więc tracą relatywnie więcej ciepła.'),
          Flashcard(id: 'f_k3_zas_21', front: 'Co to jest podstawowa przemiana materii?', back: 'Minimalna ilość energii potrzebna do podtrzymania funkcji życiowych w spoczynku.'),
          Flashcard(id: 'f_k3_zas_22', front: 'Dlaczego zwierzęta stałocieplne potrzebują więcej energii niż zmiennocieplne tej samej masy?', back: 'Część energii zużywają na wytwarzanie ciepła i utrzymanie stałej temperatury ciała.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k3_zas_9', question: 'Homeostaza utrzymywana jest głównie dzięki:', options: ['Dodatniemu sprzężeniu zwrotnemu', 'Ujemnemu sprzężeniu zwrotnemu', 'Wyłącznie odruchom warunkowym', 'Rozmnażaniu komórek'], correctIndex: 1, explanation: 'Ujemne sprzężenie zwrotne wywołuje reakcję przeciwną do odchylenia od normy.'),
          QuizQuestion(id: 'q_k3_zas_10', question: 'Drżenie mięśniowe jest reakcją organizmu na:', options: ['Przegrzanie', 'Wychłodzenie', 'Wzrost stężenia glukozy', 'Spadek ciśnienia osmotycznego'], correctIndex: 1, explanation: 'Skurcze mięśni wytwarzają ciepło.'),
          QuizQuestion(id: 'q_k3_zas_11', question: 'Który hormon powoduje zatrzymywanie wody przez nerki przy wzroście ciśnienia osmotycznego krwi?', options: ['Insulina', 'Wazopresyna', 'Glukagon', 'Adrenalina'], correctIndex: 1, explanation: 'Wazopresyna (hormon antydiuretyczny) zwiększa zwrotne wchłanianie wody w nerkach.'),
          QuizQuestion(id: 'q_k3_zas_12', question: 'Ośrodek regulujący ciśnienie krwi, do którego docierają informacje z baroreceptorów, znajduje się w:', options: ['Móżdżku', 'Rdzeniu przedłużonym', 'Korze ruchowej', 'Rdzeniu kręgowym odcinka lędźwiowego'], correctIndex: 1, explanation: 'Rdzeń przedłużony zawiera ośrodki krążenia i oddychania.'),
          QuizQuestion(id: 'q_k3_zas_13', question: 'W przeliczeniu na jednostkę masy ciała najwyższe tempo metabolizmu ma:', options: ['Słoń', 'Koń', 'Ryjówka', 'Człowiek'], correctIndex: 2, explanation: 'Najmniejsze zwierzę ma największy stosunek powierzchni do objętości i największe straty ciepła.'),
          QuizQuestion(id: 'q_k3_zas_14', question: 'Podczas wysiłku fizycznego:', options: ['Maleje częstość oddechów', 'Wzrasta tętno i wentylacja płuc', 'Wątroba magazynuje więcej glikogenu', 'Spada zużycie glukozy'], correctIndex: 1, explanation: 'Pracujące mięśnie potrzebują więcej tlenu i glukozy.'),
          QuizQuestion(id: 'q_k3_zas_15', question: 'U zwierzęcia zmiennocieplnego wzrost temperatury otoczenia powoduje:', options: ['Spadek tempa metabolizmu', 'Wzrost tempa metabolizmu', 'Brak zmian w metabolizmie', 'Zatrzymanie metabolizmu'], correctIndex: 1, explanation: 'Temperatura ciała ektotermy zależy od otoczenia, a wraz z nią tempo reakcji enzymatycznych.'),
        ],
      ),
    ],
  ),

  // ===========================================================================
  // XI.2 ODŻYWIANIE SIĘ
  // ===========================================================================
  Chapter(
    id: 'k3_odzywianie',
    name: 'Odżywianie się',
    topics: [
      Topic(
        id: 'k3_odzywianie_zwierzeta',
        name: 'Odżywianie się zwierząt',
        theory: '''
SPOSOBY POBIERANIA POKARMU
Filtratory odcedzają drobne cząstki pokarmu z wody — należą do nich małże oraz walenie fiszbinowe. Zwierzęta pobierające pokarm płynny, takie jak komary, mszyce czy pijawki, mają narządy do przekłuwania i wysysania. Większość zwierząt pobiera pokarm w kawałkach, rozdrabniając go zębami, dziobem lub aparatem gębowym. Pasożyty wewnętrzne, na przykład tasiemce, wchłaniają strawiony pokarm żywiciela całą powierzchnią ciała.

TRAWIENIE WEWNĄTRZKOMÓRKOWE I ZEWNĄTRZKOMÓRKOWE
Trawienie wewnątrzkomórkowe zachodzi w wodniczkach pokarmowych po pochłonięciu cząstek pokarmu przez komórkę; ogranicza ono wielkość pobieranego pokarmu. Trawienie zewnątrzkomórkowe zachodzi w świetle przewodu pokarmowego, do którego komórki gruczołowe wydzielają enzymy — pozwala to trawić duże kawałki pokarmu i występuje u większości zwierząt. U parzydełkowców i płazińców wolno żyjących trawienie rozpoczyna się zewnątrzkomórkowo w jamie chłonąco-trawiącej, a kończy wewnątrzkomórkowo. U człowieka trawienie wewnątrzkomórkowe przeprowadzają jedynie komórki żerne układu odpornościowego. Szczególnym przypadkiem jest trawienie zewnątrzustrojowe: pająki wstrzykują enzymy do ciała ofiary i wysysają strawioną treść, a rozgwiazdy wynicowują żołądek na zdobycz.

ADAPTACJE MIĘSOŻERCÓW I ROŚLINOŻERCÓW
Mięsożercy mają ostre, silne kły do chwytania i zabijania ofiary, a u drapieżnych ssaków występują łamacze — zęby do cięcia mięsa. Ich przewód pokarmowy jest stosunkowo krótki, ponieważ pokarm zwierzęcy jest łatwo strawny. Roślinożercy mają trzonowce o szerokiej, pofałdowanej powierzchni do rozcierania roślin i długi przewód pokarmowy. Ssaki nie wytwarzają enzymów trawiących celulozę — rozkładają ją symbiotyczne bakterie i protisty. Przeżuwacze, na przykład krowa, mają żołądek złożony z czterech komór: w żwaczu mikroorganizmy fermentują pokarm, czepiec i księgi uczestniczą w jego przeżuwaniu i odwadnianiu, a trawieniec jest żołądkiem właściwym, wydzielającym sok żołądkowy. Roślinożercy nieprzeżuwający, jak koń i zając, mają silnie rozbudowane jelito ślepe, w którym zachodzi fermentacja; zając zjada dodatkowo miękki kał, aby ponownie strawić jego składniki.

ADAPTACJE PTAKÓW I OWADÓW
Ptaki nie mają zębów. Wole służy do magazynowania i zmiękczania pokarmu. Żołądek składa się z części gruczołowej, wydzielającej enzymy, oraz mięśniowej, w której pokarm jest rozcierany, często z udziałem połkniętych kamyków. Aparaty gębowe owadów odpowiadają rodzajowi pokarmu: gryzący występuje u chrząszczy i szarańczy, kłująco-ssący u komarów, ssący (ssawka) u motyli, a liżący u much.
''',
        flashcards: [
          Flashcard(id: 'f_k3_odz_1', front: 'Podaj dwa przykłady filtratorów.', back: 'Małże i walenie fiszbinowe.'),
          Flashcard(id: 'f_k3_odz_2', front: 'Czym różni się trawienie wewnątrzkomórkowe od zewnątrzkomórkowego?', back: 'Wewnątrzkomórkowe zachodzi w wodniczkach pokarmowych po pochłonięciu cząstek; zewnątrzkomórkowe — w świetle przewodu pokarmowego dzięki wydzielanym enzymom.'),
          Flashcard(id: 'f_k3_odz_3', front: 'Dlaczego trawienie zewnątrzkomórkowe jest korzystniejsze?', back: 'Pozwala trawić duże kawałki pokarmu.'),
          Flashcard(id: 'f_k3_odz_4', front: 'Na czym polega trawienie zewnątrzustrojowe pająków?', back: 'Pająk wstrzykuje enzymy do ciała ofiary i wysysa strawioną treść.'),
          Flashcard(id: 'f_k3_odz_5', front: 'Dlaczego mięsożercy mają krótki przewód pokarmowy?', back: 'Pokarm zwierzęcy jest łatwo strawny.'),
          Flashcard(id: 'f_k3_odz_6', front: 'Kto trawi celulozę w przewodzie pokarmowym roślinożerców?', back: 'Symbiotyczne bakterie i protisty — ssaki nie wytwarzają enzymów rozkładających celulozę.'),
          Flashcard(id: 'f_k3_odz_7', front: 'Wymień komory żołądka przeżuwacza.', back: 'Żwacz, czepiec, księgi i trawieniec (żołądek właściwy).'),
          Flashcard(id: 'f_k3_odz_8', front: 'Gdzie zachodzi fermentacja pokarmu u konia i zająca?', back: 'W silnie rozbudowanym jelicie ślepym.'),
          Flashcard(id: 'f_k3_odz_9', front: 'Jaką funkcję pełni żołądek mięśniowy ptaka?', back: 'Rozciera pokarm, często z udziałem połkniętych kamyków.'),
          Flashcard(id: 'f_k3_odz_10', front: 'Jaki aparat gębowy ma komar, a jaki motyl?', back: 'Komar — kłująco-ssący, motyl — ssący (ssawkę).'),
        ],
        questions: [
          QuizQuestion(id: 'q_k3_odz_1', question: 'Trawieniec to:', options: ['Część jelita ślepego konia', 'Żołądek właściwy przeżuwacza', 'Wole ptaka', 'Część aparatu gębowego owada'], correctIndex: 1, explanation: 'Trawieniec wydziela sok żołądkowy, podobnie jak żołądek jednokomorowy.'),
          QuizQuestion(id: 'q_k3_odz_2', question: 'U człowieka trawienie wewnątrzkomórkowe przeprowadzają:', options: ['Komórki nabłonka jelita', 'Komórki żerne układu odpornościowego', 'Komórki wątroby', 'Komórki główne żołądka'], correctIndex: 1, explanation: 'Pochłanianie i trawienie drobnoustrojów w wodniczkach to fagocytoza.'),
          QuizQuestion(id: 'q_k3_odz_3', question: 'Łamacze to zęby charakterystyczne dla:', options: ['Przeżuwaczy', 'Drapieżnych ssaków', 'Gryzoni', 'Ptaków'], correctIndex: 1, explanation: 'Łamacze służą drapieżnikom do cięcia mięsa.'),
          QuizQuestion(id: 'q_k3_odz_4', question: 'W żwaczu przeżuwacza zachodzi przede wszystkim:', options: ['Trawienie białek przez pepsynę', 'Fermentacja pokarmu przez mikroorganizmy', 'Wchłanianie glukozy', 'Wytwarzanie żółci'], correctIndex: 1, explanation: 'Bakterie i protisty żwacza rozkładają celulozę.'),
          QuizQuestion(id: 'q_k3_odz_5', question: 'Rozgwiazda trawi małża:', options: ['Wewnątrzkomórkowo w wodniczkach', 'Zewnątrzustrojowo, wynicowując żołądek', 'Wyłącznie w jelicie ślepym', 'Nie trawi pokarmu, tylko go filtruje'], correctIndex: 1, explanation: 'Wynicowany żołądek rozpoczyna trawienie ofiary poza ciałem rozgwiazdy.'),
          QuizQuestion(id: 'q_k3_odz_6', question: 'Przewód pokarmowy roślinożerców jest w porównaniu z mięsożercami:', options: ['Krótszy', 'Dłuższy', 'Tej samej długości', 'Pozbawiony jelita grubego'], correctIndex: 1, explanation: 'Pokarm roślinny trawi się trudniej i dłużej.'),
          QuizQuestion(id: 'q_k3_odz_7', question: 'Liżący aparat gębowy ma:', options: ['Szarańcza', 'Mucha', 'Komar', 'Motyl'], correctIndex: 1, explanation: 'Mucha zlizuje płynny pokarm; szarańcza ma aparat gryzący.'),
        ],
      ),
      Topic(
        id: 'k3_odzywianie_skladniki',
        name: 'Składniki pokarmowe i racjonalne żywienie',
        theory: '''
BIAŁKA
Białka są materiałem budulcowym oraz źródłem aminokwasów do syntezy enzymów, hormonów i przeciwciał. Część aminokwasów to aminokwasy egzogenne — organizm człowieka nie potrafi ich wytworzyć, więc muszą być dostarczane z pokarmem; należą do nich m.in. lizyna, tryptofan i metionina. Białka pełnowartościowe zawierają wszystkie aminokwasy egzogenne w odpowiednich proporcjach — są to przede wszystkim białka zwierzęce: mięsa, ryb, jaj i mleka. Białka niepełnowartościowe mają zbyt mało któregoś z nich — dotyczy to większości białek roślinnych, np. zbożom brakuje lizyny, a roślinom strączkowym metioniny. Łączenie różnych produktów roślinnych, na przykład kaszy z fasolą, pozwala uzupełnić te braki.

WĘGLOWODANY I BŁONNIK
Węglowodany są głównym źródłem energii, a podstawowym paliwem komórek jest glukoza. Błonnik pokarmowy, w tym celuloza, nie jest trawiony przez enzymy człowieka, ale pełni ważne funkcje: pobudza ruchy perystaltyczne jelit i zapobiega zaparciom, zwiększa uczucie sytości, spowalnia wchłanianie glukozy, obniża stężenie cholesterolu i stanowi pożywkę dla bakterii jelitowych. Jego źródłem są produkty pełnoziarniste, warzywa i owoce.

TŁUSZCZE I NNKT
Tłuszcze dostarczają ponad dwukrotnie więcej energii z grama niż białka i węglowodany, budują błony komórkowe i umożliwiają wchłanianie witamin A, D, E i K. Niezbędne nienasycone kwasy tłuszczowe (NNKT), czyli kwasy z rodzin omega-3 i omega-6, nie są syntetyzowane przez organizm człowieka. Są potrzebne do budowy błon komórkowych, rozwoju mózgu i siatkówki oka, powstawania hormonów tkankowych oraz obniżają stężenie „złego" cholesterolu LDL. Ich źródłem są oleje roślinne, ryby morskie i orzechy. Nadmiar kwasów nasyconych i tłuszczów trans sprzyja rozwojowi miażdżycy.

WITAMINY
Witaminy nie są źródłem energii ani budulcem, lecz regulują przemiany metaboliczne, często jako składniki koenzymów. Witaminy rozpuszczalne w tłuszczach (A, D, E, K) są magazynowane w organizmie, dlatego możliwe jest ich przedawkowanie. Witaminy rozpuszczalne w wodzie (C i z grupy B) są łatwo wydalane i trzeba je dostarczać regularnie. Witamina A jest niezbędna do widzenia i prawidłowego stanu nabłonków; jej niedobór powoduje kurzą ślepotę. Witamina D umożliwia wchłanianie wapnia i mineralizację kości; jej niedobór wywołuje krzywicę u dzieci i osteomalację u dorosłych. Witamina E jest przeciwutleniaczem chroniącym błony komórkowe. Witamina K jest potrzebna do wytwarzania czynników krzepnięcia krwi, a jej niedobór zwiększa skłonność do krwawień. Witamina C uczestniczy w syntezie kolagenu i ułatwia wchłanianie żelaza; jej niedobór powoduje szkorbut z krwawieniem dziąseł. Witamina B1 bierze udział w przemianach węglowodanów, a jej niedobór wywołuje chorobę beri-beri. Witamina B12 jest niezbędna do wytwarzania erytrocytów i pracy układu nerwowego; występuje wyłącznie w produktach zwierzęcych, a jej niedobór prowadzi do niedokrwistości złośliwej. Kwas foliowy jest potrzebny do podziałów komórek, a jego niedobór w ciąży zwiększa ryzyko wad cewy nerwowej płodu.

SKŁADNIKI NIEORGANICZNE
Woda stanowi środowisko reakcji i transportu. Wapń buduje kości i zęby oraz uczestniczy w krzepnięciu krwi i skurczu mięśni. Żelazo wchodzi w skład hemoglobiny, a jego niedobór powoduje niedokrwistość. Jod jest niezbędny do wytwarzania hormonów tarczycy, a jego niedobór prowadzi do powstania wola. Sód i potas utrzymują potencjał błonowy komórek, a fosfor buduje kości i wchodzi w skład ATP.

ZASADY RACJONALNEGO ŻYWIENIA
Posiłki należy spożywać regularnie, 4–5 razy dziennie. Dieta powinna być urozmaicona i dostosowana energetycznie do wieku, płci i aktywności fizycznej. Podstawę stanowią warzywa i owoce oraz produkty pełnoziarniste; białko powinno pochodzić z różnych źródeł, a ryby warto jeść co najmniej dwa razy w tygodniu. Należy ograniczać cukry proste, sól, tłuszcze nasycone i trans oraz żywność wysoko przetworzoną, pić odpowiednią ilość wody i dbać o codzienną aktywność fizyczną.

OŚRODEK GŁODU I SYTOŚCI
Ośrodki głodu i sytości znajdują się w podwzgórzu. Uczucie głodu wywołują spadek stężenia glukozy we krwi i pusty żołądek, który wydziela grelinę. Uczucie sytości pojawia się po rozciągnięciu ścian żołądka, wzroście stężenia glukozy i insuliny, a długoterminowo informację o zapasach energii przekazuje leptyna wytwarzana przez tkankę tłuszczową.

ZABURZENIA ODŻYWIANIA
Anoreksja (jadłowstręt psychiczny) polega na celowym ograniczaniu jedzenia z powodu lęku przed przytyciem i zaburzonego obrazu własnego ciała. Prowadzi do skrajnego wychudzenia, zaniku mięśni, zaburzeń rytmu serca, osteoporozy, zatrzymania miesiączki i zaburzeń hormonalnych, a nawet do śmierci. Bulimia to napady objadania się, po których chory stosuje zachowania kompensacyjne, takie jak prowokowanie wymiotów czy przyjmowanie środków przeczyszczających. Skutkiem są uszkodzenia szkliwa zębów i przełyku przez kwas żołądkowy, odwodnienie oraz zaburzenia elektrolitowe, w tym niedobór potasu grożący zaburzeniami rytmu serca. Oba zaburzenia wymagają leczenia z udziałem psychologa i lekarza.

OTYŁOŚĆ
Główną przyczyną otyłości jest dodatni bilans energetyczny — spożywanie większej ilości energii, niż wynosi wydatek. Sprzyjają jej dieta bogata w żywność wysoko przetworzoną i słodzone napoje, mała aktywność fizyczna, zbyt krótki sen, stres, a także czynniki genetyczne i hormonalne, na przykład niedoczynność tarczycy. Otyłość ocenia się m.in. wskaźnikiem BMI (masa ciała w kilogramach podzielona przez kwadrat wzrostu w metrach) — wartość 30 i więcej oznacza otyłość — oraz obwodem talii. Zwiększa ona ryzyko cukrzycy typu 2, nadciśnienia tętniczego, miażdżycy, chorób stawów i niektórych nowotworów. Profilaktyka polega na racjonalnym żywieniu, regularnej aktywności fizycznej i odpowiedniej ilości snu.
''',
        flashcards: [
          Flashcard(id: 'f_k3_odz_11', front: 'Czym są aminokwasy egzogenne?', back: 'Aminokwasami, których organizm nie potrafi wytworzyć i musi otrzymać z pokarmem, np. lizyna, tryptofan, metionina.'),
          Flashcard(id: 'f_k3_odz_12', front: 'Czym różnią się białka pełnowartościowe od niepełnowartościowych?', back: 'Pełnowartościowe zawierają wszystkie aminokwasy egzogenne w odpowiednich proporcjach (głównie zwierzęce); niepełnowartościowe mają zbyt mało któregoś z nich (większość roślinnych).'),
          Flashcard(id: 'f_k3_odz_13', front: 'Wymień trzy funkcje błonnika pokarmowego.', back: 'Pobudza perystaltykę jelit, zwiększa sytość, spowalnia wchłanianie glukozy, obniża cholesterol, odżywia bakterie jelitowe.'),
          Flashcard(id: 'f_k3_odz_14', front: 'Czym są NNKT i dlaczego są niezbędne?', back: 'Niezbędnymi nienasyconymi kwasami tłuszczowymi (omega-3 i omega-6); organizm ich nie syntetyzuje, a są potrzebne do budowy błon, rozwoju mózgu i powstawania hormonów tkankowych.'),
          Flashcard(id: 'f_k3_odz_15', front: 'Które witaminy rozpuszczają się w tłuszczach?', back: 'A, D, E i K.'),
          Flashcard(id: 'f_k3_odz_16', front: 'Jaki jest skutek niedoboru witaminy D?', back: 'Krzywica u dzieci i osteomalacja u dorosłych.'),
          Flashcard(id: 'f_k3_odz_17', front: 'Do czego potrzebna jest witamina K?', back: 'Do wytwarzania czynników krzepnięcia krwi.'),
          Flashcard(id: 'f_k3_odz_18', front: 'Dlaczego weganie są narażeni na niedobór witaminy B12?', back: 'Witamina B12 występuje wyłącznie w produktach zwierzęcych.'),
          Flashcard(id: 'f_k3_odz_19', front: 'Czym grozi niedobór kwasu foliowego w ciąży?', back: 'Zwiększonym ryzykiem wad cewy nerwowej płodu.'),
          Flashcard(id: 'f_k3_odz_20', front: 'Jaki hormon wywołuje uczucie głodu, a jaki informuje o zapasach tkanki tłuszczowej?', back: 'Głód — grelina wydzielana przez pusty żołądek; zapasy — leptyna z tkanki tłuszczowej.'),
          Flashcard(id: 'f_k3_odz_21', front: 'Gdzie znajdują się ośrodki głodu i sytości?', back: 'W podwzgórzu.'),
          Flashcard(id: 'f_k3_odz_22', front: 'Czym różni się bulimia od anoreksji?', back: 'Anoreksja to celowe głodzenie się; bulimia — napady objadania się z następującymi po nich wymiotami lub przeczyszczaniem.'),
          Flashcard(id: 'f_k3_odz_23', front: 'Jak oblicza się BMI i jaka wartość oznacza otyłość?', back: 'Masa ciała [kg] podzielona przez kwadrat wzrostu [m]; 30 i więcej oznacza otyłość.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k3_odz_8', question: 'Białkami pełnowartościowymi są przede wszystkim białka:', options: ['Zbóż', 'Roślin strączkowych', 'Jaj, mleka i mięsa', 'Owoców'], correctIndex: 2, explanation: 'Białka zwierzęce zawierają wszystkie aminokwasy egzogenne w odpowiednich proporcjach.'),
          QuizQuestion(id: 'q_k3_odz_9', question: 'Niedobór witaminy C powoduje:', options: ['Kurzą ślepotę', 'Szkorbut', 'Krzywicę', 'Beri-beri'], correctIndex: 1, explanation: 'Witamina C jest potrzebna do syntezy kolagenu; objawem szkorbutu jest krwawienie dziąseł.'),
          QuizQuestion(id: 'q_k3_odz_10', question: 'Witaminy, które mogą gromadzić się w organizmie i których przedawkowanie jest możliwe, to:', options: ['C i B1', 'A i D', 'B12 i kwas foliowy', 'Wszystkie witaminy z grupy B'], correctIndex: 1, explanation: 'Witaminy rozpuszczalne w tłuszczach są magazynowane, np. w wątrobie.'),
          QuizQuestion(id: 'q_k3_odz_11', question: 'Błonnik pokarmowy:', options: ['Jest trawiony przez amylazę trzustkową', 'Nie jest trawiony, ale pobudza perystaltykę jelit', 'Jest głównym źródłem energii', 'Hamuje rozwój bakterii jelitowych'], correctIndex: 1, explanation: 'Człowiek nie ma enzymów rozkładających celulozę, a błonnik reguluje pracę jelit.'),
          QuizQuestion(id: 'q_k3_odz_12', question: 'Źródłem kwasów tłuszczowych omega-3 są przede wszystkim:', options: ['Słodycze', 'Ryby morskie', 'Pieczywo białe', 'Tłuszcze trans'], correctIndex: 1, explanation: 'Ryby morskie, oleje roślinne i orzechy dostarczają NNKT.'),
          QuizQuestion(id: 'q_k3_odz_13', question: 'Uczucie sytości wywołuje:', options: ['Wydzielanie greliny', 'Rozciągnięcie ścian żołądka i wzrost stężenia glukozy', 'Spadek stężenia insuliny', 'Pusty żołądek'], correctIndex: 1, explanation: 'Grelina i pusty żołądek wywołują głód, a nie sytość.'),
          QuizQuestion(id: 'q_k3_odz_14', question: 'Charakterystycznym skutkiem bulimii jest:', options: ['Uszkodzenie szkliwa zębów przez kwas żołądkowy', 'Nadmiar potasu we krwi', 'Krzywica', 'Nadczynność tarczycy'], correctIndex: 0, explanation: 'Prowokowane wymioty sprawiają, że kwas żołądkowy niszczy szkliwo i przełyk.'),
          QuizQuestion(id: 'q_k3_odz_15', question: 'Główną przyczyną otyłości jest:', options: ['Ujemny bilans energetyczny', 'Dodatni bilans energetyczny', 'Niedobór witaminy K', 'Nadmiar błonnika w diecie'], correctIndex: 1, explanation: 'Spożywanie więcej energii, niż się zużywa, prowadzi do odkładania tkanki tłuszczowej.'),
        ],
      ),
      Topic(
        id: 'k3_odzywianie_uklad',
        name: 'Układ pokarmowy człowieka — trawienie i wchłanianie',
        theory: '''
JAMA USTNA, GARDŁO I PRZEŁYK
W jamie ustnej pokarm jest rozdrabniany przez zęby (siekacze, kły, przedtrzonowce i trzonowce) i mieszany ze śliną z trzech par ślinianek: przyusznych, podżuchwowych i podjęzykowych. Ślina zawiera amylazę ślinową, która rozpoczyna trawienie skrobi, śluz ułatwiający połykanie oraz lizozym o działaniu bakteriobójczym. Podczas połykania nagłośnia zamyka wejście do krtani, a przełyk przesuwa kęs do żołądka ruchami perystaltycznymi — w przełyku nie zachodzi trawienie.

ŻOŁĄDEK
Żołądek magazynuje i miesza pokarm. Gruczoły jego błony śluzowej zawierają komórki główne wydzielające pepsynogen, komórki okładzinowe wydzielające kwas solny i czynnik wewnętrzny niezbędny do wchłaniania witaminy B12, komórki śluzowe wytwarzające śluz chroniący ścianę żołądka przed samostrawieniem oraz komórki wydzielające gastrynę. Kwas solny przekształca nieaktywny pepsynogen w pepsynę, denaturuje białka pokarmu i zabija większość bakterii.

JELITO CIENKIE I GRUBE
Do dwunastnicy uchodzą przewód żółciowy i przewód trzustkowy. Dalsze odcinki jelita cienkiego to jelito czcze i kręte. Ogromną powierzchnię wchłaniania zapewniają fałdy błony śluzowej, kosmki jelitowe oraz mikrokosmki komórek nabłonka, na których znajdują się enzymy kończące trawienie. Jelito grube, zaczynające się kątnicą z wyrostkiem robaczkowym, wchłania wodę i sole mineralne oraz formuje kał; bytujące w nim bakterie wytwarzają witaminę K i witaminy z grupy B.

TRZUSTKA I WĄTROBA JAKO GRUCZOŁY TRAWIENNE
Sok trzustkowy zawiera amylazę trzustkową, lipazę, nukleazy oraz nieaktywne enzymy trawiące białka — trypsynogen i chymotrypsynogen — które uaktywniają się dopiero w dwunastnicy; zawiera też wodorowęglany zobojętniające kwaśną treść z żołądka. Wątroba wytwarza żółć, gromadzoną w pęcherzyku żółciowym. Żółć nie zawiera enzymów — jej kwasy żółciowe emulgują tłuszcze, czyli rozbijają je na drobne kropelki, zwiększając powierzchnię działania lipazy, oraz ułatwiają wchłanianie witamin rozpuszczalnych w tłuszczach.

TRAWIENIE SKŁADNIKÓW POKARMOWYCH
Trawienie skrobi rozpoczyna amylaza ślinowa, a kontynuuje amylaza trzustkowa, rozkładając ją do maltozy; enzymy nabłonka jelita rozkładają dwucukry do monocukrów — maltaza maltozę do glukozy, sacharaza sacharozę do glukozy i fruktozy, a laktaza laktozę do glukozy i galaktozy. Trawienie białek zaczyna się w żołądku pod wpływem pepsyny, która działa w silnie kwaśnym środowisku; w dwunastnicy trypsyna i chymotrypsyna rozkładają polipeptydy do krótszych peptydów, a peptydazy nabłonka jelita — do aminokwasów. Tłuszcze po zemulgowaniu przez żółć są rozkładane przez lipazę trzustkową do kwasów tłuszczowych i monoacylogliceroli. Kwasy nukleinowe rozkładają nukleazy do nukleotydów.

DOŚWIADCZENIE — WARUNKI TRAWIENIA SKROBI
Do czterech probówek z kleikiem skrobiowym dodaje się: w pierwszej ślinę (próba badawcza), w drugiej wodę (próba kontrolna), w trzeciej ślinę przegotowaną, a w czwartej ślinę z dodatkiem kwasu solnego. Probówki umieszcza się w łaźni wodnej o temperaturze około 37°C, a po kilkunastu minutach dodaje płynu Lugola. Brak granatowego zabarwienia wskazuje, że skrobia została strawiona — dotyczy to tylko pierwszej probówki. Wniosek: amylaza ślinowa trawi skrobię w temperaturze ciała i w środowisku zbliżonym do obojętnego, a wysoka temperatura (denaturacja enzymu) i silnie kwaśne pH hamują jej działanie.

WCHŁANIANIE
Większość produktów trawienia wchłania się w jelicie cienkim. Glukoza i galaktoza wchłaniają się na drodze transportu aktywnego, fruktoza — przez dyfuzję ułatwioną, a aminokwasy — w transporcie aktywnym. Produkty te trafiają do naczyń krwionośnych kosmków, a następnie żyłą wrotną do wątroby. Kwasy tłuszczowe i monoacyloglicerole wnikają do komórek nabłonka, gdzie ponownie powstają z nich tłuszcze, pakowane w lipoproteiny (chylomikrony); te trafiają do naczyń chłonnych kosmków, a więc najpierw do limfy, dopiero później do krwi. Woda wchłania się na drodze osmozy w jelicie cienkim i grubym, a witamina B12 — w jelicie krętym, dzięki czynnikowi wewnętrznemu.

ROLA WĄTROBY
Wątroba otrzymuje żyłą wrotną krew bogatą w substancje wchłonięte w jelitach. Magazynuje glukozę w postaci glikogenu i uwalnia ją do krwi, a gdy trzeba — wytwarza glukozę z innych związków, utrzymując jej stałe stężenie. Przekształca aminokwasy, a powstający przy tym toksyczny amoniak zamienia w mocznik. Syntetyzuje białka osocza (albuminy, fibrynogen, protrombinę), cholesterol i lipoproteiny, magazynuje witaminy A, D i B12 oraz żelazo, unieszkodliwia alkohol, leki i toksyny, wytwarza żółć i rozkłada hemoglobinę ze starych erytrocytów.

MIKROBIOM
Mikrobiom jelitowy to zespół mikroorganizmów, głównie bakterii, zasiedlających jelito grube. Bakterie te fermentują błonnik, a powstające krótkołańcuchowe kwasy tłuszczowe odżywiają komórki jelita grubego. Wytwarzają witaminy K i z grupy B, chronią przed patogenami, konkurując z nimi o miejsce i pokarm, uczestniczą w dojrzewaniu i regulacji układu odpornościowego oraz wpływają na metabolizm i masę ciała, a przez oś jelito–mózg także na samopoczucie. Zaburzenie składu mikrobiomu, np. po antybiotykoterapii, może powodować biegunki i sprzyjać zakażeniom; wspierają go probiotyki (żywe kultury bakterii) i prebiotyki (błonnik).

BADANIA DIAGNOSTYCZNE
Gastroskopia to badanie przełyku, żołądka i dwunastnicy za pomocą giętkiego endoskopu; pozwala wykryć wrzody, stany zapalne, zakażenie Helicobacter pylori i raka żołądka oraz pobrać wycinki do badania. Kolonoskopia to badanie jelita grubego, podczas którego można wykryć i od razu usunąć polipy, zanim przekształcą się w nowotwór — zaleca się ją profilaktycznie osobom po 50. roku życia. Badanie USG jamy brzusznej nieinwazyjnie obrazuje wątrobę, trzustkę, pęcherzyk żółciowy i nerki. Ryzyko raka żołądka zwiększają zakażenie Helicobacter pylori, dieta bogata w sól i żywność wędzoną oraz palenie, a raka jelita grubego — dieta uboga w błonnik i bogata w czerwone i przetworzone mięso, otyłość, alkohol i palenie.
''',
        flashcards: [
          Flashcard(id: 'f_k3_odz_24', front: 'Jakie składniki zawiera ślina i jaką pełnią funkcję?', back: 'Amylazę ślinową (trawi skrobię), śluz (ułatwia połykanie) i lizozym (działa bakteriobójczo).'),
          Flashcard(id: 'f_k3_odz_25', front: 'Jaką rolę pełni kwas solny w żołądku?', back: 'Przekształca pepsynogen w pepsynę, denaturuje białka i zabija bakterie.'),
          Flashcard(id: 'f_k3_odz_26', front: 'Co wydzielają komórki okładzinowe żołądka?', back: 'Kwas solny i czynnik wewnętrzny, niezbędny do wchłaniania witaminy B12.'),
          Flashcard(id: 'f_k3_odz_27', front: 'Co chroni ścianę żołądka przed samostrawieniem?', back: 'Śluz wytwarzany przez komórki śluzowe.'),
          Flashcard(id: 'f_k3_odz_28', front: 'Co zwiększa powierzchnię wchłaniania jelita cienkiego?', back: 'Fałdy błony śluzowej, kosmki jelitowe i mikrokosmki komórek nabłonka.'),
          Flashcard(id: 'f_k3_odz_29', front: 'Czy żółć zawiera enzymy? Jaka jest jej rola?', back: 'Nie. Kwasy żółciowe emulgują tłuszcze i ułatwiają wchłanianie witamin A, D, E, K.'),
          Flashcard(id: 'f_k3_odz_30', front: 'Na co rozkładana jest laktoza i przez jaki enzym?', back: 'Laktaza rozkłada laktozę do glukozy i galaktozy.'),
          Flashcard(id: 'f_k3_odz_31', front: 'Gdzie zaczyna się trawienie białek i jaki enzym je rozpoczyna?', back: 'W żołądku — pepsyna, działająca w silnie kwaśnym środowisku.'),
          Flashcard(id: 'f_k3_odz_32', front: 'Po co w soku trzustkowym są wodorowęglany?', back: 'Zobojętniają kwaśną treść napływającą z żołądka.'),
          Flashcard(id: 'f_k3_odz_33', front: 'Jak wykazać, że amylaza ślinowa trawi skrobię?', back: 'Kleik skrobiowy ze śliną w 37°C po dodaniu płynu Lugola nie barwi się na granatowo, w odróżnieniu od próby kontrolnej z wodą.'),
          Flashcard(id: 'f_k3_odz_34', front: 'Jaką drogą produkty trawienia tłuszczów trafiają do krwi?', back: 'Jako chylomikrony wnikają do naczyń chłonnych kosmków — najpierw do limfy, potem do krwi.'),
          Flashcard(id: 'f_k3_odz_35', front: 'Co wątroba robi z amoniakiem powstającym z aminokwasów?', back: 'Przekształca go w mniej toksyczny mocznik.'),
          Flashcard(id: 'f_k3_odz_36', front: 'Wymień trzy funkcje mikrobiomu jelitowego.', back: 'Fermentuje błonnik, wytwarza witaminy K i z grupy B, chroni przed patogenami, reguluje odporność.'),
          Flashcard(id: 'f_k3_odz_37', front: 'Dlaczego kolonoskopia chroni przed rakiem jelita grubego?', back: 'Pozwala wykryć i usunąć polipy, zanim przekształcą się w nowotwór.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k3_odz_16', question: 'Trawienie skrobi rozpoczyna się w:', options: ['Żołądku', 'Jamie ustnej', 'Dwunastnicy', 'Jelicie grubym'], correctIndex: 1, explanation: 'Rozpoczyna je amylaza ślinowa.'),
          QuizQuestion(id: 'q_k3_odz_17', question: 'Pepsyna trawi:', options: ['Skrobię', 'Białka', 'Tłuszcze', 'Kwasy nukleinowe'], correctIndex: 1, explanation: 'Pepsyna rozkłada białka do polipeptydów w kwaśnym środowisku żołądka.'),
          QuizQuestion(id: 'q_k3_odz_18', question: 'Emulgacja tłuszczów to zadanie:', options: ['Lipazy trzustkowej', 'Kwasów żółciowych', 'Pepsyny', 'Amylazy'], correctIndex: 1, explanation: 'Kwasy żółciowe rozbijają tłuszcze na drobne kropelki, ułatwiając działanie lipazy.'),
          QuizQuestion(id: 'q_k3_odz_19', question: 'W doświadczeniu z trawieniem skrobi próbą kontrolną jest probówka z kleikiem i:', options: ['Śliną w 37°C', 'Wodą w 37°C', 'Śliną przegotowaną', 'Śliną z kwasem solnym'], correctIndex: 1, explanation: 'Próba kontrolna różni się od badawczej tylko brakiem badanego czynnika — enzymu.'),
          QuizQuestion(id: 'q_k3_odz_20', question: 'Glukoza wchłania się w jelicie cienkim na drodze:', options: ['Osmozy', 'Transportu aktywnego', 'Pinocytozy do naczyń chłonnych', 'Dyfuzji przez błonę śluzową żołądka'], correctIndex: 1, explanation: 'Glukoza i galaktoza są pobierane aktywnie przez komórki nabłonka jelita.'),
          QuizQuestion(id: 'q_k3_odz_21', question: 'Żyła wrotna prowadzi krew:', options: ['Z wątroby do serca', 'Z jelit do wątroby', 'Z płuc do serca', 'Z nerek do wątroby'], correctIndex: 1, explanation: 'Dzięki temu wątroba jako pierwsza przetwarza substancje wchłonięte w jelitach.'),
          QuizQuestion(id: 'q_k3_odz_22', question: 'Witamina B12 wchłania się w:', options: ['Żołądku', 'Jelicie krętym z udziałem czynnika wewnętrznego', 'Jelicie grubym', 'Jamie ustnej'], correctIndex: 1, explanation: 'Czynnik wewnętrzny wydzielany w żołądku umożliwia jej wchłonięcie w jelicie krętym.'),
          QuizQuestion(id: 'q_k3_odz_23', question: 'Trypsynogen uaktywnia się w:', options: ['Trzustce', 'Dwunastnicy', 'Żołądku', 'Wątrobie'], correctIndex: 1, explanation: 'Enzymy trawiące białka są nieaktywne w trzustce, co chroni ją przed samostrawieniem.'),
          QuizQuestion(id: 'q_k3_odz_24', question: 'Wykrycie zakażenia Helicobacter pylori umożliwia:', options: ['Kolonoskopia', 'Gastroskopia', 'Spirometria', 'EKG'], correctIndex: 1, explanation: 'Gastroskopia pozwala obejrzeć żołądek i pobrać wycinek błony śluzowej.'),
        ],
      ),
    ],
  ),

  // ===========================================================================
  // XI.3 ODPORNOŚĆ
  // ===========================================================================
  Chapter(
    id: 'k3_odpornosc',
    name: 'Odporność',
    topics: [
      Topic(
        id: 'k3_odpornosc_mechanizmy',
        name: 'Odporność wrodzona i nabyta',
        theory: '''
NARZĄDY UKŁADU ODPORNOŚCIOWEGO
Narządami limfatycznymi pierwotnymi są szpik kostny czerwony, w którym powstają wszystkie komórki krwi i dojrzewają limfocyty B, oraz grasica, w której dojrzewają limfocyty T. Narządy limfatyczne wtórne — węzły chłonne, śledziona, migdałki, grudki chłonne w ścianie jelita i wyrostek robaczkowy — są miejscem, w którym limfocyty stykają się z antygenami i namnażają się.

KOMÓRKI UKŁADU ODPORNOŚCIOWEGO
Neutrofile pochłaniają i niszczą bakterie. Monocyty przekształcają się w tkankach w makrofagi, które fagocytują drobnoustroje i prezentują antygeny limfocytom — podobnie jak komórki dendrytyczne. Komórki tuczne i bazofile uwalniają histaminę, a eozynofile zwalczają pasożyty. Komórki NK niszczą komórki zakażone wirusami i nowotworowe bez wcześniejszego kontaktu z antygenem. Limfocyty B po aktywacji przekształcają się w plazmocyty wytwarzające przeciwciała. Limfocyty T pomocnicze aktywują inne komórki odpornościowe, limfocyty T cytotoksyczne niszczą komórki zakażone i nowotworowe, a limfocyty T regulatorowe wygaszają odpowiedź odpornościową. Część limfocytów staje się komórkami pamięci.

ODPORNOŚĆ WRODZONA (NIESWOISTA)
Odporność wrodzona działa od urodzenia, natychmiast i jednakowo wobec różnych patogenów, ale nie wytwarza pamięci. Pierwszą linię obrony tworzą bariery: nieuszkodzona skóra, błony śluzowe ze śluzem, rzęski nabłonka dróg oddechowych, lizozym w łzach i ślinie, kwas solny w żołądku i prawidłowa mikroflora. Gdy patogen je pokona, działają mechanizmy wewnętrzne: fagocytoza, komórki NK, białka dopełniacza (tworzą otwory w błonach bakterii i ułatwiają fagocytozę), interferony (hamują namnażanie wirusów w sąsiednich komórkach) oraz stan zapalny. Jego objawy — zaczerwienienie, obrzęk, ból i podwyższona temperatura — wynikają z rozszerzenia i zwiększonej przepuszczalności naczyń krwionośnych oraz napływu fagocytów do miejsca zakażenia.

ODPORNOŚĆ NABYTA (SWOISTA)
Odporność nabyta skierowana jest przeciwko konkretnemu antygenowi, czyli substancji rozpoznawanej jako obca. Rozwija się po kontakcie z nim — pierwotna odpowiedź trwa kilka dni — i wytwarza pamięć immunologiczną, dzięki której odpowiedź przy ponownym kontakcie (wtórna) jest szybsza, silniejsza i trwa dłużej.

ODPORNOŚĆ HUMORALNA I KOMÓRKOWA
Odporność humoralna opiera się na przeciwciałach. Limfocyt B rozpoznaje antygen i, wspomagany przez limfocyt T pomocniczy, przekształca się w plazmocyty, które wydzielają przeciwciała (immunoglobuliny) swoiście wiążące ten antygen. Przeciwciała neutralizują toksyny i wirusy, zlepiają bakterie, ułatwiają ich fagocytozę i aktywują dopełniacz — działają na patogeny obecne poza komórkami. Odporność komórkowa opiera się na limfocytach T. Komórka prezentująca antygen, np. makrofag lub komórka dendrytyczna, pokazuje jego fragment na swojej powierzchni; limfocyt T pomocniczy go rozpoznaje i pobudza limfocyty T cytotoksyczne, które niszczą komórki zakażone wirusami, komórki nowotworowe i komórki przeszczepu.

SPOSOBY NABYWANIA ODPORNOŚCI SWOISTEJ
Odporność czynną organizm wytwarza sam — powstają przeciwciała i komórki pamięci, więc ochrona jest długotrwała. Naturalną odporność czynną uzyskuje się po przechorowaniu, a sztuczną — po szczepieniu; szczepionki zawierają zabite lub osłabione drobnoustroje, ich fragmenty, unieszkodliwione toksyny albo mRNA kodujący antygen. Odporność bierna polega na otrzymaniu gotowych przeciwciał — działa natychmiast, ale krótko, bo nie powstaje pamięć. Naturalną odporność bierną zapewniają przeciwciała matki przechodzące do płodu przez łożysko i do dziecka z mlekiem. Sztuczną odporność bierną daje podanie surowicy lub immunoglobuliny, np. po ukąszeniu przez żmiję albo po narażeniu na zakażenie tężcem lub wścieklizną.

MEDIATORY UKŁADU ODPORNOŚCIOWEGO
Cytokiny to białka sygnałowe wydzielane przez komórki odpornościowe, m.in. interleukiny i interferony. Regulują aktywację i namnażanie limfocytów, przyciągają komórki do ogniska zapalnego i wywołują gorączkę. Białka ostrej fazy wytwarzane są przez wątrobę pod wpływem cytokin w odpowiedzi na zakażenie lub uraz. Najważniejsze z nich, białko C-reaktywne (CRP), ułatwia fagocytozę i aktywuje dopełniacz; podwyższone stężenie CRP we krwi jest ważnym wskaźnikiem stanu zapalnego w diagnostyce.
''',
        flashcards: [
          Flashcard(id: 'f_k3_odp_1', front: 'Które narządy limfatyczne są pierwotne i co w nich zachodzi?', back: 'Szpik kostny czerwony (powstają komórki krwi, dojrzewają limfocyty B) i grasica (dojrzewają limfocyty T).'),
          Flashcard(id: 'f_k3_odp_2', front: 'Wymień narządy limfatyczne wtórne.', back: 'Węzły chłonne, śledziona, migdałki, grudki chłonne jelita, wyrostek robaczkowy.'),
          Flashcard(id: 'f_k3_odp_3', front: 'Czym różni się odporność wrodzona od nabytej?', back: 'Wrodzona działa od razu i niespecyficznie, bez pamięci; nabyta jest swoista, rozwija się po kontakcie z antygenem i tworzy pamięć.'),
          Flashcard(id: 'f_k3_odp_4', front: 'Wymień bariery odporności wrodzonej.', back: 'Skóra, błony śluzowe ze śluzem, rzęski, lizozym w łzach i ślinie, kwas solny w żołądku, prawidłowa mikroflora.'),
          Flashcard(id: 'f_k3_odp_5', front: 'Skąd biorą się objawy stanu zapalnego?', back: 'Z rozszerzenia i zwiększonej przepuszczalności naczyń oraz napływu fagocytów — stąd zaczerwienienie, obrzęk, ból i ciepło.'),
          Flashcard(id: 'f_k3_odp_6', front: 'Jak działają interferony?', back: 'Hamują namnażanie się wirusów w sąsiednich komórkach.'),
          Flashcard(id: 'f_k3_odp_7', front: 'Co robią komórki NK?', back: 'Niszczą komórki zakażone wirusami i nowotworowe bez wcześniejszego kontaktu z antygenem.'),
          Flashcard(id: 'f_k3_odp_8', front: 'Czym różni się odporność humoralna od komórkowej?', back: 'Humoralna działa dzięki przeciwciałom z plazmocytów (limfocyty B), komórkowa — dzięki limfocytom T niszczącym zakażone komórki.'),
          Flashcard(id: 'f_k3_odp_9', front: 'Jak działają przeciwciała?', back: 'Neutralizują toksyny i wirusy, zlepiają bakterie, ułatwiają fagocytozę i aktywują dopełniacz.'),
          Flashcard(id: 'f_k3_odp_10', front: 'Jaka jest rola limfocytów T pomocniczych?', back: 'Aktywują limfocyty B i limfocyty T cytotoksyczne oraz wydzielają cytokiny.'),
          Flashcard(id: 'f_k3_odp_11', front: 'Czym różni się odporność czynna od biernej?', back: 'Czynną organizm wytwarza sam (długotrwała, z pamięcią); w biernej otrzymuje gotowe przeciwciała (natychmiastowa, krótka).'),
          Flashcard(id: 'f_k3_odp_12', front: 'Podaj przykład odporności naturalnej biernej i sztucznej czynnej.', back: 'Naturalna bierna — przeciwciała matki przez łożysko i z mlekiem; sztuczna czynna — szczepienie.'),
          Flashcard(id: 'f_k3_odp_13', front: 'Dlaczego odpowiedź wtórna jest szybsza od pierwotnej?', back: 'Dzięki komórkom pamięci powstałym podczas pierwszego kontaktu z antygenem.'),
          Flashcard(id: 'f_k3_odp_14', front: 'Czym są cytokiny?', back: 'Białkami sygnałowymi komórek odpornościowych (np. interleukinami, interferonami), które regulują odpowiedź odpornościową.'),
          Flashcard(id: 'f_k3_odp_15', front: 'Czym są białka ostrej fazy i co oznacza wysokie CRP?', back: 'Białkami wytwarzanymi przez wątrobę podczas zakażenia lub urazu; wysokie CRP wskazuje na stan zapalny.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k3_odp_1', question: 'Limfocyty T dojrzewają w:', options: ['Szpiku kostnym', 'Grasicy', 'Śledzionie', 'Węzłach chłonnych'], correctIndex: 1, explanation: 'Grasica jest pierwotnym narządem limfatycznym, w którym dojrzewają limfocyty T.'),
          QuizQuestion(id: 'q_k3_odp_2', question: 'Do mechanizmów odporności wrodzonej NIE należy:', options: ['Fagocytoza', 'Lizozym w ślinie', 'Wytwarzanie przeciwciał przez plazmocyty', 'Stan zapalny'], correctIndex: 2, explanation: 'Przeciwciała to element odporności swoistej.'),
          QuizQuestion(id: 'q_k3_odp_3', question: 'Przeciwciała wytwarzają:', options: ['Limfocyty T cytotoksyczne', 'Plazmocyty powstałe z limfocytów B', 'Neutrofile', 'Erytrocyty'], correctIndex: 1, explanation: 'Aktywowany limfocyt B przekształca się w plazmocyty.'),
          QuizQuestion(id: 'q_k3_odp_4', question: 'Komórki zakażone wirusem niszczą przede wszystkim:', options: ['Limfocyty T cytotoksyczne i komórki NK', 'Erytrocyty', 'Plazmocyty', 'Trombocyty'], correctIndex: 0, explanation: 'Przeciwciała nie docierają do wirusów ukrytych we wnętrzu komórek.'),
          QuizQuestion(id: 'q_k3_odp_5', question: 'Szczepienie wywołuje odporność:', options: ['Naturalną bierną', 'Sztuczną czynną', 'Sztuczną bierną', 'Naturalną czynną'], correctIndex: 1, explanation: 'Organizm sam wytwarza przeciwciała i komórki pamięci po kontakcie z antygenem ze szczepionki.'),
          QuizQuestion(id: 'q_k3_odp_6', question: 'Podanie surowicy z gotowymi przeciwciałami po ukąszeniu żmii to przykład odporności:', options: ['Sztucznej biernej', 'Sztucznej czynnej', 'Naturalnej czynnej', 'Wrodzonej'], correctIndex: 0, explanation: 'Organizm otrzymuje gotowe przeciwciała.'),
          QuizQuestion(id: 'q_k3_odp_7', question: 'Odporność bierna, w odróżnieniu od czynnej:', options: ['Trwa całe życie', 'Działa natychmiast, ale krótko', 'Tworzy komórki pamięci', 'Wymaga kontaktu z antygenem'], correctIndex: 1, explanation: 'Podane przeciwciała są stopniowo rozkładane, a pamięć nie powstaje.'),
          QuizQuestion(id: 'q_k3_odp_8', question: 'Białko C-reaktywne (CRP) wytwarzane jest w:', options: ['Szpiku kostnym', 'Wątrobie', 'Grasicy', 'Nerkach'], correctIndex: 1, explanation: 'CRP to białko ostrej fazy produkowane przez wątrobę.'),
          QuizQuestion(id: 'q_k3_odp_9', question: 'Wtórna odpowiedź immunologiczna jest silniejsza od pierwotnej dzięki:', options: ['Interferonom', 'Komórkom pamięci', 'Lizozymowi', 'Gorączce'], correctIndex: 1, explanation: 'Komórki pamięci szybko rozpoznają znany antygen.'),
          QuizQuestion(id: 'q_k3_odp_10', question: 'Antygeny limfocytom T prezentują m.in.:', options: ['Erytrocyty', 'Komórki dendrytyczne i makrofagi', 'Trombocyty', 'Neurony'], correctIndex: 1, explanation: 'To tzw. komórki prezentujące antygen.'),
        ],
      ),
      Topic(
        id: 'k3_odpornosc_zaburzenia',
        name: 'Transplantologia, konflikt serologiczny i zaburzenia odporności',
        theory: '''
ZGODNOŚĆ TKANKOWA
Na powierzchni komórek znajdują się białka głównego układu zgodności tkankowej, u człowieka nazywane antygenami HLA. Dzięki nim układ odpornościowy odróżnia komórki własne od obcych. Białka te są bardzo zróżnicowane i dziedziczone po obojgu rodzicach, więc identyczny zestaw mają jedynie bliźnięta jednojajowe. Po przeszczepieniu narządu od dawcy o innych antygenach HLA limfocyty T rozpoznają go jako obcy i dochodzi do odrzucenia przeszczepu. Dlatego dobiera się dawcę o możliwie zgodnych antygenach HLA i zgodnej grupie krwi — często wśród rodzeństwa, które ma 25% szans na pełną zgodność — a biorca przyjmuje leki immunosupresyjne. Przeszczep własnej tkanki, np. skóry z innej części ciała, nie jest odrzucany.

GRUPY KRWI I PRZETACZANIE KRWI
Na erytrocytach znajdują się antygeny grup krwi, a w osoczu — przeciwciała przeciwko antygenom, których dana osoba nie ma. Osoba z grupą A ma antygen A i przeciwciała anty-B, z grupą B — antygen B i przeciwciała anty-A, z grupą AB — oba antygeny i żadnych z tych przeciwciał, a z grupą 0 — brak antygenów i oba rodzaje przeciwciał. Przetoczenie niezgodnej krwi powoduje zlepianie się i rozpad erytrocytów, dlatego przetacza się krew zgodną grupowo. Osoby Rh+ mają na erytrocytach antygen D, a osoby Rh− go nie mają; przeciwciała anty-Rh powstają dopiero po kontakcie z krwią Rh+.

KONFLIKT SEROLOGICZNY
Konflikt serologiczny może wystąpić, gdy matka ma krew Rh−, a płód odziedziczył po ojcu antygen Rh+. Podczas porodu, poronienia lub zabiegów krew płodu przedostaje się do krwiobiegu matki, a jej układ odpornościowy wytwarza przeciwciała anty-Rh i komórki pamięci. Pierwsze dziecko zwykle nie jest zagrożone, ponieważ przeciwciała powstają głównie w czasie porodu. W kolejnej ciąży z płodem Rh+ przeciwciała matki przechodzą przez łożysko i niszczą erytrocyty płodu, wywołując chorobę hemolityczną — niedokrwistość, żółtaczkę, a w ciężkich przypadkach obrzęk i śmierć płodu. Aby temu zapobiec, matce Rh− podaje się immunoglobulinę anty-D w 28. tygodniu ciąży oraz do 72 godzin po porodzie dziecka Rh+, a także po poronieniu. Podane przeciwciała niszczą erytrocyty płodu w krwiobiegu matki, zanim jej układ odpornościowy zdąży je rozpoznać i wytworzyć własne przeciwciała oraz komórki pamięci.

NADMIERNA ODPOWIEDŹ IMMUNOLOGICZNA
Alergia to nadmierna reakcja na substancje nieszkodliwe dla większości ludzi, zwane alergenami — pyłki roślin, roztocza kurzu, sierść zwierząt, niektóre pokarmy, jad owadów i leki. Przy pierwszym kontakcie powstają przeciwciała IgE, które osiadają na komórkach tucznych. Przy kolejnym kontakcie alergen łączy się z nimi, a komórki tuczne uwalniają histaminę, która rozszerza naczynia, powoduje obrzęk, świąd, nadmierne wydzielanie śluzu i skurcz oskrzeli. Tak przebiegają katar sienny, pokrzywka i astma alergiczna. Najgroźniejszą postacią jest wstrząs anafilaktyczny z gwałtownym spadkiem ciśnienia i dusznością, wymagający natychmiastowego podania adrenaliny. Choroby autoimmunologiczne rozwijają się, gdy układ odpornościowy przestaje tolerować własne antygeny i atakuje własne tkanki — przykładami są cukrzyca typu 1 (niszczenie komórek trzustki wytwarzających insulinę), stwardnienie rozsiane (niszczenie osłonek mielinowych), reumatoidalne zapalenie stawów i choroba Hashimoto.

OSŁABIONA ODPOWIEDŹ IMMUNOLOGICZNA
Niedobory odporności mogą być wrodzone, uwarunkowane genetycznie, lub nabyte — wskutek zakażenia HIV prowadzącego do AIDS, chemioterapii, napromieniania, niedożywienia, długotrwałego stresu albo przyjmowania leków immunosupresyjnych. Ich skutkiem są częste i ciężkie zakażenia, także drobnoustrojami niegroźnymi dla zdrowych osób, oraz zwiększone ryzyko nowotworów.

IMMUNOSUPRESJA
Immunosupresja to celowe osłabienie odpowiedzi odpornościowej za pomocą leków. Stosuje się ją po przeszczepach, aby zapobiec odrzuceniu narządu, a także w leczeniu ciężkich alergii i chorób autoimmunologicznych. Jej wadą jest zwiększona podatność na zakażenia i nowotwory.
''',
        flashcards: [
          Flashcard(id: 'f_k3_odp_16', front: 'Czym są antygeny zgodności tkankowej (HLA)?', back: 'Białkami na powierzchni komórek, dzięki którym układ odpornościowy odróżnia komórki własne od obcych.'),
          Flashcard(id: 'f_k3_odp_17', front: 'Dlaczego przeszczep może zostać odrzucony?', back: 'Limfocyty T rozpoznają obce antygeny HLA dawcy.'),
          Flashcard(id: 'f_k3_odp_18', front: 'Jak zmniejsza się ryzyko odrzucenia przeszczepu?', back: 'Dobierając dawcę o zgodnych antygenach HLA i grupie krwi oraz stosując leki immunosupresyjne.'),
          Flashcard(id: 'f_k3_odp_19', front: 'Jakie antygeny i przeciwciała ma osoba z grupą krwi A?', back: 'Antygen A na erytrocytach i przeciwciała anty-B w osoczu.'),
          Flashcard(id: 'f_k3_odp_20', front: 'Kiedy może wystąpić konflikt serologiczny?', back: 'Gdy matka jest Rh−, a płód Rh+ — zwykle w kolejnej ciąży, po uczuleniu matki.'),
          Flashcard(id: 'f_k3_odp_21', front: 'Dlaczego pierwsze dziecko w konflikcie serologicznym zwykle nie choruje?', back: 'Przeciwciała anty-Rh powstają u matki głównie w czasie porodu.'),
          Flashcard(id: 'f_k3_odp_22', front: 'Dlaczego matce Rh− podaje się immunoglobulinę anty-D?', back: 'Podane przeciwciała niszczą erytrocyty płodu, zanim układ odpornościowy matki wytworzy własne przeciwciała i komórki pamięci.'),
          Flashcard(id: 'f_k3_odp_23', front: 'Kiedy podaje się immunoglobulinę anty-D?', back: 'W 28. tygodniu ciąży i do 72 godzin po porodzie dziecka Rh+, a także po poronieniu.'),
          Flashcard(id: 'f_k3_odp_24', front: 'Jaki jest mechanizm alergii?', back: 'Alergen łączy się z przeciwciałami IgE na komórkach tucznych, które uwalniają histaminę.'),
          Flashcard(id: 'f_k3_odp_25', front: 'Czym jest wstrząs anafilaktyczny i jak się go leczy?', back: 'Gwałtowną reakcją alergiczną ze spadkiem ciśnienia i dusznością; leczy się natychmiastowym podaniem adrenaliny.'),
          Flashcard(id: 'f_k3_odp_26', front: 'Czym są choroby autoimmunologiczne? Podaj przykłady.', back: 'Chorobami, w których układ odpornościowy atakuje własne tkanki, np. cukrzyca typu 1, stwardnienie rozsiane, reumatoidalne zapalenie stawów.'),
          Flashcard(id: 'f_k3_odp_27', front: 'Kiedy stosuje się immunosupresję?', back: 'Po przeszczepach oraz w leczeniu ciężkich alergii i chorób autoimmunologicznych.'),
          Flashcard(id: 'f_k3_odp_28', front: 'Podaj przyczyny nabytego niedoboru odporności.', back: 'Zakażenie HIV, chemioterapia, napromienianie, niedożywienie, długotrwały stres, leki immunosupresyjne.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k3_odp_11', question: 'Osoba z grupą krwi 0 ma w osoczu przeciwciała:', options: ['Tylko anty-A', 'Tylko anty-B', 'Anty-A i anty-B', 'Nie ma żadnych z tych przeciwciał'], correctIndex: 2, explanation: 'Ma przeciwciała przeciwko obu antygenom, których nie posiada.'),
          QuizQuestion(id: 'q_k3_odp_12', question: 'Konflikt serologiczny grozi, gdy:', options: ['Matka jest Rh+, a płód Rh−', 'Matka jest Rh−, a płód Rh+', 'Oboje rodzice są Rh−', 'Matka ma grupę krwi AB'], correctIndex: 1, explanation: 'Układ odpornościowy matki Rh− może wytworzyć przeciwciała przeciwko erytrocytom płodu Rh+.'),
          QuizQuestion(id: 'q_k3_odp_13', question: 'Immunoglobulina anty-D podana matce:', options: ['Wytwarza u matki pamięć immunologiczną', 'Zapobiega wytworzeniu przez matkę własnych przeciwciał anty-Rh', 'Zmienia grupę krwi płodu', 'Leczy chorobę hemolityczną u matki'], correctIndex: 1, explanation: 'Erytrocyty płodu zostają usunięte, zanim uczulą układ odpornościowy matki.'),
          QuizQuestion(id: 'q_k3_odp_14', question: 'W reakcji alergicznej histaminę uwalniają:', options: ['Erytrocyty', 'Komórki tuczne', 'Limfocyty T cytotoksyczne', 'Neurony'], correctIndex: 1, explanation: 'Na komórkach tucznych osiadają przeciwciała IgE wiążące alergen.'),
          QuizQuestion(id: 'q_k3_odp_15', question: 'Chorobą autoimmunologiczną jest:', options: ['AIDS', 'Cukrzyca typu 1', 'Katar sienny', 'Grypa'], correctIndex: 1, explanation: 'Układ odpornościowy niszczy komórki trzustki wytwarzające insulinę.'),
          QuizQuestion(id: 'q_k3_odp_16', question: 'Leki immunosupresyjne stosuje się przede wszystkim po:', options: ['Szczepieniu', 'Przeszczepieniu narządu', 'Zakażeniu HIV', 'Złamaniu kości'], correctIndex: 1, explanation: 'Zapobiegają odrzuceniu przeszczepu.'),
          QuizQuestion(id: 'q_k3_odp_17', question: 'Identyczny zestaw antygenów HLA mają zawsze:', options: ['Rodzice i dzieci', 'Bliźnięta jednojajowe', 'Rodzeństwo', 'Osoby o tej samej grupie krwi'], correctIndex: 1, explanation: 'Bliźnięta jednojajowe są identyczne genetycznie.'),
          QuizQuestion(id: 'q_k3_odp_18', question: 'Za alergie natychmiastowe odpowiadają przeciwciała klasy:', options: ['IgG', 'IgE', 'IgM', 'IgA'], correctIndex: 1, explanation: 'IgE wiążą się z komórkami tucznymi.'),
          QuizQuestion(id: 'q_k3_odp_19', question: 'Wadą leczenia immunosupresyjnego jest:', options: ['Większa podatność na zakażenia', 'Nasilenie reakcji alergicznych', 'Zniszczenie przeszczepu', 'Wzrost liczby limfocytów'], correctIndex: 0, explanation: 'Osłabiony układ odpornościowy gorzej zwalcza drobnoustroje.'),
        ],
      ),
    ],
  ),

  // ===========================================================================
  // XI.3 WYMIANA GAZOWA (część a–k)
  // ===========================================================================
  Chapter(
    id: 'k3_oddychanie',
    name: 'Wymiana gazowa',
    topics: [
      Topic(
        id: 'k3_oddychanie_zwierzeta',
        name: 'Wymiana gazowa u zwierząt',
        theory: '''
WARUNKI WYMIANY GAZOWEJ
Gazy oddechowe przenikają przez powierzchnie wymiany na drodze dyfuzji, zgodnie z różnicą ciśnień parcjalnych. Wymianę ułatwiają: duża powierzchnia, bardzo cienka warstwa oddzielająca środowisko od krwi, wilgotność powierzchni (gazy muszą się rozpuścić w wodzie), duża różnica stężeń gazów utrzymywana dzięki wentylacji, czyli stałej wymianie powietrza lub wody, oraz sprawny transport gazów w organizmie — bogate unaczynienie i barwniki oddechowe.

POWIERZCHNIE WYMIANY A ŚRODOWISKO ŻYCIA
U zwierząt wodnych powierzchnie wymiany gazowej mogą być zewnętrzne, jak skrzela wystające poza obręb ciała, bo w wodzie nie grozi im wyschnięcie, a woda podtrzymuje delikatne struktury. Woda zawiera jednak wielokrotnie mniej tlenu niż powietrze i jest od niego gęstsza, dlatego zwierzęta wodne muszą przepuszczać przez narządy oddechowe duże jej ilości. U zwierząt lądowych powierzchnie wymiany znajdują się wewnątrz ciała — w płucach lub tchawkach — co chroni je przed wysychaniem i uszkodzeniem.

NARZĄDY WYMIANY GAZOWEJ
Całą powierzchnią ciała oddychają zwierzęta drobne lub spłaszczone o niskim zapotrzebowaniu na tlen, jak płazińce i nicienie, a także dżdżownica, której wilgotna skóra jest silnie unaczyniona. Skrzela mają ryby, larwy płazów, skorupiaki oraz wodne mięczaki. Owady oddychają tchawkami — systemem rozgałęzionych rurek otwierających się na zewnątrz przetchlinkami i doprowadzających powietrze bezpośrednio do komórek, dlatego ich krew nie uczestniczy w transporcie tlenu. Pajęczaki mają płucotchawki lub tchawki. Płuca mają kręgowce lądowe, a funkcję płuca pełni też jama płaszczowa ślimaków lądowych. U płazów ważną rolę odgrywa dodatkowo wymiana gazowa przez skórę.

PŁUCA KRĘGOWCÓW — PORÓWNANIE
Płuca płazów są workowate, o słabo pofałdowanych ścianach i małej powierzchni wymiany, dlatego płazy wspomagają się oddychaniem przez skórę. Płuca gadów mają silniej pofałdowane ściany i wewnętrzne przegrody, co zapewnia większą powierzchnię i pozwala oddychać wyłącznie płucami. Płuca ptaków są niewielkie i nierozciągliwe, zbudowane z sieci cienkich kanalików (parabronchów), przez które powietrze przepływa jednokierunkowo, i połączone z workami powietrznymi. Płuca ssaków tworzy rozgałęzione drzewo oskrzelowe zakończone ogromną liczbą pęcherzyków płucnych. W ewolucji kręgowców widać tendencję do zwiększania powierzchni wymiany gazowej.

MECHANIZM PRZECIWPRĄDOWY W SKRZELACH
W blaszkach skrzelowych ryb krew płynie w kierunku przeciwnym do przepływu wody. Dzięki temu na całej długości blaszki krew styka się z wodą zawierającą więcej tlenu niż ona sama, więc tlen nieprzerwanie do niej dyfunduje — ryba pobiera ponad 80% tlenu rozpuszczonego w wodzie. Gdyby krew i woda płynęły w tym samym kierunku, ich stężenia wyrównałyby się w połowie drogi i wymiana zatrzymałaby się na poziomie około 50%.

WENTYLACJA PŁUC U KRĘGOWCÓW
Płazy nie mają żeber ani przepony i wentylują płuca za pomocą pompy ustnej: przy otwartych nozdrzach opuszczają dno jamy gębowej, zasysając powietrze, a następnie zamykają nozdrza i unoszą dno jamy gębowej, wtłaczając powietrze do płuc. Gady wentylują płuca ssąco — ruchy żeber powiększają i zmniejszają objętość klatki piersiowej. Ptaki mają worki powietrzne: podczas wdechu świeże powietrze trafia do tylnych worków, a powietrze z płuc przechodzi do przednich worków; podczas wydechu powietrze z tylnych worków przepływa przez płuca, a z przednich jest usuwane na zewnątrz. Przez płuca stale płynie więc jednokierunkowy strumień powietrza, a wymiana gazowa zachodzi zarówno podczas wdechu, jak i wydechu — to podwójne oddychanie, zapewniające dużą wydajność podczas lotu. Ssaki wentylują płuca dzięki pracy przepony i mięśni międzyżebrowych, zmieniających objętość klatki piersiowej.
''',
        flashcards: [
          Flashcard(id: 'f_k3_odd_1', front: 'Jakie cechy powierzchni ułatwiają wymianę gazową?', back: 'Duża, cienka i wilgotna powierzchnia, duża różnica stężeń gazów utrzymywana przez wentylację oraz bogate unaczynienie.'),
          Flashcard(id: 'f_k3_odd_2', front: 'Dlaczego u zwierząt lądowych powierzchnie wymiany gazowej leżą wewnątrz ciała?', back: 'Chroni to je przed wysychaniem i uszkodzeniem.'),
          Flashcard(id: 'f_k3_odd_3', front: 'Które zwierzęta oddychają całą powierzchnią ciała?', back: 'Drobne lub spłaszczone o niskim zapotrzebowaniu na tlen, np. płazińce i nicienie, a także dżdżownica.'),
          Flashcard(id: 'f_k3_odd_4', front: 'Jak zbudowane są tchawki owadów?', back: 'To rozgałęzione rurki otwierające się przetchlinkami i doprowadzające powietrze bezpośrednio do komórek.'),
          Flashcard(id: 'f_k3_odd_5', front: 'Dlaczego krew owadów nie transportuje tlenu?', back: 'Tchawki doprowadzają powietrze bezpośrednio do komórek.'),
          Flashcard(id: 'f_k3_odd_6', front: 'Na czym polega mechanizm przeciwprądowy w skrzelach?', back: 'Krew płynie przeciwnie do wody, więc na całej długości blaszki styka się z wodą bogatszą w tlen i stale go pobiera.'),
          Flashcard(id: 'f_k3_odd_7', front: 'Porównaj płuca płazów i ssaków.', back: 'Płazy mają workowate, słabo pofałdowane płuca o małej powierzchni; ssaki — drzewo oskrzelowe z ogromną liczbą pęcherzyków.'),
          Flashcard(id: 'f_k3_odd_8', front: 'Jak płazy wentylują płuca?', back: 'Pompą ustną — ruchami dna jamy gębowej wtłaczają powietrze do płuc.'),
          Flashcard(id: 'f_k3_odd_9', front: 'Jak gady wentylują płuca?', back: 'Ssąco, dzięki ruchom żeber zmieniającym objętość klatki piersiowej.'),
          Flashcard(id: 'f_k3_odd_10', front: 'Jaką rolę pełnią worki powietrzne ptaków?', back: 'Zapewniają jednokierunkowy przepływ powietrza przez płuca i wymianę gazową zarówno przy wdechu, jak i przy wydechu.'),
          Flashcard(id: 'f_k3_odd_11', front: 'Czym są parabronchy?', back: 'Cienkimi kanalikami płuc ptaków, przez które powietrze przepływa jednokierunkowo.'),
          Flashcard(id: 'f_k3_odd_12', front: 'Dzięki jakim mięśniom ssaki wentylują płuca?', back: 'Dzięki przeponie i mięśniom międzyżebrowym.'),
          Flashcard(id: 'f_k3_odd_13', front: 'Jaka tendencja ewolucyjna widoczna jest w budowie płuc kręgowców?', back: 'Zwiększanie powierzchni wymiany gazowej.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k3_odd_1', question: 'Skrzela zewnętrzne mogą występować u zwierząt wodnych, ponieważ:', options: ['Woda zawiera więcej tlenu niż powietrze', 'W wodzie nie grozi im wyschnięcie', 'Nie wymagają wentylacji', 'Nie mają naczyń krwionośnych'], correctIndex: 1, explanation: 'Woda chroni delikatne powierzchnie przed wysychaniem i podtrzymuje je.'),
          QuizQuestion(id: 'q_k3_odd_2', question: 'Dzięki mechanizmowi przeciwprądowemu ryba pobiera z wody:', options: ['Około 10% tlenu', 'Około 50% tlenu', 'Ponad 80% tlenu', 'Cały tlen'], correctIndex: 2, explanation: 'Przy przepływie współprądowym wymiana zatrzymałaby się na około 50%.'),
          QuizQuestion(id: 'q_k3_odd_3', question: 'Tchawki występują u:', options: ['Ryb', 'Owadów', 'Małży', 'Płazów'], correctIndex: 1, explanation: 'Tchawki doprowadzają powietrze bezpośrednio do komórek owada.'),
          QuizQuestion(id: 'q_k3_odd_4', question: 'Wentylacja płuc za pomocą pompy ustnej jest charakterystyczna dla:', options: ['Ssaków', 'Płazów', 'Ptaków', 'Gadów'], correctIndex: 1, explanation: 'Płazy nie mają żeber ani przepony, które umożliwiałyby wentylację ssącą.'),
          QuizQuestion(id: 'q_k3_odd_5', question: 'Podwójne oddychanie występuje u:', options: ['Płazów', 'Gadów', 'Ptaków', 'Ssaków'], correctIndex: 2, explanation: 'Umożliwiają je worki powietrzne.'),
          QuizQuestion(id: 'q_k3_odd_6', question: 'Najmniejszą powierzchnię wymiany gazowej w płucach mają:', options: ['Ssaki', 'Ptaki', 'Gady', 'Płazy'], correctIndex: 3, explanation: 'Workowate płuca płazów są słabo pofałdowane.'),
          QuizQuestion(id: 'q_k3_odd_7', question: 'Płucotchawki występują u:', options: ['Pajęczaków', 'Owadów', 'Skorupiaków', 'Pierścienic'], correctIndex: 0, explanation: 'Owady mają tchawki, a skorupiaki skrzela.'),
          QuizQuestion(id: 'q_k3_odd_8', question: 'Ryby muszą przepuszczać przez skrzela dużo wody, ponieważ:', options: ['Woda zawiera wielokrotnie mniej tlenu niż powietrze', 'Skrzela nie mają naczyń krwionośnych', 'Woda jest mniej gęsta od powietrza', 'Ryby nie mają hemoglobiny'], correctIndex: 0, explanation: 'Mała zawartość tlenu w wodzie wymaga intensywnej wentylacji.'),
          QuizQuestion(id: 'q_k3_odd_9', question: 'Dżdżownica wymienia gazy przez:', options: ['Skrzela', 'Tchawki', 'Wilgotną, unaczynioną skórę', 'Płuca'], correctIndex: 2, explanation: 'Dlatego dżdżownica ginie po wyschnięciu skóry.'),
        ],
      ),
      Topic(
        id: 'k3_oddychanie_czlowiek',
        name: 'Układ oddechowy człowieka',
        theory: '''
BUDOWA A FUNKCJA
Jama nosowa oczyszcza powietrze dzięki włoskom i śluzowi, ogrzewa je dzięki bogatemu unaczynieniu, nawilża i zawiera receptory węchowe. Gardło jest wspólnym odcinkiem dróg oddechowych i pokarmowych. Krtań zbudowana jest z chrząstek; nagłośnia zamyka ją podczas połykania, a fałdy głosowe umożliwiają wydawanie dźwięków. Ściany tchawicy usztywniają chrzęstne półpierścienie, a oskrzeli — chrzęstne pierścienie i płytki, co zapobiega zapadaniu się dróg oddechowych. Wyściela je nabłonek migawkowy z komórkami wydzielającymi śluz: śluz zatrzymuje pyły i drobnoustroje, a rzęski przesuwają go w stronę gardła. Oskrzela rozgałęziają się na coraz drobniejsze oskrzeliki, zakończone pęcherzykami płucnymi. Pęcherzyków jest kilkaset milionów, ich ściany zbudowane są z nabłonka jednowarstwowego płaskiego i oplecione siecią naczyń włosowatych, a wnętrze pokrywa surfaktant — substancja zapobiegająca zlepianiu się pęcherzyków. Płuca otacza opłucna, której dwie blaszki oddziela cienka warstwa płynu, zmniejszająca tarcie podczas ruchów oddechowych.

MECHANIZM WDECHU I WYDECHU
Wdech jest procesem czynnym: kurczy się przepona, która spłaszcza się i obniża, oraz mięśnie międzyżebrowe zewnętrzne, unoszące żebra. Objętość klatki piersiowej rośnie, ciśnienie w płucach spada poniżej atmosferycznego i powietrze napływa do płuc. Spokojny wydech jest bierny: mięśnie rozkurczają się, sprężyste płuca się zmniejszają, ciśnienie w nich rośnie i powietrze wypływa. Wydech nasilony wspomagają mięśnie międzyżebrowe wewnętrzne i mięśnie brzucha. Rytm oddychania reguluje ośrodek oddechowy w rdzeniu przedłużonym, a najsilniejszym bodźcem pobudzającym go jest wzrost stężenia dwutlenku węgla i spadek pH krwi.

WYMIANA GAZOWA W PŁUCACH I W TKANKACH
W pęcherzykach płucnych ciśnienie parcjalne tlenu jest wyższe niż we krwi, dlatego tlen dyfunduje do krwi, a dwutlenek węgla przechodzi z krwi do pęcherzyków. W tkankach sytuacja jest odwrotna: komórki zużywają tlen w oddychaniu komórkowym i wytwarzają dwutlenek węgla, więc tlen przechodzi z krwi do komórek, a dwutlenek węgla z komórek do krwi.

POWINOWACTWO HEMOGLOBINY DO TLENU
Hemoglobina wiąże tlen odwracalnie, tworząc oksyhemoglobinę. Stopień jej wysycenia zależy od ciśnienia parcjalnego tlenu: w płucach, gdzie jest ono wysokie, hemoglobina wysyca się niemal całkowicie, a w tkankach, gdzie jest niskie, oddaje tlen. Powinowactwo hemoglobiny do tlenu maleje, gdy spada pH krwi (rośnie stężenie dwutlenku węgla lub kwasu mlekowego) i gdy rośnie temperatura. Dlatego ciepłe i zakwaszone, intensywnie pracujące mięśnie otrzymują więcej tlenu. W płucach usuwanie dwutlenku węgla podnosi pH, co zwiększa powinowactwo i ułatwia wiązanie tlenu. W wysokich górach ciśnienie parcjalne tlenu w powietrzu jest niższe, więc hemoglobina wysyca się słabiej; organizm przystosowuje się m.in. przez zwiększenie liczby erytrocytów. Hemoglobina płodowa ma większe powinowactwo do tlenu niż hemoglobina dorosłego, co pozwala płodowi pobierać tlen z krwi matki w łożysku.

ROLA KRWI W TRANSPORCIE GAZÓW
Tlen transportowany jest niemal w całości w erytrocytach w postaci oksyhemoglobiny, a tylko niewielka jego ilość rozpuszcza się w osoczu. Dwutlenek węgla przenoszony jest głównie w postaci jonów wodorowęglanowych rozpuszczonych w osoczu — powstają one w erytrocytach z udziałem enzymu anhydrazy węglanowej — a częściowo w połączeniu z hemoglobiną i w postaci rozpuszczonej w osoczu.

CZYNNIKI SZKODLIWE DLA UKŁADU ODDECHOWEGO
Tlenek węgla (czad) jest bezbarwny i bezwonny, powstaje przy niepełnym spalaniu, np. w niesprawnych piecykach gazowych i piecach. Wiąże się z hemoglobiną ponad 200 razy silniej niż tlen, tworząc karboksyhemoglobinę, i blokuje transport tlenu, co prowadzi do bólu głowy, senności, utraty przytomności, a nawet śmierci; chronią przed nim sprawna wentylacja i czujniki czadu. Pyły zawieszone, zwłaszcza najdrobniejsze (PM2,5), docierają do pęcherzyków płucnych, a nawet do krwi — nasilają astmę, zwiększają ryzyko przewlekłej obturacyjnej choroby płuc (POChP), raka płuc i chorób serca. Dym tytoniowy zawiera tlenek węgla, substancje smoliste i kilkadziesiąt związków rakotwórczych; paraliżuje rzęski nabłonka, prowadzi do przewlekłego zapalenia oskrzeli, POChP i raka płuc, szkodząc także osobom biernie wdychającym dym. Smog to mieszanina pyłów i szkodliwych gazów, m.in. tlenków siarki i azotu oraz rakotwórczego benzo(a)pirenu; w Polsce powstaje głównie zimą w wyniku ogrzewania domów węglem i drewnem złej jakości oraz z transportu.

BADANIA DIAGNOSTYCZNE
Zdjęcie rentgenowskie (RTG) klatki piersiowej pozwala wykryć zapalenie płuc, gruźlicę, zmiany nowotworowe i obecność płynu w jamie opłucnej. Spirometria mierzy objętości i przepływ powietrza podczas oddychania, m.in. pojemność życiową płuc; służy do rozpoznawania i kontroli astmy oraz POChP i jest zalecana palaczom. Bronchoskopia polega na oglądaniu wnętrza tchawicy i oskrzeli za pomocą giętkiego endoskopu wprowadzonego przez nos lub usta; umożliwia pobranie wycinków, np. przy podejrzeniu raka płuca, oraz usunięcie ciała obcego.
''',
        flashcards: [
          Flashcard(id: 'f_k3_odd_14', front: 'Jakie funkcje pełni jama nosowa?', back: 'Oczyszcza, ogrzewa i nawilża powietrze oraz zawiera receptory węchowe.'),
          Flashcard(id: 'f_k3_odd_15', front: 'Po co tchawica ma chrzęstne półpierścienie?', back: 'Zapobiegają zapadaniu się tchawicy.'),
          Flashcard(id: 'f_k3_odd_16', front: 'Jak nabłonek migawkowy chroni drogi oddechowe?', back: 'Śluz zatrzymuje pyły i drobnoustroje, a rzęski przesuwają go w stronę gardła.'),
          Flashcard(id: 'f_k3_odd_17', front: 'Jakie cechy pęcherzyków płucnych ułatwiają wymianę gazową?', back: 'Ogromna liczba, cienkie ściany z nabłonka płaskiego, gęsta sieć naczyń włosowatych i wilgotna powierzchnia.'),
          Flashcard(id: 'f_k3_odd_18', front: 'Jaką rolę pełni surfaktant?', back: 'Zapobiega zlepianiu się pęcherzyków płucnych.'),
          Flashcard(id: 'f_k3_odd_19', front: 'Opisz mechanizm wdechu.', back: 'Kurczą się przepona i mięśnie międzyżebrowe zewnętrzne, objętość klatki piersiowej rośnie, ciśnienie w płucach spada i powietrze napływa.'),
          Flashcard(id: 'f_k3_odd_20', front: 'Czy spokojny wydech wymaga pracy mięśni?', back: 'Nie — jest bierny: mięśnie się rozkurczają, a sprężyste płuca zmniejszają objętość.'),
          Flashcard(id: 'f_k3_odd_21', front: 'Gdzie leży ośrodek oddechowy i co go najsilniej pobudza?', back: 'W rdzeniu przedłużonym; najsilniej pobudza go wzrost stężenia CO2 i spadek pH krwi.'),
          Flashcard(id: 'f_k3_odd_22', front: 'Jak pH i temperatura wpływają na powinowactwo hemoglobiny do tlenu?', back: 'Spadek pH i wzrost temperatury obniżają powinowactwo — hemoglobina łatwiej oddaje tlen.'),
          Flashcard(id: 'f_k3_odd_23', front: 'Dlaczego intensywnie pracujące mięśnie dostają więcej tlenu?', back: 'Są cieplejsze i zakwaszone, więc hemoglobina łatwiej oddaje im tlen.'),
          Flashcard(id: 'f_k3_odd_24', front: 'Po co hemoglobinie płodowej większe powinowactwo do tlenu?', back: 'Aby płód mógł pobierać tlen z krwi matki w łożysku.'),
          Flashcard(id: 'f_k3_odd_25', front: 'W jakiej postaci krew transportuje dwutlenek węgla?', back: 'Głównie jako jony wodorowęglanowe w osoczu, częściowo związany z hemoglobiną i rozpuszczony w osoczu.'),
          Flashcard(id: 'f_k3_odd_26', front: 'Dlaczego tlenek węgla jest tak niebezpieczny?', back: 'Wiąże się z hemoglobiną ponad 200 razy silniej niż tlen i blokuje jego transport.'),
          Flashcard(id: 'f_k3_odd_27', front: 'Jak dym tytoniowy uszkadza drogi oddechowe?', back: 'Paraliżuje rzęski nabłonka, powoduje przewlekłe zapalenie oskrzeli, POChP i raka płuc.'),
          Flashcard(id: 'f_k3_odd_28', front: 'Skąd w Polsce bierze się smog?', back: 'Głównie z zimowego ogrzewania domów węglem i drewnem złej jakości oraz z transportu.'),
          Flashcard(id: 'f_k3_odd_29', front: 'Do czego służy spirometria?', back: 'Do pomiaru objętości i przepływu powietrza — rozpoznawania i kontroli astmy oraz POChP.'),
          Flashcard(id: 'f_k3_odd_30', front: 'Czym różni się bronchoskopia od RTG klatki piersiowej?', back: 'Bronchoskopia to oglądanie wnętrza oskrzeli endoskopem, z możliwością pobrania wycinka; RTG to zdjęcie rentgenowskie.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k3_odd_10', question: 'Podczas wdechu przepona:', options: ['Rozkurcza się i unosi', 'Kurczy się i obniża', 'Nie zmienia położenia', 'Wypycha powietrze z płuc'], correctIndex: 1, explanation: 'Skurcz przepony zwiększa objętość klatki piersiowej.'),
          QuizQuestion(id: 'q_k3_odd_11', question: 'Surfaktant:', options: ['Transportuje tlen', 'Zapobiega zlepianiu się pęcherzyków płucnych', 'Zatrzymuje pyły w oskrzelach', 'Wiąże dwutlenek węgla'], correctIndex: 1, explanation: 'Obniża napięcie powierzchniowe w pęcherzykach.'),
          QuizQuestion(id: 'q_k3_odd_12', question: 'Spadek pH krwi w pracujących mięśniach sprawia, że hemoglobina:', options: ['Silniej wiąże tlen', 'Łatwiej oddaje tlen', 'Przestaje transportować CO2', 'Wiąże tlenek węgla'], correctIndex: 1, explanation: 'Obniża się jej powinowactwo do tlenu.'),
          QuizQuestion(id: 'q_k3_odd_13', question: 'Większość dwutlenku węgla transportowana jest we krwi w postaci:', options: ['Karboksyhemoglobiny', 'Jonów wodorowęglanowych', 'Gazu rozpuszczonego w erytrocytach', 'Oksyhemoglobiny'], correctIndex: 1, explanation: 'Jony te powstają w erytrocytach z udziałem anhydrazy węglanowej.'),
          QuizQuestion(id: 'q_k3_odd_14', question: 'Karboksyhemoglobina to połączenie hemoglobiny z:', options: ['Tlenem', 'Dwutlenkiem węgla', 'Tlenkiem węgla', 'Azotem'], correctIndex: 2, explanation: 'Tlenek węgla wiąże się z hemoglobiną wielokrotnie silniej niż tlen.'),
          QuizQuestion(id: 'q_k3_odd_15', question: 'Najsilniejszym bodźcem nasilającym oddychanie jest:', options: ['Spadek stężenia CO2 we krwi', 'Wzrost stężenia CO2 we krwi', 'Wzrost stężenia glukozy', 'Spadek temperatury'], correctIndex: 1, explanation: 'Wzrost stężenia CO2 obniża pH, co pobudza ośrodek oddechowy.'),
          QuizQuestion(id: 'q_k3_odd_16', question: 'Pojemność życiową płuc mierzy się w badaniu:', options: ['Bronchoskopowym', 'Spirometrycznym', 'EKG', 'Gastroskopowym'], correctIndex: 1, explanation: 'Spirometria mierzy objętości i przepływy powietrza.'),
          QuizQuestion(id: 'q_k3_odd_17', question: 'Nagłośnia:', options: ['Zamyka krtań podczas połykania', 'Wytwarza śluz', 'Ogrzewa powietrze', 'Zawiera receptory węchowe'], correctIndex: 0, explanation: 'Zapobiega przedostaniu się pokarmu do dróg oddechowych.'),
          QuizQuestion(id: 'q_k3_odd_18', question: 'Hemoglobina płodowa w porównaniu z hemoglobiną dorosłego ma powinowactwo do tlenu:', options: ['Mniejsze', 'Większe', 'Takie samo', 'Nie wiąże tlenu'], correctIndex: 1, explanation: 'Umożliwia to pobieranie tlenu z krwi matki.'),
          QuizQuestion(id: 'q_k3_odd_19', question: 'W wysokich górach hemoglobina wysyca się tlenem słabiej, ponieważ:', options: ['Powietrze zawiera mniej azotu', 'Ciśnienie parcjalne tlenu jest niższe', 'Temperatura jest wyższa', 'pH krwi gwałtownie spada'], correctIndex: 1, explanation: 'Stopień wysycenia zależy od ciśnienia parcjalnego tlenu.'),
          QuizQuestion(id: 'q_k3_odd_20', question: 'Najdrobniejsze pyły zawieszone (PM2,5) są szczególnie groźne, ponieważ:', options: ['Zatrzymują się w jamie nosowej', 'Docierają do pęcherzyków płucnych, a nawet do krwi', 'Rozpuszczają się w śluzie', 'Nie są wdychane'], correctIndex: 1, explanation: 'Omijają zabezpieczenia górnych dróg oddechowych.'),
        ],
      ),
    ],
  ),

  // ===========================================================================
  // XI.3 KRĄŻENIE (część l–s)
  // ===========================================================================
  Chapter(
    id: 'k3_krazenie',
    name: 'Krążenie i krew',
    topics: [
      Topic(
        id: 'k3_krazenie_zwierzeta',
        name: 'Układy krążenia zwierząt',
        theory: '''
RODZAJE UKŁADÓW KRĄŻENIA
Zwierzęta o prostej budowie, jak parzydełkowce i płazińce, nie mają układu krążenia — substancje rozprowadzane są w ich ciele przez dyfuzję. Układ krążenia otwarty występuje u stawonogów i większości mięczaków: serce tłoczy płyn ustrojowy, zwany hemolimfą, do naczyń, z których wypływa on do jam ciała i bezpośrednio omywa narządy, a następnie wraca do serca. Ciśnienie jest w nim niskie, a przepływ powolny. Aktywnym owadom to wystarcza, ponieważ tlen dostarczają im tchawki, a hemolimfa transportuje głównie substancje odżywcze. Układ krążenia zamknięty mają pierścienice, głowonogi i kręgowce: krew płynie wyłącznie w naczyniach, szybciej i pod wyższym ciśnieniem, co umożliwia sprawne dostarczanie tlenu i regulację przepływu krwi przez poszczególne narządy. Jest to przystosowanie do dużych rozmiarów ciała i aktywnego trybu życia.

BARWNIKI ODDECHOWE I SERCA BEZKRĘGOWCÓW
U dżdżownicy krew tłoczą kurczliwe naczynia, tzw. serca boczne, a u owadów — grzbietowe naczynie z otworami. Hemolimfa owadów zwykle nie zawiera barwnika oddechowego. U wielu mięczaków i skorupiaków barwnikiem oddechowym jest hemocyjanina zawierająca miedź, a u pierścienic i kręgowców — hemoglobina zawierająca żelazo.

SERCA KRĘGOWCÓW — TENDENCJE EWOLUCYJNE
Ryby mają serce dwudzielne, złożone z przedsionka i komory, oraz jeden obieg krwi: serce tłoczy krew odtlenowaną do skrzeli, a stamtąd krew utlenowana płynie dalej do narządów pod niskim już ciśnieniem. Płazy mają serce trójdzielne — dwa przedsionki i jedną komorę — oraz dwa obiegi krwi, płucny i ustrojowy; w komorze krew utlenowana i odtlenowana częściowo się mieszają. Gady mają serce trójdzielne z niepełną przegrodą w komorze, która ogranicza mieszanie się krwi, a krokodyle — przegrodę pełną. Ptaki i ssaki mają serce czterodzielne i całkowicie rozdzielone obiegi, dzięki czemu krew utlenowana nie miesza się z odtlenowaną i trafia do narządów pod wysokim ciśnieniem. Tendencją ewolucyjną jest więc stopniowe oddzielanie krwi utlenowanej od odtlenowanej, pojawienie się drugiego obiegu i wzrost wydajności układu krążenia, co było jednym z warunków stałocieplności ptaków i ssaków.
''',
        flashcards: [
          Flashcard(id: 'f_k3_kr_1', front: 'Czym różni się układ krążenia otwarty od zamkniętego?', back: 'W otwartym hemolimfa wypływa z naczyń do jam ciała i omywa narządy; w zamkniętym krew płynie wyłącznie w naczyniach, szybciej i pod wyższym ciśnieniem.'),
          Flashcard(id: 'f_k3_kr_2', front: 'Które zwierzęta mają otwarty układ krążenia?', back: 'Stawonogi i większość mięczaków.'),
          Flashcard(id: 'f_k3_kr_3', front: 'Które zwierzęta mają zamknięty układ krążenia?', back: 'Pierścienice, głowonogi i kręgowce.'),
          Flashcard(id: 'f_k3_kr_4', front: 'Dlaczego aktywnym owadom wystarcza otwarty układ krążenia?', back: 'Tlen dostarczają tchawki, a hemolimfa transportuje głównie substancje odżywcze.'),
          Flashcard(id: 'f_k3_kr_5', front: 'Jaki barwnik oddechowy mają skorupiaki i wiele mięczaków?', back: 'Hemocyjaninę zawierającą miedź.'),
          Flashcard(id: 'f_k3_kr_6', front: 'Jakie serce i ile obiegów krwi mają ryby?', back: 'Serce dwudzielne (przedsionek i komora) i jeden obieg krwi.'),
          Flashcard(id: 'f_k3_kr_7', front: 'Jakie serce i ile obiegów krwi mają płazy?', back: 'Serce trójdzielne (dwa przedsionki i komora) i dwa obiegi, z częściowym mieszaniem krwi w komorze.'),
          Flashcard(id: 'f_k3_kr_8', front: 'Czym różni się serce gadów od serca ptaków?', back: 'Gady mają serce trójdzielne z niepełną przegrodą w komorze (krokodyle — pełną), ptaki — czterodzielne z całkowicie rozdzielonymi obiegami.'),
          Flashcard(id: 'f_k3_kr_9', front: 'Jaka tendencja ewolucyjna widoczna jest w budowie serc kręgowców?', back: 'Stopniowe oddzielanie krwi utlenowanej od odtlenowanej i wzrost wydajności układu krążenia.'),
          Flashcard(id: 'f_k3_kr_10', front: 'Z czym wiąże się całkowite rozdzielenie obiegów krwi u ptaków i ssaków?', back: 'Z dużym zapotrzebowaniem na tlen i stałocieplnością.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k3_kr_1', question: 'Układ krążenia otwarty występuje u:', options: ['Dżdżownicy', 'Owadów', 'Ośmiornicy', 'Ryb'], correctIndex: 1, explanation: 'Pierścienice, głowonogi i kręgowce mają układ zamknięty.'),
          QuizQuestion(id: 'q_k3_kr_2', question: 'Serce dwudzielne i jeden obieg krwi mają:', options: ['Płazy', 'Ryby', 'Gady', 'Ptaki'], correctIndex: 1, explanation: 'Krew z serca płynie do skrzeli, a potem od razu do narządów.'),
          QuizQuestion(id: 'q_k3_kr_3', question: 'Krew utlenowana i odtlenowana częściowo mieszają się w komorze serca:', options: ['Ptaków', 'Ssaków', 'Płazów', 'Krokodyli'], correctIndex: 2, explanation: 'Płazy mają jedną komorę wspólną dla obu obiegów.'),
          QuizQuestion(id: 'q_k3_kr_4', question: 'Zamknięty układ krążenia w odróżnieniu od otwartego:', options: ['Nie ma serca', 'Zapewnia szybszy przepływ krwi pod wyższym ciśnieniem', 'Występuje u wszystkich bezkręgowców', 'Nie wymaga naczyń krwionośnych'], correctIndex: 1, explanation: 'Krew nie wypływa do jam ciała, więc ciśnienie się utrzymuje.'),
          QuizQuestion(id: 'q_k3_kr_5', question: 'Wśród gadów pełną przegrodę w komorze serca mają:', options: ['Węże', 'Jaszczurki', 'Krokodyle', 'Żółwie'], correctIndex: 2, explanation: 'Pozostałe gady mają przegrodę niepełną.'),
          QuizQuestion(id: 'q_k3_kr_6', question: 'Hemocyjanina zawiera:', options: ['Żelazo', 'Miedź', 'Magnez', 'Wapń'], correctIndex: 1, explanation: 'Żelazo zawiera hemoglobina.'),
          QuizQuestion(id: 'q_k3_kr_7', question: 'Całkowite rozdzielenie krwi utlenowanej i odtlenowanej w sercu mają:', options: ['Ryby i płazy', 'Ptaki i ssaki', 'Gady i płazy', 'Wszystkie kręgowce'], correctIndex: 1, explanation: 'Mają serce czterodzielne.'),
        ],
      ),
      Topic(
        id: 'k3_krazenie_krew',
        name: 'Krew, naczynia krwionośne i układ limfatyczny',
        theory: '''
SKŁAD I FUNKCJE KRWI
Krew stanowi około 7–8% masy ciała człowieka. Składa się z osocza, stanowiącego około 55% jej objętości, i elementów morfotycznych. Osocze to w ponad 90% woda, w której rozpuszczone są białka — albuminy utrzymujące ciśnienie onkotyczne krwi, globuliny, w tym przeciwciała, oraz fibrynogen — a także glukoza, lipidy, sole mineralne, hormony i produkty przemiany materii. Erytrocyty człowieka to bezjądrowe krążki o dwuwklęsłym kształcie, wypełnione hemoglobiną; brak jądra i mitochondriów zostawia więcej miejsca na hemoglobinę, a kształt zwiększa powierzchnię wymiany gazów. Powstają w szpiku kostnym czerwonym pod wpływem erytropoetyny, żyją około 120 dni i są rozkładane w śledzionie i wątrobie. Leukocyty mają jądra i bronią organizm przed patogenami. Trombocyty, czyli płytki krwi, są bezjądrowymi fragmentami komórek szpiku i uczestniczą w krzepnięciu. Krew transportuje gazy oddechowe, substancje odżywcze, produkty przemiany materii i hormony, chroni przed drobnoustrojami, zapobiega utracie krwi dzięki krzepnięciu, rozprowadza ciepło i utrzymuje stałe pH.

ROLA KRWI W TRANSPORCIE GAZÓW
Tlen przenoszony jest niemal wyłącznie przez hemoglobinę w erytrocytach, a dwutlenek węgla — głównie w postaci jonów wodorowęglanowych w osoczu, a w mniejszym stopniu w połączeniu z hemoglobiną i w postaci rozpuszczonej.

KRZEPNIĘCIE KRWI
Krzepnięcie chroni organizm przed utratą krwi po uszkodzeniu naczynia, a więc przed zaburzeniem homeostazy. Najpierw uszkodzone naczynie obkurcza się, a płytki krwi przylegają do jego ściany i tworzą czop płytkowy. Następnie uszkodzone tkanki i płytki uwalniają czynniki krzepnięcia, które uruchamiają kaskadę reakcji z udziałem jonów wapnia; część czynników krzepnięcia wątroba wytwarza przy udziale witaminy K. W wyniku tych reakcji nieaktywna protrombina przekształca się w enzym trombinę, a trombina przekształca rozpuszczony w osoczu fibrynogen w nierozpuszczalną fibrynę. Nici fibryny tworzą sieć, w której zatrzymują się krwinki — powstaje skrzep. Zbyt słabe krzepnięcie, np. w hemofilii lub przy niedoborze witaminy K, grozi krwotokami, a nadmierne — zakrzepami, które mogą zamknąć naczynie i spowodować zawał lub udar.

BUDOWA I FUNKCJA NACZYŃ KRWIONOŚNYCH
Tętnice prowadzą krew z serca. Mają grube ściany z dużą ilością włókien sprężystych i mięśni gładkich, dzięki czemu wytrzymują wysokie ciśnienie i wyrównują pulsujący przepływ krwi. Żyły prowadzą krew do serca pod niskim ciśnieniem, mają cieńsze ściany i szersze światło oraz zastawki zapobiegające cofaniu się krwi; przepływ krwi w żyłach kończyn wspomagają skurcze otaczających je mięśni szkieletowych. Naczynia włosowate mają ścianę złożoną z jednej warstwy komórek śródbłonka i bardzo małą średnicę, tworzą sieć o ogromnej łącznej powierzchni, a krew płynie w nich wolno — dlatego to w nich zachodzi wymiana gazów, substancji odżywczych i produktów przemiany materii między krwią a tkankami.

UKŁAD LIMFATYCZNY
Część osocza przesącza się przez ściany naczyń włosowatych i tworzy płyn tkankowy. Większość tego płynu wraca do naczyń krwionośnych, a jego nadmiar wchłaniają ślepo zaczynające się naczynia limfatyczne — płyn ten nazywamy limfą (chłonką). Naczynia limfatyczne mają zastawki i uchodzą do dużych żył w pobliżu serca, zwracając płyn do krwi. Po drodze limfa przepływa przez węzły chłonne, w których jest oczyszczana, a limfocyty zwalczają drobnoustroje. Naczynia chłonne kosmków jelitowych transportują wchłonięte tłuszcze. Układ limfatyczny zapobiega więc obrzękom, uczestniczy w obronie organizmu i w transporcie lipidów.
''',
        flashcards: [
          Flashcard(id: 'f_k3_kr_11', front: 'Jaki jest skład krwi?', back: 'Osocze (ok. 55% objętości) i elementy morfotyczne: erytrocyty, leukocyty i trombocyty.'),
          Flashcard(id: 'f_k3_kr_12', front: 'Jaka jest korzyść z braku jądra w erytrocytach człowieka?', back: 'Zostaje więcej miejsca na hemoglobinę.'),
          Flashcard(id: 'f_k3_kr_13', front: 'Jak długo żyją erytrocyty i gdzie są rozkładane?', back: 'Około 120 dni; rozkładane są w śledzionie i wątrobie.'),
          Flashcard(id: 'f_k3_kr_14', front: 'Który hormon pobudza wytwarzanie erytrocytów?', back: 'Erytropoetyna.'),
          Flashcard(id: 'f_k3_kr_15', front: 'Wymień funkcje krwi.', back: 'Transport gazów, substancji odżywczych, produktów przemiany materii i hormonów, obrona, krzepnięcie, rozprowadzanie ciepła, utrzymanie pH.'),
          Flashcard(id: 'f_k3_kr_16', front: 'Jakie znaczenie ma krzepnięcie krwi dla homeostazy?', back: 'Zapobiega utracie krwi po uszkodzeniu naczynia.'),
          Flashcard(id: 'f_k3_kr_17', front: 'Opisz kluczowy etap krzepnięcia krwi.', back: 'Trombina przekształca rozpuszczalny fibrynogen w nierozpuszczalną fibrynę, której nici tworzą skrzep.'),
          Flashcard(id: 'f_k3_kr_18', front: 'Jakie substancje są niezbędne do krzepnięcia krwi?', back: 'Czynniki krzepnięcia, jony wapnia oraz witamina K.'),
          Flashcard(id: 'f_k3_kr_19', front: 'Dlaczego tętnice mają grube i sprężyste ściany?', back: 'Wytrzymują wysokie ciśnienie i wyrównują pulsujący przepływ krwi.'),
          Flashcard(id: 'f_k3_kr_20', front: 'Po co żyłom zastawki?', back: 'Zapobiegają cofaniu się krwi płynącej pod niskim ciśnieniem.'),
          Flashcard(id: 'f_k3_kr_21', front: 'Dlaczego wymiana substancji zachodzi w naczyniach włosowatych?', back: 'Mają ścianę z jednej warstwy komórek, ogromną łączną powierzchnię, a krew płynie w nich wolno.'),
          Flashcard(id: 'f_k3_kr_22', front: 'Czym jest limfa i skąd się bierze?', back: 'Nadmiarem płynu tkankowego wchłoniętym przez naczynia limfatyczne.'),
          Flashcard(id: 'f_k3_kr_23', front: 'Jakie funkcje pełni układ limfatyczny?', back: 'Zwraca płyn tkankowy do krwi (zapobiega obrzękom), uczestniczy w obronie organizmu i transportuje wchłonięte tłuszcze.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k3_kr_8', question: 'Białkiem przekształcanym podczas krzepnięcia w nierozpuszczalne nici jest:', options: ['Albumina', 'Fibrynogen', 'Hemoglobina', 'Kolagen'], correctIndex: 1, explanation: 'Trombina przekształca fibrynogen w fibrynę.'),
          QuizQuestion(id: 'q_k3_kr_9', question: 'Zastawki zapobiegające cofaniu się krwi występują w:', options: ['Tętnicach', 'Żyłach', 'Naczyniach włosowatych', 'Aorcie na całej jej długości'], correctIndex: 1, explanation: 'Krew płynie w żyłach pod niskim ciśnieniem.'),
          QuizQuestion(id: 'q_k3_kr_10', question: 'Wymiana substancji między krwią a tkankami zachodzi w:', options: ['Tętnicach', 'Żyłach', 'Naczyniach włosowatych', 'Aorcie'], correctIndex: 2, explanation: 'Tylko ich cienka ściana umożliwia wymianę substancji.'),
          QuizQuestion(id: 'q_k3_kr_11', question: 'Niedobór witaminy K powoduje:', options: ['Nadmierne krzepnięcie krwi', 'Skłonność do krwawień', 'Niedokrwistość złośliwą', 'Obrzęki limfatyczne'], correctIndex: 1, explanation: 'Witamina K jest potrzebna do wytwarzania czynników krzepnięcia.'),
          QuizQuestion(id: 'q_k3_kr_12', question: 'Erytrocyty człowieka powstają w:', options: ['Śledzionie', 'Szpiku kostnym czerwonym', 'Węzłach chłonnych', 'Grasicy'], correctIndex: 1, explanation: 'Śledziona i wątroba je rozkładają.'),
          QuizQuestion(id: 'q_k3_kr_13', question: 'Naczynia limfatyczne uchodzą do:', options: ['Tętnic płucnych', 'Dużych żył w pobliżu serca', 'Naczyń włosowatych płuc', 'Aorty brzusznej'], correctIndex: 1, explanation: 'Dzięki temu limfa wraca do krwi.'),
          QuizQuestion(id: 'q_k3_kr_14', question: 'Osocze stanowi około:', options: ['10% objętości krwi', '55% objętości krwi', '90% objętości krwi', '100% objętości krwi'], correctIndex: 1, explanation: 'Resztę stanowią elementy morfotyczne.'),
          QuizQuestion(id: 'q_k3_kr_15', question: 'Albuminy osocza odpowiadają przede wszystkim za:', options: ['Krzepnięcie krwi', 'Utrzymanie ciśnienia onkotycznego krwi', 'Transport tlenu', 'Wytwarzanie przeciwciał'], correctIndex: 1, explanation: 'Utrzymują wodę w naczyniach krwionośnych.'),
        ],
      ),
      Topic(
        id: 'k3_krazenie_serce',
        name: 'Serce człowieka i choroby układu krążenia',
        theory: '''
BUDOWA SERCA CZŁOWIEKA
Serce leży w śródpiersiu, między płucami, i otacza je worek osierdziowy. Jego ścianę tworzy głównie mięsień sercowy. Serce ma cztery jamy: dwa przedsionki i dwie komory, a przegroda oddziela prawą połowę, zawierającą krew odtlenowaną, od lewej, zawierającej krew utlenowaną. Ściana lewej komory jest znacznie grubsza niż prawej, bo tłoczy ona krew do całego ciała pod wysokim ciśnieniem. Zastawki przedsionkowo-komorowe — trójdzielna po prawej stronie i dwudzielna po lewej — zapobiegają cofaniu się krwi z komór do przedsionków, a zastawki półksiężycowate u wylotu aorty i pnia płucnego — cofaniu się krwi do komór. Mięsień sercowy odżywiają naczynia wieńcowe, odchodzące od aorty.

OBIEGI KRWI
W obiegu płucnym prawa komora tłoczy krew odtlenowaną do pnia płucnego i tętnic płucnych. W naczyniach włosowatych płuc krew oddaje dwutlenek węgla i pobiera tlen, a następnie żyłami płucnymi wraca do lewego przedsionka. W obiegu ustrojowym lewa komora tłoczy krew utlenowaną do aorty, z której tętnice rozprowadzają ją po całym ciele. W naczyniach włosowatych narządów krew oddaje tlen i substancje odżywcze, a żyłami głównymi górną i dolną wraca do prawego przedsionka. Tętnice płucne są jedynymi tętnicami prowadzącymi krew odtlenowaną, a żyły płucne — jedynymi żyłami prowadzącymi krew utlenowaną.

CYKL PRACY SERCA
Cykl pracy serca obejmuje skurcz przedsionków, skurcz komór i rozkurcz całego serca. W czasie skurczu komór zastawki przedsionkowo-komorowe zamykają się, a półksiężycowate otwierają, i krew wypływa do tętnic. W spoczynku serce dorosłego człowieka kurczy się około 70 razy na minutę.

AUTOMATYZM PRACY SERCA
Serce kurczy się rytmicznie nawet bez impulsów z układu nerwowego, ponieważ ma własny układ bodźcotwórczo-przewodzący, zbudowany ze zmodyfikowanych komórek mięśnia sercowego. Impulsy powstają samoistnie w węźle zatokowo-przedsionkowym w ścianie prawego przedsionka, który jest naturalnym rozrusznikiem serca. Pobudzenie rozchodzi się po przedsionkach, powodując ich skurcz, i dociera do węzła przedsionkowo-komorowego, gdzie zostaje nieco opóźnione, dzięki czemu komory kurczą się dopiero po wypełnieniu krwią. Następnie pęczek przedsionkowo-komorowy (pęczek Hisa), jego odnogi i włókna Purkinjego przewodzą pobudzenie do mięśnia komór, wywołując ich skurcz. Układ nerwowy autonomiczny i hormony nie wywołują skurczów serca, lecz zmieniają ich częstość i siłę: układ współczulny i adrenalina przyspieszają pracę serca, a układ przywspółczulny ją zwalnia. Gdy węzeł zatokowo-przedsionkowy działa nieprawidłowo, jego funkcję może przejąć wszczepiony elektroniczny rozrusznik serca.

CHOROBY UKŁADU KRĄŻENIA A STYL ŻYCIA
Miażdżyca polega na odkładaniu się w ścianach tętnic blaszek miażdżycowych zawierających cholesterol, które zwężają światło naczyń i utrudniają przepływ krwi. Choroba wieńcowa to niedokrwienie mięśnia sercowego wskutek zwężenia tętnic wieńcowych, objawiające się bólem w klatce piersiowej, zwłaszcza podczas wysiłku. Zawał mięśnia sercowego następuje, gdy tętnica wieńcowa zostaje całkowicie zamknięta, np. przez zakrzep powstały na blaszce miażdżycowej, a pozbawiony tlenu fragment mięśnia obumiera. Udar mózgu powstaje wskutek zamknięcia naczynia mózgowego (udar niedokrwienny) lub jego pęknięcia (udar krwotoczny). Nadciśnienie tętnicze to utrzymujące się ciśnienie krwi wynoszące 140/90 mm Hg lub więcej; długo nie daje objawów, a uszkadza naczynia, serce, nerki i mózg. Żylaki to poszerzone, kręte żyły, najczęściej kończyn dolnych, powstające wskutek niewydolności zastawek żylnych; sprzyjają im długotrwałe stanie lub siedzenie i otyłość. Ryzyko chorób układu krążenia zwiększają palenie tytoniu, dieta bogata w tłuszcze nasycone, tłuszcze trans i sól, otyłość, mała aktywność fizyczna, nadużywanie alkoholu, przewlekły stres i cukrzyca. Zmniejszają je regularny ruch, zbilansowana dieta, niepalenie i utrzymywanie prawidłowej masy ciała.

BADANIA DIAGNOSTYCZNE
Regularny pomiar ciśnienia tętniczego pozwala wcześnie wykryć nadciśnienie. Elektrokardiografia (EKG) rejestruje elektryczną czynność serca i ujawnia zaburzenia rytmu, niedokrwienie oraz zawał. Badanie Holtera to całodobowy zapis EKG lub ciśnienia w czasie codziennej aktywności, wykrywający zaburzenia występujące tylko okresowo. USG serca (echokardiografia) obrazuje budowę i pracę serca, jego jamy i zastawki. Angiokardiografia (koronarografia) to rentgenowskie obrazowanie naczyń po podaniu środka kontrastowego, ukazujące zwężenia tętnic wieńcowych, które w czasie tego samego zabiegu można poszerzyć i zabezpieczyć stentem. Badania krwi, m.in. stężenia cholesterolu całkowitego, frakcji LDL i HDL, trójglicerydów i glukozy, pozwalają ocenić ryzyko miażdżycy.
''',
        flashcards: [
          Flashcard(id: 'f_k3_kr_24', front: 'Dlaczego ściana lewej komory jest grubsza niż prawej?', back: 'Lewa komora tłoczy krew do całego ciała pod wysokim ciśnieniem.'),
          Flashcard(id: 'f_k3_kr_25', front: 'Jaką rolę pełnią zastawki przedsionkowo-komorowe?', back: 'Zapobiegają cofaniu się krwi z komór do przedsionków.'),
          Flashcard(id: 'f_k3_kr_26', front: 'Opisz drogę krwi w obiegu płucnym.', back: 'Prawa komora → tętnice płucne → naczynia włosowate płuc → żyły płucne → lewy przedsionek.'),
          Flashcard(id: 'f_k3_kr_27', front: 'Opisz drogę krwi w obiegu ustrojowym.', back: 'Lewa komora → aorta → tętnice → naczynia włosowate narządów → żyły główne → prawy przedsionek.'),
          Flashcard(id: 'f_k3_kr_28', front: 'Które tętnice prowadzą krew odtlenowaną?', back: 'Tętnice płucne.'),
          Flashcard(id: 'f_k3_kr_29', front: 'Na czym polega automatyzm serca?', back: 'Serce kurczy się rytmicznie dzięki impulsom powstającym samoistnie w jego układzie bodźcotwórczo-przewodzącym.'),
          Flashcard(id: 'f_k3_kr_30', front: 'Gdzie powstają impulsy wywołujące skurcz serca?', back: 'W węźle zatokowo-przedsionkowym w ścianie prawego przedsionka.'),
          Flashcard(id: 'f_k3_kr_31', front: 'Po co impuls jest opóźniany w węźle przedsionkowo-komorowym?', back: 'Aby komory skurczyły się dopiero po wypełnieniu krwią.'),
          Flashcard(id: 'f_k3_kr_32', front: 'Jak układ autonomiczny wpływa na pracę serca?', back: 'Współczulny ją przyspiesza, a przywspółczulny zwalnia — żaden nie wywołuje jednak skurczów.'),
          Flashcard(id: 'f_k3_kr_33', front: 'Czym jest miażdżyca?', back: 'Odkładaniem się w ścianach tętnic blaszek zawierających cholesterol, które zwężają ich światło.'),
          Flashcard(id: 'f_k3_kr_34', front: 'Jak dochodzi do zawału mięśnia sercowego?', back: 'Tętnica wieńcowa zostaje całkowicie zamknięta, a pozbawiony tlenu fragment mięśnia obumiera.'),
          Flashcard(id: 'f_k3_kr_35', front: 'Od jakiej wartości rozpoznaje się nadciśnienie tętnicze?', back: 'Od utrzymującego się ciśnienia 140/90 mm Hg lub wyższego.'),
          Flashcard(id: 'f_k3_kr_36', front: 'Czym różni się EKG od badania Holtera?', back: 'EKG to krótki zapis elektrycznej czynności serca; Holter to zapis całodobowy, wykrywający zaburzenia okresowe.'),
          Flashcard(id: 'f_k3_kr_37', front: 'Do czego służy angiokardiografia (koronarografia)?', back: 'Do rentgenowskiego obrazowania naczyń z kontrastem i wykrywania zwężeń tętnic wieńcowych.'),
          Flashcard(id: 'f_k3_kr_38', front: 'Jakie czynniki zwiększają ryzyko chorób układu krążenia?', back: 'Palenie, dieta bogata w tłuszcze nasycone i sól, otyłość, brak ruchu, alkohol, stres, cukrzyca.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k3_kr_16', question: 'Krew utlenowana wraca z płuc do:', options: ['Prawego przedsionka', 'Lewego przedsionka', 'Prawej komory', 'Aorty'], correctIndex: 1, explanation: 'Żyły płucne uchodzą do lewego przedsionka.'),
          QuizQuestion(id: 'q_k3_kr_17', question: 'Naturalnym rozrusznikiem serca jest:', options: ['Węzeł przedsionkowo-komorowy', 'Węzeł zatokowo-przedsionkowy', 'Pęczek Hisa', 'Zastawka dwudzielna'], correctIndex: 1, explanation: 'To w nim samoistnie powstają impulsy.'),
          QuizQuestion(id: 'q_k3_kr_18', question: 'Zastawka dwudzielna znajduje się między:', options: ['Prawym przedsionkiem a prawą komorą', 'Lewym przedsionkiem a lewą komorą', 'Lewą komorą a aortą', 'Prawą komorą a pniem płucnym'], correctIndex: 1, explanation: 'Po prawej stronie serca leży zastawka trójdzielna.'),
          QuizQuestion(id: 'q_k3_kr_19', question: 'Serce pozbawione połączeń z układem nerwowym:', options: ['Przestaje się kurczyć', 'Nadal kurczy się rytmicznie', 'Kurczy się tylko pod wpływem woli', 'Kurczy się wyłącznie w czasie wysiłku'], correctIndex: 1, explanation: 'Dzięki automatyzmowi impulsy powstają w samym sercu.'),
          QuizQuestion(id: 'q_k3_kr_20', question: 'Układ przywspółczulny:', options: ['Przyspiesza pracę serca', 'Zwalnia pracę serca', 'Wywołuje skurcze serca', 'Nie wpływa na pracę serca'], correctIndex: 1, explanation: 'Przyspiesza ją układ współczulny.'),
          QuizQuestion(id: 'q_k3_kr_21', question: 'Całkowite zamknięcie tętnicy wieńcowej prowadzi do:', options: ['Żylaków', 'Zawału mięśnia sercowego', 'Udaru krwotocznego', 'Niedokrwistości'], correctIndex: 1, explanation: 'Fragment mięśnia sercowego pozbawiony tlenu obumiera.'),
          QuizQuestion(id: 'q_k3_kr_22', question: 'Całodobowy zapis EKG w czasie codziennej aktywności to:', options: ['Koronarografia', 'Badanie Holtera', 'Echokardiografia', 'Spirometria'], correctIndex: 1, explanation: 'Pozwala wykryć zaburzenia rytmu pojawiające się okresowo.'),
          QuizQuestion(id: 'q_k3_kr_23', question: 'Żylaki kończyn dolnych powstają wskutek:', options: ['Niewydolności zastawek żylnych', 'Zwężenia tętnic wieńcowych', 'Nadmiaru płytek krwi', 'Niedoboru witaminy K'], correctIndex: 0, explanation: 'Krew cofa się i zalega w żyłach, poszerzając je.'),
          QuizQuestion(id: 'q_k3_kr_24', question: 'Mięsień sercowy odżywiają naczynia:', options: ['Płucne', 'Wieńcowe', 'Wrotne', 'Limfatyczne'], correctIndex: 1, explanation: 'Tętnice wieńcowe odchodzą od aorty.'),
        ],
      ),
    ],
  ),

  // ===========================================================================
  // XI.4 WYDALANIE I OSMOREGULACJA
  // ===========================================================================
  Chapter(
    id: 'k3_wydalanie',
    name: 'Wydalanie i osmoregulacja',
    topics: [
      Topic(
        id: 'k3_wydalanie_zwierzeta',
        name: 'Osmoregulacja i wydalanie u zwierząt',
        theory: '''
ISTOTA WYDALANIA
Wydalanie to usuwanie z organizmu zbędnych i szkodliwych produktów przemiany materii — dwutlenku węgla, azotowych produktów rozkładu białek i kwasów nukleinowych, nadmiaru wody i soli mineralnych — oraz substancji obcych, np. leków. Wydalania nie należy mylić z defekacją, czyli usuwaniem niestrawionych resztek pokarmu, które nigdy nie weszły do komórek. U człowieka funkcje wydalnicze pełnią nerki (mocznik, nadmiar wody i soli), płuca (dwutlenek węgla i para wodna), skóra (pot zawierający wodę, sole i niewielką ilość mocznika) oraz wątroba (barwniki żółciowe usuwane wraz z żółcią).

AZOTOWE PRODUKTY PRZEMIANY MATERII A ŚRODOWISKO ŻYCIA
Podczas rozkładu aminokwasów powstaje amoniak. Jest on bardzo toksyczny, ale dobrze rozpuszcza się w wodzie i łatwo do niej przenika, dlatego wydalają go zwierzęta wodne — większość bezkręgowców wodnych, ryby kostnoszkieletowe i larwy płazów. Mocznik jest znacznie mniej toksyczny i może być czasowo gromadzony, ale jego wytworzenie wymaga energii, a usunięcie — pewnej ilości wody; wydalają go ssaki, dorosłe płazy i ryby chrzęstnoszkieletowe. Kwas moczowy jest najmniej toksyczny i słabo rozpuszcza się w wodzie, więc może być usuwany w postaci półstałej przy minimalnej utracie wody, choć jego synteza wymaga najwięcej energii. Wydalają go owady, gady i ptaki — to przystosowanie do oszczędzania wody na lądzie, a u zarodków rozwijających się w jajach z twardą osłonką pozwala gromadzić produkty przemiany azotowej bez zatrucia.

OSMOREGULACJA U ZWIERZĄT ŻYJĄCYCH W RÓŻNYCH ŚRODOWISKACH
Zwierzęta muszą utrzymywać stałe stężenie płynów ustrojowych. Ryby słodkowodne żyją w środowisku hipotonicznym: woda stale wnika do ich organizmu przez skrzela, a sole są tracone. Nie piją więc wody, wydalają duże ilości silnie rozcieńczonego moczu i aktywnie pobierają jony przez skrzela. Ryby morskie kostnoszkieletowe żyją w środowisku hipertonicznym i tracą wodę przez osmozę: piją wodę morską, wydalają niewielkie ilości moczu, a nadmiar soli aktywnie usuwają przez skrzela. Ryby chrzęstnoszkieletowe, np. rekiny, zatrzymują we krwi mocznik, dzięki czemu stężenie ich płynów ustrojowych jest zbliżone do stężenia wody morskiej. Zwierzęta lądowe muszą przede wszystkim ograniczać utratę wody — mają mało przepuszczalne pokrycie ciała, wytwarzają zagęszczony mocz lub wydalają kwas moczowy, a ptaki i gady morskie usuwają nadmiar soli przez gruczoły solne. Protisty słodkowodne pozbywają się nadmiaru wody za pomocą wodniczek tętniących.

UKŁADY WYDALNICZE ZWIERZĄT
Płazińce mają protonefrydia — kanaliki zakończone komórkami płomykowymi, których rzęski wprawiają płyn w ruch; służą głównie do usuwania nadmiaru wody, a produkty azotowe usuwane są także całą powierzchnią ciała. Pierścienice mają metanefrydia, występujące parami w segmentach ciała: zaczynają się orzęsionym lejkiem otwartym do jamy ciała i uchodzą na zewnątrz, a w ich kanaliku zachodzi zwrotne wchłanianie potrzebnych substancji. Owady mają cewki Malpighiego, uchodzące do przewodu pokarmowego: pobierają one produkty przemiany materii z hemolimfy, które wraz z resztkami pokarmu są usuwane w postaci kwasu moczowego, a woda jest odzyskiwana w jelicie. Kręgowce mają nerki zbudowane z nefronów, w których filtrowana jest krew.
''',
        flashcards: [
          Flashcard(id: 'f_k3_wyd_1', front: 'Czym różni się wydalanie od defekacji?', back: 'Wydalanie usuwa produkty przemiany materii, a defekacja — niestrawione resztki pokarmu.'),
          Flashcard(id: 'f_k3_wyd_2', front: 'Które narządy człowieka pełnią funkcje wydalnicze?', back: 'Nerki, płuca, skóra i wątroba.'),
          Flashcard(id: 'f_k3_wyd_3', front: 'Dlaczego zwierzęta wodne mogą wydalać amoniak?', back: 'Amoniak dobrze rozpuszcza się w wodzie i szybko się w niej rozcieńcza, więc nie zatruwa organizmu.'),
          Flashcard(id: 'f_k3_wyd_4', front: 'Które zwierzęta wydalają mocznik?', back: 'Ssaki, dorosłe płazy i ryby chrzęstnoszkieletowe.'),
          Flashcard(id: 'f_k3_wyd_5', front: 'Dlaczego ptaki i gady wydalają kwas moczowy?', back: 'Jest najmniej toksyczny i słabo rozpuszczalny, więc można go usuwać z minimalną utratą wody.'),
          Flashcard(id: 'f_k3_wyd_6', front: 'Jak ryby słodkowodne radzą sobie z nadmiarem wody?', back: 'Nie piją, wydalają dużo rozcieńczonego moczu i aktywnie pobierają jony przez skrzela.'),
          Flashcard(id: 'f_k3_wyd_7', front: 'Jak ryby morskie kostnoszkieletowe zapobiegają utracie wody?', back: 'Piją wodę morską, wydalają mało moczu, a nadmiar soli usuwają przez skrzela.'),
          Flashcard(id: 'f_k3_wyd_8', front: 'Jak rekiny utrzymują równowagę osmotyczną z wodą morską?', back: 'Zatrzymują we krwi mocznik.'),
          Flashcard(id: 'f_k3_wyd_9', front: 'Czym są protonefrydia i u kogo występują?', back: 'Kanalikami zakończonymi komórkami płomykowymi — występują u płazińców.'),
          Flashcard(id: 'f_k3_wyd_10', front: 'Czym są metanefrydia i u kogo występują?', back: 'Parzystymi kanalikami zaczynającymi się orzęsionym lejkiem w jamie ciała — występują u pierścienic.'),
          Flashcard(id: 'f_k3_wyd_11', front: 'Jak działają cewki Malpighiego?', back: 'Pobierają produkty przemiany materii z hemolimfy i odprowadzają je do jelita, gdzie odzyskiwana jest woda.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k3_wyd_1', question: 'Kwas moczowy wydalają:', options: ['Ryby kostnoszkieletowe', 'Ptaki', 'Ssaki', 'Larwy płazów'], correctIndex: 1, explanation: 'Wydalają go także gady i owady.'),
          QuizQuestion(id: 'q_k3_wyd_2', question: 'Najbardziej toksycznym azotowym produktem przemiany materii jest:', options: ['Mocznik', 'Kwas moczowy', 'Amoniak', 'Kreatynina'], correctIndex: 2, explanation: 'Dlatego wydalają go głównie zwierzęta wodne.'),
          QuizQuestion(id: 'q_k3_wyd_3', question: 'Ryby słodkowodne:', options: ['Piją dużo wody', 'Wydalają duże ilości rozcieńczonego moczu', 'Usuwają nadmiar soli przez skrzela', 'Wydalają kwas moczowy'], correctIndex: 1, explanation: 'Woda stale wnika do ich organizmu ze środowiska hipotonicznego.'),
          QuizQuestion(id: 'q_k3_wyd_4', question: 'Metanefrydia występują u:', options: ['Płazińców', 'Pierścienic', 'Owadów', 'Ryb'], correctIndex: 1, explanation: 'Płazińce mają protonefrydia, a owady cewki Malpighiego.'),
          QuizQuestion(id: 'q_k3_wyd_5', question: 'Cewki Malpighiego uchodzą do:', options: ['Jamy ciała', 'Przewodu pokarmowego', 'Tchawek', 'Serca'], correctIndex: 1, explanation: 'Produkty przemiany materii są usuwane wraz z resztkami pokarmu.'),
          QuizQuestion(id: 'q_k3_wyd_6', question: 'Wydalanie kwasu moczowego jest przystosowaniem do:', options: ['Życia w wodzie słodkiej', 'Oszczędzania wody na lądzie', 'Szybkiego wzrostu', 'Oddychania skrzelami'], correctIndex: 1, explanation: 'Kwas moczowy usuwa się przy minimalnej utracie wody.'),
          QuizQuestion(id: 'q_k3_wyd_7', question: 'Funkcji wydalniczej NIE pełni:', options: ['Nerka', 'Płuco', 'Skóra', 'Śledziona'], correctIndex: 3, explanation: 'Śledziona jest narządem limfatycznym.'),
        ],
      ),
      Topic(
        id: 'k3_wydalanie_czlowiek',
        name: 'Układ moczowy człowieka',
        theory: '''
BUDOWA UKŁADU MOCZOWEGO
Układ moczowy tworzą nerki, moczowody, pęcherz moczowy i cewka moczowa. Nerki leżą w jamie brzusznej po obu stronach kręgosłupa. Na przekroju nerki widać zewnętrzną korę, rdzeń z piramidami nerkowymi i miedniczkę nerkową, do której spływa mocz. Podstawową jednostką budowy i czynności nerki jest nefron — każda nerka zawiera ich około miliona. Nefron składa się z ciałka nerkowego, czyli kłębuszka naczyń włosowatych otoczonego torebką, oraz kanalika nerkowego, w którym wyróżnia się kanalik kręty pierwszego rzędu, pętlę nefronu i kanalik kręty drugiego rzędu, uchodzący do kanalika zbiorczego. Moczowody odprowadzają mocz do pęcherza moczowego, w którym jest gromadzony, a cewka moczowa wyprowadza go na zewnątrz.

TWORZENIE MOCZU
Mocz powstaje w trzech etapach. Filtracja zachodzi w ciałku nerkowym: pod wpływem wysokiego ciśnienia krwi w kłębuszku woda i drobne cząsteczki — glukoza, aminokwasy, sole i mocznik — przechodzą do torebki, tworząc mocz pierwotny, którego w ciągu doby powstaje około 150–180 litrów. Białka i komórki krwi pozostają w naczyniach. Podczas resorpcji zwrotnej, zachodzącej w kanaliku nerkowym, do krwi wraca około 99% wody, w warunkach prawidłowych cała glukoza i wszystkie aminokwasy, a także większość jonów sodu i innych soli. Sekrecja kanalikowa polega na aktywnym wydzielaniu z krwi do kanalika substancji, których organizm musi się pozbyć — m.in. jonów wodorowych i potasowych, niektórych leków i toksyn — co pomaga utrzymać stałe pH krwi. W efekcie powstaje około 1,5 litra moczu ostatecznego na dobę, zawierającego wodę, mocznik, kwas moczowy, kreatyninę i sole mineralne. Glukoza w moczu, np. w nieleczonej cukrzycy, świadczy o tym, że jej stężenie we krwi przekroczyło możliwości resorpcji.

REGULACJA HORMONALNA TWORZENIA MOCZU
Wazopresyna (hormon antydiuretyczny) jest wytwarzana w podwzgórzu i uwalniana z tylnego płata przysadki, gdy rośnie ciśnienie osmotyczne krwi, np. przy odwodnieniu. Zwiększa przepuszczalność kanalików zbiorczych dla wody, dzięki czemu więcej wody wraca do krwi, a powstaje mniej, bardziej zagęszczonego moczu. Alkohol hamuje wydzielanie wazopresyny, dlatego zwiększa ilość wydalanego moczu i odwadnia organizm. Aldosteron, hormon kory nadnerczy, zwiększa zwrotne wchłanianie jonów sodu, a wraz z nimi wody, oraz wydalanie jonów potasu, co podnosi objętość krwi i ciśnienie tętnicze. Przedsionkowy peptyd natriuretyczny, wydzielany przez przedsionki serca przy wzroście objętości krwi, działa przeciwnie — zwiększa wydalanie sodu i wody.

BADANIE OGÓLNE MOCZU
Badanie ogólne moczu jest proste, tanie i nieinwazyjne. Ocenia się w nim barwę, przejrzystość, ciężar właściwy i odczyn moczu, a także obecność substancji, które w prawidłowym moczu nie występują lub występują w śladowych ilościach: glukozy, która może wskazywać na cukrzycę, białka, świadczącego o uszkodzeniu nerek, krwi, pojawiającej się m.in. w kamicy, stanach zapalnych i nowotworach, leukocytów i bakterii, wskazujących na zakażenie dróg moczowych, oraz ciał ketonowych. Badanie wykonuje się profilaktycznie, w czasie ciąży oraz przy podejrzeniu chorób nerek i dróg moczowych.

DIALIZA
Przy ciężkiej niewydolności nerek w organizmie gromadzą się mocznik, woda i jony potasu, co grozi zatruciem i zaburzeniami pracy serca. Stosuje się wtedy dializę. W hemodializie krew pacjenta przepływa przez dializator, w którym od płynu dializacyjnego oddziela ją błona półprzepuszczalna: zbędne substancje przechodzą przez nią do płynu na drodze dyfuzji, a nadmiar wody zostaje usunięty. Zabieg trwa kilka godzin i powtarza się go zwykle trzy razy w tygodniu. W dializie otrzewnowej funkcję błony pełni otrzewna pacjenta, a płyn dializacyjny wprowadza się do jamy brzusznej. Dializa zastępuje wydalniczą funkcję nerek, ale nie ich funkcje hormonalne, dlatego najlepszym rozwiązaniem pozostaje przeszczepienie nerki.
''',
        flashcards: [
          Flashcard(id: 'f_k3_wyd_12', front: 'Z czego zbudowany jest nefron?', back: 'Z ciałka nerkowego (kłębuszka naczyń włosowatych i torebki) oraz kanalika nerkowego.'),
          Flashcard(id: 'f_k3_wyd_13', front: 'Wymień etapy tworzenia moczu.', back: 'Filtracja, resorpcja zwrotna i sekrecja kanalikowa.'),
          Flashcard(id: 'f_k3_wyd_14', front: 'Gdzie zachodzi filtracja i co w jej wyniku powstaje?', back: 'W ciałku nerkowym; powstaje mocz pierwotny — ok. 150–180 litrów na dobę.'),
          Flashcard(id: 'f_k3_wyd_15', front: 'Które składniki krwi nie przechodzą do moczu pierwotnego?', back: 'Białka i komórki krwi.'),
          Flashcard(id: 'f_k3_wyd_16', front: 'Co wraca do krwi podczas resorpcji zwrotnej?', back: 'Około 99% wody, cała glukoza i aminokwasy oraz większość soli.'),
          Flashcard(id: 'f_k3_wyd_17', front: 'Na czym polega sekrecja kanalikowa?', back: 'Na aktywnym wydzielaniu z krwi do kanalika m.in. jonów wodorowych i potasowych, leków i toksyn.'),
          Flashcard(id: 'f_k3_wyd_18', front: 'Ile moczu ostatecznego wydala dorosły człowiek na dobę?', back: 'Około 1,5 litra.'),
          Flashcard(id: 'f_k3_wyd_19', front: 'Jak działa wazopresyna?', back: 'Zwiększa przepuszczalność kanalików zbiorczych dla wody, więc powstaje mniej, bardziej zagęszczonego moczu.'),
          Flashcard(id: 'f_k3_wyd_20', front: 'Dlaczego alkohol odwadnia organizm?', back: 'Hamuje wydzielanie wazopresyny, więc nerki wydalają więcej wody.'),
          Flashcard(id: 'f_k3_wyd_21', front: 'Jak działa aldosteron?', back: 'Zwiększa zwrotne wchłanianie sodu i wody oraz wydalanie potasu.'),
          Flashcard(id: 'f_k3_wyd_22', front: 'Co może oznaczać glukoza w moczu?', back: 'Cukrzycę — stężenie glukozy we krwi przekroczyło możliwości resorpcji w nerkach.'),
          Flashcard(id: 'f_k3_wyd_23', front: 'Na czym polega hemodializa?', back: 'Krew przepływa przez dializator, gdzie zbędne substancje przechodzą przez błonę półprzepuszczalną do płynu dializacyjnego.'),
          Flashcard(id: 'f_k3_wyd_24', front: 'Dlaczego przeszczep nerki jest lepszy od dializy?', back: 'Dializa nie zastępuje funkcji hormonalnych nerek.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k3_wyd_8', question: 'Filtracja krwi zachodzi w:', options: ['Pętli nefronu', 'Ciałku nerkowym', 'Kanaliku zbiorczym', 'Miedniczce nerkowej'], correctIndex: 1, explanation: 'W kłębuszku panuje wysokie ciśnienie krwi, które wymusza przesączanie.'),
          QuizQuestion(id: 'q_k3_wyd_9', question: 'W prawidłowym moczu ostatecznym NIE powinno być:', options: ['Mocznika', 'Glukozy', 'Soli mineralnych', 'Wody'], correctIndex: 1, explanation: 'Glukoza w całości wraca do krwi podczas resorpcji.'),
          QuizQuestion(id: 'q_k3_wyd_10', question: 'Wazopresyna powoduje:', options: ['Wydalanie większej ilości rozcieńczonego moczu', 'Zatrzymanie wody w organizmie', 'Wydalanie glukozy', 'Zwiększone wydalanie sodu'], correctIndex: 1, explanation: 'Zwiększa zwrotne wchłanianie wody w kanalikach zbiorczych.'),
          QuizQuestion(id: 'q_k3_wyd_11', question: 'Dobowa objętość moczu pierwotnego wynosi około:', options: ['1,5 litra', '15 litrów', '150–180 litrów', '1000 litrów'], correctIndex: 2, explanation: 'Ponad 99% tej objętości wraca do krwi.'),
          QuizQuestion(id: 'q_k3_wyd_12', question: 'Aldosteron wytwarzany jest w:', options: ['Przysadce', 'Korze nadnerczy', 'Nerkach', 'Tarczycy'], correctIndex: 1, explanation: 'Reguluje gospodarkę sodem i potasem.'),
          QuizQuestion(id: 'q_k3_wyd_13', question: 'Obecność białka w moczu może świadczyć o:', options: ['Prawidłowej pracy nerek', 'Uszkodzeniu nerek', 'Nadmiarze wody w diecie', 'Wysiłku umysłowym'], correctIndex: 1, explanation: 'Białka w prawidłowych warunkach nie przechodzą przez filtr kłębuszka.'),
          QuizQuestion(id: 'q_k3_wyd_14', question: 'W hemodializie zbędne substancje przechodzą z krwi do płynu dializacyjnego na drodze:', options: ['Transportu aktywnego', 'Dyfuzji przez błonę półprzepuszczalną', 'Fagocytozy', 'Filtracji w kłębuszku'], correctIndex: 1, explanation: 'Przemieszczają się zgodnie z różnicą stężeń.'),
          QuizQuestion(id: 'q_k3_wyd_15', question: 'Mocz z nerki do pęcherza moczowego odprowadza:', options: ['Cewka moczowa', 'Moczowód', 'Kanalik zbiorczy', 'Miedniczka nerkowa'], correctIndex: 1, explanation: 'Cewka moczowa wyprowadza mocz z pęcherza na zewnątrz.'),
        ],
      ),
    ],
  ),

  // ===========================================================================
  // XI.5 REGULACJA HORMONALNA
  // ===========================================================================
  Chapter(
    id: 'k3_hormony',
    name: 'Regulacja hormonalna',
    topics: [
      Topic(
        id: 'k3_hormony_gruczoly',
        name: 'Hormony i gruczoły dokrewne',
        theory: '''
HORMONY
Hormony to substancje wydzielane do krwi przez gruczoły dokrewne i niektóre wyspecjalizowane komórki. Już w bardzo małych ilościach regulują czynności komórek docelowych, czyli tych, które mają odpowiednie receptory. W porównaniu z impulsami nerwowymi działają wolniej, ale dłużej. Ze względu na budowę chemiczną dzieli się je na hormony steroidowe, będące pochodnymi cholesterolu — hormony kory nadnerczy (kortyzol, aldosteron) oraz hormony płciowe (testosteron, estrogeny, progesteron) — i hormony niesteroidowe: pochodne aminokwasów (np. adrenalina i hormony tarczycy) oraz hormony peptydowe i białkowe (np. insulina, glukagon, hormon wzrostu, wazopresyna).

MECHANIZM DZIAŁANIA HORMONÓW
Hormony steroidowe rozpuszczają się w lipidach, więc przenikają przez błonę komórkową i łączą się z receptorami w cytoplazmie lub w jądrze. Kompleks hormon–receptor wiąże się z DNA i zmienia ekspresję określonych genów, co prowadzi do syntezy nowych białek — działanie jest wolniejsze, ale długotrwałe. Hormony peptydowe i większość pochodnych aminokwasów nie przenikają przez błonę komórkową. Łączą się z receptorami na jej powierzchni, a receptor uruchamia wewnątrz komórki przekaźnik drugiego rzędu, np. cykliczny AMP, który aktywuje enzymy i szybko zmienia metabolizm komórki. Wyjątkiem są hormony tarczycy: choć są pochodnymi aminokwasów, wnikają do komórki i działają na receptory w jądrze.

GRUCZOŁY DOKREWNE CZŁOWIEKA I ICH HORMONY
Podwzgórze wytwarza hormony uwalniające (liberyny) i hamujące (statyny), które sterują pracą przysadki, a także wazopresynę i oksytocynę, magazynowane i uwalniane przez tylny płat przysadki. Przedni płat przysadki wydziela hormon wzrostu, prolaktynę (pobudzającą wytwarzanie mleka), tyreotropinę (TSH), kortykotropinę (ACTH) oraz hormony gonadotropowe: folikulotropowy (FSH) i luteinizujący (LH). Wazopresyna zmniejsza wydalanie wody przez nerki, a oksytocyna wywołuje skurcze macicy podczas porodu i wypływ mleka z gruczołów mlekowych. Szyszynka wydziela melatoninę, regulującą rytm dobowy. Tarczyca wydziela tyroksynę i trijodotyroninę, regulujące tempo przemiany materii, oraz kalcytoninę, obniżającą stężenie wapnia we krwi. Przytarczyce wydzielają parathormon, który to stężenie podwyższa. Grasica wytwarza hormony uczestniczące w dojrzewaniu limfocytów T. Komórki wysepek trzustkowych wydzielają insulinę i glukagon. Kora nadnerczy wydziela kortyzol i aldosteron, a rdzeń nadnerczy — adrenalinę i noradrenalinę. Jądra wydzielają testosteron, a jajniki — estrogeny i progesteron.

KOORDYNACJA UKŁADU HORMONALNEGO I NERWOWEGO
Podwzgórze jest częścią mózgowia i stanowi łącznik między układem nerwowym a hormonalnym: odbiera informacje z układu nerwowego i przekłada je na sygnały hormonalne. Jego liberyny i statyny docierają naczyniami krwionośnymi do przedniego płata przysadki i pobudzają lub hamują wydzielanie jej hormonów. Przysadka wydziela z kolei hormony tropowe — TSH, ACTH, FSH i LH — pobudzające inne gruczoły dokrewne: tarczycę, korę nadnerczy i gonady. Dlatego podwzgórzu i przysadce przypisuje się nadrzędną rolę w układzie hormonalnym.

SPRZĘŻENIE ZWROTNE UJEMNE NA OSI PODWZGÓRZE–PRZYSADKA–GRUCZOŁ
Wydzielanie wielu hormonów regulowane jest przez ujemne sprzężenie zwrotne. Podwzgórze wydziela tyreoliberynę, która pobudza przysadkę do wydzielania TSH, a TSH pobudza tarczycę do wydzielania tyroksyny. Gdy stężenie tyroksyny we krwi rośnie, hamuje ona wydzielanie tyreoliberyny i TSH, więc produkcja tyroksyny maleje; gdy tyroksyny jest mało, hamowanie słabnie i jej wydzielanie wzrasta. W taki sam sposób regulowane są osie kortykoliberyna–ACTH–kortyzol wydzielany przez korę nadnerczy oraz gonadoliberyna–FSH i LH–hormony płciowe wydzielane przez gonady. Dzięki temu stężenie hormonów utrzymuje się na względnie stałym poziomie.
''',
        flashcards: [
          Flashcard(id: 'f_k3_hor_1', front: 'Czym różni się regulacja hormonalna od nerwowej pod względem szybkości i czasu działania?', back: 'Hormony działają wolniej, ale dłużej niż impulsy nerwowe.'),
          Flashcard(id: 'f_k3_hor_2', front: 'Podaj przykłady hormonów steroidowych.', back: 'Kortyzol, aldosteron, testosteron, estrogeny, progesteron.'),
          Flashcard(id: 'f_k3_hor_3', front: 'Jak działają hormony steroidowe?', back: 'Przenikają przez błonę, łączą się z receptorem wewnątrz komórki i zmieniają ekspresję genów.'),
          Flashcard(id: 'f_k3_hor_4', front: 'Jak działają hormony peptydowe?', back: 'Łączą się z receptorem na błonie komórkowej, który uruchamia przekaźnik drugiego rzędu (np. cAMP) aktywujący enzymy.'),
          Flashcard(id: 'f_k3_hor_5', front: 'Dlaczego hormony tarczycy są wyjątkiem wśród pochodnych aminokwasów?', back: 'Wnikają do komórki i działają na receptory w jądrze.'),
          Flashcard(id: 'f_k3_hor_6', front: 'Jakie hormony wydziela przedni płat przysadki?', back: 'Hormon wzrostu, prolaktynę, TSH, ACTH, FSH i LH.'),
          Flashcard(id: 'f_k3_hor_7', front: 'Gdzie powstaje, a skąd jest uwalniana wazopresyna?', back: 'Powstaje w podwzgórzu, a uwalniana jest z tylnego płata przysadki.'),
          Flashcard(id: 'f_k3_hor_8', front: 'Jaki hormon wydziela szyszynka i za co odpowiada?', back: 'Melatoninę — reguluje rytm dobowy.'),
          Flashcard(id: 'f_k3_hor_9', front: 'Jakie hormony wydziela kora, a jakie rdzeń nadnerczy?', back: 'Kora — kortyzol i aldosteron; rdzeń — adrenalinę i noradrenalinę.'),
          Flashcard(id: 'f_k3_hor_10', front: 'Dlaczego podwzgórze łączy układ nerwowy z hormonalnym?', back: 'Odbiera informacje z układu nerwowego i wydziela hormony sterujące przysadką.'),
          Flashcard(id: 'f_k3_hor_11', front: 'Czym są hormony tropowe?', back: 'Hormonami przysadki pobudzającymi inne gruczoły dokrewne, np. TSH, ACTH, FSH i LH.'),
          Flashcard(id: 'f_k3_hor_12', front: 'Opisz ujemne sprzężenie zwrotne na osi podwzgórze–przysadka–tarczyca.', back: 'Tyreoliberyna pobudza wydzielanie TSH, a TSH — tyroksyny; wysokie stężenie tyroksyny hamuje podwzgórze i przysadkę, więc jej wydzielanie spada.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k3_hor_1', question: 'Hormonem steroidowym jest:', options: ['Insulina', 'Kortyzol', 'Adrenalina', 'Wazopresyna'], correctIndex: 1, explanation: 'Kortyzol jest pochodną cholesterolu.'),
          QuizQuestion(id: 'q_k3_hor_2', question: 'Receptory hormonów steroidowych znajdują się:', options: ['Wyłącznie na powierzchni błony komórkowej', 'Wewnątrz komórki', 'W osoczu krwi', 'W ścianach naczyń krwionośnych'], correctIndex: 1, explanation: 'Hormony steroidowe przenikają przez błonę dzięki rozpuszczalności w lipidach.'),
          QuizQuestion(id: 'q_k3_hor_3', question: 'Z tylnego płata przysadki uwalniana jest:', options: ['Tyreotropina', 'Oksytocyna', 'Prolaktyna', 'Hormon wzrostu'], correctIndex: 1, explanation: 'Tylny płat przysadki uwalnia oksytocynę i wazopresynę wytworzone w podwzgórzu.'),
          QuizQuestion(id: 'q_k3_hor_4', question: 'Parathormon wydzielają:', options: ['Tarczyca', 'Przytarczyce', 'Nadnercza', 'Trzustka'], correctIndex: 1, explanation: 'Parathormon podwyższa stężenie wapnia we krwi.'),
          QuizQuestion(id: 'q_k3_hor_5', question: 'Nadrzędną rolę w układzie hormonalnym pełnią:', options: ['Nadnercza i trzustka', 'Podwzgórze i przysadka', 'Tarczyca i przytarczyce', 'Jądra i jajniki'], correctIndex: 1, explanation: 'Sterują pracą innych gruczołów dokrewnych.'),
          QuizQuestion(id: 'q_k3_hor_6', question: 'Wzrost stężenia tyroksyny we krwi powoduje:', options: ['Wzrost wydzielania TSH', 'Spadek wydzielania TSH', 'Wzrost wydzielania tyreoliberyny', 'Powiększenie tarczycy'], correctIndex: 1, explanation: 'To ujemne sprzężenie zwrotne.'),
          QuizQuestion(id: 'q_k3_hor_7', question: 'ACTH pobudza do wydzielania hormonów:', options: ['Tarczycę', 'Korę nadnerczy', 'Rdzeń nadnerczy', 'Gonady'], correctIndex: 1, explanation: 'Pod wpływem ACTH kora nadnerczy wydziela kortyzol.'),
          QuizQuestion(id: 'q_k3_hor_8', question: 'Przykładem przekaźnika drugiego rzędu jest:', options: ['Tyroksyna', 'Cykliczny AMP', 'Estrogen', 'Kortyzol'], correctIndex: 1, explanation: 'Przekazuje sygnał od receptora błonowego do wnętrza komórki.'),
        ],
      ),
      Topic(
        id: 'k3_hormony_regulacja',
        name: 'Regulacja hormonalna procesów życiowych',
        theory: '''
ANTAGONISTYCZNE DZIAŁANIE HORMONÓW — REGULACJA STĘŻENIA GLUKOZY
Hormony antagonistyczne działają przeciwstawnie na ten sam parametr. Po posiłku stężenie glukozy we krwi rośnie, a komórki beta wysepek trzustkowych wydzielają insulinę. Insulina ułatwia pobieranie glukozy przez komórki, zwłaszcza mięśni i tkanki tłuszczowej, oraz pobudza syntezę glikogenu w wątrobie i mięśniach i syntezę tłuszczów — w efekcie stężenie glukozy spada. Gdy stężenie glukozy się obniża, np. między posiłkami, komórki alfa wysepek wydzielają glukagon, który pobudza w wątrobie rozkład glikogenu i wytwarzanie glukozy z innych związków, podnosząc jej stężenie we krwi. Niedobór insuliny lub oporność tkanek na jej działanie prowadzi do cukrzycy: cukrzyca typu 1 wynika z autoimmunologicznego zniszczenia komórek beta, a cukrzyca typu 2 wiąże się przede wszystkim z otyłością i małą aktywnością fizyczną.

ANTAGONISTYCZNE DZIAŁANIE HORMONÓW — REGULACJA STĘŻENIA WAPNIA
Gdy stężenie wapnia we krwi spada, przytarczyce wydzielają parathormon, który pobudza uwalnianie wapnia z kości, zwiększa jego zwrotne wchłanianie w nerkach i — za pośrednictwem aktywnej postaci witaminy D — wchłanianie w jelicie. Gdy stężenie wapnia rośnie, tarczyca wydziela kalcytoninę, która hamuje uwalnianie wapnia z kości i zwiększa jego wydalanie. Stałe stężenie wapnia jest niezbędne do przewodzenia impulsów nerwowych, skurczu mięśni i krzepnięcia krwi.

HORMONY W REAKCJI NA STRES
W sytuacji zagrożenia podwzgórze pobudza układ współczulny, a ten — rdzeń nadnerczy do wydzielania adrenaliny i noradrenaliny. W ciągu kilku sekund przygotowują one organizm do walki lub ucieczki: przyspieszają pracę serca i oddychanie, podnoszą ciśnienie krwi, rozszerzają oskrzela, zwiększają przepływ krwi przez mięśnie, zmniejszając go w narządach trawiennych, i podnoszą stężenie glukozy we krwi. Przy stresie długotrwałym podwzgórze wydziela kortykoliberynę, która za pośrednictwem ACTH pobudza korę nadnerczy do wydzielania kortyzolu. Kortyzol podnosi stężenie glukozy, nasila rozkład białek i tłuszczów oraz hamuje reakcje zapalne i odpornościowe — dlatego przewlekły stres sprzyja infekcjom, nadciśnieniu i zaburzeniom metabolicznym.

HORMONY A WZROST I TEMPO METABOLIZMU
Hormon wzrostu, wydzielany przez przysadkę, pobudza wzrost kości na długość i wzrost mięśni oraz syntezę białek. Jego niedobór w dzieciństwie powoduje karłowatość przysadkową, a nadmiar — gigantyzm. Nadmiar hormonu wzrostu u dorosłych, gdy kości nie mogą już rosnąć na długość, prowadzi do akromegalii, czyli powiększenia rąk, stóp i rysów twarzy. Hormony tarczycy regulują tempo przemiany materii i zużycie tlenu przez komórki, a u dzieci są niezbędne do prawidłowego wzrostu i rozwoju układu nerwowego. W regulacji wzrostu i dojrzewania uczestniczą też insulina i hormony płciowe.

HORMONY TKANKOWE
Hormony tkankowe wytwarzane są przez rozproszone komórki różnych narządów i działają zwykle w pobliżu miejsca powstania. Gastryna, wydzielana przez komórki ściany żołądka po dostaniu się do niego pokarmu, pobudza wydzielanie soku żołądkowego. Erytropoetyna, wydzielana głównie przez nerki w warunkach niedotlenienia, pobudza szpik kostny do wytwarzania erytrocytów — dlatego jej wydzielanie wzrasta podczas pobytu w wysokich górach. Histamina, uwalniana m.in. przez komórki tuczne, rozszerza naczynia krwionośne i zwiększa ich przepuszczalność w reakcjach zapalnych i alergicznych, a w żołądku pobudza wydzielanie kwasu solnego.

NIEDOCZYNNOŚĆ I NADCZYNNOŚĆ TARCZYCY
Niedoczynność tarczycy spowalnia przemianę materii: powoduje przyrost masy ciała, zmęczenie i senność, uczucie zimna, suchość skóry, zaparcia, spowolnienie tętna i pogorszenie pamięci. U dzieci nieleczona prowadzi do zahamowania wzrostu i niepełnosprawności intelektualnej, dlatego w Polsce każdego noworodka bada się pod tym kątem. Przyczyną bywa niedobór jodu, prowadzący do powiększenia tarczycy (wola), lub choroba Hashimoto; leczy się ją podawaniem hormonów tarczycy. Nadczynność tarczycy przyspiesza przemianę materii: powoduje chudnięcie mimo dobrego apetytu, przyspieszone bicie serca, nadpobudliwość, drżenie rąk, nadmierną potliwość, nietolerancję ciepła i bezsenność, a w chorobie Gravesa-Basedowa także wytrzeszcz oczu. Leczy się ją lekami hamującymi pracę tarczycy, jodem promieniotwórczym lub operacyjnie.
''',
        flashcards: [
          Flashcard(id: 'f_k3_hor_13', front: 'Jak insulina obniża stężenie glukozy we krwi?', back: 'Ułatwia pobieranie glukozy przez komórki i pobudza syntezę glikogenu w wątrobie i mięśniach.'),
          Flashcard(id: 'f_k3_hor_14', front: 'Jak glukagon podwyższa stężenie glukozy we krwi?', back: 'Pobudza w wątrobie rozkład glikogenu i wytwarzanie glukozy z innych związków.'),
          Flashcard(id: 'f_k3_hor_15', front: 'Które komórki trzustki wydzielają insulinę, a które glukagon?', back: 'Insulinę — komórki beta, glukagon — komórki alfa wysepek trzustkowych.'),
          Flashcard(id: 'f_k3_hor_16', front: 'Czym różni się cukrzyca typu 1 od typu 2?', back: 'Typ 1 — autoimmunologiczne zniszczenie komórek beta; typ 2 — głównie oporność na insulinę związana z otyłością.'),
          Flashcard(id: 'f_k3_hor_17', front: 'Jak działa parathormon?', back: 'Podnosi stężenie wapnia we krwi — uwalnia go z kości i zwiększa jego wchłanianie w nerkach i jelicie.'),
          Flashcard(id: 'f_k3_hor_18', front: 'Jak działa kalcytonina?', back: 'Obniża stężenie wapnia we krwi.'),
          Flashcard(id: 'f_k3_hor_19', front: 'Jak adrenalina przygotowuje organizm do walki lub ucieczki?', back: 'Przyspiesza pracę serca i oddychanie, podnosi ciśnienie i stężenie glukozy, rozszerza oskrzela.'),
          Flashcard(id: 'f_k3_hor_20', front: 'Dlaczego przewlekły stres sprzyja infekcjom?', back: 'Kortyzol hamuje reakcje odpornościowe.'),
          Flashcard(id: 'f_k3_hor_21', front: 'Czym różni się gigantyzm od akromegalii?', back: 'Oba wynikają z nadmiaru hormonu wzrostu: gigantyzm w dzieciństwie, akromegalia u dorosłych.'),
          Flashcard(id: 'f_k3_hor_22', front: 'Jak działa gastryna?', back: 'Pobudza wydzielanie soku żołądkowego.'),
          Flashcard(id: 'f_k3_hor_23', front: 'Gdzie i kiedy wydzielana jest erytropoetyna?', back: 'Głównie w nerkach, w warunkach niedotlenienia; pobudza wytwarzanie erytrocytów.'),
          Flashcard(id: 'f_k3_hor_24', front: 'Jak działa histamina?', back: 'Rozszerza naczynia i zwiększa ich przepuszczalność w stanach zapalnych i alergiach; w żołądku pobudza wydzielanie kwasu solnego.'),
          Flashcard(id: 'f_k3_hor_25', front: 'Wymień objawy niedoczynności tarczycy.', back: 'Przyrost masy ciała, zmęczenie, senność, uczucie zimna, sucha skóra, wolne tętno.'),
          Flashcard(id: 'f_k3_hor_26', front: 'Wymień objawy nadczynności tarczycy.', back: 'Chudnięcie, szybkie bicie serca, nadpobudliwość, drżenie rąk, potliwość, bezsenność.'),
          Flashcard(id: 'f_k3_hor_27', front: 'Dlaczego niedoczynność tarczycy u dzieci jest szczególnie groźna?', back: 'Hamuje wzrost i rozwój układu nerwowego, prowadząc do niepełnosprawności intelektualnej.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k3_hor_9', question: 'Po posiłku bogatym w węglowodany wzrasta wydzielanie:', options: ['Glukagonu', 'Insuliny', 'Adrenaliny', 'Kortyzolu'], correctIndex: 1, explanation: 'Insulina obniża podwyższone po posiłku stężenie glukozy.'),
          QuizQuestion(id: 'q_k3_hor_10', question: 'Hormonem podwyższającym stężenie wapnia we krwi jest:', options: ['Kalcytonina', 'Parathormon', 'Insulina', 'Melatonina'], correctIndex: 1, explanation: 'Kalcytonina działa przeciwnie.'),
          QuizQuestion(id: 'q_k3_hor_11', question: 'W reakcji na nagłe zagrożenie najszybciej wydzielana jest:', options: ['Tyroksyna', 'Adrenalina', 'Insulina', 'Prolaktyna'], correctIndex: 1, explanation: 'Rdzeń nadnerczy wydziela ją w ciągu sekund.'),
          QuizQuestion(id: 'q_k3_hor_12', question: 'Nadmiar hormonu wzrostu u osoby dorosłej powoduje:', options: ['Gigantyzm', 'Akromegalię', 'Karłowatość', 'Wole'], correctIndex: 1, explanation: 'Gigantyzm dotyczy okresu wzrostu, czyli dzieciństwa.'),
          QuizQuestion(id: 'q_k3_hor_13', question: 'Erytropoetyna pobudza:', options: ['Wydzielanie soku żołądkowego', 'Wytwarzanie erytrocytów', 'Skurcz oskrzeli', 'Rozkład glikogenu'], correctIndex: 1, explanation: 'Działa na szpik kostny czerwony.'),
          QuizQuestion(id: 'q_k3_hor_14', question: 'Wytrzeszcz oczu, drżenie rąk i spadek masy ciała mogą świadczyć o:', options: ['Niedoczynności tarczycy', 'Nadczynności tarczycy', 'Cukrzycy typu 1', 'Niedoborze parathormonu'], correctIndex: 1, explanation: 'Nadmiar hormonów tarczycy przyspiesza przemianę materii.'),
          QuizQuestion(id: 'q_k3_hor_15', question: 'Glukagon wydzielany jest przez:', options: ['Komórki beta trzustki', 'Komórki alfa trzustki', 'Korę nadnerczy', 'Wątrobę'], correctIndex: 1, explanation: 'Komórki beta wydzielają insulinę.'),
          QuizQuestion(id: 'q_k3_hor_16', question: 'Kortyzol:', options: ['Obniża stężenie glukozy we krwi', 'Hamuje reakcje zapalne i odpornościowe', 'Pobudza wydzielanie soku żołądkowego', 'Obniża ciśnienie krwi'], correctIndex: 1, explanation: 'Dlatego jego pochodne stosuje się jako leki przeciwzapalne.'),
          QuizQuestion(id: 'q_k3_hor_17', question: 'Niedobór jodu w diecie może prowadzić do:', options: ['Akromegalii', 'Wola i niedoczynności tarczycy', 'Cukrzycy', 'Nadczynności przytarczyc'], correctIndex: 1, explanation: 'Jod jest niezbędny do wytwarzania hormonów tarczycy.'),
        ],
      ),
    ],
  ),

  // ===========================================================================
  // XI.6 REGULACJA NERWOWA
  // ===========================================================================
  Chapter(
    id: 'k3_nerwowy',
    name: 'Regulacja nerwowa',
    topics: [
      Topic(
        id: 'k3_nerwowy_impuls',
        name: 'Impuls nerwowy, synapsy i odruchy',
        theory: '''
POTENCJAŁ SPOCZYNKOWY
Neuron odbiera pobudzenie dendrytami i ciałem komórki, a przewodzi impuls wzdłuż aksonu do jego zakończeń. W stanie spoczynku wnętrze neuronu ma ładunek ujemny względem otoczenia — różnica potencjałów wynosi około −70 mV. Wynika to z nierównomiernego rozmieszczenia jonów: pompa sodowo-potasowa, zużywając ATP, wypompowuje z komórki trzy jony sodu, a wprowadza dwa jony potasu, więc na zewnątrz komórki jest więcej jonów Na+, a wewnątrz K+. Błona w spoczynku jest ponadto bardziej przepuszczalna dla jonów potasu, które wypływają z komórki, pozostawiając wewnątrz nadmiar ładunków ujemnych.

POTENCJAŁ CZYNNOŚCIOWY
Bodziec o sile co najmniej progowej powoduje otwarcie kanałów sodowych. Jony Na+ gwałtownie napływają do neuronu, a jego wnętrze staje się dodatnie — to depolaryzacja. Następnie kanały sodowe zamykają się, a otwierają kanały potasowe; jony K+ wypływają z komórki i przywracają ujemny ładunek wnętrza — to repolaryzacja. Pompa sodowo-potasowa odtwarza wyjściowe rozmieszczenie jonów. Tuż po pobudzeniu fragment błony przez chwilę nie reaguje na bodźce (okres refrakcji), dzięki czemu impuls biegnie wzdłuż aksonu tylko w jedną stronę. Pobudzenie podlega zasadzie „wszystko albo nic": bodziec podprogowy nie wywołuje impulsu, a każdy bodziec progowy lub silniejszy wywołuje impuls o tej samej wielkości — o sile bodźca informuje częstość impulsów.

PRZEWODZENIE IMPULSU A BUDOWA NEURONU
Potencjał czynnościowy powstały w jednym miejscu błony depolaryzuje sąsiedni jej fragment, więc impuls przesuwa się wzdłuż aksonu. W aksonach bez osłonki mielinowej przewodzenie jest ciągłe i stosunkowo wolne. Osłonka mielinowa izoluje akson i jest przerywana w przewężeniach Ranviera — depolaryzacja zachodzi tylko w nich, a impuls przeskakuje od przewężenia do przewężenia. Takie przewodzenie skokowe jest wielokrotnie szybsze i zużywa mniej energii. Szybkość przewodzenia rośnie także wraz ze średnicą aksonu.

SYNAPSA CHEMICZNA
Synapsa to miejsce przekazywania pobudzenia z neuronu na inną komórkę. Gdy impuls dociera do zakończenia aksonu, otwierają się kanały wapniowe; jony Ca2+ napływają do zakończenia i powodują zlewanie się pęcherzyków synaptycznych z błoną presynaptyczną. Neuroprzekaźnik zostaje uwolniony do szczeliny synaptycznej, przechodzi przez nią i łączy się z receptorami błony postsynaptycznej, otwierając kanały jonowe. Przekaźniki pobudzające wywołują depolaryzację i powstanie impulsu, a hamujące utrudniają jego powstanie. Neuroprzekaźnik jest następnie szybko rozkładany przez enzymy — acetylocholinę rozkłada acetylocholinoesteraza — lub wychwytywany zwrotnie przez zakończenie presynaptyczne, co kończy przekazywanie sygnału. Ponieważ neuroprzekaźnik uwalniany jest tylko z błony presynaptycznej, a receptory ma tylko błona postsynaptyczna, synapsa przewodzi pobudzenie jednokierunkowo. Przykładami neuroprzekaźników są acetylocholina (m.in. w połączeniach nerwów z mięśniami szkieletowymi i w układzie przywspółczulnym), noradrenalina (układ współczulny), dopamina (kontrola ruchów, układ nagrody), serotonina (nastrój, sen) oraz kwas gamma-aminomasłowy (GABA) — główny przekaźnik hamujący w mózgu.

ŁUK ODRUCHOWY
Odruch to automatyczna reakcja organizmu na bodziec, zachodząca z udziałem układu nerwowego, a drogę, jaką przebywa impuls, nazywamy łukiem odruchowym. Tworzą go: receptor, który odbiera bodziec; neuron czuciowy, przewodzący impuls do ośrodka; ośrodek nerwowy w rdzeniu kręgowym lub mózgowiu, w którym często pośredniczą neurony pośredniczące; neuron ruchowy, przewodzący impuls do efektora; oraz efektor — mięsień lub gruczoł — wykonujący reakcję. Najprostszy łuk odruchowy, np. w odruchu kolanowym, składa się tylko z dwóch neuronów.

RODZAJE ODRUCHÓW I UCZENIE SIĘ
Odruchy bezwarunkowe są wrodzone, wspólne dla wszystkich osobników gatunku, trwałe i niezmienne — należą do nich odruch kolanowy, źreniczny, ssania, kaszlu czy cofania ręki od gorącego przedmiotu; ich ośrodki znajdują się w rdzeniu kręgowym i pniu mózgu. Odruchy warunkowe są nabywane w ciągu życia wskutek wielokrotnego kojarzenia bodźca obojętnego z bodźcem wywołującym odruch bezwarunkowy; są indywidualne i wygasają, jeśli nie są wzmacniane, a ich ośrodki znajdują się w korze mózgowej. Klasycznym przykładem są doświadczenia Iwana Pawłowa: pies, któremu przed podaniem pokarmu wielokrotnie włączano dźwięk, zaczynał wydzielać ślinę na sam dźwięk. Odruchy warunkowe są podstawą uczenia się — dzięki nim zwierzęta i ludzie dostosowują zachowanie do zmieniających się warunków, a wiele umiejętności utrwala się przez powtarzanie.
''',
        flashcards: [
          Flashcard(id: 'f_k3_ner_1', front: 'Jaki jest potencjał spoczynkowy neuronu i z czego wynika?', back: 'Około −70 mV; wynika z pracy pompy sodowo-potasowej i większej przepuszczalności błony dla jonów potasu.'),
          Flashcard(id: 'f_k3_ner_2', front: 'Jak działa pompa sodowo-potasowa?', back: 'Kosztem ATP wypompowuje z komórki trzy jony Na+ i wprowadza dwa jony K+.'),
          Flashcard(id: 'f_k3_ner_3', front: 'Na czym polega depolaryzacja?', back: 'Po otwarciu kanałów sodowych jony Na+ napływają do neuronu, a jego wnętrze staje się dodatnie.'),
          Flashcard(id: 'f_k3_ner_4', front: 'Na czym polega repolaryzacja?', back: 'Jony K+ wypływają z komórki i przywracają ujemny ładunek jej wnętrza.'),
          Flashcard(id: 'f_k3_ner_5', front: 'Co oznacza zasada „wszystko albo nic"?', back: 'Bodziec podprogowy nie wywołuje impulsu, a każdy bodziec progowy lub silniejszy — impuls o tej samej wielkości.'),
          Flashcard(id: 'f_k3_ner_6', front: 'W jaki sposób neuron przekazuje informację o sile bodźca?', back: 'Częstością impulsów.'),
          Flashcard(id: 'f_k3_ner_7', front: 'Dlaczego przewodzenie skokowe jest szybsze?', back: 'Depolaryzacja zachodzi tylko w przewężeniach Ranviera, a impuls przeskakuje między nimi.'),
          Flashcard(id: 'f_k3_ner_8', front: 'Jaką rolę w synapsie pełnią jony wapnia?', back: 'Napływają do zakończenia aksonu i wywołują uwolnienie neuroprzekaźnika z pęcherzyków synaptycznych.'),
          Flashcard(id: 'f_k3_ner_9', front: 'Dlaczego synapsa przewodzi pobudzenie jednokierunkowo?', back: 'Neuroprzekaźnik uwalniany jest tylko z błony presynaptycznej, a receptory ma tylko błona postsynaptyczna.'),
          Flashcard(id: 'f_k3_ner_10', front: 'Jak kończy się działanie neuroprzekaźnika?', back: 'Jest rozkładany przez enzymy (np. acetylocholinoesterazę) lub wychwytywany zwrotnie.'),
          Flashcard(id: 'f_k3_ner_11', front: 'Podaj przykłady neuroprzekaźników.', back: 'Acetylocholina, noradrenalina, dopamina, serotonina, GABA.'),
          Flashcard(id: 'f_k3_ner_12', front: 'Wymień elementy łuku odruchowego.', back: 'Receptor, neuron czuciowy, ośrodek nerwowy, neuron ruchowy, efektor.'),
          Flashcard(id: 'f_k3_ner_13', front: 'Czym różnią się odruchy bezwarunkowe od warunkowych?', back: 'Bezwarunkowe są wrodzone, trwałe i wspólne dla gatunku; warunkowe — nabyte, indywidualne i wygasają bez wzmacniania.'),
          Flashcard(id: 'f_k3_ner_14', front: 'Na czym polegało doświadczenie Pawłowa?', back: 'Pies, któremu przed podaniem pokarmu włączano dźwięk, zaczął wydzielać ślinę na sam dźwięk.'),
          Flashcard(id: 'f_k3_ner_15', front: 'Gdzie znajdują się ośrodki odruchów warunkowych?', back: 'W korze mózgowej.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k3_ner_1', question: 'Wnętrze neuronu w stanie spoczynku ma względem otoczenia ładunek:', options: ['Dodatni', 'Ujemny', 'Obojętny', 'Zmieniający się co sekundę'], correctIndex: 1, explanation: 'Potencjał spoczynkowy wynosi około −70 mV.'),
          QuizQuestion(id: 'q_k3_ner_2', question: 'Depolaryzację błony neuronu wywołuje:', options: ['Wypływ jonów K+ z komórki', 'Napływ jonów Na+ do komórki', 'Wypływ jonów Cl− z komórki', 'Praca pompy sodowo-potasowej'], correctIndex: 1, explanation: 'Po otwarciu kanałów sodowych wnętrze staje się dodatnie.'),
          QuizQuestion(id: 'q_k3_ner_3', question: 'Przewodzenie skokowe zachodzi w aksonach:', options: ['Pozbawionych osłonki mielinowej', 'Otoczonych osłonką mielinową', 'Wyłącznie w dendrytach', 'Tylko u bezkręgowców'], correctIndex: 1, explanation: 'Impuls przeskakuje między przewężeniami Ranviera.'),
          QuizQuestion(id: 'q_k3_ner_4', question: 'Uwolnienie neuroprzekaźnika do szczeliny synaptycznej wywołuje napływ do zakończenia aksonu jonów:', options: ['Sodu', 'Potasu', 'Wapnia', 'Chloru'], correctIndex: 2, explanation: 'Jony Ca2+ powodują zlewanie się pęcherzyków synaptycznych z błoną.'),
          QuizQuestion(id: 'q_k3_ner_5', question: 'Enzymem rozkładającym acetylocholinę w szczelinie synaptycznej jest:', options: ['Amylaza', 'Acetylocholinoesteraza', 'Pepsyna', 'Ligaza'], correctIndex: 1, explanation: 'Rozkład neuroprzekaźnika kończy przekazywanie sygnału.'),
          QuizQuestion(id: 'q_k3_ner_6', question: 'Efektorem w łuku odruchowym jest:', options: ['Receptor w skórze', 'Mięsień lub gruczoł', 'Rdzeń kręgowy', 'Neuron czuciowy'], correctIndex: 1, explanation: 'To efektor wykonuje reakcję na bodziec.'),
          QuizQuestion(id: 'q_k3_ner_7', question: 'Odruchem warunkowym jest:', options: ['Odruch kolanowy', 'Wydzielanie śliny na widok ulubionej potrawy', 'Odruch ssania u noworodka', 'Zwężenie źrenicy w jasnym świetle'], correctIndex: 1, explanation: 'To reakcja nabyta w wyniku doświadczenia.'),
          QuizQuestion(id: 'q_k3_ner_8', question: 'Zgodnie z zasadą „wszystko albo nic" bodziec silniejszy od progowego wywołuje:', options: ['Większy impuls', 'Impuls tej samej wielkości', 'Brak impulsu', 'Impuls biegnący w przeciwnym kierunku'], correctIndex: 1, explanation: 'Silniejszy bodziec zwiększa częstość impulsów, a nie ich wielkość.'),
          QuizQuestion(id: 'q_k3_ner_9', question: 'Głównym neuroprzekaźnikiem hamującym w mózgu jest:', options: ['Acetylocholina', 'GABA', 'Dopamina', 'Noradrenalina'], correctIndex: 1, explanation: 'GABA utrudnia powstawanie impulsów w neuronach.'),
        ],
      ),
      Topic(
        id: 'k3_nerwowy_budowa',
        name: 'Budowa i funkcje układu nerwowego',
        theory: '''
PODZIAŁ UKŁADU NERWOWEGO
Ośrodkowy układ nerwowy tworzą mózgowie i rdzeń kręgowy, chronione przez kości czaszki i kręgosłupa, opony mózgowo-rdzeniowe oraz płyn mózgowo-rdzeniowy. Obwodowy układ nerwowy tworzą nerwy czaszkowe i rdzeniowe oraz zwoje nerwowe. Ze względu na pełnione funkcje wyróżnia się część somatyczną, która steruje mięśniami szkieletowymi i w dużej mierze podlega woli, oraz część autonomiczną, regulującą pracę narządów wewnętrznych niezależnie od woli.

MÓZGOWIE
Kresomózgowie tworzą dwie półkule mózgu pokryte korą mózgową zbudowaną z istoty szarej, czyli ciał neuronów. Kora mózgowa jest ośrodkiem świadomości, myślenia, pamięci, uczenia się i mowy. Płat czołowy odpowiada m.in. za planowanie, podejmowanie decyzji, ruchy dowolne i tworzenie mowy, płat ciemieniowy — za czucie, płat skroniowy — za słuch, rozumienie mowy i pamięć, a płat potyliczny — za widzenie. Międzymózgowie obejmuje wzgórze, przekazujące informacje czuciowe do kory, oraz podwzgórze — ośrodek termoregulacji, głodu, sytości i pragnienia, nadrzędny ośrodek układu autonomicznego i hormonalnego. Móżdżek koordynuje ruchy, utrzymuje równowagę i napięcie mięśni. W pniu mózgu, a zwłaszcza w rdzeniu przedłużonym, znajdują się ośrodki oddychania, pracy serca i ciśnienia krwi oraz odruchów kaszlu, kichania, połykania i wymiotów — dlatego jego uszkodzenie jest zwykle śmiertelne.

RDZEŃ KRĘGOWY I NERWY
Rdzeń kręgowy leży w kanale kręgowym. Na jego przekroju poprzecznym widać położoną centralnie istotę szarą o kształcie litery H, zbudowaną z ciał neuronów, otoczoną istotą białą z aksonów, tworzących drogi nerwowe. Rdzeń przewodzi impulsy między mózgowiem a resztą ciała i jest ośrodkiem wielu odruchów bezwarunkowych. Wychodzi z niego 31 par nerwów rdzeniowych. Każdy z nich powstaje z połączenia korzenia grzbietowego, zawierającego włókna czuciowe, i korzenia brzusznego, zawierającego włókna ruchowe, dlatego nerwy rdzeniowe są nerwami mieszanymi. Z mózgowia wychodzi 12 par nerwów czaszkowych.

AUTONOMICZNY UKŁAD NERWOWY
Autonomiczny układ nerwowy utrzymuje homeostazę, regulując pracę serca, naczyń krwionośnych, narządów wewnętrznych i gruczołów. Jego nadrzędnym ośrodkiem jest podwzgórze, a pozostałe ośrodki leżą w pniu mózgu i rdzeniu kręgowym. Część współczulna, której ośrodki znajdują się w piersiowym i lędźwiowym odcinku rdzenia kręgowego, mobilizuje organizm w sytuacji stresu i wysiłku: przyspiesza pracę serca, podnosi ciśnienie krwi, rozszerza źrenice i oskrzela, hamuje pracę przewodu pokarmowego i pobudza wydzielanie adrenaliny. Część przywspółczulna, której ośrodki leżą w pniu mózgu i krzyżowym odcinku rdzenia kręgowego, dominuje w stanie spoczynku: zwalnia pracę serca, zwęża źrenice i oskrzela oraz pobudza trawienie i wydzielanie śliny. Obie części działają antagonistycznie, a równowaga między nimi pozwala dostosować pracę narządów do bieżących potrzeb organizmu.

ZNACZENIE SNU
Sen jest niezbędny do prawidłowego funkcjonowania mózgu i całego organizmu. W czasie snu utrwalają się ślady pamięciowe i efekty uczenia się, z mózgu usuwane są szkodliwe produkty przemiany materii, regenerują się tkanki, wydzielany jest hormon wzrostu, a układ odpornościowy odzyskuje sprawność. Sen składa się z powtarzających się cyklicznie faz snu wolnofalowego (NREM) i snu z szybkimi ruchami gałek ocznych (REM), w którym występują marzenia senne. Rytm snu i czuwania reguluje melatonina, wydzielana przez szyszynkę w ciemności — dlatego jasne światło ekranów wieczorem utrudnia zasypianie. Przewlekły niedobór snu upośledza koncentrację, pamięć i nastrój, osłabia odporność oraz zwiększa ryzyko otyłości, cukrzycy i chorób serca. Nastolatki potrzebują około 8–10 godzin snu na dobę.

SUBSTANCJE PSYCHOAKTYWNE
Substancje psychoaktywne zmieniają pracę układu nerwowego, najczęściej wpływając na przekazywanie sygnałów w synapsach — naśladują neuroprzekaźniki, nasilają ich uwalnianie albo hamują ich rozkład lub wychwyt zwrotny. Wiele z nich pobudza układ nagrody zależny od dopaminy, co prowadzi do uzależnienia: organizm przyzwyczaja się do substancji i potrzebuje coraz większych dawek, a jej odstawienie wywołuje objawy abstynencyjne. Alkohol spowalnia reakcje, zaburza koordynację ruchów i uszkadza wątrobę oraz mózg. Nikotyna działa na receptory acetylocholiny i silnie uzależnia. Opioidy, amfetamina, kokaina i marihuana zmieniają nastrój, postrzeganie i procesy poznawcze. Szczególnie niebezpieczne są dopalacze — substancje o nieznanym i zmiennym składzie oraz dawce, sprzedawane np. jako produkty kolekcjonerskie; mogą wywołać ciężkie zatrucia, psychozy, drgawki, zaburzenia rytmu serca i śmierć. Mózg nastolatka wciąż się rozwija, dlatego jest szczególnie wrażliwy na działanie tych substancji.

CHOROBY UKŁADU NERWOWEGO
Depresja to choroba, w której przez długi czas utrzymują się obniżony nastrój, utrata zainteresowań i energii, zaburzenia snu i łaknienia, poczucie beznadziei, a niekiedy myśli samobójcze; wiąże się m.in. z zaburzeniami przekaźnictwa serotoniny i noradrenaliny i jest skutecznie leczona farmakologicznie oraz psychoterapią. Choroba Alzheimera polega na stopniowym obumieraniu neuronów kory mózgowej, związanym z odkładaniem się złogów nieprawidłowych białek; objawia się narastającymi zaburzeniami pamięci, orientacji i myślenia, prowadzącymi do otępienia. Choroba Parkinsona wynika z obumierania neuronów wytwarzających dopaminę i objawia się drżeniem, sztywnością mięśni, spowolnieniem ruchów i zaburzeniami równowagi. Schizofrenia to przewlekła choroba psychiczna, w której występują urojenia, omamy — np. słyszenie nieistniejących głosów — zaburzenia myślenia i wycofanie się z życia społecznego. Część tych chorób jest nieuleczalna, a pozostałe wymagają długotrwałego leczenia, ale wczesne rozpoznanie pozwala spowolnić ich postęp, złagodzić objawy i dłużej zachować samodzielność chorego, co ogranicza także skutki choroby dla rodziny i społeczeństwa. Osoba, która ma myśli samobójcze, powinna jak najszybciej szukać pomocy — młodzież może bezpłatnie zadzwonić pod numer telefonu zaufania 116 111.
''',
        flashcards: [
          Flashcard(id: 'f_k3_ner_16', front: 'Co tworzy ośrodkowy układ nerwowy?', back: 'Mózgowie i rdzeń kręgowy.'),
          Flashcard(id: 'f_k3_ner_17', front: 'Czym różni się część somatyczna od autonomicznej układu nerwowego?', back: 'Somatyczna steruje mięśniami szkieletowymi i podlega woli; autonomiczna reguluje narządy wewnętrzne niezależnie od woli.'),
          Flashcard(id: 'f_k3_ner_18', front: 'Za co odpowiada kora mózgowa?', back: 'Za świadomość, myślenie, pamięć, uczenie się, mowę, czucie i ruchy dowolne.'),
          Flashcard(id: 'f_k3_ner_19', front: 'Który płat kory odpowiada za widzenie, a który za słuch?', back: 'Widzenie — płat potyliczny, słuch — płat skroniowy.'),
          Flashcard(id: 'f_k3_ner_20', front: 'Jakie funkcje pełni podwzgórze?', back: 'Jest ośrodkiem termoregulacji, głodu, sytości i pragnienia oraz nadrzędnym ośrodkiem układu autonomicznego i hormonalnego.'),
          Flashcard(id: 'f_k3_ner_21', front: 'Za co odpowiada móżdżek?', back: 'Za koordynację ruchów, równowagę i napięcie mięśni.'),
          Flashcard(id: 'f_k3_ner_22', front: 'Jakie ośrodki znajdują się w rdzeniu przedłużonym?', back: 'Ośrodki oddychania, pracy serca i ciśnienia krwi oraz odruchów kaszlu, połykania i wymiotów.'),
          Flashcard(id: 'f_k3_ner_23', front: 'Jak rozmieszczone są istota szara i biała w rdzeniu kręgowym?', back: 'Istota szara leży centralnie (kształt litery H), a otacza ją istota biała.'),
          Flashcard(id: 'f_k3_ner_24', front: 'Dlaczego nerwy rdzeniowe są nerwami mieszanymi?', back: 'Zawierają włókna czuciowe z korzenia grzbietowego i ruchowe z korzenia brzusznego.'),
          Flashcard(id: 'f_k3_ner_25', front: 'Ile par nerwów czaszkowych i rdzeniowych ma człowiek?', back: '12 par nerwów czaszkowych i 31 par rdzeniowych.'),
          Flashcard(id: 'f_k3_ner_26', front: 'Jak działa część współczulna układu autonomicznego?', back: 'Mobilizuje organizm: przyspiesza pracę serca, rozszerza źrenice i oskrzela, hamuje trawienie.'),
          Flashcard(id: 'f_k3_ner_27', front: 'Jak działa część przywspółczulna układu autonomicznego?', back: 'Dominuje w spoczynku: zwalnia pracę serca, zwęża źrenice, pobudza trawienie.'),
          Flashcard(id: 'f_k3_ner_28', front: 'Dlaczego sen jest niezbędny?', back: 'Utrwala pamięć, usuwa szkodliwe produkty przemiany materii z mózgu, regeneruje tkanki i wzmacnia odporność.'),
          Flashcard(id: 'f_k3_ner_29', front: 'Który hormon reguluje rytm snu i czuwania?', back: 'Melatonina, wydzielana przez szyszynkę w ciemności.'),
          Flashcard(id: 'f_k3_ner_30', front: 'Jak substancje psychoaktywne prowadzą do uzależnienia?', back: 'Pobudzają układ nagrody zależny od dopaminy; rośnie tolerancja, a odstawienie wywołuje objawy abstynencyjne.'),
          Flashcard(id: 'f_k3_ner_31', front: 'Dlaczego dopalacze są szczególnie niebezpieczne?', back: 'Mają nieznany i zmienny skład oraz dawkę — grożą ciężkimi zatruciami, psychozami i śmiercią.'),
          Flashcard(id: 'f_k3_ner_32', front: 'Z czym wiąże się choroba Parkinsona?', back: 'Z obumieraniem neuronów wytwarzających dopaminę — powoduje drżenie, sztywność i spowolnienie ruchów.'),
          Flashcard(id: 'f_k3_ner_33', front: 'Czym objawia się choroba Alzheimera?', back: 'Narastającymi zaburzeniami pamięci, orientacji i myślenia, prowadzącymi do otępienia.'),
          Flashcard(id: 'f_k3_ner_34', front: 'Dlaczego ważna jest wczesna diagnostyka chorób układu nerwowego?', back: 'Pozwala spowolnić postęp choroby, złagodzić objawy i dłużej zachować samodzielność chorego.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k3_ner_10', question: 'Ośrodek termoregulacji znajduje się w:', options: ['Móżdżku', 'Podwzgórzu', 'Rdzeniu kręgowym', 'Płacie potylicznym'], correctIndex: 1, explanation: 'Podwzgórze reguluje także głód, sytość i pragnienie.'),
          QuizQuestion(id: 'q_k3_ner_11', question: 'Uszkodzenie móżdżku powoduje przede wszystkim:', options: ['Utratę wzroku', 'Zaburzenia koordynacji ruchów i równowagi', 'Zatrzymanie oddychania', 'Utratę słuchu'], correctIndex: 1, explanation: 'Móżdżek koordynuje ruchy i utrzymuje równowagę.'),
          QuizQuestion(id: 'q_k3_ner_12', question: 'Ośrodek wzroku znajduje się w płacie:', options: ['Czołowym', 'Ciemieniowym', 'Skroniowym', 'Potylicznym'], correctIndex: 3, explanation: 'Do płata potylicznego trafiają impulsy z nerwów wzrokowych.'),
          QuizQuestion(id: 'q_k3_ner_13', question: 'Pobudzenie części współczulnej układu autonomicznego powoduje:', options: ['Zwężenie źrenic', 'Przyspieszenie pracy serca', 'Pobudzenie trawienia', 'Zwężenie oskrzeli'], correctIndex: 1, explanation: 'Część współczulna przygotowuje organizm do wysiłku.'),
          QuizQuestion(id: 'q_k3_ner_14', question: 'Korzeń brzuszny nerwu rdzeniowego zawiera włókna:', options: ['Czuciowe', 'Ruchowe', 'Węchowe', 'Wzrokowe'], correctIndex: 1, explanation: 'Włókna czuciowe biegną w korzeniu grzbietowym.'),
          QuizQuestion(id: 'q_k3_ner_15', question: 'Chorobę Parkinsona wywołuje obumieranie neuronów wytwarzających:', options: ['Serotoninę', 'Dopaminę', 'Acetylocholinę', 'Melatoninę'], correctIndex: 1, explanation: 'Niedobór dopaminy zaburza kontrolę ruchów.'),
          QuizQuestion(id: 'q_k3_ner_16', question: 'Uszkodzenie rdzenia przedłużonego jest zwykle śmiertelne, ponieważ znajdują się tam ośrodki:', options: ['Mowy', 'Oddychania i pracy serca', 'Wzroku', 'Pamięci'], correctIndex: 1, explanation: 'Bez nich nie są możliwe podstawowe czynności życiowe.'),
          QuizQuestion(id: 'q_k3_ner_17', question: 'Melatonina wydzielana jest przez:', options: ['Przysadkę', 'Szyszynkę', 'Tarczycę', 'Podwzgórze'], correctIndex: 1, explanation: 'Jej wydzielanie rośnie w ciemności.'),
          QuizQuestion(id: 'q_k3_ner_18', question: 'Omamy i urojenia są charakterystycznymi objawami:', options: ['Choroby Parkinsona', 'Schizofrenii', 'Niedoczynności tarczycy', 'Stwardnienia rozsianego'], correctIndex: 1, explanation: 'Schizofrenia to przewlekła choroba psychiczna.'),
        ],
      ),
      Topic(
        id: 'k3_nerwowy_zmysly',
        name: 'Receptory i narządy zmysłów',
        theory: '''
RODZAJE RECEPTORÓW
Receptory to wyspecjalizowane komórki lub zakończenia nerwowe, które odbierają bodźce i przekształcają je w impulsy nerwowe. Ze względu na rodzaj bodźca wyróżnia się fotoreceptory, reagujące na światło (pręciki i czopki siatkówki); mechanoreceptory, reagujące na dotyk, ucisk, drgania, dźwięki i zmiany położenia ciała (receptory słuchu i równowagi, receptory dotyku w skórze, linia boczna ryb); chemoreceptory, reagujące na substancje chemiczne (receptory smaku i węchu, receptory stężenia dwutlenku węgla we krwi); termoreceptory, reagujące na zmiany temperatury (w skórze, a u niektórych węży — narządy wykrywające promieniowanie cieplne ofiar); oraz receptory bólu, pobudzane przez bodźce uszkadzające tkanki. Niektóre zwierzęta mają też elektroreceptory, np. ryby chrzęstnoszkieletowe, oraz magnetoreceptory, z których korzystają ptaki wędrowne.

LOKALIZACJA RECEPTORÓW A PEŁNIONA FUNKCJA
Rozmieszczenie receptorów w organizmie człowieka odpowiada ich funkcji. Eksteroreceptory, odbierające bodźce ze środowiska zewnętrznego, znajdują się na powierzchni ciała i w narządach zmysłów — w oku, uchu, jamie nosowej, na języku i w skórze; najwięcej receptorów dotyku mają opuszki palców, wargi i język, służące do poznawania otoczenia. Interoreceptory monitorują stan środowiska wewnętrznego — baroreceptory w ścianach aorty i tętnic szyjnych reagują na zmiany ciśnienia krwi, a chemoreceptory na stężenie dwutlenku węgla i tlenu. Proprioreceptory w mięśniach, ścięgnach i stawach informują o położeniu i ruchach części ciała, co umożliwia koordynację ruchów bez patrzenia.

BUDOWA I DZIAŁANIE OKA
Ścianę gałki ocznej tworzą trzy warstwy. Zewnętrzna błona włóknista obejmuje twardówkę, nadającą oku kształt i chroniącą je, oraz przezroczystą rogówkę, załamującą światło. Błona naczyniowa obejmuje naczyniówkę, która odżywia siatkówkę, ciało rzęskowe z mięśniem zmieniającym kształt soczewki oraz tęczówkę, która zmieniając średnicę źrenicy, reguluje ilość wpadającego światła. Wewnętrzną warstwą jest siatkówka z fotoreceptorami: pręcikami, odpowiedzialnymi za widzenie przy słabym oświetleniu, bez rozróżniania barw, i czopkami, odpowiedzialnymi za widzenie barwne i ostre w dobrym świetle. Czopki skupione są w plamce żółtej — miejscu najostrzejszego widzenia — a w miejscu wyjścia nerwu wzrokowego nie ma fotoreceptorów; to plamka ślepa. Wnętrze gałki ocznej wypełnia ciało szkliste. Światło załamuje się w rogówce i soczewce, a na siatkówce powstaje obraz rzeczywisty, pomniejszony i odwrócony, który mózg interpretuje jako prosty. Akomodacja to zmiana kształtu soczewki, umożliwiająca ostre widzenie przedmiotów bliskich i dalekich: przy patrzeniu z bliska mięsień rzęskowy kurczy się, a soczewka staje się bardziej wypukła. Impulsy z siatkówki nerwem wzrokowym trafiają do ośrodka wzroku w płacie potylicznym kory mózgowej.

WADY WZROKU
W krótkowzroczności obraz powstaje przed siatkówką — zwykle dlatego, że gałka oczna jest zbyt długa — więc niewyraźnie widać przedmioty odległe; koryguje się ją soczewkami rozpraszającymi. W dalekowzroczności obraz powstaje za siatkówką i niewyraźnie widać przedmioty bliskie; koryguje się ją soczewkami skupiającymi. Astygmatyzm wynika z nieregularnej krzywizny rogówki, która daje zniekształcony obraz; koryguje się go soczewkami cylindrycznymi.

BUDOWA I DZIAŁANIE UCHA
Ucho zewnętrzne tworzą małżowina uszna, zbierająca fale dźwiękowe, i przewód słuchowy zewnętrzny, zakończony błoną bębenkową. W wypełnionym powietrzem uchu środkowym znajdują się kosteczki słuchowe — młoteczek, kowadełko i strzemiączko — które przenoszą i wzmacniają drgania błony bębenkowej na okienko owalne ucha wewnętrznego. Trąbka słuchowa łączy ucho środkowe z gardłem i wyrównuje ciśnienie po obu stronach błony bębenkowej. Ucho wewnętrzne, zwane błędnikiem, wypełnia płyn. W ślimaku znajduje się narząd spiralny z komórkami zmysłowymi zakończonymi rzęskami: drgania płynu wyginają rzęski, a powstałe impulsy nerwem słuchowym docierają do ośrodka słuchu w płacie skroniowym. W uchu wewnętrznym mieści się również narząd równowagi: przewody półkoliste, reagujące na obroty głowy, oraz woreczek i łagiewka, reagujące na położenie głowy względem siły ciężkości i ruchy prostoliniowe.

HIGIENA WZROKU I SŁUCHU
Aby chronić wzrok, należy czytać przy dobrym oświetleniu, zachowywać odpowiednią odległość od książki i ekranu, robić przerwy w pracy przy ekranie i patrzeć wtedy w dal, chronić oczy przed silnym światłem słonecznym okularami z filtrem UV oraz regularnie badać wzrok. Aby chronić słuch, należy unikać długotrwałego hałasu i słuchania głośnej muzyki w słuchawkach — hałas trwale uszkadza komórki zmysłowe ślimaka — stosować ochronniki słuchu w głośnym otoczeniu, nie wkładać do uszu ostrych przedmiotów i leczyć infekcje uszu.

ZMYSŁY SMAKU I WĘCHU
Receptory smaku to chemoreceptory skupione w kubkach smakowych, leżących głównie w brodawkach języka. Rozpoznają pięć smaków podstawowych: słodki, słony, kwaśny, gorzki i umami, czyli smak glutaminianu, charakterystyczny np. dla bulionu i dojrzewających serów. Receptory węchu znajdują się w błonie śluzowej górnej części jamy nosowej; ich rzęski zawierają receptory wiążące cząsteczki lotnych substancji rozpuszczonych w śluzie. Człowiek odróżnia tysiące zapachów, a to, co odczuwamy jako smak potrawy, w dużej mierze zależy od węchu — dlatego przy katarze jedzenie wydaje się bez smaku. Zmysły smaku i węchu pozwalają ocenić jakość pokarmu i ostrzegają przed substancjami zepsutymi lub trującymi, a węch także przed zagrożeniami, takimi jak dym czy ulatniający się gaz.
''',
        flashcards: [
          Flashcard(id: 'f_k3_ner_35', front: 'Wymień rodzaje receptorów ze względu na rodzaj bodźca.', back: 'Fotoreceptory, mechanoreceptory, chemoreceptory, termoreceptory i receptory bólu.'),
          Flashcard(id: 'f_k3_ner_36', front: 'Czym różnią się eksteroreceptory, interoreceptory i proprioreceptory?', back: 'Eksteroreceptory odbierają bodźce z otoczenia, interoreceptory — ze środowiska wewnętrznego, a proprioreceptory informują o położeniu części ciała.'),
          Flashcard(id: 'f_k3_ner_37', front: 'Gdzie jest najwięcej receptorów dotyku i dlaczego?', back: 'Na opuszkach palców, wargach i języku — służą do poznawania otoczenia.'),
          Flashcard(id: 'f_k3_ner_38', front: 'Czym różnią się pręciki od czopków?', back: 'Pręciki umożliwiają widzenie przy słabym świetle bez rozróżniania barw, czopki — widzenie barwne i ostre.'),
          Flashcard(id: 'f_k3_ner_39', front: 'Czym różni się plamka żółta od plamki ślepej?', back: 'Plamka żółta to miejsce najostrzejszego widzenia z dużą liczbą czopków; plamka ślepa to miejsce wyjścia nerwu wzrokowego bez fotoreceptorów.'),
          Flashcard(id: 'f_k3_ner_40', front: 'Na czym polega akomodacja oka?', back: 'Na zmianie kształtu soczewki, umożliwiającej ostre widzenie przedmiotów bliskich i dalekich.'),
          Flashcard(id: 'f_k3_ner_41', front: 'Jaki obraz powstaje na siatkówce?', back: 'Rzeczywisty, pomniejszony i odwrócony.'),
          Flashcard(id: 'f_k3_ner_42', front: 'Jak koryguje się krótkowzroczność i dalekowzroczność?', back: 'Krótkowzroczność — soczewkami rozpraszającymi, dalekowzroczność — skupiającymi.'),
          Flashcard(id: 'f_k3_ner_43', front: 'Jaką rolę pełnią kosteczki słuchowe?', back: 'Przenoszą i wzmacniają drgania błony bębenkowej na ucho wewnętrzne.'),
          Flashcard(id: 'f_k3_ner_44', front: 'Jaką funkcję pełni trąbka słuchowa?', back: 'Wyrównuje ciśnienie po obu stronach błony bębenkowej.'),
          Flashcard(id: 'f_k3_ner_45', front: 'Gdzie znajdują się receptory słuchu?', back: 'W narządzie spiralnym w ślimaku ucha wewnętrznego.'),
          Flashcard(id: 'f_k3_ner_46', front: 'Które struktury ucha odpowiadają za zmysł równowagi?', back: 'Przewody półkoliste oraz woreczek i łagiewka.'),
          Flashcard(id: 'f_k3_ner_47', front: 'Jakie smaki podstawowe rozpoznaje człowiek?', back: 'Słodki, słony, kwaśny, gorzki i umami.'),
          Flashcard(id: 'f_k3_ner_48', front: 'Dlaczego przy katarze jedzenie wydaje się bez smaku?', back: 'Odczuwanie smaku potrawy w dużej mierze zależy od węchu.'),
          Flashcard(id: 'f_k3_ner_49', front: 'Jak dbać o słuch?', back: 'Unikać długotrwałego hałasu i głośnej muzyki w słuchawkach oraz stosować ochronniki słuchu.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k3_ner_19', question: 'Za widzenie barwne odpowiadają:', options: ['Pręciki', 'Czopki', 'Komórki tęczówki', 'Włókna twardówki'], correctIndex: 1, explanation: 'Pręciki umożliwiają widzenie przy słabym świetle, bez rozróżniania barw.'),
          QuizQuestion(id: 'q_k3_ner_20', question: 'Przy patrzeniu na bliski przedmiot soczewka:', options: ['Staje się bardziej płaska', 'Staje się bardziej wypukła', 'Nie zmienia kształtu', 'Przesuwa się do tyłu'], correctIndex: 1, explanation: 'Mięsień rzęskowy kurczy się, a soczewka mocniej załamuje światło.'),
          QuizQuestion(id: 'q_k3_ner_21', question: 'W krótkowzroczności obraz powstaje:', options: ['Na siatkówce', 'Przed siatkówką', 'Za siatkówką', 'Na plamce ślepej'], correctIndex: 1, explanation: 'Dlatego niewyraźnie widać przedmioty odległe.'),
          QuizQuestion(id: 'q_k3_ner_22', question: 'Ilość światła wpadającego do oka reguluje:', options: ['Soczewka', 'Tęczówka', 'Twardówka', 'Ciało szkliste'], correctIndex: 1, explanation: 'Tęczówka zmienia średnicę źrenicy.'),
          QuizQuestion(id: 'q_k3_ner_23', question: 'Receptory słuchu znajdują się w:', options: ['Uchu środkowym', 'Ślimaku ucha wewnętrznego', 'Przewodach półkolistych', 'Trąbce słuchowej'], correctIndex: 1, explanation: 'Przewody półkoliste należą do narządu równowagi.'),
          QuizQuestion(id: 'q_k3_ner_24', question: 'Kosteczki słuchowe znajdują się w uchu:', options: ['Zewnętrznym', 'Środkowym', 'Wewnętrznym', 'Zewnętrznym i wewnętrznym'], correctIndex: 1, explanation: 'Przenoszą drgania z błony bębenkowej do ucha wewnętrznego.'),
          QuizQuestion(id: 'q_k3_ner_25', question: 'Baroreceptory reagują na:', options: ['Światło', 'Zmiany ciśnienia krwi', 'Temperaturę', 'Substancje zapachowe'], correctIndex: 1, explanation: 'Znajdują się w ścianach aorty i tętnic szyjnych.'),
          QuizQuestion(id: 'q_k3_ner_26', question: 'Proprioreceptory znajdują się w:', options: ['Siatkówce', 'Mięśniach, ścięgnach i stawach', 'Jamie nosowej', 'Brodawkach języka'], correctIndex: 1, explanation: 'Informują o położeniu i ruchach części ciała.'),
          QuizQuestion(id: 'q_k3_ner_27', question: 'Smak umami jest związany z obecnością:', options: ['Cukrów', 'Glutaminianu', 'Kwasów', 'Soli kuchennej'], correctIndex: 1, explanation: 'Charakterystyczny jest m.in. dla bulionu i dojrzewających serów.'),
        ],
      ),
    ],
  ),

  // ===========================================================================
  // XI.7 PORUSZANIE SIĘ
  // ===========================================================================
  Chapter(
    id: 'k3_ruch',
    name: 'Poruszanie się',
    topics: [
      Topic(
        id: 'k3_ruch_zwierzeta',
        name: 'Ruch zwierząt i typy szkieletów',
        theory: '''
SPOSÓB PORUSZANIA SIĘ A ŚRODOWISKO ŻYCIA
Sposób poruszania się zależy od środowiska. Woda jest gęsta i stawia duży opór, ale podtrzymuje ciało, dlatego zwierzęta wodne mają opływowy kształt, płetwy lub kończyny przekształcone w wiosła, a wiele z nich pływa dzięki falistym ruchom ciała. Na lądzie ciało trzeba podtrzymywać wbrew sile ciężkości, więc zwierzęta lądowe mają mocny szkielet i kończyny, na których chodzą, biegają lub skaczą. Powietrze stawia mały opór, ale słabo podtrzymuje ciało, dlatego zwierzęta latające mają skrzydła, lekkie ciało i silne mięśnie. Zwierzęta osiadłe, np. koralowce, poruszają jedynie częściami ciała.

RODZAJE RUCHU
Ruch rzęskowy polega na skoordynowanym ruchu licznych rzęsek pokrywających powierzchnię ciała; umożliwia pływanie drobnym organizmom, np. orzęskom i larwom wielu bezkręgowców, a płazińcom wolno żyjącym — pełzanie. U człowieka rzęski nabłonka dróg oddechowych przesuwają śluz, a rzęski jajowodu — komórkę jajową. Ruch mięśniowy, wykorzystywany przez większość zwierząt, możliwy jest dzięki skurczom komórek mięśniowych działających na szkielet.

SZKIELET HYDRAULICZNY
Szkielet hydrauliczny tworzy płyn wypełniający jamę ciała, otoczony warstwami mięśni. Płyn jest nieściśliwy, dlatego skurcz jednych mięśni zmienia kształt ciała i rozciąga inne. U dżdżownicy skurcz mięśni okrężnych wydłuża i zwęża segmenty ciała, a skurcz mięśni podłużnych je skraca i poszerza; szczecinki zakotwiczają fragmenty ciała w podłożu, dzięki czemu przesuwające się fale skurczów przemieszczają zwierzę do przodu. Szkielet hydrauliczny mają m.in. pierścienice, nicienie i parzydełkowce.

SZKIELET ZEWNĘTRZNY
Szkielet zewnętrzny okrywa ciało od zewnątrz — u stawonogów tworzy go oskórek wysycony chityną, a u wielu mięczaków wapienna muszla. Mięśnie przyczepiają się do jego wewnętrznej powierzchni i poruszają członami połączonymi stawami. Szkielet zewnętrzny chroni narządy wewnętrzne i ogranicza utratę wody, ale jest ciężki i nie rośnie wraz ze zwierzęciem — stawonogi muszą więc linieć i przez pewien czas są wtedy bezbronne. Ogranicza to także ich maksymalne rozmiary.

SZKIELET WEWNĘTRZNY
Szkielet wewnętrzny kręgowców zbudowany jest z kości i chrząstek i leży wewnątrz ciała, a mięśnie przyczepiają się do jego zewnętrznej powierzchni. Rośnie wraz z organizmem, jest lekki w stosunku do swojej wytrzymałości i umożliwia osiągnięcie dużych rozmiarów ciała. Szkielet wewnętrzny z płytek wapiennych mają też szkarłupnie.

SZKIELET WEWNĘTRZNY JAKO ADAPTACJA DO ŚRODOWISKA I TRYBU ŻYCIA
Budowa szkieletu odzwierciedla środowisko i tryb życia. Ryby mają kręgosłup o słabo zróżnicowanych odcinkach i płetwy. U kręgowców lądowych kończyny połączone są z tułowiem za pośrednictwem obręczy barkowej i miednicznej, a kręgosłup dzieli się na wyraźne odcinki. Ptaki mają lekkie kości pneumatyczne, zrośnięte kręgi zapewniające sztywność tułowia, mostek z talerzem, do którego przyczepiają się silne mięśnie lotne, oraz kończyny przednie przekształcone w skrzydła. Wśród ssaków koń ma długie kończyny zakończone jednym palcem, przystosowane do szybkiego biegu, kret — krótkie, łopatowate kończyny przednie do kopania, nietoperz — silnie wydłużone palce rozpinające błonę lotną, a walenie — kończyny przednie przekształcone w płetwy i silnie zredukowane kończyny tylne.
''',
        flashcards: [
          Flashcard(id: 'f_k3_ruch_1', front: 'Jakie przystosowania do ruchu mają zwierzęta wodne?', back: 'Opływowy kształt ciała, płetwy lub wiosłowate kończyny, faliste ruchy ciała.'),
          Flashcard(id: 'f_k3_ruch_2', front: 'Na czym polega ruch rzęskowy? Podaj przykład.', back: 'Na skoordynowanym ruchu licznych rzęsek — np. pływanie orzęsków.'),
          Flashcard(id: 'f_k3_ruch_3', front: 'Jak działa szkielet hydrauliczny?', back: 'Nieściśliwy płyn w jamie ciała przenosi siłę skurczu mięśni i zmienia kształt ciała.'),
          Flashcard(id: 'f_k3_ruch_4', front: 'Jak porusza się dżdżownica?', back: 'Naprzemienne skurcze mięśni okrężnych i podłużnych, przy zakotwiczeniu ciała szczecinkami, przesuwają ją do przodu.'),
          Flashcard(id: 'f_k3_ruch_5', front: 'Jakie są zalety i wady szkieletu zewnętrznego?', back: 'Chroni narządy i ogranicza utratę wody, ale jest ciężki, nie rośnie i wymusza linienie.'),
          Flashcard(id: 'f_k3_ruch_6', front: 'Dlaczego szkielet wewnętrzny umożliwia osiągnięcie dużych rozmiarów ciała?', back: 'Rośnie wraz z organizmem i jest lekki w stosunku do swojej wytrzymałości.'),
          Flashcard(id: 'f_k3_ruch_7', front: 'Jakie przystosowania do lotu ma szkielet ptaka?', back: 'Lekkie kości pneumatyczne, mostek z talerzem dla mięśni lotnych, zrośnięte kręgi i skrzydła.'),
          Flashcard(id: 'f_k3_ruch_8', front: 'Które zwierzęta mają szkielet hydrauliczny?', back: 'Pierścienice, nicienie i parzydełkowce.'),
          Flashcard(id: 'f_k3_ruch_9', front: 'Podaj przykłady przystosowań kończyn ssaków do trybu życia.', back: 'Kret — łopatowate kończyny do kopania; koń — długie kończyny z jednym palcem; nietoperz — palce rozpinające błonę lotną.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k3_ruch_1', question: 'Szkielet hydrauliczny występuje u:', options: ['Owadów', 'Dżdżownicy', 'Ryb', 'Szkarłupni'], correctIndex: 1, explanation: 'Funkcję szkieletu pełni u niej płyn wypełniający jamę ciała.'),
          QuizQuestion(id: 'q_k3_ruch_2', question: 'Linienie jest konieczne u zwierząt ze szkieletem:', options: ['Wewnętrznym', 'Zewnętrznym', 'Hydraulicznym', 'Chrzęstnym'], correctIndex: 1, explanation: 'Sztywny szkielet zewnętrzny nie rośnie wraz ze zwierzęciem.'),
          QuizQuestion(id: 'q_k3_ruch_3', question: 'Talerz mostka ptaków jest miejscem przyczepu:', options: ['Mięśni lotnych', 'Mięśni szyi', 'Worków powietrznych', 'Piór'], correctIndex: 0, explanation: 'Silne mięśnie lotne poruszają skrzydłami.'),
          QuizQuestion(id: 'q_k3_ruch_4', question: 'Ruch rzęskowy umożliwia pływanie:', options: ['Orzęskom', 'Rybom', 'Ptakom wodnym', 'Waleniom'], correctIndex: 0, explanation: 'Pozostałe zwierzęta poruszają się dzięki skurczom mięśni.'),
          QuizQuestion(id: 'q_k3_ruch_5', question: 'U dżdżownicy skurcz mięśni okrężnych powoduje:', options: ['Skrócenie i poszerzenie segmentów', 'Wydłużenie i zwężenie segmentów', 'Wysunięcie szczecinek', 'Linienie'], correctIndex: 1, explanation: 'Skrócenie i poszerzenie wywołują mięśnie podłużne.'),
          QuizQuestion(id: 'q_k3_ruch_6', question: 'Szkielet zewnętrzny stawonogów:', options: ['Ogranicza utratę wody', 'Rośnie wraz ze zwierzęciem', 'Zbudowany jest z kości', 'Występuje wewnątrz ciała'], correctIndex: 0, explanation: 'Oskórek z chityną chroni przed wysychaniem.'),
        ],
      ),
      Topic(
        id: 'k3_ruch_czlowiek',
        name: 'Układ ruchu człowieka',
        theory: '''
SZKIELET CZŁOWIEKA
Szkielet dorosłego człowieka tworzy 206 kości. Szkielet osiowy obejmuje czaszkę, kręgosłup i klatkę piersiową. Czaszka dzieli się na część mózgową, chroniącą mózgowie, i część twarzową. Kręgosłup składa się z 33–34 kręgów tworzących pięć odcinków: szyjny (7 kręgów), piersiowy (12), lędźwiowy (5), krzyżowy (5 kręgów zrośniętych w kość krzyżową) i guziczny (4–5 kręgów zrośniętych w kość guziczną). Klatkę piersiową tworzą 12 par żeber, mostek i kręgi piersiowe — chroni ona serce i płuca i uczestniczy w ruchach oddechowych. Szkielet kończyn obejmuje obręcze i kończyny wolne. Obręcz barkową tworzą łopatki i obojczyki, a kończynę górną — kość ramienna, kości przedramienia (łokciowa i promieniowa) oraz kości ręki (nadgarstka, śródręcza i palców). Obręcz miedniczną tworzą kości miedniczne połączone z kością krzyżową, a kończynę dolną — kość udowa, rzepka, kości podudzia (piszczelowa i strzałkowa) oraz kości stopy (stępu, śródstopia i palców).

POŁĄCZENIA KOŚCI
Połączenia ścisłe są nieruchome lub mało ruchome. Należą do nich szwy łączące kości czaszki, chrząstkozrosty — np. połączenia żeber z mostkiem i trzonów kręgów za pośrednictwem krążków międzykręgowych — oraz kościozrosty, powstające przez zrośnięcie się kości, jak w kości krzyżowej. Połączenia ruchome, czyli stawy, umożliwiają ruch. Staw tworzą powierzchnie stawowe kości pokryte chrząstką szklistą, zmniejszającą tarcie, torebka stawowa, której błona wewnętrzna wytwarza maź stawową nawilżającą staw, jama stawowa oraz więzadła wzmacniające połączenie. Ze względu na kształt powierzchni stawowych i zakres ruchów wyróżnia się m.in. stawy kuliste, umożliwiające ruchy we wszystkich kierunkach — np. ramienny i biodrowy — stawy zawiasowe, umożliwiające zginanie i prostowanie — np. łokciowy i międzypaliczkowe — oraz staw siodełkowy u podstawy kciuka.

WSPÓŁDZIAŁANIE MIĘŚNI, ŚCIĘGIEN, STAWÓW I KOŚCI
Mięśnie szkieletowe przyczepiają się do kości za pomocą ścięgien, zbudowanych z tkanki łącznej zbitej. Kurcząc się, pociągają kość, która obraca się w stawie jak dźwignia: kość jest ramieniem dźwigni, a staw — punktem podparcia. Mięśnie mogą tylko ciągnąć, a nie pchać, dlatego ruchy w stawach wykonują mięśnie działające antagonistycznie — jeden zgina, a drugi prostuje. Mięsień dwugłowy ramienia zgina przedramię w stawie łokciowym, a mięsień trójgłowy ramienia je prostuje; gdy jeden z nich się kurczy, drugi się rozkurcza. Mięśnie synergistyczne kurczą się jednocześnie, wspólnie wykonując ruch lub stabilizując staw. Precyzyjną koordynację ruchów zapewnia układ nerwowy, a informacje o położeniu części ciała dostarczają proprioreceptory.

BUDOWA MIĘŚNIA SZKIELETOWEGO
Mięsień szkieletowy składa się z brzuśca i ścięgien. Brzusiec zbudowany jest z pęczków włókien mięśniowych otoczonych tkanką łączną. Włókno mięśniowe to wydłużona, wielojądrowa komórka wypełniona miofibryllami. Miofibrylle zbudowane są z ułożonych naprzemiennie filamentów aktynowych (cienkich) i miozynowych (grubych), tworzących powtarzające się jednostki — sarkomery. Regularne ułożenie filamentów daje obraz poprzecznego prążkowania.

MOLEKULARNY MECHANIZM SKURCZU MIĘŚNIA
Impuls nerwowy docierający do włókna mięśniowego powoduje uwolnienie jonów wapnia z siateczki śródplazmatycznej do cytoplazmy. Jony Ca2+ odsłaniają na filamentach aktynowych miejsca wiązania miozyny. Główki miozyny łączą się z aktyną, tworząc mostki poprzeczne, i wykonują ruch podobny do wiosłowania, przesuwając filamenty aktynowe w stronę środka sarkomeru; następnie dzięki ATP odłączają się i przyłączają w kolejnym miejscu. Filamenty aktynowe wsuwają się między miozynowe, sarkomery się skracają i cały mięsień się kurczy, choć długość samych filamentów nie ulega zmianie — to ślizgowy model skurczu. Gdy pobudzenie ustaje, jony wapnia są aktywnie usuwane z cytoplazmy i mięsień się rozkurcza. ATP jest potrzebny zarówno do ruchu główek miozyny, jak i do ich odłączenia od aktyny — dlatego po śmierci, gdy brakuje ATP, mięśnie sztywnieją.

POZYSKIWANIE ATP NIEZBĘDNEGO DO SKURCZU
Zapas ATP w mięśniu wystarcza na kilka sekund pracy. W pierwszych sekundach intensywnego wysiłku ATP odtwarzany jest z fosfokreatyny, która przekazuje grupę fosforanową na ADP. Przy bardzo intensywnym wysiłku, gdy brakuje tlenu, ATP powstaje w glikolizie, a pirogronian przekształcany jest w mleczan — ten sposób jest szybki, ale mało wydajny i prowadzi do zakwaszenia mięśni. Podczas długotrwałego wysiłku o umiarkowanej intensywności głównym źródłem ATP jest oddychanie tlenowe, w którym utleniane są glukoza, pochodząca z glikogenu i z krwi, oraz kwasy tłuszczowe. Po intensywnym wysiłku zużycie tlenu przez pewien czas pozostaje podwyższone, co umożliwia m.in. odtworzenie zapasów fosfokreatyny i przekształcenie mleczanu.

ODŻYWIANIE, AKTYWNOŚĆ FIZYCZNA A KOŚCI I MIĘŚNIE
Do prawidłowego rozwoju kości potrzebne są wapń i fosfor, witamina D, umożliwiająca wchłanianie wapnia, witamina C, niezbędna do syntezy kolagenu, oraz białko. Mięśnie wymagają pełnowartościowego białka, węglowodanów jako źródła energii oraz składników mineralnych, m.in. potasu i magnezu. Suplementy diety mogą uzupełnić niedobory — np. witaminy D w miesiącach o małym nasłonecznieniu — ale nie zastąpią zbilansowanej diety, a przyjmowane w nadmiarze mogą szkodzić. Regularna aktywność fizyczna zwiększa gęstość i wytrzymałość kości, masę i siłę mięśni oraz poprawia koordynację ruchów, a w młodości pozwala zbudować szczytową masę kostną, chroniącą przed osteoporozą w starszym wieku. Brak ruchu, długotrwałe siedzenie i nieprawidłowa postawa sprzyjają wadom postawy, takim jak skolioza, osłabieniu mięśni i utracie masy kostnej.

DOPING
Doping to stosowanie niedozwolonych substancji lub metod w celu zwiększenia wydolności sportowej. Sterydy anaboliczne zwiększają masę mięśni, ale uszkadzają wątrobę i serce oraz zaburzają gospodarkę hormonalną — u mężczyzn prowadzą do zaniku jąder i bezpłodności, u kobiet do nabywania cech męskich — powodują też trądzik, agresję i zahamowanie wzrostu u młodzieży. Erytropoetyna zwiększa liczbę erytrocytów i ilość transportowanego tlenu, ale zagęszcza krew, zwiększając ryzyko zakrzepów, zawału i udaru. Środki pobudzające maskują zmęczenie, grożąc wyczerpaniem organizmu, zaburzeniami rytmu serca i uzależnieniem, a leki moczopędne, stosowane do szybkiej utraty masy ciała i ukrywania innych substancji, prowadzą do odwodnienia i zaburzeń elektrolitowych. Doping jest nieuczciwy i zakazany, a jego skutki dla zdrowia bywają nieodwracalne.
''',
        flashcards: [
          Flashcard(id: 'f_k3_ruch_10', front: 'Wymień odcinki kręgosłupa człowieka i liczbę kręgów w każdym z nich.', back: 'Szyjny (7), piersiowy (12), lędźwiowy (5), krzyżowy (5 zrośniętych), guziczny (4–5 zrośniętych).'),
          Flashcard(id: 'f_k3_ruch_11', front: 'Co tworzy klatkę piersiową?', back: '12 par żeber, mostek i kręgi piersiowe.'),
          Flashcard(id: 'f_k3_ruch_12', front: 'Z jakich kości zbudowana jest kończyna dolna?', back: 'Z kości udowej, rzepki, kości piszczelowej i strzałkowej oraz kości stopy.'),
          Flashcard(id: 'f_k3_ruch_13', front: 'Z jakich kości zbudowana jest kończyna górna?', back: 'Z kości ramiennej, kości łokciowej i promieniowej oraz kości ręki.'),
          Flashcard(id: 'f_k3_ruch_14', front: 'Podaj przykłady połączeń ścisłych kości.', back: 'Szwy czaszki, chrząstkozrosty (żebra z mostkiem) i kościozrosty (kość krzyżowa).'),
          Flashcard(id: 'f_k3_ruch_15', front: 'Z czego zbudowany jest staw?', back: 'Z powierzchni stawowych pokrytych chrząstką, torebki stawowej wytwarzającej maź, jamy stawowej i więzadeł.'),
          Flashcard(id: 'f_k3_ruch_16', front: 'Podaj przykład stawu kulistego i zawiasowego.', back: 'Kulisty — ramienny lub biodrowy; zawiasowy — łokciowy lub międzypaliczkowy.'),
          Flashcard(id: 'f_k3_ruch_17', front: 'Na czym polega antagonistyczne działanie mięśni?', back: 'Jeden mięsień zgina, a drugi prostuje — np. mięsień dwugłowy i trójgłowy ramienia.'),
          Flashcard(id: 'f_k3_ruch_18', front: 'Czym są sarkomery?', back: 'Powtarzającymi się jednostkami miofibrylli zbudowanymi z filamentów aktynowych i miozynowych.'),
          Flashcard(id: 'f_k3_ruch_19', front: 'Jaką rolę w skurczu mięśnia pełnią jony wapnia?', back: 'Odsłaniają na aktynie miejsca wiązania miozyny.'),
          Flashcard(id: 'f_k3_ruch_20', front: 'Na czym polega ślizgowy model skurczu mięśnia?', back: 'Filamenty aktynowe wsuwają się między miozynowe i sarkomer się skraca, choć długość filamentów się nie zmienia.'),
          Flashcard(id: 'f_k3_ruch_21', front: 'Dlaczego po śmierci mięśnie sztywnieją?', back: 'Brakuje ATP potrzebnego do odłączenia główek miozyny od aktyny.'),
          Flashcard(id: 'f_k3_ruch_22', front: 'Skąd mięsień czerpie ATP w pierwszych sekundach intensywnego wysiłku?', back: 'Z fosfokreatyny.'),
          Flashcard(id: 'f_k3_ruch_23', front: 'Co jest źródłem ATP podczas długotrwałego, umiarkowanego wysiłku?', back: 'Oddychanie tlenowe — utlenianie glukozy i kwasów tłuszczowych.'),
          Flashcard(id: 'f_k3_ruch_24', front: 'Jak aktywność fizyczna w młodości chroni przed osteoporozą?', back: 'Pozwala zbudować większą szczytową masę kostną.'),
          Flashcard(id: 'f_k3_ruch_25', front: 'Jakie są skutki stosowania sterydów anabolicznych?', back: 'Uszkodzenie wątroby i serca, zaburzenia hormonalne, bezpłodność, agresja, zahamowanie wzrostu u młodzieży.'),
          Flashcard(id: 'f_k3_ruch_26', front: 'Dlaczego doping erytropoetyną jest niebezpieczny?', back: 'Zagęszcza krew, zwiększając ryzyko zakrzepów, zawału i udaru.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k3_ruch_7', question: 'Kręgosłup człowieka zawiera kręgów piersiowych:', options: ['7', '12', '5', '4'], correctIndex: 1, explanation: 'Łączą się z nimi żebra.'),
          QuizQuestion(id: 'q_k3_ruch_8', question: 'Staw biodrowy jest stawem:', options: ['Zawiasowym', 'Kulistym', 'Siodełkowym', 'Nieruchomym'], correctIndex: 1, explanation: 'Umożliwia ruchy w wielu kierunkach.'),
          QuizQuestion(id: 'q_k3_ruch_9', question: 'Przedramię w stawie łokciowym prostuje:', options: ['Mięsień dwugłowy ramienia', 'Mięsień trójgłowy ramienia', 'Przepona', 'Mięsień czworogłowy uda'], correctIndex: 1, explanation: 'Mięsień dwugłowy działa antagonistycznie — zgina przedramię.'),
          QuizQuestion(id: 'q_k3_ruch_10', question: 'Maź stawową wytwarza:', options: ['Chrząstka stawowa', 'Błona wewnętrzna torebki stawowej', 'Więzadło', 'Szpik kostny'], correctIndex: 1, explanation: 'Maź zmniejsza tarcie w stawie.'),
          QuizQuestion(id: 'q_k3_ruch_11', question: 'Podczas skurczu mięśnia skracają się:', options: ['Filamenty aktynowe', 'Filamenty miozynowe', 'Sarkomery', 'Wszystkie filamenty'], correctIndex: 2, explanation: 'Filamenty nie zmieniają długości, tylko przesuwają się względem siebie.'),
          QuizQuestion(id: 'q_k3_ruch_12', question: 'ATP jest potrzebny w skurczu mięśnia m.in. do:', options: ['Wytwarzania mazi stawowej', 'Odłączenia główek miozyny od aktyny', 'Syntezy kolagenu', 'Wytwarzania wapnia'], correctIndex: 1, explanation: 'Bez ATP mostki poprzeczne nie mogą się rozłączyć.'),
          QuizQuestion(id: 'q_k3_ruch_13', question: 'W pierwszych sekundach intensywnego wysiłku ATP odtwarzany jest głównie z:', options: ['Kwasów tłuszczowych', 'Fosfokreatyny', 'Białek', 'Mleczanu'], correctIndex: 1, explanation: 'Fosfokreatyna szybko przekazuje grupę fosforanową na ADP.'),
          QuizQuestion(id: 'q_k3_ruch_14', question: 'Kości czaszki łączą się za pomocą:', options: ['Stawów', 'Szwów', 'Chrząstkozrostów', 'Ścięgien'], correctIndex: 1, explanation: 'Szwy to połączenia ścisłe.'),
          QuizQuestion(id: 'q_k3_ruch_15', question: 'Do syntezy kolagenu w kościach niezbędna jest witamina:', options: ['A', 'C', 'K', 'B12'], correctIndex: 1, explanation: 'Witamina C uczestniczy w wytwarzaniu kolagenu.'),
        ],
      ),
    ],
  ),

  // ===========================================================================
  // XI.8 POKRYCIE CIAŁA I TERMOREGULACJA
  // ===========================================================================
  Chapter(
    id: 'k3_pokrycie',
    name: 'Pokrycie ciała i termoregulacja',
    topics: [
      Topic(
        id: 'k3_pokrycie_skora',
        name: 'Pokrycie ciała, skóra i termoregulacja',
        theory: '''
RODZAJE POKRYCIA CIAŁA ZWIERZĄT
Pokrycie ciała oddziela organizm od środowiska, chroni przed urazami, drobnoustrojami i utratą wody, a u wielu zwierząt uczestniczy też w wymianie gazowej, wydalaniu, odbieraniu bodźców i termoregulacji. U bezkręgowców ciało okrywa zwykle jednowarstwowy naskórek, który może wydzielać oskórek; u stawonogów oskórek wysycony chityną tworzy szkielet zewnętrzny, a u mięczaków płaszcz wytwarza wapienną muszlę. U kręgowców skóra składa się z wielowarstwowego naskórka i leżącej pod nim skóry właściwej, a jej wytwory są różne w poszczególnych grupach: ryby mają łuski pokryte śluzem zmniejszającym opór wody; płazy — nagą, wilgotną skórę z licznymi gruczołami śluzowymi, uczestniczącą w wymianie gazowej; gady — rogowe łuski i tarczki ograniczające utratę wody; ptaki — pióra umożliwiające lot i izolujące cieplnie; a ssaki — włosy, pełniące funkcję izolacyjną i czuciową.

BUDOWA I FUNKCJE SKÓRY CZŁOWIEKA
Naskórek jest nabłonkiem wielowarstwowym płaskim rogowaciejącym. W jego najgłębszej warstwie komórki stale się dzielą, przesuwają ku powierzchni, gromadzą keratynę i obumierają, tworząc warstwę rogową, która chroni przed urazami, drobnoustrojami i utratą wody i jest stale złuszczana. Melanocyty wytwarzają barwnik melaninę, pochłaniający promieniowanie UV. Skóra właściwa zbudowana jest z tkanki łącznej z włóknami kolagenowymi i sprężystymi, nadającymi skórze wytrzymałość i elastyczność; zawiera naczynia krwionośne, zakończenia nerwowe i receptory, cebulki włosów oraz gruczoły potowe i łojowe. Pod skórą leży tkanka podskórna z tkanką tłuszczową, która izoluje cieplnie i magazynuje energię. Budowa skóry odpowiada więc jej funkcjom: ochronnej, czuciowej, wydalniczej, termoregulacyjnej, magazynującej i udziałowi w wytwarzaniu witaminy D.

TERMOREGULACJA U ZWIERZĄT ENDOTERMICZNYCH
Ptaki i ssaki utrzymują stałą temperaturę ciała dzięki ciepłu powstającemu w przemianach metabolicznych. Utratę ciepła ograniczają izolacją — piórami, sierścią i tkanką tłuszczową — zwężeniem naczyń krwionośnych skóry, stroszeniem piór i sierści (u człowieka jego pozostałością jest gęsia skórka), drżeniem mięśniowym i zwiększeniem tempa metabolizmu, w czym uczestniczą hormony tarczycy i brunatna tkanka tłuszczowa. Przy przegrzaniu rozszerzają naczynia krwionośne skóry i wydzielają pot, którego parowanie ochładza ciało; zwierzęta, które pocą się słabo, np. psy, ziajają. Duże, silnie ukrwione uszy słonia afrykańskiego czy fenka ułatwiają oddawanie ciepła, a przeciwprądowa wymiana ciepła między tętnicami a żyłami w nogach ptaków brodzących ogranicza jego utratę. Ośrodek termoregulacji ssaków znajduje się w podwzgórzu. Do zachowań termoregulacyjnych należą np. szukanie cienia, skupianie się w grupy czy sen zimowy, w czasie którego temperatura ciała i tempo metabolizmu znacznie się obniżają.

TERMOREGULACJA U ZWIERZĄT EKTOTERMICZNYCH
Bezkręgowce, ryby, płazy i gady czerpią ciepło głównie z otoczenia, a ich temperatura ciała zależy od temperatury środowiska. Regulują ją przede wszystkim zachowaniem: jaszczurki wygrzewają się na słońcu, ustawiając ciało tak, by pochłaniało jak najwięcej promieni, a w upale chowają się w cieniu lub w norach; wiele zwierząt zmienia aktywność w ciągu doby i roku, a w chłodnej porze zapada w odrętwienie. Niektóre gady zmieniają ubarwienie — ciemniejsza skóra pochłania więcej ciepła — a owady przed lotem rozgrzewają mięśnie drżeniem skrzydeł. Ektotermia wymaga znacznie mniej pokarmu niż endotermia, ale aktywność zwierząt zależy od temperatury otoczenia.

SYNTEZA PROWITAMINY D A PROMIENIOWANIE UV
Pod wpływem promieniowania UVB w skórze z pochodnej cholesterolu powstaje prowitamina D, przekształcana następnie w wątrobie i nerkach w aktywną witaminę D, niezbędną do wchłaniania wapnia i mineralizacji kości. Wystarcza do tego krótka, kilkunastominutowa ekspozycja odsłoniętej skóry na słońce, ale w Polsce jesienią i zimą nasłonecznienie jest zbyt słabe, dlatego zaleca się wtedy suplementację. Nadmierna ekspozycja na promieniowanie UV — na słońcu i w solarium — przyspiesza starzenie się skóry, niszcząc włókna kolagenowe i sprężyste, co powoduje zmarszczki, utratę elastyczności i przebarwienia. Uszkadza też DNA komórek skóry, wywołując mutacje zwiększające ryzyko nowotworów, w tym najgroźniejszego czerniaka złośliwego oraz raka podstawnokomórkowego, a także powoduje oparzenia słoneczne, sprzyja zaćmie i osłabia odporność. Chronią przed tym kremy z filtrem UV, odzież i nakrycie głowy, okulary przeciwsłoneczne, unikanie słońca w godzinach południowych i rezygnacja z solarium. Należy też obserwować znamiona na skórze i zgłaszać lekarzowi te, które zmieniają kształt, barwę lub wielkość.
''',
        flashcards: [
          Flashcard(id: 'f_k3_skor_1', front: 'Jakie funkcje pełni pokrycie ciała zwierząt?', back: 'Chroni przed urazami, drobnoustrojami i utratą wody, a także uczestniczy w wymianie gazowej, wydalaniu, odbiorze bodźców i termoregulacji.'),
          Flashcard(id: 'f_k3_skor_2', front: 'Czym różni się pokrycie ciała płazów od gadów?', back: 'Płazy mają nagą, wilgotną skórę z gruczołami śluzowymi; gady — suchą skórę z rogowymi łuskami.'),
          Flashcard(id: 'f_k3_skor_3', front: 'Jak zbudowany jest naskórek człowieka?', back: 'Z wielowarstwowego nabłonka płaskiego rogowaciejącego; na powierzchni ma warstwę rogową z martwych komórek.'),
          Flashcard(id: 'f_k3_skor_4', front: 'Jaką funkcję pełnią melanocyty?', back: 'Wytwarzają melaninę, która pochłania promieniowanie UV.'),
          Flashcard(id: 'f_k3_skor_5', front: 'Co zawiera skóra właściwa?', back: 'Włókna kolagenowe i sprężyste, naczynia krwionośne, receptory, cebulki włosów oraz gruczoły potowe i łojowe.'),
          Flashcard(id: 'f_k3_skor_6', front: 'Jak zwierzęta endotermiczne ograniczają utratę ciepła?', back: 'Izolacją (pióra, sierść, tkanka tłuszczowa), zwężeniem naczyń skóry, drżeniem mięśni i zwiększeniem tempa metabolizmu.'),
          Flashcard(id: 'f_k3_skor_7', front: 'Jak zwierzęta endotermiczne pozbywają się nadmiaru ciepła?', back: 'Rozszerzając naczynia krwionośne skóry, pocąc się lub ziając.'),
          Flashcard(id: 'f_k3_skor_8', front: 'Jak regulują temperaturę ciała zwierzęta ektotermiczne?', back: 'Głównie zachowaniem — wygrzewaniem się na słońcu, chowaniem w cieniu, zmianą aktywności.'),
          Flashcard(id: 'f_k3_skor_9', front: 'Jak powstaje aktywna witamina D?', back: 'Pod wpływem UVB w skórze powstaje prowitamina D, przekształcana w wątrobie i nerkach w aktywną witaminę D.'),
          Flashcard(id: 'f_k3_skor_10', front: 'Dlaczego w Polsce zaleca się suplementację witaminy D jesienią i zimą?', back: 'Nasłonecznienie jest wtedy zbyt słabe do jej wytworzenia w skórze.'),
          Flashcard(id: 'f_k3_skor_11', front: 'Jakie są skutki nadmiernej ekspozycji na promieniowanie UV?', back: 'Przyspieszone starzenie skóry, oparzenia, mutacje i nowotwory skóry, np. czerniak.'),
          Flashcard(id: 'f_k3_skor_12', front: 'Jak chronić się przed szkodliwym działaniem UV?', back: 'Stosować kremy z filtrem, odzież i nakrycie głowy, okulary, unikać słońca w południe i solarium.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k3_skor_1', question: 'Pióra są wytworem skóry charakterystycznym dla:', options: ['Gadów', 'Ptaków', 'Ssaków', 'Płazów'], correctIndex: 1, explanation: 'Umożliwiają lot i izolują cieplnie.'),
          QuizQuestion(id: 'q_k3_skor_2', question: 'Barwnik pochłaniający promieniowanie UV wytwarzają:', options: ['Komórki warstwy rogowej', 'Melanocyty', 'Gruczoły łojowe', 'Komórki tuczne'], correctIndex: 1, explanation: 'Melanocyty wytwarzają melaninę.'),
          QuizQuestion(id: 'q_k3_skor_3', question: 'Wymianę gazową przez skórę umożliwia pokrycie ciała:', options: ['Gadów', 'Płazów', 'Ptaków', 'Ssaków'], correctIndex: 1, explanation: 'Naga, wilgotna i unaczyniona skóra przepuszcza gazy.'),
          QuizQuestion(id: 'q_k3_skor_4', question: 'Przy przegrzaniu organizmu człowieka naczynia krwionośne skóry:', options: ['Zwężają się', 'Rozszerzają się', 'Nie zmieniają średnicy', 'Zamykają się całkowicie'], correctIndex: 1, explanation: 'Do skóry napływa więcej krwi, co ułatwia oddawanie ciepła.'),
          QuizQuestion(id: 'q_k3_skor_5', question: 'Jaszczurka wygrzewająca się na słońcu to przykład termoregulacji:', options: ['Opartej na cieple z metabolizmu', 'Behawioralnej zwierzęcia ektotermicznego', 'Hormonalnej', 'Za pomocą drżenia mięśni'], correctIndex: 1, explanation: 'Zwierzęta ektotermiczne regulują temperaturę głównie zachowaniem.'),
          QuizQuestion(id: 'q_k3_skor_6', question: 'Prowitamina D powstaje w skórze pod wpływem promieniowania:', options: ['Podczerwonego', 'UVB', 'Rentgenowskiego', 'Mikrofalowego'], correctIndex: 1, explanation: 'Wystarcza krótka ekspozycja odsłoniętej skóry na słońce.'),
          QuizQuestion(id: 'q_k3_skor_7', question: 'Najgroźniejszym nowotworem skóry, którego ryzyko zwiększa promieniowanie UV, jest:', options: ['Rak podstawnokomórkowy', 'Czerniak złośliwy', 'Brodawka', 'Włókniak'], correctIndex: 1, explanation: 'Czerniak łatwo daje przerzuty.'),
          QuizQuestion(id: 'q_k3_skor_8', question: 'Psy obniżają temperaturę ciała głównie przez:', options: ['Pocenie się całą powierzchnią ciała', 'Ziajanie', 'Drżenie mięśni', 'Stroszenie sierści'], correctIndex: 1, explanation: 'Woda paruje z powierzchni języka i dróg oddechowych.'),
        ],
      ),
    ],
  ),

  // ===========================================================================
  // XI.9 ROZMNAŻANIE I ROZWÓJ
  // ===========================================================================
  Chapter(
    id: 'k3_rozmnazanie',
    name: 'Rozmnażanie i rozwój',
    topics: [
      Topic(
        id: 'k3_rozmnazanie_zwierzeta',
        name: 'Rozmnażanie i rozwój zwierząt',
        theory: '''
ROZMNAŻANIE BEZPŁCIOWE
W rozmnażaniu bezpłciowym potomstwo powstaje z jednego osobnika, bez udziału gamet, i jest genetycznie identyczne z rodzicem. Pączkowanie polega na tworzeniu się na ciele osobnika uwypuklenia, które rozwija się w nowy organizm — tak rozmnaża się stułbia. Fragmentacja to rozpad ciała na części, z których każda odtwarza brakujące narządy, jak u niektórych wirków i rozgwiazd. Rozmnażanie bezpłciowe jest szybkie, nie wymaga partnera i pozwala szybko zasiedlić korzystne środowisko, ale nie zapewnia zmienności genetycznej, więc populacja jest mniej odporna na zmiany warunków i choroby.

ROZMNAŻANIE PŁCIOWE
W rozmnażaniu płciowym potomstwo powstaje w wyniku połączenia gamet, zwykle pochodzących od dwóch osobników. Dzięki crossing-over i niezależnej segregacji chromosomów w mejozie oraz losowemu łączeniu się gamet potomstwo jest zróżnicowane genetycznie, co zwiększa szanse przetrwania populacji w zmiennym środowisku. Rozmnażanie płciowe wymaga jednak znalezienia partnera i większych nakładów energii. Większość zwierząt jest rozdzielnopłciowa, ale niektóre, np. dżdżownice, ślimaki winniczki i tasiemce, są obojnakami, które wytwarzają oba rodzaje gamet. Obojnaki zwykle unikają samozapłodnienia, zapładniając się krzyżowo, ale obojnactwo ułatwia rozmnażanie zwierzętom, które rzadko spotykają partnera, np. pasożytom. Szczególną formą rozmnażania płciowego jest partenogeneza — rozwój nowego osobnika z niezapłodnionej komórki jajowej, występujący np. u mszyc, wioślarek i pszczół, u których z niezapłodnionych jaj rozwijają się samce, czyli trutnie.

ZAPŁODNIENIE ZEWNĘTRZNE I WEWNĘTRZNE
Zapłodnienie zewnętrzne zachodzi w wodzie, poza organizmem samicy — występuje u większości ryb i u płazów. Gamety są narażone na zjedzenie i rozproszenie, dlatego zwierzęta te wytwarzają ich bardzo dużo, a synchronizacji uwolnienia gamet służą gody. Zapłodnienie wewnętrzne zachodzi w drogach rodnych samicy — występuje u owadów, gadów, ptaków i ssaków. Uniezależnia rozmnażanie od wody, zwiększa prawdopodobieństwo zapłodnienia i umożliwia ochronę zarodka, dlatego wystarcza mniejsza liczba gamet. Ze względu na sposób rozwoju zarodka zwierzęta dzieli się na jajorodne, składające jaja, w których zarodek rozwija się poza organizmem matki (ptaki, większość gadów); jajożyworodne, u których zarodek rozwija się w jaju pozostającym w drogach rodnych samicy, korzystając z substancji zapasowych jaja (np. żmija zygzakowata); oraz żyworodne, u których zarodek odżywia się kosztem organizmu matki (ssaki łożyskowe).

BUDOWA JAJA PTAKA
Jajo ptaka jest przystosowaniem do rozwoju zarodka na lądzie. Wapienna skorupka chroni zarodek przed uszkodzeniami, a jej pory umożliwiają wymianę gazową. Pod skorupką leżą dwie błony, które na tępym końcu jaja rozchodzą się, tworząc komorę powietrzną. Białko stanowi zapas wody i białek oraz chroni przed wstrząsami i drobnoustrojami. Żółtko jest głównym materiałem zapasowym, a na jego powierzchni leży tarczka zarodkowa, z której rozwija się zarodek. Skręcone pasma białka, czyli chalazy, utrzymują żółtko w środku jaja tak, że tarczka zarodkowa zawsze znajduje się u góry.

ROZWÓJ ZARODKOWY
Rozwój zarodkowy rozpoczyna się od bruzdkowania, czyli szybkich podziałów mitotycznych zygoty bez wzrostu komórek, prowadzących do powstania blastuli — kulistego zarodka, często z jamą w środku. Podczas gastrulacji komórki przemieszczają się i tworzą listki zarodkowe: ektodermę, endodermę, a u zwierząt trójwarstwowych również mezodermę. W organogenezie z listków zarodkowych powstają narządy. Z ektodermy powstają naskórek i jego wytwory oraz układ nerwowy i narządy zmysłów; z endodermy — wyściółka przewodu pokarmowego, wątroba, trzustka i płuca; z mezodermy — mięśnie, szkielet, układ krwionośny, wydalniczy i rozrodczy.

BŁONY PŁODOWE OWODNIOWCÓW
Owodniowce — gady, ptaki i ssaki — wytwarzają błony płodowe, które umożliwiły rozwój zarodka na lądzie. Owodnia otacza zarodek i wypełniona jest płynem owodniowym, chroniącym przed wysychaniem i wstrząsami. Pęcherzyk żółtkowy zawiera żółtko odżywiające zarodek; u ssaków, których jaja są ubogie w żółtko, powstają w nim pierwsze komórki krwi i pierwotne komórki płciowe. Omocznia gromadzi zbędne produkty przemiany materii, a wraz z kosmówką uczestniczy w wymianie gazowej. Kosmówka otacza zarodek i pozostałe błony; u ssaków łożyskowych współtworzy łożysko.

ROZWÓJ PROSTY I ZŁOŻONY
W rozwoju prostym z jaja wylęga się osobnik podobny do dorosłego, który jedynie rośnie i dojrzewa — tak rozwijają się m.in. gady, ptaki, ssaki i pajęczaki. W rozwoju złożonym z jaja wylęga się larwa, różniąca się od osobnika dorosłego budową, sposobem odżywiania i często środowiskiem życia, która przechodzi przeobrażenie, czyli metamorfozę. Dzięki temu larwy i osobniki dorosłe nie konkurują ze sobą o pokarm i siedlisko, a stadia rozwojowe mogą się specjalizować — larwa w odżywianiu i wzroście, a postać dorosła w rozmnażaniu i rozprzestrzenianiu się. Rozwój złożony występuje u wielu bezkręgowców i u płazów, u których wodna, skrzelodyszna kijanka przekształca się w lądową, płucodyszną postać dorosłą.

PRZEOBRAŻENIE ZUPEŁNE I NIEZUPEŁNE U OWADÓW
W przeobrażeniu niezupełnym rozwój przebiega w stadiach: jajo, larwa i postać dorosła (imago). Larwa jest podobna do owada dorosłego, ale nie ma w pełni rozwiniętych skrzydeł ani dojrzałych narządów rozrodczych i przechodzi kolejne linienia. Tak rozwijają się m.in. ważki, prostoskrzydłe (koniki polne, szarańcza), karaczany i pluskwiaki. W przeobrażeniu zupełnym rozwój przebiega w stadiach: jajo, larwa, poczwarka i imago. Larwa znacznie różni się od owada dorosłego, a w stadium poczwarki, które nie pobiera pokarmu, następuje całkowita przebudowa ciała. Tak rozwijają się m.in. motyle, chrząszcze, muchówki i błonkówki.

CYKLE ROZWOJOWE PASOŻYTÓW
Żywiciel ostateczny to organizm, w którym pasożyt osiąga dojrzałość płciową i rozmnaża się płciowo, a żywiciel pośredni — organizm, w którym rozwijają się jego larwy. Tasiemiec uzbrojony żyje w jelicie cienkim człowieka, który jest żywicielem ostatecznym. Człony wypełnione jajami wydostają się z kałem; zjedzone przez świnię, będącą żywicielem pośrednim, uwalniają larwy, które krwią docierają do mięśni i przekształcają się w wągry. Człowiek zaraża się, jedząc surowe lub niedogotowane mięso wieprzowe z wągrami. Jeśli połknie jaja tasiemca uzbrojonego, sam staje się żywicielem pośrednim — wągry mogą rozwinąć się wtedy m.in. w mózgu i oczach, co jest bardzo groźne. Tasiemiec nieuzbrojony ma podobny cykl, ale jego żywicielem pośrednim jest bydło. Motylica wątrobowa pasożytuje w przewodach żółciowych owiec i bydła, a czasem człowieka. Z jaj wydostających się z kałem do wody wylęgają się larwy, które wnikają do żywiciela pośredniego — ślimaka błotniarki moczarowej — i rozmnażają się w nim. Opuszczające ślimaka larwy otorbiają się na roślinach, a żywiciel ostateczny zaraża się, zjadając je wraz z trawą. Glista ludzka nie ma żywiciela pośredniego: człowiek zaraża się, połykając jaja z niemytymi warzywami lub brudnymi rękami, a larwy wylęgające się w jelicie wędrują z krwią przez wątrobę i serce do płuc, skąd są odkrztuszane i ponownie połykane, po czym dojrzewają w jelicie. Włosień kręty zaraża człowieka jedzącego niedogotowane mięso świń lub dzików z otorbionymi larwami; w jelicie dorośleją, a samice rodzą larwy, które z krwią docierają do mięśni i się w nich otorbiają — ten sam organizm jest więc żywicielem ostatecznym i pośrednim. Profilaktyka obejmuje mycie rąk, owoców i warzyw, spożywanie tylko przebadanego i dobrze obróbionego termicznie mięsa, picie przegotowanej wody oraz odrobaczanie zwierząt.
''',
        flashcards: [
          Flashcard(id: 'f_k3_roz_1', front: 'Jakie są zalety i wady rozmnażania bezpłciowego?', back: 'Zalety: szybkość, brak potrzeby partnera. Wady: brak zmienności genetycznej i mniejsza odporność populacji na zmiany środowiska.'),
          Flashcard(id: 'f_k3_roz_2', front: 'Czym jest pączkowanie? Podaj przykład.', back: 'Wytworzeniem na ciele uwypuklenia, które rozwija się w nowy osobnik — np. u stułbi.'),
          Flashcard(id: 'f_k3_roz_3', front: 'Czym jest partenogeneza? Podaj przykłady.', back: 'Rozwojem osobnika z niezapłodnionej komórki jajowej — np. mszyce, wioślarki, trutnie pszczół.'),
          Flashcard(id: 'f_k3_roz_4', front: 'Dlaczego rozmnażanie płciowe zwiększa zmienność genetyczną?', back: 'Dzięki crossing-over, niezależnej segregacji chromosomów w mejozie i losowemu łączeniu się gamet.'),
          Flashcard(id: 'f_k3_roz_5', front: 'Podaj przykłady zwierząt obojnaczych.', back: 'Dżdżownica, winniczek, tasiemce.'),
          Flashcard(id: 'f_k3_roz_6', front: 'Jakie są zalety zapłodnienia wewnętrznego?', back: 'Uniezależnia rozmnażanie od wody, zwiększa szansę zapłodnienia i umożliwia ochronę zarodka.'),
          Flashcard(id: 'f_k3_roz_7', front: 'Czym różni się jajożyworodność od żyworodności?', back: 'W jajożyworodności zarodek rozwija się w jaju w drogach rodnych, korzystając z żółtka; w żyworodności odżywia się kosztem matki.'),
          Flashcard(id: 'f_k3_roz_8', front: 'Jaką funkcję pełnią chalazy w jaju ptaka?', back: 'Utrzymują żółtko w środku jaja tak, że tarczka zarodkowa jest zawsze u góry.'),
          Flashcard(id: 'f_k3_roz_9', front: 'Wymień etapy rozwoju zarodkowego zwierząt.', back: 'Bruzdkowanie (blastula), gastrulacja (listki zarodkowe), organogeneza.'),
          Flashcard(id: 'f_k3_roz_10', front: 'Co powstaje z ektodermy?', back: 'Naskórek i jego wytwory, układ nerwowy i narządy zmysłów.'),
          Flashcard(id: 'f_k3_roz_11', front: 'Co powstaje z endodermy?', back: 'Wyściółka przewodu pokarmowego, wątroba, trzustka i płuca.'),
          Flashcard(id: 'f_k3_roz_12', front: 'Wymień błony płodowe owodniowców i ich funkcje.', back: 'Owodnia — ochrona przed wysychaniem i wstrząsami; pęcherzyk żółtkowy — odżywianie; omocznia — gromadzenie zbędnych produktów i wymiana gazowa; kosmówka — wymiana gazowa, u ssaków współtworzy łożysko.'),
          Flashcard(id: 'f_k3_roz_13', front: 'Czym różni się rozwój prosty od złożonego?', back: 'W prostym z jaja wylęga się osobnik podobny do dorosłego; w złożonym — larwa, która przechodzi przeobrażenie.'),
          Flashcard(id: 'f_k3_roz_14', front: 'Jakie korzyści daje rozwój złożony?', back: 'Larwy i dorośli nie konkurują o pokarm i siedlisko; stadia specjalizują się we wzroście i rozmnażaniu.'),
          Flashcard(id: 'f_k3_roz_15', front: 'Czym różni się przeobrażenie zupełne od niezupełnego?', back: 'Zupełne ma stadium poczwarki (jajo–larwa–poczwarka–imago), niezupełne nie ma (jajo–larwa–imago).'),
          Flashcard(id: 'f_k3_roz_16', front: 'Podaj przykłady owadów o przeobrażeniu zupełnym i niezupełnym.', back: 'Zupełne: motyle, chrząszcze, muchówki, błonkówki. Niezupełne: ważki, prostoskrzydłe, pluskwiaki.'),
          Flashcard(id: 'f_k3_roz_17', front: 'Czym różni się żywiciel ostateczny od pośredniego?', back: 'W ostatecznym pasożyt osiąga dojrzałość i rozmnaża się płciowo, w pośrednim rozwijają się jego larwy.'),
          Flashcard(id: 'f_k3_roz_18', front: 'Jak człowiek zaraża się tasiemcem uzbrojonym?', back: 'Jedząc surowe lub niedogotowane mięso wieprzowe z wągrami.'),
          Flashcard(id: 'f_k3_roz_19', front: 'Kiedy człowiek staje się żywicielem pośrednim tasiemca uzbrojonego?', back: 'Po połknięciu jego jaj — wągry rozwijają się wtedy w jego narządach, np. w mózgu.'),
          Flashcard(id: 'f_k3_roz_20', front: 'Kto jest żywicielem pośrednim motylicy wątrobowej?', back: 'Ślimak błotniarka moczarowa.'),
          Flashcard(id: 'f_k3_roz_21', front: 'Jak przebiega cykl rozwojowy glisty ludzkiej?', back: 'Bez żywiciela pośredniego: połknięte jaja → larwy w jelicie → wędrówka z krwią do płuc → odkrztuszenie i połknięcie → dojrzewanie w jelicie.'),
          Flashcard(id: 'f_k3_roz_22', front: 'Dlaczego u włośnia krętego ten sam organizm jest żywicielem ostatecznym i pośrednim?', back: 'Dorosłe osobniki żyją w jego jelicie, a larwy otorbiają się w jego mięśniach.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k3_roz_1', question: 'Pączkowanie jest sposobem rozmnażania:', options: ['Płciowego stułbi', 'Bezpłciowego stułbi', 'Płciowego dżdżownicy', 'Bezpłciowego pszczoły'], correctIndex: 1, explanation: 'Nowy osobnik rozwija się z uwypuklenia na ciele rodzica.'),
          QuizQuestion(id: 'q_k3_roz_2', question: 'Trutnie pszczoły miodnej powstają w wyniku:', options: ['Pączkowania', 'Partenogenezy', 'Fragmentacji', 'Samozapłodnienia'], correctIndex: 1, explanation: 'Rozwijają się z niezapłodnionych jaj.'),
          QuizQuestion(id: 'q_k3_roz_3', question: 'Zapłodnienie zewnętrzne występuje u:', options: ['Ptaków', 'Większości płazów', 'Ssaków', 'Gadów'], correctIndex: 1, explanation: 'Gamety łączą się w wodzie, poza organizmem samicy.'),
          QuizQuestion(id: 'q_k3_roz_4', question: 'Tarczka zarodkowa w jaju ptaka znajduje się na:', options: ['Skorupce', 'Powierzchni żółtka', 'Komorze powietrznej', 'Chalazach'], correctIndex: 1, explanation: 'Z tarczki zarodkowej rozwija się zarodek.'),
          QuizQuestion(id: 'q_k3_roz_5', question: 'Listki zarodkowe powstają podczas:', options: ['Bruzdkowania', 'Gastrulacji', 'Organogenezy', 'Zapłodnienia'], correctIndex: 1, explanation: 'Bruzdkowanie prowadzi do powstania blastuli.'),
          QuizQuestion(id: 'q_k3_roz_6', question: 'Układ nerwowy powstaje z:', options: ['Endodermy', 'Mezodermy', 'Ektodermy', 'Kosmówki'], correctIndex: 2, explanation: 'Z ektodermy powstają też naskórek i narządy zmysłów.'),
          QuizQuestion(id: 'q_k3_roz_7', question: 'Błoną płodową gromadzącą zbędne produkty przemiany materii jest:', options: ['Owodnia', 'Omocznia', 'Kosmówka', 'Pęcherzyk żółtkowy'], correctIndex: 1, explanation: 'Omocznia uczestniczy też w wymianie gazowej.'),
          QuizQuestion(id: 'q_k3_roz_8', question: 'Stadium poczwarki występuje w rozwoju:', options: ['Ważki', 'Konika polnego', 'Biedronki', 'Pluskwiaka'], correctIndex: 2, explanation: 'Chrząszcze przechodzą przeobrażenie zupełne.'),
          QuizQuestion(id: 'q_k3_roz_9', question: 'Żywicielem pośrednim tasiemca nieuzbrojonego jest:', options: ['Świnia', 'Bydło', 'Ślimak', 'Człowiek'], correctIndex: 1, explanation: 'Żywicielem pośrednim tasiemca uzbrojonego jest świnia.'),
          QuizQuestion(id: 'q_k3_roz_10', question: 'Larwy glisty ludzkiej w trakcie wędrówki po organizmie docierają do:', options: ['Mięśni, gdzie się otorbiają', 'Płuc', 'Mózgu, tworząc wągry', 'Przewodów żółciowych'], correctIndex: 1, explanation: 'Z płuc są odkrztuszane i połykane, po czym dojrzewają w jelicie.'),
          QuizQuestion(id: 'q_k3_roz_11', question: 'Człowiek zaraża się motylicą wątrobową, gdy:', options: ['Zjada niedogotowaną wieprzowinę', 'Zjada rośliny lub pije wodę z otorbionymi larwami', 'Zostanie ukąszony przez komara', 'Połknie jaja z kurzem'], correctIndex: 1, explanation: 'Larwy otorbiają się na roślinach nadwodnych.'),
          QuizQuestion(id: 'q_k3_roz_12', question: 'Rozwój złożony charakteryzuje się:', options: ['Brakiem stadium larwy', 'Występowaniem larwy przechodzącej przeobrażenie', 'Wyłącznie rozmnażaniem bezpłciowym', 'Zawsze obecnością poczwarki'], correctIndex: 1, explanation: 'Poczwarka występuje tylko w przeobrażeniu zupełnym.'),
          QuizQuestion(id: 'q_k3_roz_13', question: 'Żmija zygzakowata jest zwierzęciem:', options: ['Jajorodnym', 'Jajożyworodnym', 'Żyworodnym łożyskowym', 'Partenogenetycznym'], correctIndex: 1, explanation: 'Zarodek rozwija się w jaju pozostającym w drogach rodnych samicy.'),
        ],
      ),
      Topic(
        id: 'k3_rozmnazanie_czlowiek',
        name: 'Rozmnażanie i rozwój człowieka',
        theory: '''
MĘSKI UKŁAD ROZRODCZY
Jądra leżą w mosznie, poza jamą brzuszną, ponieważ plemniki powstają prawidłowo w temperaturze o 2–3°C niższej niż temperatura wnętrza ciała. W kanalikach nasiennych jąder zachodzi spermatogeneza, wspomagana przez komórki Sertolego, które odżywiają powstające plemniki. Komórki śródmiąższowe (Leydiga) leżące między kanalikami wytwarzają testosteron. Plemniki dojrzewają i są magazynowane w najądrzach, skąd podczas wytrysku przemieszczają się nasieniowodami do cewki moczowej. Pęcherzyki nasienne wytwarzają wydzielinę bogatą we fruktozę, stanowiącą źródło energii dla plemników, gruczoł krokowy (prostata) — wydzielinę o odczynie zasadowym, neutralizującą kwaśne środowisko pochwy, a gruczoły opuszkowo-cewkowe — śluz oczyszczający cewkę. Plemniki wraz z wydzielinami gruczołów tworzą nasienie. Prącie jest narządem kopulacyjnym, przez które przebiega cewka moczowa.

ŻEŃSKI UKŁAD ROZRODCZY
Jajniki wytwarzają komórki jajowe i hormony — estrogeny i progesteron. Komórki jajowe dojrzewają w pęcherzykach jajnikowych. Jajowody odbierają uwolnioną z jajnika komórkę jajową i przesuwają ją ku macicy dzięki rzęskom i skurczom ścian; w jajowodzie zwykle dochodzi do zapłodnienia. Macica jest mięśniowym narządem, w którym rozwija się zarodek i płód; jej błona śluzowa (endometrium) zmienia się cyklicznie i umożliwia zagnieżdżenie zarodka, a gruba warstwa mięśni gładkich wypycha płód podczas porodu. Pochwa jest narządem kopulacyjnym i stanowi drogę rodną. Kwaśny odczyn pochwy chroni przed drobnoustrojami.

GAMETOGENEZA
Spermatogeneza zachodzi w kanalikach nasiennych od okresu dojrzewania płciowego przez całe życie. Spermatogonie (2n) namnażają się mitotycznie, a część z nich rośnie, przekształcając się w spermatocyty I rzędu (2n). W wyniku I podziału mejotycznego powstają spermatocyty II rzędu (n), a po II podziale — spermatydy (n), które przekształcają się w plemniki. Z jednego spermatocytu I rzędu powstają cztery plemniki. Plemnik składa się z główki zawierającej jądro i akrosom z enzymami umożliwiającymi przejście przez osłonki komórki jajowej, wstawki z mitochondriami dostarczającymi ATP oraz witki umożliwiającej ruch. Oogeneza rozpoczyna się w życiu płodowym: oogonie namnażają się mitotycznie i przekształcają w oocyty I rzędu, które rozpoczynają mejozę, ale zatrzymują się w profazie I aż do okresu dojrzewania. Od okresu dojrzewania w każdym cyklu zwykle jeden oocyt kończy I podział mejotyczny. Podział ten jest nierówny: powstaje duży oocyt II rzędu, zawierający prawie całą cytoplazmę, oraz małe ciałko kierunkowe. Oocyt II rzędu zostaje uwolniony podczas owulacji, a II podział mejotyczny kończy dopiero po wniknięciu plemnika. Z jednego oocytu I rzędu powstaje więc jedna komórka jajowa, zawierająca duży zapas substancji dla zarodka, i ciałka kierunkowe, które obumierają.

HORMONALNA REGULACJA ROZRODU
Podwzgórze wydziela gonadoliberynę, która pobudza przysadkę do wydzielania hormonów gonadotropowych: folikulotropiny (FSH) i lutropiny (LH). U mężczyzn FSH pobudza spermatogenezę, a LH — wydzielanie testosteronu przez komórki śródmiąższowe. Testosteron warunkuje rozwój męskich cech płciowych i spermatogenezę, a jego wysokie stężenie hamuje wydzielanie gonadoliberyny i gonadotropin na zasadzie ujemnego sprzężenia zwrotnego.

CYKL MENSTRUACYJNY
Cykl menstruacyjny trwa średnio 28 dni i obejmuje zmiany zachodzące w jajniku i w błonie śluzowej macicy. Pierwszego dnia cyklu rozpoczyna się miesiączka — złuszczanie się błony śluzowej macicy, trwające zwykle 3–5 dni. W fazie folikularnej FSH pobudza wzrost pęcherzyków jajnikowych, a dojrzewający pęcherzyk wydziela coraz więcej estrogenów, które powodują odbudowę i pogrubienie błony śluzowej macicy. Wysokie stężenie estrogenów powoduje gwałtowny wzrost wydzielania LH, który około 14. dnia cyklu wywołuje owulację, czyli pęknięcie dojrzałego pęcherzyka (pęcherzyka Graafa) i uwolnienie oocytu. W fazie lutealnej z pozostałości pęcherzyka pod wpływem LH powstaje ciałko żółte, wydzielające progesteron i estrogeny. Progesteron przygotowuje błonę śluzową macicy na przyjęcie zarodka — staje się ona silnie ukrwiona i bogata w gruczoły — oraz hamuje wydzielanie FSH i LH, dzięki czemu nie dojrzewają kolejne pęcherzyki. Jeśli nie dojdzie do zapłodnienia, ciałko żółte zanika, stężenie progesteronu i estrogenów spada, błona śluzowa macicy złuszcza się i rozpoczyna się kolejny cykl. Jeśli dojdzie do zapłodnienia, zarodek wydziela gonadotropinę kosmówkową (hCG), która podtrzymuje działanie ciałka żółtego; jej obecność w moczu wykrywają testy ciążowe.

ZASTOSOWANIE SYNTETYCZNYCH HORMONÓW PŁCIOWYCH
Hormonalne środki antykoncepcyjne zawierają syntetyczne estrogeny i progestageny lub same progestageny. Hamują wydzielanie FSH i LH, przez co nie dochodzi do dojrzewania pęcherzyka i owulacji, a także zagęszczają śluz szyjkowy, utrudniając wędrówkę plemników, i zmieniają błonę śluzową macicy. Mogą powodować skutki uboczne, m.in. zwiększać ryzyko zakrzepicy, zwłaszcza u palących kobiet, dlatego stosuje się je wyłącznie z przepisu lekarza. Syntetyczne hormony wykorzystuje się też w leczeniu niepłodności — do pobudzania dojrzewania pęcherzyków i owulacji, m.in. podczas zapłodnienia pozaustrojowego (in vitro) — w podtrzymywaniu zagrożonej ciąży progesteronem, w leczeniu zaburzeń cyklu oraz w hormonalnej terapii zastępczej, łagodzącej objawy menopauzy wynikające ze spadku wydzielania estrogenów.

ZAPŁODNIENIE, ZAGNIEŻDŻENIE I ŁOŻYSKO
Do zapłodnienia dochodzi zwykle w jajowodzie. Po dotarciu do oocytu plemniki uwalniają enzymy z akrosomu, trawiące jego osłonki; po wniknięciu jednego plemnika osłonki zmieniają się tak, że inne plemniki nie mogą już wniknąć. Zygota podczas wędrówki jajowodem ulega bruzdkowaniu i jako blastocysta — zbudowana z zewnętrznej warstwy komórek, czyli trofoblastu, i węzła zarodkowego, z którego rozwija się zarodek — dociera do macicy i około 6.–7. dnia po zapłodnieniu zagnieżdża się w jej błonie śluzowej. Łożysko powstaje z kosmków kosmówki zarodka i błony śluzowej macicy i łączy się z płodem pępowiną. Krew matki i płodu nie miesza się — substancje przenikają przez cienką warstwę oddzielającą krew płodu w kosmkach od krwi matki. Łożysko umożliwia wymianę gazową, dostarcza płodowi składników odżywczych i wody, usuwa zbędne produkty przemiany materii, przepuszcza przeciwciała matki, zapewniające noworodkowi odporność bierną, oraz wytwarza hormony podtrzymujące ciążę: hCG, progesteron i estrogeny. Stanowi też częściową barierę dla drobnoustrojów, ale przenikają przez nie m.in. alkohol, nikotyna, wiele leków i niektóre wirusy.

PRZEBIEG CIĄŻY I PORÓD
Ciąża trwa około 38 tygodni od zapłodnienia, czyli około 40 tygodni licząc od pierwszego dnia ostatniej miesiączki. Do końca 8. tygodnia po zapłodnieniu trwa okres zarodkowy, w którym powstają zawiązki wszystkich narządów — zarodek jest wtedy najbardziej wrażliwy na czynniki szkodliwe. Od 9. tygodnia trwa okres płodowy, w którym narządy rosną i dojrzewają. Poród rozpoczynają skurcze macicy nasilane przez oksytocynę. Wyróżnia się okres rozwierania szyjki macicy, okres wydalania płodu i okres łożyskowy, w którym wydalane jest łożysko wraz z błonami płodowymi.

CZYNNIKI WPŁYWAJĄCE NA ROZWÓJ ZARODKA I PŁODU
Prawidłowy rozwój wymaga zbilansowanej diety, zwłaszcza odpowiedniej ilości kwasu foliowego, którego niedobór zwiększa ryzyko wad cewy nerwowej, a także żelaza, jodu i witaminy D. Alkohol uszkadza rozwijający się mózg i może wywołać płodowy zespół alkoholowy (FAS) — niepełnosprawność intelektualną, zaburzenia wzrostu i charakterystyczne cechy twarzy; nie istnieje bezpieczna dawka alkoholu w ciąży. Nikotyna i inne składniki dymu tytoniowego zwężają naczynia łożyska i zmniejszają dopływ tlenu, co prowadzi do niskiej masy urodzeniowej i przedwczesnego porodu. Szkodzą również narkotyki, niektóre leki, promieniowanie jonizujące oraz zakażenia — różyczka, toksoplazmoza, cytomegalia, kiła czy HIV — mogące wywołać wady rozwojowe lub poronienie.

BADANIA PRENATALNE
Badania prenatalne pozwalają ocenić rozwój płodu i wykryć wady wrodzone oraz choroby genetyczne. Badania nieinwazyjne nie zagrażają płodowi: badanie USG pozwala ocenić wielkość i budowę płodu, a z krwi matki wykonuje się testy biochemiczne oraz badanie wolnego DNA płodu, oceniające ryzyko m.in. zespołu Downa. Nieprawidłowy wynik wymaga potwierdzenia badaniem inwazyjnym. Do badań inwazyjnych należą amniopunkcja — pobranie płynu owodniowego z komórkami płodu — oraz biopsja kosmówki. Pozwalają one ustalić kariotyp płodu i przeprowadzić badania DNA, ale wiążą się z niewielkim ryzykiem poronienia. Wczesne wykrycie wady umożliwia przygotowanie się do opieki nad dzieckiem, a niekiedy leczenie jeszcze przed urodzeniem.

ROZWÓJ POZAPŁODOWY CZŁOWIEKA
Po urodzeniu człowiek przechodzi kolejne okresy rozwoju. Okres noworodkowy obejmuje pierwsze cztery tygodnie życia — organizm przystosowuje się do samodzielnego oddychania, odżywiania i termoregulacji. W okresie niemowlęcym, trwającym do końca pierwszego roku, dziecko najszybciej rośnie, uczy się siadać, raczkować i wypowiadać pierwsze słowa. W okresie dzieciństwa rozwijają się ruchy, mowa, myślenie i umiejętności społeczne. Okres dojrzewania, czyli pokwitanie, rozpoczyna się u dziewcząt zwykle wcześniej niż u chłopców; pod wpływem hormonów płciowych następuje skok wzrostu, rozwijają się drugorzędowe cechy płciowe, pojawia się pierwsza miesiączka lub pierwsze wytryski, a także zachodzą zmiany emocjonalne. W okresie dorosłości organizm osiąga pełną sprawność fizyczną i dojrzałość społeczną, a u kobiet w wieku około 45–55 lat następuje menopauza — wygaśnięcie czynności jajników. Starzenie się to stopniowe pogarszanie się sprawności organizmu: zmniejsza się masa mięśni i kości, elastyczność skóry i naczyń krwionośnych, sprawność narządów zmysłów, pamięć i odporność. Tempo starzenia zależy od czynników genetycznych i stylu życia — aktywność fizyczna, właściwa dieta i unikanie używek je spowalniają. Życie kończy śmierć, czyli nieodwracalne ustanie czynności organizmu, stwierdzane na podstawie śmierci mózgu.
''',
        flashcards: [
          Flashcard(id: 'f_k3_roz_23', front: 'Dlaczego jądra leżą w mosznie?', back: 'Plemniki powstają prawidłowo w temperaturze o 2–3°C niższej niż temperatura wnętrza ciała.'),
          Flashcard(id: 'f_k3_roz_24', front: 'Jaką funkcję pełnią komórki Sertolego i komórki śródmiąższowe jądra?', back: 'Komórki Sertolego odżywiają powstające plemniki, a śródmiąższowe (Leydiga) wydzielają testosteron.'),
          Flashcard(id: 'f_k3_roz_25', front: 'Jaką funkcję pełnią najądrza?', back: 'Dojrzewają i są w nich magazynowane plemniki.'),
          Flashcard(id: 'f_k3_roz_26', front: 'Jaką rolę pełni wydzielina pęcherzyków nasiennych i prostaty?', back: 'Pęcherzyki nasienne dostarczają fruktozy, prostata — zasadowej wydzieliny neutralizującej kwaśne środowisko pochwy.'),
          Flashcard(id: 'f_k3_roz_27', front: 'Gdzie zwykle dochodzi do zapłodnienia?', back: 'W jajowodzie.'),
          Flashcard(id: 'f_k3_roz_28', front: 'Ile plemników powstaje z jednego spermatocytu I rzędu, a ile komórek jajowych z oocytu I rzędu?', back: 'Cztery plemniki i jedna komórka jajowa (oraz ciałka kierunkowe).'),
          Flashcard(id: 'f_k3_roz_29', front: 'Z czego zbudowany jest plemnik?', back: 'Z główki (jądro i akrosom), wstawki z mitochondriami i witki.'),
          Flashcard(id: 'f_k3_roz_30', front: 'Kiedy oocyt kończy II podział mejotyczny?', back: 'Dopiero po wniknięciu plemnika.'),
          Flashcard(id: 'f_k3_roz_31', front: 'Dlaczego podziały mejotyczne w oogenezie są nierówne?', back: 'Prawie cała cytoplazma trafia do jednej komórki, która zyskuje zapas substancji dla zarodka.'),
          Flashcard(id: 'f_k3_roz_32', front: 'Jaką funkcję pełnią FSH i LH u mężczyzn?', back: 'FSH pobudza spermatogenezę, LH — wydzielanie testosteronu.'),
          Flashcard(id: 'f_k3_roz_33', front: 'Jaki hormon wywołuje owulację?', back: 'Lutropina (LH) — jej gwałtowny wzrost około 14. dnia cyklu.'),
          Flashcard(id: 'f_k3_roz_34', front: 'Jaką rolę pełnią estrogeny w fazie folikularnej?', back: 'Powodują odbudowę i pogrubienie błony śluzowej macicy.'),
          Flashcard(id: 'f_k3_roz_35', front: 'Jaką funkcję pełni progesteron wydzielany przez ciałko żółte?', back: 'Przygotowuje błonę śluzową macicy na przyjęcie zarodka i hamuje wydzielanie FSH i LH.'),
          Flashcard(id: 'f_k3_roz_36', front: 'Co powoduje miesiączkę?', back: 'Zanik ciałka żółtego i spadek stężenia progesteronu i estrogenów, gdy nie doszło do zapłodnienia.'),
          Flashcard(id: 'f_k3_roz_37', front: 'Jaką rolę pełni hCG?', back: 'Podtrzymuje działanie ciałka żółtego na początku ciąży; wykrywają ją testy ciążowe.'),
          Flashcard(id: 'f_k3_roz_38', front: 'Jak działa antykoncepcja hormonalna?', back: 'Syntetyczne hormony hamują wydzielanie FSH i LH, uniemożliwiając owulację, i zagęszczają śluz szyjkowy.'),
          Flashcard(id: 'f_k3_roz_39', front: 'Podaj zastosowania syntetycznych hormonów płciowych poza antykoncepcją.', back: 'Leczenie niepłodności i in vitro, podtrzymywanie ciąży, leczenie zaburzeń cyklu, hormonalna terapia zastępcza w menopauzie.'),
          Flashcard(id: 'f_k3_roz_40', front: 'Kiedy i gdzie zagnieżdża się blastocysta?', back: 'Około 6.–7. dnia po zapłodnieniu w błonie śluzowej macicy.'),
          Flashcard(id: 'f_k3_roz_41', front: 'Z czego powstaje łożysko?', back: 'Z kosmków kosmówki zarodka i błony śluzowej macicy.'),
          Flashcard(id: 'f_k3_roz_42', front: 'Wymień funkcje łożyska.', back: 'Wymiana gazowa, odżywianie płodu, usuwanie zbędnych produktów, przekazywanie przeciwciał, wytwarzanie hormonów.'),
          Flashcard(id: 'f_k3_roz_43', front: 'Dlaczego okres zarodkowy jest najbardziej wrażliwy na czynniki szkodliwe?', back: 'Powstają wtedy zawiązki wszystkich narządów.'),
          Flashcard(id: 'f_k3_roz_44', front: 'Jak alkohol w ciąży wpływa na dziecko?', back: 'Może wywołać płodowy zespół alkoholowy (FAS) — uszkodzenie mózgu, zaburzenia wzrostu, cechy dysmorficzne twarzy.'),
          Flashcard(id: 'f_k3_roz_45', front: 'Dlaczego w ciąży zaleca się kwas foliowy?', back: 'Zmniejsza ryzyko wad cewy nerwowej.'),
          Flashcard(id: 'f_k3_roz_46', front: 'Czym różnią się badania prenatalne nieinwazyjne od inwazyjnych?', back: 'Nieinwazyjne (USG, badania krwi matki) nie zagrażają płodowi; inwazyjne (amniopunkcja, biopsja kosmówki) dają pewną diagnozę, ale niosą ryzyko poronienia.'),
          Flashcard(id: 'f_k3_roz_47', front: 'Czym jest menopauza?', back: 'Wygaśnięciem czynności jajników, zwykle w wieku około 45–55 lat.'),
          Flashcard(id: 'f_k3_roz_48', front: 'Jakie zmiany zachodzą w okresie dojrzewania?', back: 'Skok wzrostu, rozwój drugorzędowych cech płciowych, pierwsza miesiączka lub wytryski, zmiany emocjonalne.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k3_roz_14', question: 'Testosteron wytwarzają:', options: ['Komórki Sertolego', 'Komórki śródmiąższowe jądra', 'Pęcherzyki nasienne', 'Najądrza'], correctIndex: 1, explanation: 'Ich wydzielanie pobudza LH.'),
          QuizQuestion(id: 'q_k3_roz_15', question: 'Owulację wywołuje gwałtowny wzrost stężenia:', options: ['FSH', 'LH', 'Progesteronu', 'Oksytocyny'], correctIndex: 1, explanation: 'Wyrzut LH następuje pod wpływem wysokiego stężenia estrogenów.'),
          QuizQuestion(id: 'q_k3_roz_16', question: 'Ciałko żółte wydziela głównie:', options: ['FSH', 'Progesteron', 'Testosteron', 'Prolaktynę'], correctIndex: 1, explanation: 'Progesteron przygotowuje błonę śluzową macicy na przyjęcie zarodka.'),
          QuizQuestion(id: 'q_k3_roz_17', question: 'Z jednego oocytu I rzędu powstaje:', options: ['Cztery komórki jajowe', 'Jedna komórka jajowa i ciałka kierunkowe', 'Dwie komórki jajowe', 'Jedna komórka jajowa i trzy plemniki'], correctIndex: 1, explanation: 'Podziały mejotyczne w oogenezie są nierówne.'),
          QuizQuestion(id: 'q_k3_roz_18', question: 'Mitochondria w plemniku znajdują się we:', options: ['Główce', 'Wstawce', 'Witce', 'W akrosomie'], correctIndex: 1, explanation: 'Dostarczają ATP do ruchu witki.'),
          QuizQuestion(id: 'q_k3_roz_19', question: 'Testy ciążowe wykrywają w moczu:', options: ['Estrogeny', 'hCG', 'FSH', 'Oksytocynę'], correctIndex: 1, explanation: 'Gonadotropinę kosmówkową wydziela zarodek.'),
          QuizQuestion(id: 'q_k3_roz_20', question: 'Hormonalne środki antykoncepcyjne działają przede wszystkim przez:', options: ['Zabijanie plemników', 'Hamowanie wydzielania FSH i LH i blokowanie owulacji', 'Przyspieszanie owulacji', 'Zwiększanie wydzielania hCG'], correctIndex: 1, explanation: 'Zagęszczają też śluz szyjkowy.'),
          QuizQuestion(id: 'q_k3_roz_21', question: 'Krew matki i płodu w łożysku:', options: ['Miesza się swobodnie', 'Nie miesza się', 'Miesza się tylko w III trymestrze', 'Przepływa wspólnymi naczyniami'], correctIndex: 1, explanation: 'Substancje przenikają przez cienką warstwę oddzielającą oba krwiobiegi.'),
          QuizQuestion(id: 'q_k3_roz_22', question: 'Badaniem prenatalnym inwazyjnym jest:', options: ['USG', 'Amniopunkcja', 'Badanie wolnego DNA płodu z krwi matki', 'Test biochemiczny z krwi matki'], correctIndex: 1, explanation: 'Wiąże się z niewielkim ryzykiem poronienia.'),
          QuizQuestion(id: 'q_k3_roz_23', question: 'Niedobór kwasu foliowego w ciąży zwiększa ryzyko:', options: ['Wad cewy nerwowej', 'Cukrzycy', 'Zespołu Downa', 'Hemofilii'], correctIndex: 0, explanation: 'Kwas foliowy zaleca się już przed zajściem w ciążę.'),
          QuizQuestion(id: 'q_k3_roz_24', question: 'Zawiązki wszystkich narządów powstają w okresie:', options: ['Płodowym', 'Zarodkowym', 'Noworodkowym', 'Niemowlęcym'], correctIndex: 1, explanation: 'Okres zarodkowy trwa do końca 8. tygodnia po zapłodnieniu.'),
          QuizQuestion(id: 'q_k3_roz_25', question: 'Wydzielinę o odczynie zasadowym, neutralizującą kwaśne środowisko pochwy, wytwarza:', options: ['Gruczoł krokowy', 'Najądrze', 'Jądro', 'Nasieniowód'], correctIndex: 0, explanation: 'Pęcherzyki nasienne dostarczają z kolei fruktozy.'),
        ],
      ),
    ],
  ),
];
