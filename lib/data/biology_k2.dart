import '../models.dart';

/// Materiał klasy 2 liceum — zakres rozszerzony.
///
/// Pokrywa działy podstawy programowej (nowelizacja 2024):
///   VI.   Bakterie i archeowce
///   VII.  Grzyby
///   VIII. Protisty
///   IX.   Różnorodność roślin
///   X.    Różnorodność zwierząt
///   XII.  Wirusy
///
/// Dział XI (Funkcjonowanie zwierząt, wraz z anatomią i fizjologią człowieka)
/// należy do materiału klasy 3 i nie jest tu zawarty.
///
/// Treści uwzględniają zmiany z 2024 r. — usunięto z podstawy m.in. gąbki,
/// wrotki, wije, rośliny typu C4 i CAM oraz gutację.
final List<Chapter> klasa2Chapters = [
  // ===========================================================================
  // VI. BAKTERIE I ARCHEOWCE
  // ===========================================================================
  Chapter(
    id: 'k2_bakterie',
    name: 'Bakterie i archeowce',
    topics: [
      Topic(
        id: 'k2_bakterie_budowa',
        name: 'Budowa i różnorodność bakterii i archeowców',
        theory: '''
BUDOWA KOMÓRKI PROKARIOTYCZNEJ
Komórka bakteryjna nie ma jądra komórkowego ani organelli otoczonych błonami. Materiał genetyczny to pojedyncza, kolista cząsteczka DNA leżąca bezpośrednio w cytoplazmie — obszar ten nazywamy nukleoidem. Rybosomy są mniejsze niż u eukariontów (typ 70S), co wykorzystują niektóre antybiotyki, blokując je wybiórczo. Komórkę otacza błona komórkowa, a na zewnątrz niej ściana komórkowa. Wiele bakterii ma dodatkowo otoczkę śluzową chroniącą przed wysychaniem i fagocytozą.

STRUKTURY DODATKOWE
Plazmidy to niewielkie, koliste cząsteczki DNA niezależne od nukleoidu; niosą geny dodatkowe, np. oporności na antybiotyki, i są przekazywane między bakteriami. Wici (rzęski) umożliwiają aktywny ruch. Fimbrie (pile) służą do przytwierdzania się do podłoża i komórek gospodarza, a pilus płciowy uczestniczy w koniugacji.

ŚCIANA KOMÓRKOWA — GRAM-DODATNIE I GRAM-UJEMNE
Ściana komórkowa bakterii zbudowana jest z mureiny (peptydoglikanu). Bakterie Gram-dodatnie mają grubą warstwę mureiny i w barwieniu metodą Grama przyjmują barwę fioletową. Bakterie Gram-ujemne mają cienką warstwę mureiny okrytą dodatkową błoną zewnętrzną z lipopolisacharydem (LPS) i barwią się na różowo lub czerwono. Różnica ta ma znaczenie praktyczne: błona zewnętrzna bakterii Gram-ujemnych utrudnia wnikanie wielu antybiotyków, dlatego dobór leku zależy od wyniku barwienia.

ARCHEOWCE A BAKTERIE
Archeowce są odrębną domeną organizmów. Ich ściana komórkowa nie zawiera mureiny, a lipidy błonowe mają rozgałęzione łańcuchy połączone wiązaniami eterowymi (u bakterii — estrowymi), co zwiększa odporność na warunki skrajne. Aparat transkrypcji i translacji archeowców bardziej przypomina eukariotyczny niż bakteryjny. Wiele archeowców to ekstremofile: termofile (gorące źródła), halofile (słone jeziora) i metanogeny (bagna, przewód pokarmowy przeżuwaczy), które wytwarzają metan.

FORMY MORFOLOGICZNE
Ziarniaki mają kształt kulisty i w zależności od układu komórek po podziale tworzą dwoinki, paciorkowce (łańcuszki) lub gronkowce (skupiska). Pałeczki i laseczki są wydłużone — laseczkami nazywamy te, które wytwarzają przetrwalniki. Przecinkowce mają kształt lekko wygięty, a krętki i śrubowce są spiralnie skręcone.
''',
        flashcards: [
          Flashcard(id: 'f_k2_bakt_1', front: 'Co to jest nukleoid?', back: 'Obszar cytoplazmy bakterii, w którym leży kolista cząsteczka DNA — nie jest otoczony błoną.'),
          Flashcard(id: 'f_k2_bakt_2', front: 'Z czego zbudowana jest ściana komórkowa bakterii?', back: 'Z mureiny (peptydoglikanu).'),
          Flashcard(id: 'f_k2_bakt_3', front: 'Czym różnią się bakterie Gram-dodatnie od Gram-ujemnych?', back: 'Gram-dodatnie mają grubą warstwę mureiny i barwią się na fioletowo; Gram-ujemne mają cienką mureinę plus błonę zewnętrzną z LPS i barwią się na różowo.'),
          Flashcard(id: 'f_k2_bakt_4', front: 'Czym jest plazmid i jakie ma znaczenie?', back: 'Małą, kolistą cząsteczką DNA niezależną od nukleoidu; niesie geny dodatkowe, np. oporności na antybiotyki, i może być przekazywany innym bakteriom.'),
          Flashcard(id: 'f_k2_bakt_5', front: 'Jakie cechy budowy odróżniają archeowce od bakterii?', back: 'Brak mureiny w ścianie i lipidy błonowe o rozgałęzionych łańcuchach połączonych wiązaniami eterowymi zamiast estrowych.'),
          Flashcard(id: 'f_k2_bakt_6', front: 'Wymień trzy grupy ekstremofilnych archeowców.', back: 'Termofile (gorące źródła), halofile (środowiska słone) i metanogeny (wytwarzają metan).'),
          Flashcard(id: 'f_k2_bakt_7', front: 'Czym różni się gronkowiec od paciorkowca?', back: 'Oba są ziarniakami: gronkowce tworzą nieregularne skupiska, paciorkowce — łańcuszki.'),
          Flashcard(id: 'f_k2_bakt_8', front: 'Jaką funkcję pełnią fimbrie?', back: 'Służą do przytwierdzania się bakterii do podłoża i do komórek gospodarza.'),
          Flashcard(id: 'f_k2_bakt_9', front: 'Jaki typ rybosomów mają bakterie?', back: 'Rybosomy 70S — mniejsze niż eukariotyczne 80S, co wykorzystują niektóre antybiotyki.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k2_bakt_1', question: 'Materiał genetyczny bakterii znajduje się w:', options: ['Jądrze komórkowym', 'Nukleoidzie', 'Mitochondrium', 'Rybosomie'], correctIndex: 1, explanation: 'Bakterie nie mają jądra — kolisty DNA leży w cytoplazmie, w obszarze zwanym nukleoidem.'),
          QuizQuestion(id: 'q_k2_bakt_2', question: 'Bakterie Gram-ujemne charakteryzują się:', options: ['Grubą warstwą mureiny i fioletowym zabarwieniem', 'Cienką mureiną i dodatkową błoną zewnętrzną z LPS', 'Brakiem ściany komórkowej', 'Ścianą zbudowaną z chityny'], correctIndex: 1, explanation: 'Gram-ujemne mają cienką warstwę mureiny okrytą błoną zewnętrzną z lipopolisacharydem i barwią się na różowo.'),
          QuizQuestion(id: 'q_k2_bakt_3', question: 'Geny oporności na antybiotyki są u bakterii najczęściej przenoszone przez:', options: ['Nukleoid', 'Plazmidy', 'Fimbrie', 'Otoczkę śluzową'], correctIndex: 1, explanation: 'Plazmidy niosą geny dodatkowe, m.in. oporności, i mogą być przekazywane innym bakteriom.'),
          QuizQuestion(id: 'q_k2_bakt_4', question: 'Lipidy błonowe archeowców różnią się od bakteryjnych tym, że zawierają wiązania:', options: ['Estrowe', 'Eterowe', 'Peptydowe', 'Glikozydowe'], correctIndex: 1, explanation: 'Archeowce mają rozgałęzione łańcuchy połączone wiązaniami eterowymi, co zwiększa odporność na warunki skrajne.'),
          QuizQuestion(id: 'q_k2_bakt_5', question: 'Metanogeny to archeowce, które:', options: ['Rozkładają metan do CO2', 'Wytwarzają metan', 'Żyją wyłącznie w słonych jeziorach', 'Prowadzą fotosyntezę tlenową'], correctIndex: 1, explanation: 'Metanogeny wytwarzają metan; żyją m.in. na bagnach i w przewodzie pokarmowym przeżuwaczy.'),
          QuizQuestion(id: 'q_k2_bakt_6', question: 'Laseczkami nazywamy bakterie, które:', options: ['Mają kształt kulisty', 'Są spiralnie skręcone', 'Mają kształt wydłużony i wytwarzają przetrwalniki', 'Tworzą łańcuszki'], correctIndex: 2, explanation: 'Laseczki to pałeczkowate bakterie wytwarzające przetrwalniki, np. laseczka tężca.'),
          QuizQuestion(id: 'q_k2_bakt_7', question: 'Otoczka śluzowa bakterii pełni funkcję:', options: ['Ruchową', 'Ochronną przed wysychaniem i fagocytozą', 'Magazynującą DNA', 'Fotosyntetyczną'], correctIndex: 1, explanation: 'Otoczka chroni bakterię przed wysychaniem i utrudnia jej pochłonięcie przez komórki żerne.'),
          QuizQuestion(id: 'q_k2_bakt_8', question: 'Aparat transkrypcji i translacji archeowców przypomina najbardziej:', options: ['Bakteryjny', 'Eukariotyczny', 'Wirusowy', 'Nie przypomina żadnego z nich'], correctIndex: 1, explanation: 'Pod tym względem archeowce są bliższe eukariontom niż bakteriom.'),
        ],
      ),
      Topic(
        id: 'k2_bakterie_czynnosci',
        name: 'Czynności życiowe i znaczenie bakterii',
        theory: '''
SPOSOBY ODŻYWIANIA SIĘ
Bakterie samożywne dzielą się na fotoautotrofy i chemoautotrofy. Sinice prowadzą fotosyntezę tlenową — z wydzieleniem tlenu, tak jak rośliny; to one odpowiadały za natlenienie pierwotnej atmosfery Ziemi. Bakterie purpurowe i zielone prowadzą fotosyntezę beztlenową, w której donorem elektronów nie jest woda, lecz np. siarkowodór, dlatego nie wydzielają tlenu. Chemoautotrofy czerpią energię z utleniania związków nieorganicznych — należą do nich bakterie nitryfikacyjne, siarkowe i żelaziste. Bakterie cudzożywne to saprotrofy (rozkładają martwą materię organiczną), symbionty i pasożyty.

ODDYCHANIE
Bezwzględne tlenowce wymagają tlenu, a bezwzględne beztlenowce giną w jego obecności. Względne beztlenowce potrafią przełączać się między oddychaniem tlenowym a beztlenowym lub fermentacją. Oddychanie beztlenowe wykorzystuje jako ostateczny akceptor elektronów związki nieorganiczne inne niż tlen, np. azotany (denitryfikacja) lub siarczany.

ROZMNAŻANIE I PRZETRWALNIKI
Bakterie rozmnażają się bezpłciowo przez podział komórki na dwie potomne. W sprzyjających warunkach podział może następować nawet co kilkanaście–dwadzieścia minut, co powoduje bardzo szybki wzrost liczebności. Przetrwalniki (endospory) to formy przetrwalne o silnie odwodnionej cytoplazmie i grubych osłonach, odporne na wysoką temperaturę, wysychanie i środki chemiczne. Nie są formą rozmnażania — z jednej komórki powstaje jeden przetrwalnik.

PROCESY PŁCIOWE I ZMIENNOŚĆ GENETYCZNA
Ponieważ podział bakterii daje komórki identyczne genetycznie, źródłem zmienności są mutacje i tak zwane procesy płciowe (parapłciowe), w których dochodzi do przekazania DNA między komórkami. W koniugacji DNA (najczęściej plazmid) przechodzi z komórki dawcy do biorcy przez mostek cytoplazmatyczny. W transformacji bakteria pobiera DNA bezpośrednio ze środowiska. W transdukcji fragment DNA jest przenoszony między bakteriami przez bakteriofaga. Procesy te odpowiadają m.in. za szybkie rozprzestrzenianie się oporności na antybiotyki.

ZNACZENIE W PRZYRODZIE
Bakterie saprotroficzne rozkładają martwą materię organiczną, uczestnicząc w obiegu pierwiastków. W obiegu azotu bakterie brodawkowe żyjące w symbiozie z roślinami motylkowymi oraz bakterie wolno żyjące wiążą azot atmosferyczny; bakterie nitryfikacyjne utleniają amoniak do azotanów(III) i azotanów(V), a bakterie denitryfikacyjne redukują azotany do azotu cząsteczkowego. Mikrobiota jelitowa człowieka wspomaga trawienie, wytwarza witaminy z grupy B oraz witaminę K i konkuruje z bakteriami chorobotwórczymi.

ZNACZENIE DLA CZŁOWIEKA
Bakterie fermentacji mlekowej wykorzystywane są przy produkcji jogurtów, serów i kiszonek. Bakterie są też źródłem antybiotyków oraz podstawowym narzędziem biotechnologii — po wprowadzeniu obcego genu produkują np. insulinę. Z drugiej strony wywołują choroby: gruźlicę (prątek gruźlicy, zakażenie drogą kropelkową), tężec (laseczka tężca, przetrwalniki wnikają przez zanieczyszczoną ranę), boreliozę (krętki przenoszone przez kleszcze), salmonellozę (zakażenie drogą pokarmową, np. przez surowe jaja), a także choroby przenoszone drogą płciową: kiłę i rzeżączkę.
''',
        flashcards: [
          Flashcard(id: 'f_k2_bakt_10', front: 'Czym różni się fotosynteza sinic od fotosyntezy bakterii purpurowych?', back: 'Sinice prowadzą fotosyntezę tlenową (donorem elektronów jest woda), bakterie purpurowe — beztlenową, np. z siarkowodoru, bez wydzielania tlenu.'),
          Flashcard(id: 'f_k2_bakt_11', front: 'Skąd chemoautotrofy czerpią energię?', back: 'Z utleniania związków nieorganicznych, np. amoniaku, siarkowodoru lub związków żelaza.'),
          Flashcard(id: 'f_k2_bakt_12', front: 'Czy przetrwalnik jest formą rozmnażania?', back: 'Nie — to forma przetrwalna. Z jednej komórki powstaje jeden przetrwalnik, więc liczba osobników nie rośnie.'),
          Flashcard(id: 'f_k2_bakt_13', front: 'Na czym polega koniugacja bakterii?', back: 'Na przekazaniu DNA (najczęściej plazmidu) z komórki dawcy do biorcy przez mostek cytoplazmatyczny.'),
          Flashcard(id: 'f_k2_bakt_14', front: 'Na czym polega transformacja u bakterii?', back: 'Na pobraniu przez bakterię DNA bezpośrednio ze środowiska.'),
          Flashcard(id: 'f_k2_bakt_15', front: 'Na czym polega transdukcja?', back: 'Na przeniesieniu fragmentu DNA między bakteriami przez bakteriofaga.'),
          Flashcard(id: 'f_k2_bakt_16', front: 'Jaką rolę w obiegu azotu pełnią bakterie brodawkowe?', back: 'Żyją w symbiozie z roślinami motylkowymi i wiążą azot atmosferyczny, udostępniając go roślinie.'),
          Flashcard(id: 'f_k2_bakt_17', front: 'Na czym polega denitryfikacja?', back: 'Na redukcji azotanów do azotu cząsteczkowego, który wraca do atmosfery.'),
          Flashcard(id: 'f_k2_bakt_18', front: 'Jak dochodzi do zakażenia tężcem?', back: 'Przetrwalniki laseczki tężca wnikają przez zanieczyszczoną glebą ranę.'),
          Flashcard(id: 'f_k2_bakt_19', front: 'Jaką rolę pełni mikrobiota jelitowa człowieka?', back: 'Wspomaga trawienie, wytwarza witaminy z grupy B i witaminę K oraz konkuruje z bakteriami chorobotwórczymi.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k2_bakt_9', question: 'Sinice prowadzą fotosyntezę:', options: ['Beztlenową, z siarkowodorem jako donorem elektronów', 'Tlenową, z wodą jako donorem elektronów', 'Wyłącznie w symbiozie z grzybami', 'Tylko w warunkach beztlenowych'], correctIndex: 1, explanation: 'Sinice prowadzą fotosyntezę tlenową i to one natleniły pierwotną atmosferę Ziemi.'),
          QuizQuestion(id: 'q_k2_bakt_10', question: 'Bakterie bezwzględnie beztlenowe:', options: ['Wymagają tlenu do życia', 'Giną w obecności tlenu', 'Przełączają się między oddychaniem tlenowym a fermentacją', 'Nie oddychają wcale'], correctIndex: 1, explanation: 'Dla bezwzględnych beztlenowców tlen jest toksyczny.'),
          QuizQuestion(id: 'q_k2_bakt_11', question: 'Który proces NIE jest źródłem zmienności genetycznej bakterii?', options: ['Koniugacja', 'Transformacja', 'Transdukcja', 'Wytwarzanie przetrwalnika'], correctIndex: 3, explanation: 'Przetrwalnik to forma przetrwania niekorzystnych warunków, nie mechanizm wymiany materiału genetycznego.'),
          QuizQuestion(id: 'q_k2_bakt_12', question: 'Przeniesienie DNA między bakteriami za pośrednictwem bakteriofaga to:', options: ['Koniugacja', 'Transformacja', 'Transdukcja', 'Denitryfikacja'], correctIndex: 2, explanation: 'Transdukcja to przeniesienie fragmentu DNA przez wirusa bakteryjnego.'),
          QuizQuestion(id: 'q_k2_bakt_13', question: 'Bakterie nitryfikacyjne w obiegu azotu:', options: ['Wiążą azot atmosferyczny', 'Utleniają amoniak do azotanów', 'Redukują azotany do azotu cząsteczkowego', 'Rozkładają celulozę'], correctIndex: 1, explanation: 'Nitryfikacja to utlenianie amoniaku do azotanów(III), a następnie azotanów(V).'),
          QuizQuestion(id: 'q_k2_bakt_14', question: 'Borelioza jest przenoszona przez:', options: ['Komary', 'Kleszcze', 'Drogę kropelkową', 'Surowe jaja'], correctIndex: 1, explanation: 'Krętki Borrelia przenoszone są przez kleszcze.'),
          QuizQuestion(id: 'q_k2_bakt_15', question: 'Która z chorób przenoszona jest drogą kropelkową?', options: ['Tężec', 'Gruźlica', 'Salmonelloza', 'Kiła'], correctIndex: 1, explanation: 'Prątek gruźlicy przenosi się drogą kropelkową.'),
          QuizQuestion(id: 'q_k2_bakt_16', question: 'Przetrwalniki bakterii są odporne przede wszystkim na:', options: ['Antybiotyki wyłącznie', 'Wysoką temperaturę, wysychanie i środki chemiczne', 'Działanie światła', 'Niskie pH wyłącznie'], correctIndex: 1, explanation: 'Silnie odwodniona cytoplazma i grube osłony chronią przetrwalnik przed skrajnymi warunkami.'),
        ],
      ),
    ],
  ),

  // ===========================================================================
  // VII. GRZYBY
  // ===========================================================================
  Chapter(
    id: 'k2_grzyby',
    name: 'Grzyby',
    topics: [
      Topic(
        id: 'k2_grzyby_budowa',
        name: 'Budowa i czynności życiowe grzybów',
        theory: '''
BUDOWA GRZYBÓW
Grzyby są eukariontami cudzożywnymi. Większość ma budowę plechową: ciało tworzą nitkowate strzępki, których splot nazywamy grzybnią. Strzępki mogą być komórczakowe — pozbawione poprzecznych przegród, z wieloma jądrami we wspólnej cytoplazmie — albo podzielone przegrodami (septami) z porami umożliwiającymi przepływ cytoplazmy. Istnieją też grzyby jednokomórkowe, np. drożdże. Ściana komórkowa grzybów zbudowana jest z chityny, a materiałem zapasowym jest glikogen — tak jak u zwierząt. Grzyby nie zawierają chlorofilu i nigdy nie prowadzą fotosyntezy.

ODŻYWIANIE SIĘ
Grzyby odżywiają się cudzożywnie, prowadząc trawienie zewnątrzustrojowe: wydzielają enzymy na zewnątrz ciała, rozkładają pokarm w środowisku, a następnie wchłaniają powstałe proste związki całą powierzchnią strzępek. Saprotrofy rozkładają martwą materię organiczną, pasożyty czerpią substancje z żywych organizmów, a symbionty tworzą układy korzystne dla obu stron — mikoryzę z korzeniami roślin oraz porosty z glonami lub sinicami.

ODDYCHANIE I FERMENTACJA
Większość grzybów oddycha tlenowo. Drożdże są względnymi beztlenowcami: w warunkach beztlenowych prowadzą fermentację alkoholową, rozkładając cukier do etanolu i dwutlenku węgla. Doświadczenie potwierdzające ten proces polega na dodaniu drożdży do roztworu glukozy i skierowaniu wydzielającego się gazu do wody wapiennej — jej zmętnienie świadczy o obecności dwutlenku węgla.

ROZMNAŻANIE
Rozmnażanie bezpłciowe zachodzi przez zarodniki (np. konidia powstające na strzępkach), fragmentację grzybni, a u drożdży przez pączkowanie. W rozmnażaniu płciowym dochodzi do połączenia strzępek i wytworzenia zarodników płciowych. U workowców powstają one w woreczkowatych workach (askospory), u podstawczaków — na maczugowatych podstawkach (bazydiospory). Do workowców należą m.in. drożdże, pędzlaki i smardze, do podstawczaków — pieczarki, borowiki i muchomory. Owocnik kapeluszowy, który zbieramy w lesie, jest jedynie organem zarodnionośnym — właściwa grzybnia rozrasta się w podłożu.

ZNACZENIE GRZYBÓW
Grzyby saprotroficzne wraz z bakteriami rozkładają martwą materię organiczną i zamykają obieg pierwiastków w przyrodzie. Mikoryza zwiększa powierzchnię chłonną korzeni i poprawia pobieranie wody oraz soli mineralnych, a roślina dostarcza grzybowi produkty fotosyntezy. Człowiek wykorzystuje drożdże w piekarnictwie i piwowarstwie, pleśnie przy produkcji serów, a z pędzlaka uzyskano pierwszy antybiotyk — penicylinę. Grzyby pasożytnicze, takie jak rdze i głownie, powodują znaczne straty w uprawach, a spożycie grzybów trujących, np. muchomora sromotnikowego, grozi śmiertelnym zatruciem.
''',
        flashcards: [
          Flashcard(id: 'f_k2_grz_1', front: 'Z czego zbudowana jest ściana komórkowa grzybów?', back: 'Z chityny.'),
          Flashcard(id: 'f_k2_grz_2', front: 'Jaki materiał zapasowy gromadzą grzyby?', back: 'Glikogen — tak samo jak zwierzęta.'),
          Flashcard(id: 'f_k2_grz_3', front: 'Czym są strzępki i grzybnia?', back: 'Strzępki to nitkowate elementy ciała grzyba, a ich splot tworzy grzybnię.'),
          Flashcard(id: 'f_k2_grz_4', front: 'Na czym polega trawienie zewnątrzustrojowe grzybów?', back: 'Grzyb wydziela enzymy na zewnątrz, trawi pokarm w środowisku i wchłania proste związki powierzchnią strzępek.'),
          Flashcard(id: 'f_k2_grz_5', front: 'Jakie są produkty fermentacji alkoholowej drożdży?', back: 'Etanol i dwutlenek węgla.'),
          Flashcard(id: 'f_k2_grz_6', front: 'Jak wykazać doświadczalnie, że drożdże wydzielają CO2?', back: 'Skierować gaz znad roztworu drożdży z glukozą do wody wapiennej — jej zmętnienie potwierdza obecność CO2.'),
          Flashcard(id: 'f_k2_grz_7', front: 'Czym różnią się workowce od podstawczaków?', back: 'Workowce wytwarzają zarodniki płciowe w workach (askospory), podstawczaki — na podstawkach (bazydiospory).'),
          Flashcard(id: 'f_k2_grz_8', front: 'Czym jest owocnik?', back: 'Organem zarodnionośnym grzyba; właściwa grzybnia rozrasta się w podłożu.'),
          Flashcard(id: 'f_k2_grz_9', front: 'Na czym polega mikoryza i co daje obu stronom?', back: 'To symbioza grzyba z korzeniem rośliny: grzyb zwiększa pobieranie wody i soli mineralnych, roślina oddaje produkty fotosyntezy.'),
          Flashcard(id: 'f_k2_grz_10', front: 'Z jakiego grzyba uzyskano penicylinę?', back: 'Z pędzlaka (Penicillium).'),
        ],
        questions: [
          QuizQuestion(id: 'q_k2_grz_1', question: 'Ściana komórkowa grzybów zbudowana jest z:', options: ['Celulozy', 'Chityny', 'Mureiny', 'Ligniny'], correctIndex: 1, explanation: 'Chityna buduje ściany komórkowe grzybów; celuloza występuje u roślin, mureina u bakterii.'),
          QuizQuestion(id: 'q_k2_grz_2', question: 'Materiałem zapasowym grzybów jest:', options: ['Skrobia', 'Glikogen', 'Celuloza', 'Tłuszcz wyłącznie'], correctIndex: 1, explanation: 'Grzyby gromadzą glikogen, podobnie jak zwierzęta.'),
          QuizQuestion(id: 'q_k2_grz_3', question: 'Strzępki komórczakowe to strzępki:', options: ['Podzielone przegrodami, z jednym jądrem w komórce', 'Pozbawione poprzecznych przegród, z wieloma jądrami', 'Zbudowane z celulozy', 'Występujące wyłącznie u drożdży'], correctIndex: 1, explanation: 'Strzępki komórczakowe nie mają przegród — jądra leżą we wspólnej cytoplazmie.'),
          QuizQuestion(id: 'q_k2_grz_4', question: 'Trawienie zewnątrzustrojowe polega na:', options: ['Pochłanianiu pokarmu przez fagocytozę', 'Wydzieleniu enzymów na zewnątrz i wchłanianiu strawionych związków', 'Rozkładzie pokarmu w wodniczkach', 'Wytwarzaniu pokarmu z CO2'], correctIndex: 1, explanation: 'Grzyb trawi pokarm w środowisku, a następnie wchłania proste związki.'),
          QuizQuestion(id: 'q_k2_grz_5', question: 'Drożdże w warunkach beztlenowych prowadzą:', options: ['Fermentację mlekową', 'Fermentację alkoholową', 'Fotosyntezę', 'Oddychanie tlenowe'], correctIndex: 1, explanation: 'Produktami fermentacji alkoholowej są etanol i CO2.'),
          QuizQuestion(id: 'q_k2_grz_6', question: 'Bazydiospory powstają u:', options: ['Workowców', 'Podstawczaków', 'Sprzężniowców', 'Drożdży'], correctIndex: 1, explanation: 'Podstawczaki wytwarzają zarodniki płciowe na podstawkach.'),
          QuizQuestion(id: 'q_k2_grz_7', question: 'Grzyb w mikoryzie dostarcza roślinie przede wszystkim:', options: ['Produktów fotosyntezy', 'Wody i soli mineralnych', 'Tlenu', 'Azotu atmosferycznego'], correctIndex: 1, explanation: 'Grzyb zwiększa powierzchnię chłonną korzenia, a roślina rewanżuje się produktami fotosyntezy.'),
          QuizQuestion(id: 'q_k2_grz_8', question: 'Rdze i głownie to grzyby:', options: ['Saprotroficzne', 'Pasożytnicze, powodujące straty w uprawach', 'Symbiotyczne', 'Jadalne'], correctIndex: 1, explanation: 'To pasożyty roślin wywołujące choroby zbóż i innych upraw.'),
        ],
      ),
      Topic(
        id: 'k2_grzyby_porosty',
        name: 'Porosty, grzybice i profilaktyka',
        theory: '''
POROSTY JAKO ORGANIZMY SYMBIOTYCZNE
Porost to trwały układ symbiotyczny grzyba (najczęściej workowca), zwanego mykobiontem, oraz glonu lub sinicy, zwanych fotobiontem. Grzyb tworzy szkielet plechy, chroni partnera przed wysychaniem i nadmiarem światła oraz pobiera wodę i sole mineralne. Fotobiont prowadzi fotosyntezę i dostarcza związki organiczne. Dzięki tej współpracy porosty zasiedlają miejsca skrajnie ubogie, na których nie utrzymałby się żaden z partnerów osobno.

BUDOWA I ROZMNAŻANIE POROSTÓW
Ze względu na kształt plechy wyróżniamy porosty skorupiaste (silnie przylegające do podłoża), listkowate (luźno przylegające, o płatowatej plesze) oraz krzaczkowate (wzniesione lub zwisające). Porosty rozmnażają się głównie wegetatywnie, przez fragmentację plechy oraz wyspecjalizowane struktury zawierające jednocześnie komórki grzyba i glonu: urwistki (soredia) i wyrostki (izydia).

ZNACZENIE POROSTÓW
Porosty są organizmami pionierskimi w sukcesji pierwotnej — jako jedne z pierwszych zasiedlają nagie skały, a wydzielanymi kwasami powodują ich wietrzenie, przyczyniając się do powstawania gleby. Są bardzo wrażliwe na zanieczyszczenia powietrza, zwłaszcza na dwutlenek siarki, dlatego wykorzystuje się je jako biowskaźniki. Skala porostowa pozwala ocenić stopień zanieczyszczenia powietrza na podstawie tego, jakie formy plechy występują na danym terenie: w powietrzu silnie zanieczyszczonym utrzymują się jedynie porosty skorupiaste lub brak ich zupełnie, a formy krzaczkowate rosną tylko tam, gdzie powietrze jest czyste.

GRZYBICE — DROGI ZARAŻENIA I PROFILAKTYKA
Grzybice skóry i paznokci szerzą się przez kontakt bezpośredni oraz przez przedmioty: wspólne ręczniki, obuwie, podłogi basenów, saun i pryszniców. Profilaktyka polega na dokładnym osuszaniu skóry, zwłaszcza między palcami, noszeniu klapek w miejscach publicznych, używaniu własnych ręczników i przewiewnego obuwia. Grzybice narządów płciowych wywołują najczęściej drożdżaki z rodzaju Candida; sprzyjają im antybiotykoterapia, cukrzyca i osłabienie odporności. Grzybice płuc, na przykład aspergiloza, powstają po wdychaniu zarodników z zapleśniałych pomieszczeń, siana lub kompostu, a chorują na nie zwłaszcza osoby z obniżoną odpornością; zapobiega im unikanie zawilgoconych, spleśniałych miejsc i stosowanie masek przy pracy z materiałem organicznym.
''',
        flashcards: [
          Flashcard(id: 'f_k2_grz_11', front: 'Jakie organizmy tworzą porost?', back: 'Grzyb (mykobiont, najczęściej workowiec) oraz glon lub sinica (fotobiont).'),
          Flashcard(id: 'f_k2_grz_12', front: 'Co daje grzyb, a co fotobiont w poroście?', back: 'Grzyb daje szkielet plechy, ochronę i wodę z solami mineralnymi; fotobiont — związki organiczne z fotosyntezy.'),
          Flashcard(id: 'f_k2_grz_13', front: 'Wymień trzy typy plech porostów.', back: 'Skorupiasta, listkowata i krzaczkowata.'),
          Flashcard(id: 'f_k2_grz_14', front: 'Czym są urwistki i izydia?', back: 'Strukturami rozmnażania wegetatywnego porostów, zawierającymi jednocześnie komórki grzyba i glonu.'),
          Flashcard(id: 'f_k2_grz_15', front: 'Dlaczego porosty są organizmami pionierskimi?', back: 'Zasiedlają nagie skały i przyspieszają ich wietrzenie, przyczyniając się do powstawania gleby.'),
          Flashcard(id: 'f_k2_grz_16', front: 'Na czym opiera się skala porostowa?', back: 'Na wrażliwości porostów na dwutlenek siarki — im czystsze powietrze, tym bardziej złożone formy plechy (krzaczkowate).'),
          Flashcard(id: 'f_k2_grz_17', front: 'Jak można zarazić się grzybicą stóp?', back: 'Przez kontakt z zakażoną powierzchnią — podłogi basenów, sauny, wspólne ręczniki i obuwie.'),
          Flashcard(id: 'f_k2_grz_18', front: 'Co sprzyja grzybicy narządów płciowych?', back: 'Antybiotykoterapia, cukrzyca i osłabienie odporności.'),
          Flashcard(id: 'f_k2_grz_19', front: 'Jak dochodzi do grzybicy płuc?', back: 'Przez wdychanie zarodników z zapleśniałych pomieszczeń, siana lub kompostu.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k2_grz_9', question: 'Fotobiontem w poroście może być:', options: ['Wyłącznie workowiec', 'Glon lub sinica', 'Mech', 'Bakteria chemoautotroficzna'], correctIndex: 1, explanation: 'Fotobiont to glon lub sinica prowadząca fotosyntezę.'),
          QuizQuestion(id: 'q_k2_grz_10', question: 'Porosty krzaczkowate występują przede wszystkim tam, gdzie powietrze jest:', options: ['Silnie zanieczyszczone', 'Czyste', 'Bardzo suche', 'Ubogie w tlen'], correctIndex: 1, explanation: 'Formy krzaczkowate są najbardziej wrażliwe na SO2 i rosną tylko w czystym powietrzu.'),
          QuizQuestion(id: 'q_k2_grz_11', question: 'Urwistki (soredia) służą porostom do:', options: ['Fotosyntezy', 'Rozmnażania wegetatywnego', 'Pobierania wody', 'Ochrony przed UV'], correctIndex: 1, explanation: 'Zawierają komórki obu partnerów i pozwalają na rozmnażanie wegetatywne.'),
          QuizQuestion(id: 'q_k2_grz_12', question: 'Rola porostów w sukcesji pierwotnej polega na:', options: ['Zacienianiu podłoża', 'Wietrzeniu skał i tworzeniu zaczątków gleby', 'Wiązaniu azotu atmosferycznego wyłącznie', 'Rozkładzie martwych zwierząt'], correctIndex: 1, explanation: 'Porosty jako pionierzy przyspieszają wietrzenie skały, co umożliwia powstanie gleby.'),
          QuizQuestion(id: 'q_k2_grz_13', question: 'Najskuteczniejszą profilaktyką grzybicy stóp jest:', options: ['Częste noszenie obuwia gumowego', 'Osuszanie skóry między palcami i klapki w miejscach publicznych', 'Stosowanie antybiotyków', 'Kąpiele w gorącej wodzie'], correctIndex: 1, explanation: 'Wilgoć sprzyja grzybicy, a klapki ograniczają kontakt z zakażonym podłożem.'),
          QuizQuestion(id: 'q_k2_grz_14', question: 'Grzybice narządów płciowych wywołują najczęściej:', options: ['Pędzlaki', 'Drożdżaki z rodzaju Candida', 'Rdze', 'Muchomory'], correctIndex: 1, explanation: 'Za większość takich zakażeń odpowiadają drożdżaki Candida.'),
          QuizQuestion(id: 'q_k2_grz_15', question: 'Porosty wykorzystuje się jako biowskaźniki, ponieważ:', options: ['Rosną bardzo szybko', 'Są wrażliwe na dwutlenek siarki w powietrzu', 'Występują tylko w miastach', 'Nie wymagają światła'], correctIndex: 1, explanation: 'Ich wrażliwość na SO2 pozwala ocenić czystość powietrza.'),
        ],
      ),
    ],
  ),

  // ===========================================================================
  // VIII. PROTISTY
  // ===========================================================================
  Chapter(
    id: 'k2_protisty',
    name: 'Protisty',
    topics: [
      Topic(
        id: 'k2_protisty_roznorodnosc',
        name: 'Różnorodność i czynności życiowe protistów',
        theory: '''
CZYM SĄ PROTISTY
Protisty to eukarionty, które nie należą do roślin, zwierząt ani grzybów. Nie jest to grupa naturalna (monofiletyczna) — łączy je raczej to, czym nie są, niż wspólne pochodzenie. Bywają jednokomórkowe, kolonijne lub wielokomórkowe, ale nawet u form wielokomórkowych nie występują prawdziwe tkanki.

PODZIAŁ PROTISTÓW
Protisty zwierzęcopodobne, czyli pierwotniaki, są cudzożywne i ruchliwe. Zalicza się do nich pełzaki poruszające się nibynóżkami, wiciowce z jedną lub kilkoma wiciami, orzęski pokryte licznymi rzęskami oraz sporowce — pasożyty pozbawione narządów ruchu. Protisty roślinopodobne, czyli glony, są samożywne; należą do nich okrzemki, brunatnice, krasnorosty, bruzdnice i eugleniny. Protisty grzybopodobne, takie jak śluzowce i lęgniowce, odżywiają się cudzożywnie i rozmnażają przez zarodniki.

ZWIĄZEK BUDOWY ZE ŚRODOWISKIEM
Aparaty ruchu odpowiadają trybowi życia: nibynóżki umożliwiają pełzanie po podłożu i pochłanianie pokarmu, wici i rzęski — aktywne pływanie. Komórkę okrywa błona komórkowa, a u orzęsków dodatkowo usztywniający pellikula. Protisty słodkowodne żyją w środowisku hipotonicznym, do którego stale wnika woda — usuwają jej nadmiar wodniczkami tętniącymi, co jest przykładem osmoregulacji. Wodniczki pokarmowe służą do trawienia wewnątrzkomórkowego pochłoniętych cząstek. Glony mają chloroplasty, a eugleny dodatkowo plamkę oczną, dzięki której kierują się ku światłu (fototaksja dodatnia).

CZYNNOŚCI ŻYCIOWE
Odżywianie może być samożywne (glony), cudzożywne przez fagocytozę i trawienie w wodniczkach (pełzaki, orzęski) albo mieszane — euglena w świetle prowadzi fotosyntezę, a w ciemności odżywia się cudzożywnie. Wymiana gazowa zachodzi całą powierzchnią ciała. Rozmnażanie bezpłciowe odbywa się przez podział komórki, a u wielu gatunków występują też procesy płciowe — u orzęsków koniugacja, podczas której dwa osobniki wymieniają materiał genetyczny mikronukleusów.

OBSERWACJA I HODOWLA
Protisty słodkowodne łatwo hodować w naparze z siana: po kilku dniach w wodzie z rozdrobnionym sianem rozwijają się bakterie, a następnie żywiące się nimi orzęski, m.in. pantofelek. Kroplę hodowli obserwuje się pod mikroskopem w preparacie przyżyciowym, a ruch najszybszych form spowalnia się, dodając kroplę roztworu zagęszczającego lub włókna waty.
''',
        flashcards: [
          Flashcard(id: 'f_k2_prot_1', front: 'Dlaczego protisty nie są grupą naturalną?', back: 'Nie mają wspólnego przodka wyłącznego dla siebie — łączy je to, że są eukariontami niebędącymi roślinami, zwierzętami ani grzybami.'),
          Flashcard(id: 'f_k2_prot_2', front: 'Wymień cztery grupy pierwotniaków i ich aparaty ruchu.', back: 'Pełzaki (nibynóżki), wiciowce (wici), orzęski (rzęski), sporowce (brak narządów ruchu).'),
          Flashcard(id: 'f_k2_prot_3', front: 'Jaką funkcję pełni wodniczka tętniąca?', back: 'Usuwa nadmiar wody wnikającej do komórki w środowisku hipotonicznym — służy osmoregulacji.'),
          Flashcard(id: 'f_k2_prot_4', front: 'Do czego służy wodniczka pokarmowa?', back: 'Do trawienia wewnątrzkomórkowego pochłoniętych cząstek pokarmu.'),
          Flashcard(id: 'f_k2_prot_5', front: 'Czym jest plamka oczna euglenów?', back: 'Strukturą umożliwiającą wykrywanie kierunku światła i ruch ku niemu (fototaksja dodatnia).'),
          Flashcard(id: 'f_k2_prot_6', front: 'Na czym polega mieszany sposób odżywiania euglen?', back: 'W świetle prowadzą fotosyntezę, a w ciemności odżywiają się cudzożywnie.'),
          Flashcard(id: 'f_k2_prot_7', front: 'Na czym polega koniugacja orzęsków?', back: 'Dwa osobniki łączą się i wymieniają materiał genetyczny mikronukleusów — to proces płciowy, nie rozmnażanie.'),
          Flashcard(id: 'f_k2_prot_8', front: 'Jak założyć hodowlę pantofelka?', back: 'Zalać rozdrobnione siano wodą — rozwiną się bakterie, a po kilku dniach żywiące się nimi orzęski.'),
          Flashcard(id: 'f_k2_prot_9', front: 'Wymień trzy grupy glonów zaliczanych do protistów.', back: 'Okrzemki, brunatnice i krasnorosty (a także bruzdnice i eugleniny).'),
        ],
        questions: [
          QuizQuestion(id: 'q_k2_prot_1', question: 'Pantofelek porusza się za pomocą:', options: ['Nibynóżek', 'Wici', 'Rzęsek', 'Nie porusza się aktywnie'], correctIndex: 2, explanation: 'Pantofelek to orzęsek — powierzchnię ciała pokrywają liczne rzęski.'),
          QuizQuestion(id: 'q_k2_prot_2', question: 'Wodniczka tętniąca występuje przede wszystkim u protistów żyjących w wodzie:', options: ['Słonej', 'Słodkiej', 'Gorącej', 'Ubogiej w tlen'], correctIndex: 1, explanation: 'Woda słodka jest hipotoniczna — do komórki stale wnika woda, którą trzeba usuwać.'),
          QuizQuestion(id: 'q_k2_prot_3', question: 'Sporowce charakteryzują się:', options: ['Ruchem za pomocą wici', 'Brakiem narządów ruchu i pasożytniczym trybem życia', 'Samożywnością', 'Budową wielokomórkową z tkankami'], correctIndex: 1, explanation: 'Sporowce to pasożyty pozbawione aparatów ruchu, np. zarodziec malarii.'),
          QuizQuestion(id: 'q_k2_prot_4', question: 'Euglena zielona w ciemności:', options: ['Ginie natychmiast', 'Odżywia się cudzożywnie', 'Prowadzi fotosyntezę intensywniej', 'Przekształca się w przetrwalnik'], correctIndex: 1, explanation: 'Euglena ma odżywianie mieszane — bez światła przechodzi na cudzożywność.'),
          QuizQuestion(id: 'q_k2_prot_5', question: 'Trawienie u pełzaka zachodzi w:', options: ['Wodniczce tętniącej', 'Wodniczce pokarmowej', 'Chloroplaście', 'Pellikuli'], correctIndex: 1, explanation: 'Pochłonięty pokarm trawiony jest wewnątrzkomórkowo w wodniczce pokarmowej.'),
          QuizQuestion(id: 'q_k2_prot_6', question: 'Koniugacja orzęsków jest procesem:', options: ['Rozmnażania — zwiększa liczbę osobników', 'Płciowym — prowadzi do wymiany materiału genetycznego', 'Odżywiania', 'Osmoregulacji'], correctIndex: 1, explanation: 'Liczba osobników się nie zmienia; celem jest wymiana materiału genetycznego.'),
          QuizQuestion(id: 'q_k2_prot_7', question: 'Które protisty zaliczamy do grzybopodobnych?', options: ['Okrzemki i brunatnice', 'Śluzowce i lęgniowce', 'Orzęski i pełzaki', 'Bruzdnice i krasnorosty'], correctIndex: 1, explanation: 'Śluzowce i lęgniowce odżywiają się cudzożywnie i rozmnażają przez zarodniki.'),
          QuizQuestion(id: 'q_k2_prot_8', question: 'Wymiana gazowa u protistów zachodzi:', options: ['Przez skrzela', 'Całą powierzchnią ciała', 'W wodniczkach tętniących', 'Przez tchawki'], correctIndex: 1, explanation: 'Protisty wymieniają gazy przez całą powierzchnię komórki.'),
        ],
      ),
      Topic(
        id: 'k2_protisty_choroby',
        name: 'Cykle rozwojowe, choroby i znaczenie protistów',
        theory: '''
MALARIA (ZIMNICA)
Malarię wywołuje zarodziec — sporowiec przenoszony przez samice komara widliszka, pełniące rolę wektora. Podczas ukłucia do krwi człowieka trafiają sporozoity, które wnikają do komórek wątroby i tam się namnażają. Następnie atakują erytrocyty, gdzie dzielą się przez schizogonię i okresowo, w tym samym czasie, rozrywają krwinki — z tym zjawiskiem wiążą się nawracające, regularne napady gorączki. Część pasożytów przekształca się w gametocyty, które pobiera komar wraz z krwią; w jego przewodzie pokarmowym zachodzi rozmnażanie płciowe. Człowiek jest żywicielem pośrednim, a komar — żywicielem ostatecznym. Profilaktyka obejmuje moskitiery, repelenty, odzież zakrywającą ciało, osuszanie zbiorników, w których rozwijają się larwy, oraz leki przeciwmalaryczne przy wyjazdach w rejony endemiczne.

TOKSOPLAZMOZA
Wywołuje ją Toxoplasma gondii. Żywicielem ostatecznym jest kot, a człowiek jest żywicielem pośrednim. Do zarażenia dochodzi przez spożycie surowego lub niedogotowanego mięsa, kontakt z odchodami kota (np. przy sprzątaniu kuwety) oraz przez nieumyte warzywa zanieczyszczone glebą. U osób zdrowych przebieg jest zwykle łagodny, ale zarażenie w czasie ciąży może prowadzić do poważnych wad rozwojowych płodu — dlatego kobiety ciężarne nie powinny sprzątać kuwety ani jeść surowego mięsa.

LAMBLIOZA (GIARDIOZA)
Wywołuje ją wiciowiec Giardia. Do zarażenia dochodzi drogą pokarmową — przez wodę lub pokarm zanieczyszczony cystami. Pasożyt bytuje w jelicie cienkim i powoduje biegunki, bóle brzucha oraz zaburzenia wchłaniania. Profilaktyka to picie wody z pewnego źródła, mycie rąk i warzyw.

CZERWONKA PEŁZAKOWA
Wywołuje ją pełzak czerwonki (Entamoeba histolytica), przenoszony drogą pokarmową przez wodę i pokarm zanieczyszczony cystami. Pasożyt uszkadza ścianę jelita grubego, powodując owrzodzenia i krwiste biegunki. Zapobiega jej higiena i korzystanie z bezpiecznych źródeł wody.

RZĘSISTKOWICA
Wywołuje ją rzęsistek pochwowy (Trichomonas vaginalis), przenoszony przez kontakty płciowe. Powoduje stan zapalny dróg moczowo-płciowych. Profilaktyka obejmuje stosowanie prezerwatyw i jednoczesne leczenie obojga partnerów.

ZNACZENIE PROTISTÓW
Glony planktonowe stanowią podstawę łańcuchów pokarmowych w wodach i odpowiadają za znaczną część produkcji tlenu na Ziemi. Pancerzyki okrzemek tworzą złoża ziemi okrzemkowej, wykorzystywanej jako materiał ścierny, filtracyjny i izolacyjny. Z krasnorostów pozyskuje się agar używany jako podłoże w hodowlach mikrobiologicznych, a z brunatnic — alginiany stosowane w przemyśle spożywczym i kosmetycznym. Nadmiar substancji odżywczych w wodzie prowadzi do zakwitów glonów i bruzdnic, po których rozkład masy glonów zużywa tlen i powoduje śnięcie organizmów wodnych.
''',
        flashcards: [
          Flashcard(id: 'f_k2_prot_10', front: 'Co przenosi zarodźca malarii?', back: 'Samice komara widliszka (Anopheles) — pełnią rolę wektora i żywiciela ostatecznego.'),
          Flashcard(id: 'f_k2_prot_11', front: 'Dlaczego w malarii napady gorączki są regularne?', back: 'Bo zarodźce w tym samym czasie rozrywają zakażone erytrocyty po kolejnych cyklach podziałów.'),
          Flashcard(id: 'f_k2_prot_12', front: 'Kto jest żywicielem ostatecznym, a kto pośrednim zarodźca malarii?', back: 'Ostatecznym — komar (zachodzi w nim rozmnażanie płciowe), pośrednim — człowiek.'),
          Flashcard(id: 'f_k2_prot_13', front: 'Jakie są drogi zarażenia toksoplazmozą?', back: 'Surowe lub niedogotowane mięso, kontakt z odchodami kota, nieumyte warzywa zanieczyszczone glebą.'),
          Flashcard(id: 'f_k2_prot_14', front: 'Dlaczego toksoplazmoza jest groźna w ciąży?', back: 'Może powodować poważne wady rozwojowe płodu.'),
          Flashcard(id: 'f_k2_prot_15', front: 'Jak dochodzi do zarażenia lambliozą i czerwonką pełzakową?', back: 'Drogą pokarmową — przez wodę lub pokarm zanieczyszczony cystami.'),
          Flashcard(id: 'f_k2_prot_16', front: 'Jak przenosi się rzęsistkowica?', back: 'Przez kontakty płciowe; leczyć trzeba oboje partnerów.'),
          Flashcard(id: 'f_k2_prot_17', front: 'Do czego wykorzystuje się agar i skąd pochodzi?', back: 'Z krasnorostów; służy jako podłoże w hodowlach mikrobiologicznych.'),
          Flashcard(id: 'f_k2_prot_18', front: 'Czym jest ziemia okrzemkowa?', back: 'Złożem z pancerzyków okrzemek, używanym jako materiał ścierny, filtracyjny i izolacyjny.'),
          Flashcard(id: 'f_k2_prot_19', front: 'Dlaczego zakwity glonów prowadzą do śnięcia ryb?', back: 'Rozkład obumarłej masy glonów zużywa tlen rozpuszczony w wodzie.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k2_prot_9', question: 'Wektorem zarodźca malarii jest:', options: ['Kleszcz', 'Samica komara widliszka', 'Mucha domowa', 'Pchła'], correctIndex: 1, explanation: 'Zarodziec przenoszony jest przez samice komara z rodzaju Anopheles.'),
          QuizQuestion(id: 'q_k2_prot_10', question: 'Człowiek w cyklu rozwojowym zarodźca malarii jest żywicielem:', options: ['Ostatecznym', 'Pośrednim', 'Przypadkowym, bez znaczenia dla cyklu', 'Jedynym'], correctIndex: 1, explanation: 'Rozmnażanie płciowe zachodzi w komarze, dlatego to on jest żywicielem ostatecznym.'),
          QuizQuestion(id: 'q_k2_prot_11', question: 'Żywicielem ostatecznym Toxoplasma gondii jest:', options: ['Człowiek', 'Kot', 'Pies', 'Komar'], correctIndex: 1, explanation: 'Cykl płciowy pasożyta zachodzi w kocie.'),
          QuizQuestion(id: 'q_k2_prot_12', question: 'Kobieta w ciąży powinna unikać przede wszystkim:', options: ['Kontaktu z odchodami kota i surowego mięsa', 'Spożywania warzyw gotowanych', 'Kontaktu z psami', 'Picia przegotowanej wody'], correctIndex: 0, explanation: 'To główne drogi zarażenia toksoplazmozą, groźną dla płodu.'),
          QuizQuestion(id: 'q_k2_prot_13', question: 'Czerwonkę pełzakową wywołuje:', options: ['Giardia', 'Entamoeba histolytica', 'Trichomonas vaginalis', 'Plasmodium'], correctIndex: 1, explanation: 'Pełzak czerwonki uszkadza ścianę jelita grubego.'),
          QuizQuestion(id: 'q_k2_prot_14', question: 'Rzęsistkowica przenoszona jest drogą:', options: ['Pokarmową', 'Płciową', 'Kropelkową', 'Przez wektora'], correctIndex: 1, explanation: 'Rzęsistek pochwowy przenosi się przez kontakty płciowe.'),
          QuizQuestion(id: 'q_k2_prot_15', question: 'Agar wykorzystywany w mikrobiologii pozyskuje się z:', options: ['Okrzemek', 'Krasnorostów', 'Brunatnic', 'Śluzowców'], correctIndex: 1, explanation: 'Agar to polisacharyd otrzymywany z krasnorostów.'),
          QuizQuestion(id: 'q_k2_prot_16', question: 'Fitoplankton w ekosystemach wodnych pełni rolę:', options: ['Reducenta', 'Producenta i źródła tlenu', 'Konsumenta I rzędu', 'Wyłącznie pasożyta'], correctIndex: 1, explanation: 'Glony planktonowe są producentami i odpowiadają za dużą część produkcji tlenu.'),
        ],
      ),
    ],
  ),

  // ===========================================================================
  // IX. RÓŻNORODNOŚĆ ROŚLIN
  // ===========================================================================
  Chapter(
    id: 'k2_rosliny',
    name: 'Różnorodność roślin',
    topics: [
      Topic(
        id: 'k2_rosliny_glony',
        name: 'Rośliny pierwotnie wodne — zielenice i krasnorosty',
        theory: '''
ZIELENICE
Zielenice zawierają chlorofil a i b, gromadzą skrobię jako materiał zapasowy, a ich ściany komórkowe zbudowane są z celulozy. Są to dokładnie te same cechy, które charakteryzują rośliny lądowe — dlatego przyjmuje się, że rośliny lądowe wywodzą się właśnie z zielenic, a najbliżej spokrewnione z nimi są ramienice. Zielenice występują w różnych formach: jednokomórkowej, kolonijnej (toczek), nitkowatej (skrętnica) oraz plechowatej (ulwa, zwana sałatą morską). Zasiedlają głównie wody słodkie, ale też morza, wilgotną glebę i korę drzew.

KRASNOROSTY
Krasnorosty zawierają chlorofil a oraz barwniki dodatkowe, przede wszystkim czerwoną fikoerytrynę. Barwnik ten pochłania światło niebieskozielone, które przenika najgłębiej w toni wodnej, dzięki czemu krasnorosty mogą prowadzić fotosyntezę na znacznych głębokościach — głębiej niż jakiekolwiek inne glony. Materiałem zapasowym jest skrobia krasnorostowa. Występują niemal wyłącznie w morzach, głównie w strefie ciepłej.

ZNACZENIE GLONÓW
Glony morskie i słodkowodne są producentami — stanowią podstawę łańcuchów pokarmowych w wodach i odpowiadają za znaczną część produkcji tlenu na Ziemi. Z krasnorostów pozyskuje się agar, wykorzystywany jako podłoże w hodowlach mikrobiologicznych oraz jako zagęstnik w przemyśle spożywczym. Niektóre gatunki, na przykład listownice i krasnorost porfira (nori), są spożywane przez człowieka. Glony bywają też stosowane jako nawozy oraz jako źródło substancji dla przemysłu kosmetycznego.
''',
        flashcards: [
          Flashcard(id: 'f_k2_ros_1', front: 'Jakie cechy zielenic wskazują na pokrewieństwo z roślinami lądowymi?', back: 'Chlorofil a i b, skrobia jako materiał zapasowy oraz ściana komórkowa z celulozy.'),
          Flashcard(id: 'f_k2_ros_2', front: 'Z jakiej grupy glonów wywodzą się rośliny lądowe?', back: 'Z zielenic — najbliżej spokrewnione z nimi są ramienice.'),
          Flashcard(id: 'f_k2_ros_3', front: 'Jaki barwnik dodatkowy zawierają krasnorosty i co on umożliwia?', back: 'Fikoerytrynę — pochłania światło niebieskozielone, dzięki czemu krasnorosty żyją na dużych głębokościach.'),
          Flashcard(id: 'f_k2_ros_4', front: 'Podaj przykłady form morfologicznych zielenic.', back: 'Jednokomórkowa, kolonijna (toczek), nitkowata (skrętnica), plechowata (ulwa).'),
          Flashcard(id: 'f_k2_ros_5', front: 'Z jakich glonów pozyskuje się agar?', back: 'Z krasnorostów.'),
          Flashcard(id: 'f_k2_ros_6', front: 'Jaki materiał zapasowy gromadzą krasnorosty?', back: 'Skrobię krasnorostową.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k2_ros_1', question: 'Rośliny lądowe wywodzą się od:', options: ['Krasnorostów', 'Zielenic', 'Brunatnic', 'Okrzemek'], correctIndex: 1, explanation: 'Zielenice mają ten sam zestaw barwników, materiał zapasowy i ścianę komórkową co rośliny lądowe.'),
          QuizQuestion(id: 'q_k2_ros_2', question: 'Krasnorosty mogą żyć głębiej niż inne glony, ponieważ:', options: ['Nie potrzebują światła', 'Fikoerytryna pochłania światło niebieskozielone, docierające najgłębiej', 'Mają grubsze ściany komórkowe', 'Odżywiają się cudzożywnie'], correctIndex: 1, explanation: 'Barwnik dodatkowy pozwala wykorzystać światło o krótkiej fali, przenikające głęboko w wodzie.'),
          QuizQuestion(id: 'q_k2_ros_3', question: 'Materiałem zapasowym zielenic jest:', options: ['Glikogen', 'Skrobia', 'Chityna', 'Agar'], correctIndex: 1, explanation: 'Zielenice, tak jak rośliny lądowe, gromadzą skrobię.'),
          QuizQuestion(id: 'q_k2_ros_4', question: 'Toczek jest przykładem zielenicy o budowie:', options: ['Jednokomórkowej', 'Kolonijnej', 'Nitkowatej', 'Plechowatej'], correctIndex: 1, explanation: 'Toczek tworzy kuliste kolonie złożone z wielu komórek.'),
          QuizQuestion(id: 'q_k2_ros_5', question: 'Ściana komórkowa zielenic zbudowana jest z:', options: ['Chityny', 'Celulozy', 'Mureiny', 'Ligniny'], correctIndex: 1, explanation: 'Celuloza buduje ściany komórkowe zielenic i roślin lądowych.'),
        ],
      ),
      Topic(
        id: 'k2_rosliny_przeglad',
        name: 'Podbój lądu i przegląd roślin lądowych',
        theory: '''
RÓŻNICE MIĘDZY ŚRODOWISKIEM WODNYM A LĄDOWYM
Woda podpiera ciało rośliny, zapewnia stały dostęp wody i rozpuszczonych soli, chroni gamety przed wysychaniem i łagodzi wahania temperatury. Na lądzie roślina musi sama się podpierać, ograniczać utratę wody, transportować ją na duże odległości, chronić komórki rozrodcze przed wysuszeniem i znosić duże wahania temperatury oraz promieniowanie UV. Z drugiej strony ląd daje lepszy dostęp do światła i dwutlenku węgla.

PRZYSTOSOWANIA UMOŻLIWIAJĄCE ZASIEDLENIE LĄDU
Kutykula pokrywająca skórkę ogranicza parowanie, a aparaty szparkowe umożliwiają regulowaną wymianę gazową. Tkanki przewodzące — drewno i łyko — pozwalają transportować wodę i produkty fotosyntezy na duże odległości. Tkanki wzmacniające usztywniają pęd, umożliwiając wzrost w górę. Korzenie zakotwiczają roślinę i pobierają wodę. Zarodniki o grubych ścianach, a później ziarna pyłku i nasiona, uniezależniły rozmnażanie od obecności wody. Zarodek rozwija się chroniony w tkankach rośliny macierzystej.

MCHY
Mchy nie mają korzeni — do podłoża przytwierdzają się chwytnikami — ani prawdziwych tkanek przewodzących, dlatego pozostają niewielkie i rosną w miejscach wilgotnych. W ich cyklu dominuje gametofit, czyli zielona, ulistniona roślinka, a sporofit (seta z zarodnią) jest od niego zależny i na nim wyrasta. Do zapłodnienia niezbędna jest woda, w której plemniki docierają do komórki jajowej. Torfowce mają zdolność magazynowania dużych ilości wody i tworzą torfowiska.

WIDŁAKI I SKRZYPY
Widłaki i skrzypy mają już tkanki przewodzące i w ich cyklu dominuje sporofit. Widłaki mają drobne, gęsto osadzone liście, a zarodnie zebrane w kłosy zarodnionośne. Skrzypy wytwarzają podziemne kłącze oraz dwa rodzaje pędów: wiosenne pędy zarodnionośne i letnie pędy asymilacyjne. Ich ściany komórkowe wysycone są krzemionką, co usztywnia pęd i chroni przed roślinożercami.

PAPROCIE
U paproci sporofitem jest okazała roślina o pierzastych liściach, na spodniej stronie których powstają zarodnie zebrane w kupki. Gametofit to drobne, sercowate przedrośle żyjące samodzielnie w wilgotnym miejscu — również u paproci do zapłodnienia potrzebna jest woda. Młode liście paproci są charakterystycznie zwinięte w pastorał.

ROŚLINY NASIENNE
Rośliny nasienne wytwarzają ziarna pyłku przenoszone przez wiatr lub zwierzęta, dzięki czemu zapłodnienie nie wymaga wody, oraz nasiona chroniące i odżywiające zarodek. Nagonasienne, na przykład sosna i świerk, mają zalążki leżące odsłonięte na łuskach szyszek, liście najczęściej igiełkowate pokryte grubą kutykulą oraz przewody żywiczne. Okrytonasienne wytwarzają kwiat, a zalążki są ukryte w zalążni słupka; po zapłodnieniu z zalążni powstaje owoc. To najliczniejsza i najbardziej zróżnicowana grupa roślin.
''',
        flashcards: [
          Flashcard(id: 'f_k2_ros_7', front: 'Wymień cztery przystosowania roślin do życia na lądzie.', back: 'Kutykula, aparaty szparkowe, tkanki przewodzące i wzmacniające, korzenie oraz nasiona/pyłek uniezależniające rozmnażanie od wody.'),
          Flashcard(id: 'f_k2_ros_8', front: 'Które pokolenie dominuje u mchów?', back: 'Gametofit — zielona, ulistniona roślinka; sporofit jest od niego zależny.'),
          Flashcard(id: 'f_k2_ros_9', front: 'Czym mchy przytwierdzają się do podłoża?', back: 'Chwytnikami — nie mają prawdziwych korzeni.'),
          Flashcard(id: 'f_k2_ros_10', front: 'Dlaczego mchy i paprocie potrzebują wody do rozmnażania?', back: 'Plemniki muszą przepłynąć w wodzie do komórki jajowej.'),
          Flashcard(id: 'f_k2_ros_11', front: 'Czym charakteryzują się skrzypy?', back: 'Kłączem, pędami zarodnionośnymi i asymilacyjnymi oraz ścianami wysyconymi krzemionką.'),
          Flashcard(id: 'f_k2_ros_12', front: 'Czym jest przedrośle paproci?', back: 'Gametofitem — drobną, sercowatą, samodzielną roślinką.'),
          Flashcard(id: 'f_k2_ros_13', front: 'Czym różnią się nagonasienne od okrytonasiennych?', back: 'U nagonasiennych zalążki leżą odsłonięte na łuskach szyszek, u okrytonasiennych są ukryte w zalążni słupka, a z zalążni powstaje owoc.'),
          Flashcard(id: 'f_k2_ros_14', front: 'Które pokolenie dominuje u paproci, skrzypów i widłaków?', back: 'Sporofit.'),
          Flashcard(id: 'f_k2_ros_15', front: 'Jaką rolę pełnią torfowce?', back: 'Magazynują duże ilości wody i tworzą torfowiska.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k2_ros_6', question: 'U mchów pokoleniem dominującym jest:', options: ['Sporofit', 'Gametofit', 'Przedrośle', 'Zarodnia'], correctIndex: 1, explanation: 'Zielona roślinka mchu to gametofit; sporofit wyrasta na nim i jest od niego zależny.'),
          QuizQuestion(id: 'q_k2_ros_7', question: 'Mchy pozostają niewielkie przede wszystkim dlatego, że:', options: ['Rosną w cieniu', 'Nie mają prawdziwych tkanek przewodzących', 'Nie prowadzą fotosyntezy', 'Nie mają chlorofilu'], correctIndex: 1, explanation: 'Brak sprawnych tkanek przewodzących ogranicza transport wody, a więc i rozmiary.'),
          QuizQuestion(id: 'q_k2_ros_8', question: 'Kutykula pokrywająca skórkę liścia pełni funkcję:', options: ['Wymiany gazowej', 'Ograniczania utraty wody', 'Transportu asymilatów', 'Fotosyntetyczną'], correctIndex: 1, explanation: 'Woskowa kutykula ogranicza parowanie wody z powierzchni rośliny.'),
          QuizQuestion(id: 'q_k2_ros_9', question: 'Krzemionka w ścianach komórkowych jest charakterystyczna dla:', options: ['Mchów', 'Skrzypów', 'Paproci', 'Nagonasiennych'], correctIndex: 1, explanation: 'Skrzypy wysycają ściany krzemionką, co usztywnia pęd.'),
          QuizQuestion(id: 'q_k2_ros_10', question: 'Kupki na spodniej stronie liścia paproci zawierają:', options: ['Gamety', 'Zarodnie z zarodnikami', 'Nasiona', 'Aparaty szparkowe'], correctIndex: 1, explanation: 'Kupki to skupienia zarodni wytwarzających zarodniki.'),
          QuizQuestion(id: 'q_k2_ros_11', question: 'Zalążki leżące odsłonięte na łuskach szyszek są cechą:', options: ['Okrytonasiennych', 'Nagonasiennych', 'Paproci', 'Mchów'], correctIndex: 1, explanation: 'Nazwa „nagonasienne" pochodzi właśnie od nieosłoniętych zalążków.'),
          QuizQuestion(id: 'q_k2_ros_12', question: 'Które przystosowanie uniezależniło rozmnażanie roślin od obecności wody?', options: ['Kutykula', 'Ziarno pyłku', 'Chwytniki', 'Aparaty szparkowe'], correctIndex: 1, explanation: 'Pyłek przenoszony przez wiatr lub zwierzęta zastąpił ruchliwe plemniki wymagające wody.'),
          QuizQuestion(id: 'q_k2_ros_13', question: 'Owoc powstaje z:', options: ['Zalążka', 'Zalążni słupka', 'Pylnika', 'Znamienia'], correctIndex: 1, explanation: 'Z zalążni rozwija się owoc, a z zalążków — nasiona.'),
        ],
      ),
      Topic(
        id: 'k2_rosliny_tkanki',
        name: 'Tkanki roślinne',
        theory: '''
TKANKI TWÓRCZE (MERYSTEMY)
Merystemy zbudowane są z komórek zdolnych do podziałów, o cienkich ścianach, dużym jądrze i niewielkich wakuolach. Merystemy wierzchołkowe leżą w stożkach wzrostu pędu i korzenia i odpowiadają za wzrost na długość. Merystemy boczne — kambium (miazga) oraz felogen (miazga korkotwórcza) — odpowiadają za przyrost na grubość. Kambium odkłada do wewnątrz drewno wtórne, a na zewnątrz łyko wtórne; felogen wytwarza korek.

TKANKI OKRYWAJĄCE
Skórka (epiderma) okrywa młode organy. Tworzy ją zwykle jedna warstwa ściśle przylegających komórek pokrytych kutykulą. W skórce znajdują się aparaty szparkowe zbudowane z dwóch komórek przyszparkowych otaczających szparkę, a także włoski — chroniące, wydzielnicze lub czepne. Włośniki to wydłużone komórki skórki korzenia zwiększające powierzchnię chłonną. Korek (peryderma) zastępuje skórkę w organach starszych; jego ściany wysycone są suberyną, co czyni go nieprzepuszczalnym, a wymianę gazową umożliwiają przetchlinki.

TKANKI MIĘKISZOWE
Miękisz zbudowany jest z żywych komórek o cienkich ścianach i dużych wakuolach. Miękisz asymilacyjny zawiera liczne chloroplasty i prowadzi fotosyntezę; w liściu dzieli się na palisadowy (pod skórką górną, komórki wydłużone, gęsto ułożone) i gąbczasty (z dużymi przestworami międzykomórkowymi). Miękisz spichrzowy magazynuje substancje zapasowe, powietrzny (aerenchyma) zawiera duże przestwory ułatwiające wymianę gazową u roślin wodnych i bagiennych, a wodny magazynuje wodę u sukulentów.

TKANKI WZMACNIAJĄCE
Kolenchyma (zwarcica) zbudowana jest z żywych komórek o nierównomiernie zgrubiałych ścianach; usztywnia organy młode, rosnące, pozostając elastyczna. Sklerenchyma (twardzica) składa się z komórek martwych o równomiernie zgrubiałych, zdrewniałych ścianach; tworzy włókna i komórki kamienne, nadając trwałą wytrzymałość organom, które zakończyły wzrost.

TKANKI PRZEWODZĄCE
Drewno (ksylem) przewodzi wodę z solami mineralnymi z korzenia do liści, czyli w górę. Tworzą je martwe, zdrewniałe elementy: naczynia, których poprzeczne ściany zanikły, oraz cewki połączone jamkami. Drewno pełni też funkcję wzmacniającą. Łyko (floem) przewodzi produkty fotosyntezy, głównie sacharozę, w obu kierunkach — od miejsca wytwarzania do miejsc zużycia lub magazynowania. Tworzą je żywe rurki sitowe pozbawione jądra, wspomagane przez komórki towarzyszące, które zaopatrują je energetycznie.

ZNACZENIE POŁĄCZEŃ MIĘDZYKOMÓRKOWYCH
Sąsiadujące komórki roślinne łączą plazmodesmy — kanały w ścianach wypełnione cytoplazmą. Umożliwiają one bezpośredni przepływ wody, jonów i drobnych cząsteczek między komórkami, tworząc ciągłą sieć cytoplazmy zwaną symplastem. Dzięki temu roślina, mimo sztywnych ścian komórkowych, funkcjonuje jako całość i może przekazywać sygnały między komórkami.
''',
        flashcards: [
          Flashcard(id: 'f_k2_ros_16', front: 'Za co odpowiada kambium (miazga)?', back: 'Za przyrost na grubość — odkłada drewno wtórne do wewnątrz, a łyko wtórne na zewnątrz.'),
          Flashcard(id: 'f_k2_ros_17', front: 'Czym różni się miękisz palisadowy od gąbczastego?', back: 'Palisadowy ma wydłużone, gęsto ułożone komórki z licznymi chloroplastami; gąbczasty ma duże przestwory międzykomórkowe.'),
          Flashcard(id: 'f_k2_ros_18', front: 'Czym różni się kolenchyma od sklerenchymy?', back: 'Kolenchyma to żywe komórki o nierównomiernie zgrubiałych ścianach (organy rosnące), sklerenchyma — martwe, o zdrewniałych ścianach (organy wyrośnięte).'),
          Flashcard(id: 'f_k2_ros_19', front: 'Co przewodzi drewno, a co łyko?', back: 'Drewno — wodę z solami mineralnymi w górę; łyko — produkty fotosyntezy (głównie sacharozę) w obu kierunkach.'),
          Flashcard(id: 'f_k2_ros_20', front: 'Czym różnią się elementy drewna od elementów łyka pod względem żywotności?', back: 'Drewno tworzą komórki martwe (naczynia, cewki), łyko — żywe rurki sitowe z komórkami towarzyszącymi.'),
          Flashcard(id: 'f_k2_ros_21', front: 'Jaką funkcję pełnią komórki towarzyszące w łyku?', back: 'Zaopatrują energetycznie pozbawione jądra rurki sitowe.'),
          Flashcard(id: 'f_k2_ros_22', front: 'Czym są plazmodesmy i co tworzą?', back: 'Kanałami cytoplazmatycznymi łączącymi sąsiednie komórki; tworzą ciągłą sieć cytoplazmy zwaną symplastem.'),
          Flashcard(id: 'f_k2_ros_23', front: 'Jaką funkcję pełnią przetchlinki?', back: 'Umożliwiają wymianę gazową przez nieprzepuszczalny korek.'),
          Flashcard(id: 'f_k2_ros_24', front: 'Czym są włośniki?', back: 'Wydłużonymi komórkami skórki korzenia, które zwiększają powierzchnię chłonną.'),
          Flashcard(id: 'f_k2_ros_25', front: 'Jaką substancją wysycone są ściany korka?', back: 'Suberyną, która czyni go nieprzepuszczalnym dla wody i gazów.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k2_ros_14', question: 'Przyrost łodygi na grubość umożliwia:', options: ['Merystem wierzchołkowy', 'Kambium', 'Skórka', 'Miękisz gąbczasty'], correctIndex: 1, explanation: 'Kambium to merystem boczny odkładający drewno i łyko wtórne.'),
          QuizQuestion(id: 'q_k2_ros_15', question: 'Naczynia i cewki to elementy:', options: ['Łyka', 'Drewna', 'Skórki', 'Kolenchymy'], correctIndex: 1, explanation: 'To martwe elementy drewna przewodzące wodę z solami mineralnymi.'),
          QuizQuestion(id: 'q_k2_ros_16', question: 'Transport sacharozy w roślinie odbywa się przez:', options: ['Drewno', 'Łyko', 'Kutykulę', 'Przetchlinki'], correctIndex: 1, explanation: 'Produkty fotosyntezy transportowane są rurkami sitowymi łyka.'),
          QuizQuestion(id: 'q_k2_ros_17', question: 'Tkanką wzmacniającą organy młode, wciąż rosnące, jest:', options: ['Sklerenchyma', 'Kolenchyma', 'Miękisz spichrzowy', 'Korek'], correctIndex: 1, explanation: 'Kolenchyma jest żywa i elastyczna, więc nie hamuje wzrostu.'),
          QuizQuestion(id: 'q_k2_ros_18', question: 'Aparat szparkowy tworzą:', options: ['Włośniki', 'Dwie komórki przyszparkowe otaczające szparkę', 'Komórki kamienne', 'Rurki sitowe'], correctIndex: 1, explanation: 'Komórki przyszparkowe, zmieniając turgor, otwierają i zamykają szparkę.'),
          QuizQuestion(id: 'q_k2_ros_19', question: 'Aerenchyma (miękisz powietrzny) występuje przede wszystkim u roślin:', options: ['Pustynnych', 'Wodnych i bagiennych', 'Górskich', 'Pasożytniczych'], correctIndex: 1, explanation: 'Duże przestwory ułatwiają wymianę gazową w warunkach niedoboru tlenu.'),
          QuizQuestion(id: 'q_k2_ros_20', question: 'Plazmodesmy umożliwiają:', options: ['Wymianę gazową z atmosferą', 'Bezpośredni przepływ substancji między sąsiednimi komórkami', 'Usztywnienie ściany komórkowej', 'Magazynowanie wody'], correctIndex: 1, explanation: 'To kanały cytoplazmatyczne tworzące symplast.'),
          QuizQuestion(id: 'q_k2_ros_21', question: 'Rurki sitowe są komórkami:', options: ['Martwymi, zdrewniałymi', 'Żywymi, pozbawionymi jądra', 'Twórczymi', 'Wypełnionymi chloroplastami'], correctIndex: 1, explanation: 'Rurki sitowe są żywe, ale bez jądra — wspomagają je komórki towarzyszące.'),
        ],
      ),
      Topic(
        id: 'k2_rosliny_organy',
        name: 'Organy wegetatywne i ich modyfikacje',
        theory: '''
KORZEŃ
Korzeń zakotwicza roślinę, pobiera wodę i sole mineralne, a często magazynuje substancje zapasowe. Wierzchołek chroni czapeczka; nad nią leży strefa podziałów, strefa wydłużania, strefa włośnikowa (najintensywniejsze pobieranie wody) oraz strefa przewodzenia z korzeniami bocznymi. W budowie pierwotnej od zewnątrz wyróżniamy ryzodermę z włośnikami, korę pierwotną oraz walec osiowy z tkankami przewodzącymi. Granicę kory i walca stanowi endoderma z pasemkami Caspary'ego — nieprzepuszczalnymi zgrubieniami, które zmuszają wodę do przejścia przez błonę komórkową, co pozwala roślinie kontrolować skład pobieranego roztworu. System palowy ma wyraźny korzeń główny (rośliny dwuliścienne), a system wiązkowy składa się z licznych korzeni przybyszowych (jednoliścienne).

ŁODYGA
Łodyga podtrzymuje liście, kwiaty i owoce oraz przewodzi substancje między korzeniem a liśćmi. Wyrastają z niej liście w węzłach, a odcinki między nimi to międzywęźla. W budowie pierwotnej ma skórkę, korę pierwotną i walec osiowy z wiązkami przewodzącymi. U roślin drzewiastych działalność kambium prowadzi do przyrostu wtórnego: powstają słoje roczne, w których drewno wiosenne ma szersze naczynia niż drewno letnie, dzięki czemu można określić wiek drzewa i warunki panujące w kolejnych latach.

LIŚĆ
Liść jest głównym organem fotosyntezy i transpiracji. Składa się z blaszki i ogonka, czasem z nasady i przylistków. W przekroju widać skórkę górną pokrytą grubą kutykulą, miękisz palisadowy, miękisz gąbczasty z przestworami, wiązki przewodzące tworzące nerwy oraz skórkę dolną, w której znajduje się zwykle więcej aparatów szparkowych — takie rozmieszczenie ogranicza straty wody, bo dolna strona jest mniej nasłoneczniona. Unerwienie może być siatkowate (dwuliścienne) lub równoległe i łukowate (jednoliścienne).

MODYFIKACJE ORGANÓW
Modyfikacje to przekształcenia organów pełniące funkcje inne niż typowe, będące przystosowaniem do warunków środowiska. Korzenie mogą być spichrzowe (marchew, burak), czepne (bluszcz), podporowe lub oddechowe u roślin bagiennych. Przekształcone łodygi to kłącze (perz, konwalia), bulwa (ziemniak — z oczkami, czyli pąkami), cebula (z mięsistymi liśćmi spichrzowymi), rozłogi (truskawka), a także ciernie (głóg) i wąsy czepne (winorośl). Liście przekształcają się w ciernie ograniczające transpirację (kaktusy), wąsy czepne (groch), liście spichrzowe (cebula), łuski okrywające pąki oraz pułapki roślin mięsożernych (rosiczka, dzbanecznik), które w ten sposób uzupełniają niedobór azotu na ubogich siedliskach. Aby odróżnić przekształconą łodygę od korzenia, sprawdza się obecność pąków i liści łuskowatych — występują one tylko na pędach.
''',
        flashcards: [
          Flashcard(id: 'f_k2_ros_26', front: 'W której strefie korzenia pobieranie wody jest najintensywniejsze?', back: 'W strefie włośnikowej.'),
          Flashcard(id: 'f_k2_ros_27', front: 'Jaką funkcję pełnią pasemka Caspary\'ego?', back: 'Uniemożliwiają swobodny przepływ wody ścianami komórkowymi, zmuszając ją do przejścia przez błonę — roślina kontroluje skład pobieranego roztworu.'),
          Flashcard(id: 'f_k2_ros_28', front: 'Czym różni się system korzeniowy palowy od wiązkowego?', back: 'Palowy ma wyraźny korzeń główny (dwuliścienne), wiązkowy tworzą liczne korzenie przybyszowe (jednoliścienne).'),
          Flashcard(id: 'f_k2_ros_29', front: 'Dlaczego można określić wiek drzewa po słojach?', back: 'Co roku kambium odkłada drewno wiosenne o szerokich naczyniach i letnie o wąskich — jedna para to jeden rok.'),
          Flashcard(id: 'f_k2_ros_30', front: 'Dlaczego aparatów szparkowych jest więcej na dolnej stronie liścia?', back: 'Dolna strona jest mniej nasłoneczniona, więc ogranicza to straty wody przez transpirację.'),
          Flashcard(id: 'f_k2_ros_31', front: 'Jak odróżnić przekształconą łodygę od korzenia?', back: 'Po obecności pąków i liści łuskowatych — występują tylko na pędach.'),
          Flashcard(id: 'f_k2_ros_32', front: 'Czym jest bulwa ziemniaka?', back: 'Przekształconą, zgrubiałą łodygą podziemną z pąkami (oczkami).'),
          Flashcard(id: 'f_k2_ros_33', front: 'Jakie znaczenie mają ciernie kaktusa?', back: 'To przekształcone liście — ograniczają transpirację i chronią przed roślinożercami.'),
          Flashcard(id: 'f_k2_ros_34', front: 'Dlaczego rośliny mięsożerne chwytają owady?', back: 'Uzupełniają w ten sposób niedobór azotu na ubogich siedliskach.'),
          Flashcard(id: 'f_k2_ros_35', front: 'Czym różni się unerwienie liści jedno- i dwuliściennych?', back: 'Jednoliścienne mają unerwienie równoległe lub łukowate, dwuliścienne — siatkowate.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k2_ros_22', question: 'Pasemka Caspary\'ego znajdują się w:', options: ['Skórce liścia', 'Endodermie korzenia', 'Rurkach sitowych', 'Czapeczce'], correctIndex: 1, explanation: 'Endoderma z pasemkami Caspary\'ego oddziela korę pierwotną od walca osiowego.'),
          QuizQuestion(id: 'q_k2_ros_23', question: 'Bulwa ziemniaka jest przekształconą:', options: ['Korzeniem', 'Łodygą', 'Liściem', 'Zalążnią'], correctIndex: 1, explanation: 'Świadczą o tym oczka, czyli pąki — występują tylko na pędach.'),
          QuizQuestion(id: 'q_k2_ros_24', question: 'System korzeniowy wiązkowy jest charakterystyczny dla:', options: ['Roślin dwuliściennych', 'Roślin jednoliściennych', 'Nagonasiennych', 'Mchów'], correctIndex: 1, explanation: 'Jednoliścienne tworzą liczne korzenie przybyszowe zamiast korzenia głównego.'),
          QuizQuestion(id: 'q_k2_ros_25', question: 'Drewno wiosenne różni się od letniego tym, że ma:', options: ['Węższe naczynia', 'Szersze naczynia', 'Brak naczyń', 'Więcej chloroplastów'], correctIndex: 1, explanation: 'Wiosną roślina intensywnie transportuje wodę, więc naczynia są szersze.'),
          QuizQuestion(id: 'q_k2_ros_26', question: 'Miękisz palisadowy w liściu leży:', options: ['Pod skórką dolną', 'Pod skórką górną', 'W wiązkach przewodzących', 'W ogonku liściowym'], correctIndex: 1, explanation: 'Znajduje się pod skórką górną, gdzie dociera najwięcej światła.'),
          QuizQuestion(id: 'q_k2_ros_27', question: 'Wąsy czepne grochu są przekształconymi:', options: ['Łodygami', 'Liśćmi', 'Korzeniami', 'Kwiatami'], correctIndex: 1, explanation: 'U grochu w wąsy przekształcają się szczytowe listki liścia złożonego.'),
          QuizQuestion(id: 'q_k2_ros_28', question: 'Czapeczka korzenia pełni funkcję:', options: ['Pobierania wody', 'Ochrony merystemu wierzchołkowego', 'Fotosyntezy', 'Magazynowania skrobi wyłącznie'], correctIndex: 1, explanation: 'Chroni delikatny stożek wzrostu podczas przemieszczania się w glebie.'),
          QuizQuestion(id: 'q_k2_ros_29', question: 'Korzenie spichrzowe występują u:', options: ['Bluszczu', 'Marchwi', 'Ziemniaka', 'Truskawki'], correctIndex: 1, explanation: 'Marchew magazynuje substancje zapasowe w zgrubiałym korzeniu.'),
        ],
      ),
      Topic(
        id: 'k2_rosliny_woda',
        name: 'Gospodarka wodna i odżywianie mineralne',
        theory: '''
POBIERANIE WODY
Woda pobierana jest głównie przez włośniki na drodze osmozy — wnika do komórki, ponieważ roztwór w jej wnętrzu jest bardziej stężony niż roztwór glebowy. Sole mineralne pobierane są w postaci jonów, najczęściej na drodze transportu aktywnego, z nakładem energii, ponieważ ich stężenie w glebie bywa niższe niż w komórce.

DROGI TRANSPORTU W KORZENIU
Woda przemieszcza się w poprzek korzenia dwiema drogami: apoplastem, czyli ścianami komórkowymi i przestworami, oraz symplastem — przez cytoplazmę i plazmodesmy. Na granicy walca osiowego droga apoplastyczna zostaje przerwana przez pasemka Caspary'ego, więc cała woda musi przejść przez błony komórkowe endodermy. Dzięki temu roślina kontroluje, co dostaje się do naczyń.

SIŁY TRANSPORTUJĄCE WODĘ
Transport wody w górę napędzają dwa mechanizmy. Parcie korzeniowe działa od dołu: aktywne pobieranie jonów do walca osiowego obniża potencjał wody, powodując napływ wody i wzrost ciśnienia. Ma ono jednak ograniczoną siłę. Główną rolę odgrywa transpiracja — parowanie wody z liści wytwarza siłę ssącą, a woda przemieszcza się w naczyniach jako ciągły słup dzięki kohezji (przyleganiu cząsteczek wody do siebie) oraz adhezji (przyleganiu do ścian naczyń). Mechanizm ten opisuje teoria kohezyjno-napięciowa.

TRANSPIRACJA I RUCH APARATÓW SZPARKOWYCH
Transpiracja to parowanie wody z rośliny: szparkowa (przez aparaty szparkowe, regulowana) i kutykularna (przez kutykulę, niewielka i nieregulowana). Otwieranie szparek wiąże się ze zmianą turgoru komórek przyszparkowych. Aktywny napływ jonów potasu obniża potencjał osmotyczny i potencjał wody w tych komórkach, dzięki czemu napływa do nich woda, rośnie turgor, a nierównomiernie zgrubiałe ściany wyginają się, otwierając szparkę. Odpływ jonów powoduje utratę wody, spadek turgoru i zamknięcie szparki.

CZYNNIKI WPŁYWAJĄCE NA TRANSPIRACJĘ
Wzrost temperatury przyspiesza parowanie, podobnie jak wiatr, który usuwa nasyconą parą warstwę powietrza znad liścia. Światło powoduje otwieranie szparek, więc zwiększa transpirację. Wysoka wilgotność powietrza zmniejsza różnicę stężeń pary wodnej i ogranicza parowanie. Przy silnym niedoborze wody roślina zamyka szparki, co ogranicza straty, ale jednocześnie hamuje dopływ dwutlenku węgla i spowalnia fotosyntezę.

SUSZA FIZJOLOGICZNA
Susza fizjologiczna to sytuacja, w której woda w środowisku jest obecna, ale roślina nie może jej pobrać. Występuje przy niskiej temperaturze gleby (zimą lub wczesną wiosną, gdy gleba jest zmarznięta), przy dużym zasoleniu, gdy roztwór glebowy jest bardziej stężony niż sok komórkowy, oraz przy silnym zakwaszeniu podłoża. Roślina więdnie mimo obecności wody.

ODŻYWIANIE MINERALNE
Azot pobierany jest w postaci azotanów(V) i jonów amonowych, a siarka jako siarczany(VI). Makroelementy potrzebne są w większych ilościach: azot buduje białka, kwasy nukleinowe i chlorofil; fosfor wchodzi w skład ATP, kwasów nukleinowych i fosfolipidów; potas reguluje gospodarkę wodną i ruch szparek; wapń buduje ściany komórkowe; magnez jest centralnym atomem chlorofilu; siarka wchodzi w skład niektórych aminokwasów. Mikroelementy, takie jak żelazo, mangan, cynk, miedź, bor i molibden, potrzebne są w ilościach śladowych i pełnią głównie funkcje kofaktorów enzymów. Niedobór pierwiastka daje charakterystyczne objawy, na przykład brak magnezu lub azotu powoduje żółknięcie liści, czyli chlorozę.
''',
        flashcards: [
          Flashcard(id: 'f_k2_ros_36', front: 'Czym różni się droga apoplastyczna od symplastycznej?', back: 'Apoplast to ściany komórkowe i przestwory, symplast to cytoplazma połączona plazmodesmami.'),
          Flashcard(id: 'f_k2_ros_37', front: 'Co opisuje teoria kohezyjno-napięciowa?', back: 'Transport wody w górę: siła ssąca transpiracji ciągnie ciągły słup wody utrzymywany przez kohezję i adhezję.'),
          Flashcard(id: 'f_k2_ros_38', front: 'Czym jest parcie korzeniowe?', back: 'Siłą tłoczącą wodę od dołu, powstającą wskutek aktywnego pobierania jonów do walca osiowego i napływu wody.'),
          Flashcard(id: 'f_k2_ros_39', front: 'Jak jony potasu otwierają aparat szparkowy?', back: 'Napływ K+ obniża potencjał wody w komórkach przyszparkowych, napływa woda, rośnie turgor i szparka się otwiera.'),
          Flashcard(id: 'f_k2_ros_40', front: 'Jak wilgotność powietrza wpływa na transpirację?', back: 'Wysoka wilgotność zmniejsza różnicę stężeń pary wodnej i ogranicza transpirację.'),
          Flashcard(id: 'f_k2_ros_41', front: 'Czym jest susza fizjologiczna?', back: 'Sytuacją, w której woda jest w środowisku obecna, ale niedostępna dla rośliny — np. przy zmarzniętej lub zasolonej glebie.'),
          Flashcard(id: 'f_k2_ros_42', front: 'W jakiej postaci rośliny pobierają azot i siarkę?', back: 'Azot jako azotany(V) i jony amonowe, siarkę jako siarczany(VI).'),
          Flashcard(id: 'f_k2_ros_43', front: 'Jaką rolę pełni magnez w roślinie?', back: 'Jest centralnym atomem cząsteczki chlorofilu.'),
          Flashcard(id: 'f_k2_ros_44', front: 'Czym jest chloroza i co ją powoduje?', back: 'Żółknięciem liści wskutek niedoboru pierwiastków, np. azotu lub magnezu.'),
          Flashcard(id: 'f_k2_ros_45', front: 'Dlaczego zamknięcie szparek podczas suszy spowalnia fotosyntezę?', back: 'Ogranicza nie tylko utratę wody, ale i dopływ dwutlenku węgla do liścia.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k2_ros_30', question: 'Główną siłą transportującą wodę w górę rośliny jest:', options: ['Parcie korzeniowe', 'Siła ssąca transpiracji', 'Transport aktywny w łyku', 'Grawitacja'], correctIndex: 1, explanation: 'Parowanie z liści wytwarza siłę ssącą; parcie korzeniowe ma znaczenie pomocnicze.'),
          QuizQuestion(id: 'q_k2_ros_31', question: 'Kohezja w transporcie wody oznacza:', options: ['Przyleganie wody do ścian naczyń', 'Wzajemne przyleganie cząsteczek wody', 'Aktywne pobieranie jonów', 'Parowanie z powierzchni liścia'], correctIndex: 1, explanation: 'Kohezja to przyciąganie cząsteczek wody między sobą, dzięki czemu słup wody się nie rwie.'),
          QuizQuestion(id: 'q_k2_ros_32', question: 'Otwarcie aparatu szparkowego następuje, gdy komórki przyszparkowe:', options: ['Tracą wodę i turgor', 'Pobierają jony K+, wodę i zwiększają turgor', 'Obumierają', 'Tracą chloroplasty'], correctIndex: 1, explanation: 'Wzrost turgoru wygina nierównomiernie zgrubiałe ściany i otwiera szparkę.'),
          QuizQuestion(id: 'q_k2_ros_33', question: 'Który czynnik ZMNIEJSZA intensywność transpiracji?', options: ['Wzrost temperatury', 'Wiatr', 'Wysoka wilgotność powietrza', 'Światło'], correctIndex: 2, explanation: 'Wilgotne powietrze zmniejsza różnicę stężeń pary wodnej, więc parowanie słabnie.'),
          QuizQuestion(id: 'q_k2_ros_34', question: 'Susza fizjologiczna może wystąpić, gdy gleba jest:', options: ['Wilgotna i ciepła', 'Zmarznięta lub silnie zasolona', 'Bogata w azot', 'Lekko kwaśna i przewiewna'], correctIndex: 1, explanation: 'Woda jest wtedy obecna, ale niedostępna dla korzeni.'),
          QuizQuestion(id: 'q_k2_ros_35', question: 'Pasemka Caspary\'ego wymuszają przejście wody przez:', options: ['Ściany komórkowe', 'Błony komórkowe endodermy', 'Przestwory międzykomórkowe', 'Kutykulę'], correctIndex: 1, explanation: 'Przerwanie drogi apoplastycznej pozwala roślinie kontrolować skład roztworu wnikającego do naczyń.'),
          QuizQuestion(id: 'q_k2_ros_36', question: 'Magnez jest niezbędny roślinie przede wszystkim jako składnik:', options: ['Ściany komórkowej', 'Chlorofilu', 'ATP', 'Białek zapasowych'], correctIndex: 1, explanation: 'Magnez stanowi centralny atom cząsteczki chlorofilu.'),
          QuizQuestion(id: 'q_k2_ros_37', question: 'Sole mineralne pobierane są przez korzeń najczęściej na drodze:', options: ['Osmozy', 'Transportu aktywnego', 'Dyfuzji prostej przez kutykulę', 'Fagocytozy'], correctIndex: 1, explanation: 'Stężenie jonów w glebie bywa niższe niż w komórce, więc potrzebny jest nakład energii.'),
        ],
      ),
      Topic(
        id: 'k2_rosliny_odzywianie',
        name: 'Odżywianie się roślin i wymiana gazowa',
        theory: '''
DROGA SUBSTRATÓW FOTOSYNTEZY DO LIŚCIA
Dwutlenek węgla wnika do liścia przez aparaty szparkowe, następnie dyfunduje przestworami międzykomórkowymi miękiszu gąbczastego, rozpuszcza się w wodzie pokrywającej ściany komórek i dociera do chloroplastów, najliczniejszych w miękiszu palisadowym. Woda pobrana przez włośniki transportowana jest drewnem korzenia, łodygi i nerwów liścia, skąd trafia do komórek miękiszu. Energia świetlna dociera przez przezroczystą skórkę i kutykulę.

TRANSPORT PRODUKTÓW FOTOSYNTEZY
Powstałe cukry transportowane są w postaci sacharozy rurkami sitowymi łyka. Transport odbywa się od źródła, czyli miejsca wytwarzania lub uwalniania asymilatów (liść, bulwa wiosną), do ujścia — miejsca zużycia lub magazynowania (korzeń, owoc, rosnący pęd). W komórkach towarzyszących sacharoza jest aktywnie ładowana do rurek sitowych, co obniża potencjał wody i powoduje napływ wody z drewna; powstałe różnice ciśnienia przesuwają roztwór ku ujściu, gdzie sacharoza jest rozładowywana. Kierunek transportu w łyku może się zmieniać zależnie od pory roku i fazy rozwoju rośliny.

PRZYSTOSOWANIA ANATOMICZNE DO WYMIANY GAZOWEJ
Aparaty szparkowe umożliwiają regulowaną wymianę gazową i występują głównie w skórce dolnej liścia. Rozbudowany system przestworów międzykomórkowych w miękiszu gąbczastym zwiększa powierzchnię kontaktu komórek z powietrzem. W organach pokrytych korkiem wymianę gazową umożliwiają przetchlinki. U roślin wodnych o liściach pływających aparaty szparkowe leżą po stronie górnej, a u roślin całkowicie zanurzonych zanikają — wymiana gazowa zachodzi wtedy całą powierzchnią ciała.

CZYNNIKI WPŁYWAJĄCE NA INTENSYWNOŚĆ FOTOSYNTEZY
Czynniki zewnętrzne to natężenie światła, stężenie dwutlenku węgla, temperatura i dostępność wody. Wraz ze wzrostem natężenia światła intensywność fotosyntezy rośnie, aż do punktu wysycenia, powyżej którego się nie zwiększa. Podobnie działa stężenie CO2. Temperatura wpływa na aktywność enzymów: powyżej optimum fotosynteza gwałtownie spada wskutek denaturacji białek. Czynniki wewnętrzne to zawartość barwników fotosyntetycznych, wiek i budowa liścia oraz stopień otwarcia aparatów szparkowych. Zgodnie z zasadą czynnika ograniczającego tempo procesu wyznacza ten czynnik, którego jest najmniej w stosunku do zapotrzebowania.

DOŚWIADCZENIE BADAJĄCE WPŁYW ŚWIATŁA NA FOTOSYNTEZĘ
Pęd moczarki kanadyjskiej umieszcza się w wodzie z dodatkiem wodorowęglanu sodu (źródło CO2) i oświetla lampą z różnych odległości, licząc pęcherzyki tlenu wydzielające się w jednostce czasu. Im bliżej źródła światła, tym więcej pęcherzyków — świadczy to o wzroście intensywności fotosyntezy. W próbie kontrolnej zestaw pozostaje w ciemności. Aby wynik był wiarygodny, wszystkie pozostałe czynniki — temperatura wody, stężenie wodorowęglanu, ten sam pęd — muszą pozostać niezmienione.

UDZIAŁ BAKTERII I GRZYBÓW W POZYSKIWANIU POKARMU
Mikoryza, czyli symbioza grzyba z korzeniem, znacznie zwiększa powierzchnię chłonną i poprawia pobieranie wody oraz soli mineralnych, zwłaszcza fosforanów. Bakterie brodawkowe żyjące w brodawkach korzeniowych roślin motylkowych wiążą azot atmosferyczny i udostępniają go roślinie, otrzymując w zamian związki organiczne. Dzięki tej symbiozie rośliny motylkowe rosną na glebach ubogich w azot i wzbogacają je, co wykorzystuje się w płodozmianie.
''',
        flashcards: [
          Flashcard(id: 'f_k2_ros_46', front: 'Jaką drogą CO2 dociera do chloroplastów?', back: 'Przez aparaty szparkowe, przestwory międzykomórkowe miękiszu gąbczastego, rozpuszcza się w wodzie na ścianach i wnika do komórek.'),
          Flashcard(id: 'f_k2_ros_47', front: 'W jakiej postaci transportowane są produkty fotosyntezy?', back: 'Głównie jako sacharoza, rurkami sitowymi łyka.'),
          Flashcard(id: 'f_k2_ros_48', front: 'Co oznaczają pojęcia „źródło" i „ujście" w transporcie floemowym?', back: 'Źródło to miejsce wytwarzania lub uwalniania asymilatów (liść), ujście — miejsce ich zużycia lub magazynowania (korzeń, owoc).'),
          Flashcard(id: 'f_k2_ros_49', front: 'Co to jest punkt wysycenia światłem?', back: 'Natężenie światła, powyżej którego intensywność fotosyntezy przestaje rosnąć.'),
          Flashcard(id: 'f_k2_ros_50', front: 'Na czym polega zasada czynnika ograniczającego?', back: 'Tempo procesu wyznacza ten czynnik, którego jest najmniej w stosunku do zapotrzebowania.'),
          Flashcard(id: 'f_k2_ros_51', front: 'Gdzie leżą aparaty szparkowe u roślin o liściach pływających?', back: 'Po stronie górnej liścia — tylko ona ma kontakt z powietrzem.'),
          Flashcard(id: 'f_k2_ros_52', front: 'Jak zbadać wpływ światła na fotosyntezę?', back: 'Liczyć pęcherzyki tlenu wydzielane przez moczarkę oświetlaną z różnych odległości, przy stałych pozostałych warunkach.'),
          Flashcard(id: 'f_k2_ros_53', front: 'Co daje roślinie mikoryza?', back: 'Zwiększa powierzchnię chłonną korzenia i poprawia pobieranie wody oraz soli mineralnych, zwłaszcza fosforanów.'),
          Flashcard(id: 'f_k2_ros_54', front: 'Dlaczego rośliny motylkowe wzbogacają glebę w azot?', back: 'Bakterie brodawkowe w ich korzeniach wiążą azot atmosferyczny i udostępniają go w formie przyswajalnej.'),
          Flashcard(id: 'f_k2_ros_55', front: 'Dlaczego powyżej optymalnej temperatury fotosynteza gwałtownie spada?', back: 'Wysoka temperatura powoduje denaturację enzymów uczestniczących w procesie.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k2_ros_38', question: 'Dwutlenek węgla wnika do liścia głównie przez:', options: ['Kutykulę', 'Aparaty szparkowe', 'Wiązki przewodzące', 'Włośniki'], correctIndex: 1, explanation: 'Regulowaną wymianę gazową umożliwiają aparaty szparkowe.'),
          QuizQuestion(id: 'q_k2_ros_39', question: 'Produkty fotosyntezy transportowane są przede wszystkim jako:', options: ['Glukoza w drewnie', 'Sacharoza w łyku', 'Skrobia w łyku', 'Celuloza w drewnie'], correctIndex: 1, explanation: 'Sacharoza jest głównym cukrem transportowym roślin i płynie łykiem.'),
          QuizQuestion(id: 'q_k2_ros_40', question: 'Powyżej punktu wysycenia światłem intensywność fotosyntezy:', options: ['Nadal rośnie liniowo', 'Przestaje rosnąć', 'Spada do zera', 'Zmienia się losowo'], correctIndex: 1, explanation: 'Ograniczeniem staje się wtedy inny czynnik, np. stężenie CO2.'),
          QuizQuestion(id: 'q_k2_ros_41', question: 'W doświadczeniu z moczarką próbą kontrolną jest zestaw:', options: ['Ustawiony najbliżej lampy', 'Pozostawiony w ciemności', 'Bez wodorowęglanu sodu i bez światła jednocześnie', 'Z podwyższoną temperaturą'], correctIndex: 1, explanation: 'Próba kontrolna różni się tylko badanym czynnikiem — obecnością światła.'),
          QuizQuestion(id: 'q_k2_ros_42', question: 'Przetchlinki umożliwiają wymianę gazową w organach pokrytych:', options: ['Skórką', 'Korkiem', 'Kutykulą', 'Łykiem'], correctIndex: 1, explanation: 'Korek jest nieprzepuszczalny, więc gazy przechodzą przez przetchlinki.'),
          QuizQuestion(id: 'q_k2_ros_43', question: 'Bakterie brodawkowe roślin motylkowych:', options: ['Rozkładają celulozę', 'Wiążą azot atmosferyczny', 'Prowadzą fotosyntezę', 'Powodują choroby korzeni'], correctIndex: 1, explanation: 'Wiążą N2 i udostępniają roślinie azot w formie przyswajalnej.'),
          QuizQuestion(id: 'q_k2_ros_44', question: 'U roślin całkowicie zanurzonych w wodzie aparaty szparkowe:', options: ['Występują tylko po stronie górnej', 'Zanikają — wymiana zachodzi całą powierzchnią', 'Są liczniejsze niż u lądowych', 'Otwierają się tylko nocą'], correctIndex: 1, explanation: 'Bez kontaktu z powietrzem szparki tracą znaczenie.'),
          QuizQuestion(id: 'q_k2_ros_45', question: 'Załadunek sacharozy do rurek sitowych powoduje:', options: ['Wzrost potencjału wody i odpływ wody', 'Spadek potencjału wody i napływ wody', 'Zamknięcie aparatów szparkowych', 'Zatrzymanie transpiracji'], correctIndex: 1, explanation: 'Napływ wody podnosi ciśnienie i przesuwa roztwór ku ujściu.'),
        ],
      ),
      Topic(
        id: 'k2_rosliny_rozmnazanie',
        name: 'Rozmnażanie i rozprzestrzenianie się roślin',
        theory: '''
PRZEMIANA POKOLEŃ
W cyklu życiowym roślin występują na przemian dwa pokolenia. Gametofit jest haploidalny (n) i wytwarza gamety na drodze mitozy. Po zapłodnieniu powstaje diploidalna (2n) zygota, z której rozwija się sporofit. Sporofit wytwarza zarodniki na drodze mejozy, a z zarodnika (n) wyrasta nowy gametofit. U mchów pokoleniem dominującym jest gametofit, natomiast u paprotników i roślin nasiennych — sporofit. W miarę ewolucji roślin lądowych gametofit ulegał redukcji: u roślin nasiennych jest mikroskopijny i całkowicie zależny od sporofitu.

ROZMNAŻANIE BEZPŁCIOWE (WEGETATYWNE)
Nowa roślina powstaje z fragmentu organizmu macierzystego dzięki zdolności komórek roślinnych do różnicowania się. Naturalne sposoby to rozłogi (truskawka), kłącza (perz), bulwy (ziemniak), cebule (tulipan) oraz rozmnóżki. Człowiek wykorzystuje sadzonkowanie, odkłady i szczepienie. Zaletą jest szybkość oraz zachowanie cech odmiany — potomstwo jest genetycznie identyczne z rośliną macierzystą. Wadą jest brak zmienności genetycznej, przez co cała populacja jest jednakowo wrażliwa na choroby i zmiany warunków.

BUDOWA KWIATU
Kwiat wyrasta na osadce kwiatowej i składa się z okwiatu oraz organów rozrodczych. Okwiat tworzą kielich z działek i korona z płatków. Pręcik, czyli męski organ rozrodczy, zbudowany jest z nitki i główki zawierającej pylniki, w których powstają ziarna pyłku. Słupek, organ żeński, składa się ze znamienia (odbiera pyłek), szyjki i zalążni, w której znajdują się zalążki.

ZAPYLANIE
Kwiaty wiatropylne wytwarzają ogromne ilości drobnego, lekkiego i suchego pyłku, mają niepozorny lub zredukowany okwiat, zwykle nie wytwarzają nektaru ani zapachu, a ich znamiona są duże i pierzaste, co ułatwia wychwytywanie pyłku z powietrza — tak kwitną trawy, leszczyna i brzoza. Kwiaty owadopylne mają barwną, okazałą koronę, wydzielają nektar i zapach, a ich pyłek jest cięższy, często kleisty lub kolczasty, dzięki czemu przylega do ciała owada. Zapylenie krzyżowe, czyli przeniesienie pyłku na słupek innego osobnika, zwiększa zmienność genetyczną potomstwa.

ZAPŁODNIENIE I POWSTAWANIE NASION
U okrytonasiennych zachodzi podwójne zapłodnienie. Z ziarna pyłku wyrasta łagiewka pyłkowa, którą do zalążka wędrują dwie komórki plemnikowe. Jedna łączy się z komórką jajową, dając diploidalną zygotę, z której rozwija się zarodek. Druga łączy się z dwoma jądrami komórki centralnej, dając triploidalne (3n) bielmo — tkankę odżywczą dla zarodka. Z zalążka powstaje nasienie, a ze ściany zalążni — owoc.

ROZPRZESTRZENIANIE NASION I OWOCÓW
Budowa owocu odpowiada sposobowi rozsiewania. Owoce rozsiewane przez wiatr są lekkie i mają skrzydlaki (klon, jesion) albo aparat lotny z puchem (dmuchawiec). Owoce rozsiewane przez zwierzęta bywają mięsiste i jadalne — nasiona przechodzą przez przewód pokarmowy nieuszkodzone — albo zaopatrzone w haczyki czepiające się sierści (łopian, rzep). Owoce rozsiewane przez wodę mają tkanki powietrzne zapewniające pływalność (kokos). Niektóre rośliny rozsiewają nasiona samodzielnie, gwałtownie pękającymi owocami (niecierpek, groch).
''',
        flashcards: [
          Flashcard(id: 'f_k2_ros_56', front: 'Czym różni się gametofit od sporofitu?', back: 'Gametofit jest haploidalny (n) i wytwarza gamety przez mitozę; sporofit jest diploidalny (2n) i wytwarza zarodniki przez mejozę.'),
          Flashcard(id: 'f_k2_ros_57', front: 'Jak zmieniał się gametofit w ewolucji roślin lądowych?', back: 'Ulegał redukcji — u roślin nasiennych jest mikroskopijny i zależny od sporofitu.'),
          Flashcard(id: 'f_k2_ros_58', front: 'Wymień zaletę i wadę rozmnażania wegetatywnego.', back: 'Zaleta: szybkie, zachowuje cechy odmiany. Wada: brak zmienności genetycznej — cała populacja jednakowo wrażliwa na choroby.'),
          Flashcard(id: 'f_k2_ros_59', front: 'Z czego zbudowany jest pręcik?', back: 'Z nitki i główki zawierającej pylniki, w których powstają ziarna pyłku.'),
          Flashcard(id: 'f_k2_ros_60', front: 'Z czego zbudowany jest słupek?', back: 'Ze znamienia, szyjki i zalążni zawierającej zalążki.'),
          Flashcard(id: 'f_k2_ros_61', front: 'Wymień cechy kwiatu wiatropylnego.', back: 'Drobny, lekki i suchy pyłek w dużych ilościach, niepozorny okwiat, brak nektaru i zapachu, duże pierzaste znamiona.'),
          Flashcard(id: 'f_k2_ros_62', front: 'Na czym polega podwójne zapłodnienie?', back: 'Jedna komórka plemnikowa łączy się z komórką jajową (zygota 2n), druga z jądrami komórki centralnej, dając bielmo 3n.'),
          Flashcard(id: 'f_k2_ros_63', front: 'Jaka jest ploidalność bielma i jaką pełni funkcję?', back: 'Jest triploidalne (3n) i stanowi tkankę odżywczą dla zarodka.'),
          Flashcard(id: 'f_k2_ros_64', front: 'Z czego powstaje owoc, a z czego nasienie?', back: 'Owoc ze ściany zalążni, nasienie z zalążka.'),
          Flashcard(id: 'f_k2_ros_65', front: 'Jak zbudowane są owoce rozsiewane przez wiatr?', back: 'Są lekkie, mają skrzydlaki (klon) lub aparat lotny z puchem (dmuchawiec).'),
          Flashcard(id: 'f_k2_ros_66', front: 'Dlaczego zapylenie krzyżowe jest korzystne?', back: 'Zwiększa zmienność genetyczną potomstwa.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k2_ros_46', question: 'Sporofit wytwarza zarodniki na drodze:', options: ['Mitozy', 'Mejozy', 'Podziału amitotycznego', 'Pączkowania'], correctIndex: 1, explanation: 'Diploidalny sporofit wytwarza haploidalne zarodniki w wyniku mejozy.'),
          QuizQuestion(id: 'q_k2_ros_47', question: 'Ziarna pyłku powstają w:', options: ['Zalążni', 'Pylnikach', 'Znamieniu', 'Zalążku'], correctIndex: 1, explanation: 'Pylniki znajdują się w główce pręcika.'),
          QuizQuestion(id: 'q_k2_ros_48', question: 'Bielmo u okrytonasiennych jest:', options: ['Haploidalne (n)', 'Diploidalne (2n)', 'Triploidalne (3n)', 'Bezjądrowe'], correctIndex: 2, explanation: 'Powstaje z połączenia komórki plemnikowej z dwoma jądrami komórki centralnej.'),
          QuizQuestion(id: 'q_k2_ros_49', question: 'Duże, pierzaste znamię słupka jest przystosowaniem do zapylania:', options: ['Owadopylnego', 'Wiatropylnego', 'Wodnego', 'Samopylnego'], correctIndex: 1, explanation: 'Rozbudowane znamię skuteczniej wychwytuje pyłek niesiony przez wiatr.'),
          QuizQuestion(id: 'q_k2_ros_50', question: 'Rozmnażanie wegetatywne daje potomstwo:', options: ['Genetycznie zróżnicowane', 'Genetycznie identyczne z rośliną macierzystą', 'Zawsze haploidalne', 'Odporne na wszystkie choroby'], correctIndex: 1, explanation: 'Brak zmienności to jednocześnie największa wada tego sposobu rozmnażania.'),
          QuizQuestion(id: 'q_k2_ros_51', question: 'Owoce z haczykami, np. łopianu, rozsiewane są przez:', options: ['Wiatr', 'Wodę', 'Zwierzęta — czepiają się sierści', 'Samodzielne pękanie'], correctIndex: 2, explanation: 'Haczyki przyczepiają owoc do sierści przechodzących zwierząt.'),
          QuizQuestion(id: 'q_k2_ros_52', question: 'U mchów pokoleniem dominującym jest gametofit, a u paproci:', options: ['Również gametofit', 'Sporofit', 'Oba w równym stopniu', 'Nie występuje przemiana pokoleń'], correctIndex: 1, explanation: 'U paprotników i roślin nasiennych dominuje sporofit.'),
          QuizQuestion(id: 'q_k2_ros_53', question: 'Łagiewka pyłkowa służy do:', options: ['Wychwytywania pyłku', 'Doprowadzenia komórek plemnikowych do zalążka', 'Odżywiania zarodka', 'Rozsiewania nasion'], correctIndex: 1, explanation: 'Wyrasta z ziarna pyłku i transportuje komórki plemnikowe.'),
        ],
      ),
      Topic(
        id: 'k2_rosliny_wzrost',
        name: 'Wzrost, rozwój i reakcje na bodźce',
        theory: '''
BUDOWA NASIENIA BIELMOWEGO
Nasienie bielmowe zbudowane jest z łupiny nasiennej, zarodka oraz bielma. Zarodek składa się z korzenia zarodkowego, łodyżki, liścieni oraz pączka zarodkowego. Bielmo stanowi tkankę odżywczą zużywaną podczas kiełkowania — występuje między innymi u zbóż i rącznika. W nasionach bezbielmowych, na przykład u fasoli i grochu, materiał zapasowy zgromadzony jest w mięsistych liścieniach, a bielmo zanika w trakcie rozwoju nasienia.

KIEŁKOWANIE I JEGO WARUNKI
Do kiełkowania niezbędne są woda, tlen i odpowiednia temperatura. Woda powoduje pęcznienie nasienia, uruchamia enzymy i umożliwia rozkład materiałów zapasowych; tlen jest potrzebny do oddychania komórkowego dostarczającego energii; temperatura wpływa na tempo reakcji enzymatycznych i jest charakterystyczna dla gatunku. Światło nie jest warunkiem powszechnym — nasiona niektórych gatunków wymagają go do kiełkowania, innym przeszkadza. Wiele nasion przechodzi okres spoczynku, który zapobiega kiełkowaniu w nieodpowiedniej porze roku; przerywa go między innymi chłód, czyli stratyfikacja.

ROLA LIŚCIENI
Liścienie to pierwsze liście zarodka. W nasionach bezbielmowych magazynują substancje zapasowe i zaopatrują siewkę, dopóki nie rozwinie ona liści właściwych. Po wydostaniu się nad powierzchnię gleby liścienie wielu gatunków zielenieją i przejściowo prowadzą fotosyntezę. Liczba liścieni jest cechą systematyczną: rośliny jednoliścienne mają jeden, a dwuliścienne dwa.

HORMONY ROŚLINNE
Auksyny powstają głównie w stożkach wzrostu pędu i pobudzają wzrost komórek przez ich wydłużanie. Odpowiadają za dominację wierzchołkową — pąk szczytowy hamuje rozwój pąków bocznych, dlatego po jego usunięciu (przycięciu) roślina zaczyna się krzewić. Etylen jest hormonem gazowym: przyspiesza dojrzewanie owoców, starzenie się tkanek oraz opadanie liści i owoców. Ponieważ dojrzewający owoc wydziela etylen, umieszczenie dojrzałego jabłka wśród niedojrzałych owoców przyspiesza ich dojrzewanie.

TROPIZMY
Tropizmy to kierunkowe reakcje wzrostowe, w których kierunek wygięcia zależy od kierunku działania bodźca. Fototropizm to reakcja na światło — pęd wykazuje fototropizm dodatni, rosnąc w stronę światła. Geotropizm (grawitropizm) to reakcja na siłę ciężkości: korzeń rośnie zgodnie z jej kierunkiem (geotropizm dodatni), a pęd przeciwnie (ujemny). Występują też hydrotropizm (reakcja na wodę), chemotropizm oraz tigmotropizm — reakcja na dotyk, dzięki której wąsy czepne oplatają podporę.

ROLA AUKSYN W RUCHACH WZROSTOWYCH
Podstawą tropizmów jest nierównomierne rozmieszczenie auksyn. Przy jednostronnym oświetleniu auksyny gromadzą się po stronie zacienionej, gdzie komórki wydłużają się silniej, co powoduje wygięcie pędu w stronę światła. W geotropizmie auksyny gromadzą się po dolnej stronie organu; w pędzie pobudza to wzrost dolnej strony i wygięcie ku górze, natomiast w korzeniu ich wysokie stężenie działa hamująco, więc dolna strona rośnie wolniej i korzeń wygina się w dół.

NASTIE
Nastie to ruchy niezależne od kierunku działania bodźca — reakcja jest zawsze taka sama, niezależnie od tego, z której strony bodziec działa. Nyktynastie to ruchy związane ze zmianą pory dnia, na przykład zamykanie się koszyczków mniszka i kwiatów tulipana. Sejsmonastie to reakcja na wstrząs lub dotyk — najbardziej znanym przykładem jest mimoza wstydliwa, która składa listki po dotknięciu. Termonastie zachodzą pod wpływem zmian temperatury.

DOŚWIADCZENIE BADAJĄCE GEOTROPIZM
Skiełkowane nasiona umieszcza się na wilgotnej ligninie w kilku pozycjach — korzeniem w dół, w górę i poziomo — a następnie przetrzymuje w ciemności, aby wykluczyć wpływ światła. Po kilku dniach we wszystkich zestawach korzenie wyginają się w dół, a pędy w górę, co dowodzi, że o kierunku wzrostu decyduje siła ciężkości, a nie początkowe ułożenie nasienia.
''',
        flashcards: [
          Flashcard(id: 'f_k2_ros_67', front: 'Z czego zbudowane jest nasienie bielmowe?', back: 'Z łupiny nasiennej, zarodka i bielma stanowiącego tkankę odżywczą.'),
          Flashcard(id: 'f_k2_ros_68', front: 'Gdzie zgromadzony jest materiał zapasowy w nasionach bezbielmowych?', back: 'W mięsistych liścieniach, np. u fasoli i grochu.'),
          Flashcard(id: 'f_k2_ros_69', front: 'Jakie warunki są niezbędne do kiełkowania?', back: 'Woda, tlen i odpowiednia temperatura; światło nie jest warunkiem powszechnym.'),
          Flashcard(id: 'f_k2_ros_70', front: 'Po co nasionom okres spoczynku?', back: 'Zapobiega kiełkowaniu w nieodpowiedniej porze roku; przerywa go m.in. chłód (stratyfikacja).'),
          Flashcard(id: 'f_k2_ros_71', front: 'Na czym polega dominacja wierzchołkowa?', back: 'Auksyny z pąka szczytowego hamują rozwój pąków bocznych; po przycięciu wierzchołka roślina się krzewi.'),
          Flashcard(id: 'f_k2_ros_72', front: 'Za co odpowiada etylen?', back: 'Za dojrzewanie owoców, starzenie się tkanek oraz opadanie liści i owoców.'),
          Flashcard(id: 'f_k2_ros_73', front: 'Czym różnią się tropizmy od nastii?', back: 'W tropizmach kierunek reakcji zależy od kierunku bodźca, w nastiach — nie.'),
          Flashcard(id: 'f_k2_ros_74', front: 'Dlaczego pęd wygina się ku światłu?', back: 'Auksyny gromadzą się po stronie zacienionej, gdzie komórki wydłużają się silniej.'),
          Flashcard(id: 'f_k2_ros_75', front: 'Dlaczego auksyny działają odwrotnie w korzeniu niż w pędzie?', back: 'W korzeniu ich wysokie stężenie hamuje wzrost, więc dolna strona rośnie wolniej i korzeń wygina się w dół.'),
          Flashcard(id: 'f_k2_ros_76', front: 'Podaj przykład sejsmonastii.', back: 'Składanie listków mimozy wstydliwej po dotknięciu.'),
          Flashcard(id: 'f_k2_ros_77', front: 'Dlaczego doświadczenie z geotropizmem prowadzi się w ciemności?', back: 'Aby wykluczyć wpływ światła i mieć pewność, że reakcja dotyczy siły ciężkości.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k2_ros_54', question: 'Bielmo w nasieniu pełni funkcję:', options: ['Ochronną', 'Odżywczą dla zarodka', 'Przewodzącą', 'Wzmacniającą'], correctIndex: 1, explanation: 'To tkanka zapasowa zużywana podczas kiełkowania.'),
          QuizQuestion(id: 'q_k2_ros_55', question: 'Który czynnik NIE jest powszechnie wymagany do kiełkowania nasion?', options: ['Woda', 'Tlen', 'Światło', 'Odpowiednia temperatura'], correctIndex: 2, explanation: 'Część gatunków wymaga światła, innym ono przeszkadza — nie jest to warunek powszechny.'),
          QuizQuestion(id: 'q_k2_ros_56', question: 'Usunięcie pąka szczytowego powoduje krzewienie się rośliny, ponieważ:', options: ['Zwiększa się dopływ wody', 'Ustaje hamujące działanie auksyn na pąki boczne', 'Wzrasta stężenie etylenu w korzeniu', 'Zamykają się aparaty szparkowe'], correctIndex: 1, explanation: 'To zniesienie dominacji wierzchołkowej.'),
          QuizQuestion(id: 'q_k2_ros_57', question: 'Korzeń wykazuje geotropizm:', options: ['Dodatni', 'Ujemny', 'Nie reaguje na grawitację', 'Zmienny zależnie od pory dnia'], correctIndex: 0, explanation: 'Korzeń rośnie zgodnie z kierunkiem działania siły ciężkości.'),
          QuizQuestion(id: 'q_k2_ros_58', question: 'Składanie listków mimozy po dotknięciu to przykład:', options: ['Tropizmu', 'Nastii', 'Taksji', 'Dominacji wierzchołkowej'], correctIndex: 1, explanation: 'Kierunek reakcji nie zależy od kierunku bodźca, więc jest to nastia (sejsmonastia).'),
          QuizQuestion(id: 'q_k2_ros_59', question: 'Dojrzałe jabłko przyspiesza dojrzewanie innych owoców, ponieważ wydziela:', options: ['Auksyny', 'Etylen', 'Cytokininy', 'Kwas abscysynowy'], correctIndex: 1, explanation: 'Etylen jest gazowym hormonem przyspieszającym dojrzewanie.'),
          QuizQuestion(id: 'q_k2_ros_60', question: 'Oplatanie podpory przez wąsy czepne to:', options: ['Fototropizm', 'Tigmotropizm', 'Nyktynastia', 'Hydrotropizm'], correctIndex: 1, explanation: 'To kierunkowa reakcja wzrostowa na bodziec dotykowy.'),
          QuizQuestion(id: 'q_k2_ros_61', question: 'Liczba liścieni w nasieniu jest cechą:', options: ['Przypadkową', 'Systematyczną — odróżnia jedno- od dwuliściennych', 'Zależną od warunków kiełkowania', 'Zmienną w ciągu życia rośliny'], correctIndex: 1, explanation: 'Jednoliścienne mają jeden liścień, dwuliścienne — dwa.'),
        ],
      ),
    ],
  ),

  // ===========================================================================
  // X. RÓŻNORODNOŚĆ ZWIERZĄT
  // ===========================================================================
  Chapter(
    id: 'k2_zwierzeta',
    name: 'Różnorodność zwierząt',
    topics: [
      Topic(
        id: 'k2_zwierzeta_podzialy',
        name: 'Plan budowy i podstawowe podziały zwierząt',
        theory: '''
LISTKI ZARODKOWE
Zwierzęta dwuwarstwowe wykształcają w rozwoju zarodkowym dwa listki: ektodermę i endodermę — należą do nich parzydełkowce. Zwierzęta trójwarstwowe mają dodatkowo mezodermę, z której powstają mięśnie, szkielet wewnętrzny, układ krwionośny i wydalniczy. Obecność mezodermy umożliwiła powstanie złożonych narządów i większych rozmiarów ciała, dlatego wszystkie pozostałe grupy zwierząt są trójwarstwowe.

SYMETRIA CIAŁA A TRYB ŻYCIA
Symetria promienista, w której przez ciało można poprowadzić wiele płaszczyzn symetrii, jest typowa dla zwierząt osiadłych lub biernie unoszonych przez wodę, takich jak parzydełkowce. Pozwala ona odbierać bodźce i zdobywać pokarm równie skutecznie ze wszystkich stron. Symetria dwuboczna, w której istnieje tylko jedna płaszczyzna symetrii, jest przystosowaniem do aktywnego, ukierunkowanego ruchu. Towarzyszy jej cefalizacja — skupienie narządów zmysłów i zwojów nerwowych w przedniej części ciała, która pierwsza styka się z nowym otoczeniem. Szkarłupnie mają wtórną symetrię promienistą: ich larwy są dwubocznie symetryczne, co świadczy o pochodzeniu od przodków o takiej symetrii.

JAMA CIAŁA
Bezjamowce nie mają jamy ciała — przestrzeń między narządami wypełnia tkanka (płazińce). Pierwotnojamowce mają jamę nieotoczoną w pełni nabłonkiem pochodzenia mezodermalnego (nicienie). Wtórnojamowce mają celomę, czyli jamę wysłaną nabłonkiem mezodermalnym; pełni ona funkcję szkieletu hydraulicznego, umożliwia transport substancji i swobodne rozmieszczenie narządów.

OWODNIOWCE I BEZOWODNIOWCE
Owodniowce — gady, ptaki i ssaki — wykształcają w rozwoju zarodkowym błony płodowe, w tym owodnię wypełnioną płynem owodniowym. Chroni ona zarodek przed wysychaniem i wstrząsami, dzięki czemu rozwój może przebiegać na lądzie. Bezowodniowce, czyli ryby i płazy, nie mają tych błon, a ich rozwój zarodkowy zachodzi w wodzie.

ROZRÓŻNIENIA WŚRÓD SSAKÓW
Ssaki łożyskowe wykształcają łożysko, przez które zarodek długo odżywia się kosztem organizmu matki, i rodzą potomstwo w pełni ukształtowane. Do ssaków bezłożyskowych należą stekowce, które składają jaja, oraz torbacze, u których ciąża jest bardzo krótka, a dalszy rozwój młodego odbywa się w torbie lęgowej.

WYMIANA GAZOWA I TERMOREGULACJA
Zwierzęta skrzelodyszne pobierają tlen rozpuszczony w wodzie za pomocą skrzeli, a płucodyszne — tlen atmosferyczny za pomocą płuc. Zwierzęta zmiennocieplne (ektotermiczne) mają temperaturę ciała zależną od temperatury otoczenia i czerpią ciepło ze środowiska; ich aktywność zmienia się wraz z pogodą, ale zapotrzebowanie energetyczne jest niskie. Zwierzęta stałocieplne (endotermiczne) utrzymują stałą temperaturę ciała dzięki ciepłu z przemian metabolicznych, co pozwala im zachować aktywność niezależnie od warunków, ale wymaga znacznie większej ilości pokarmu.
''',
        flashcards: [
          Flashcard(id: 'f_k2_zw_1', front: 'Które zwierzęta są dwuwarstwowe?', back: 'Parzydełkowce — mają tylko ektodermę i endodermę.'),
          Flashcard(id: 'f_k2_zw_2', front: 'Co powstaje z mezodermy?', back: 'Mięśnie, szkielet wewnętrzny, układ krwionośny i wydalniczy.'),
          Flashcard(id: 'f_k2_zw_3', front: 'Z jakim trybem życia wiąże się symetria promienista?', back: 'Z osiadłym lub biernie unoszonym — pozwala odbierać bodźce ze wszystkich stron.'),
          Flashcard(id: 'f_k2_zw_4', front: 'Czym jest cefalizacja i czemu towarzyszy?', back: 'Skupieniem narządów zmysłów i zwojów nerwowych w przedniej części ciała; towarzyszy symetrii dwubocznej i aktywnemu ruchowi.'),
          Flashcard(id: 'f_k2_zw_5', front: 'Dlaczego mówimy, że szkarłupnie mają wtórną symetrię promienistą?', back: 'Ich larwy są dwubocznie symetryczne, więc pochodzą od przodków o symetrii dwubocznej.'),
          Flashcard(id: 'f_k2_zw_6', front: 'Czym jest celoma i jakie pełni funkcje?', back: 'Wtórną jamą ciała wysłaną nabłonkiem mezodermalnym; działa jak szkielet hydrauliczny i umożliwia transport substancji.'),
          Flashcard(id: 'f_k2_zw_7', front: 'Które zwierzęta są owodniowcami i co to umożliwia?', back: 'Gady, ptaki i ssaki — błony płodowe chronią zarodek przed wysychaniem, umożliwiając rozwój na lądzie.'),
          Flashcard(id: 'f_k2_zw_8', front: 'Czym różnią się stekowce od torbaczy?', back: 'Stekowce składają jaja, torbacze rodzą bardzo słabo rozwinięte młode, które dojrzewają w torbie lęgowej.'),
          Flashcard(id: 'f_k2_zw_9', front: 'Jaka jest wada i zaleta stałocieplności?', back: 'Zaleta: aktywność niezależna od temperatury otoczenia. Wada: dużo większe zapotrzebowanie na pokarm.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k2_zw_1', question: 'Zwierzętami dwuwarstwowymi są:', options: ['Płazińce', 'Parzydełkowce', 'Nicienie', 'Pierścienice'], correctIndex: 1, explanation: 'Parzydełkowce mają tylko ektodermę i endodermę.'),
          QuizQuestion(id: 'q_k2_zw_2', question: 'Symetria dwuboczna jest przystosowaniem do:', options: ['Osiadłego trybu życia', 'Aktywnego, ukierunkowanego ruchu', 'Filtrowania wody', 'Życia pasożytniczego wyłącznie'], correctIndex: 1, explanation: 'Towarzyszy jej cefalizacja — skupienie zmysłów z przodu ciała.'),
          QuizQuestion(id: 'q_k2_zw_3', question: 'Larwa szkarłupni jest symetryczna:', options: ['Promieniście', 'Dwubocznie', 'Asymetryczna', 'Nie ma określonej symetrii'], correctIndex: 1, explanation: 'Dlatego symetrię promienistą dorosłych uznajemy za wtórną.'),
          QuizQuestion(id: 'q_k2_zw_4', question: 'Owodnia pełni funkcję:', options: ['Wymiany gazowej z otoczeniem', 'Ochrony zarodka przed wysychaniem i wstrząsami', 'Odżywiania zarodka w wodzie', 'Wydalania u dorosłego osobnika'], correctIndex: 1, explanation: 'Płyn owodniowy chroni zarodek, umożliwiając rozwój na lądzie.'),
          QuizQuestion(id: 'q_k2_zw_5', question: 'Do bezowodniowców należą:', options: ['Gady i ptaki', 'Ryby i płazy', 'Ssaki łożyskowe', 'Torbacze'], correctIndex: 1, explanation: 'Ich rozwój zarodkowy zachodzi w wodzie i nie wymaga błon płodowych.'),
          QuizQuestion(id: 'q_k2_zw_6', question: 'Zwierzę zmiennocieplne charakteryzuje się:', options: ['Stałą temperaturą ciała i wysokim zapotrzebowaniem na pokarm', 'Temperaturą zależną od otoczenia i niskim zapotrzebowaniem energetycznym', 'Brakiem wymiany gazowej', 'Obecnością błon płodowych'], correctIndex: 1, explanation: 'Ektotermy czerpią ciepło ze środowiska, więc zużywają mniej energii.'),
          QuizQuestion(id: 'q_k2_zw_7', question: 'Celoma to jama ciała:', options: ['Nieobecna u pierścienic', 'Wysłana nabłonkiem pochodzenia mezodermalnego', 'Występująca u płazińców', 'Wypełniona powietrzem'], correctIndex: 1, explanation: 'Wtórna jama ciała wysłana nabłonkiem mezodermalnym występuje m.in. u pierścienic.'),
          QuizQuestion(id: 'q_k2_zw_8', question: 'Ssakiem bezłożyskowym jest:', options: ['Nietoperz', 'Kangur', 'Wieloryb', 'Kret'], correctIndex: 1, explanation: 'Kangur to torbacz — młode rozwija się w torbie lęgowej.'),
        ],
      ),
      Topic(
        id: 'k2_zwierzeta_bezkregowce',
        name: 'Przegląd bezkręgowców',
        theory: '''
PARZYDEŁKOWCE
Są dwuwarstwowe i promieniście symetryczne. Mają jamę chłonąco-trawiącą z jednym otworem pełniącym funkcję gębową i odbytową. Cechą wyróżniającą są komórki parzydełkowe (knidocyty) zawierające parzydełka, które służą do obezwładniania zdobyczy i obrony. Występują w dwóch postaciach: osiadłego polipa i swobodnie pływającej meduzy. Układ nerwowy ma postać rozproszonej sieci. Koralowce budują rafy koralowe — jedne z najbogatszych ekosystemów Ziemi.

PŁAZIŃCE
Trójwarstwowe, spłaszczone grzbieto-brzusznie i bezjamowe. Spłaszczenie ułatwia wymianę gazową całą powierzchnią ciała, ponieważ żaden fragment ciała nie leży daleko od jego powierzchni. Układ pokarmowy jest ślepo zakończony lub, u pasożytów, całkowicie zredukowany — tasiemiec wchłania strawiony pokarm gospodarza całą powierzchnią ciała. Układ wydalniczy to protonefrydia. Wiele gatunków to pasożyty o złożonych cyklach rozwojowych z żywicielami pośrednimi, na przykład tasiemiec uzbrojony i motylica wątrobowa.

NICIENIE
Mają obłe, niesegmentowane ciało pokryte oskórkiem i pierwotną jamę ciała. Jako pierwsze wykształciły przewód pokarmowy z dwoma otworami — gębowym i odbytowym — co umożliwia jednokierunkowy przepływ pokarmu i jego stopniowe trawienie. Są zwykle rozdzielnopłciowe, a samice bywają większe od samców. Do pasożytów człowieka należą glista ludzka, owsik i włosień kręty.

PIERŚCIENICE
Charakteryzują się metamerią, czyli podziałem ciała na powtarzalne segmenty, oraz wtórną jamą ciała. Mają zamknięty układ krwionośny i układ nerwowy w postaci łańcuszka brzusznego. Poruszają się dzięki współdziałaniu mięśni okrężnych i podłużnych ze szkieletem hydraulicznym oraz szczecinek. Dżdżownice spulchniają i użyźniają glebę, mieszając materię organiczną z mineralną.

MIĘCZAKI
Mają miękkie ciało zbudowane z nogi, worka trzewiowego i płaszcza, który wydziela wapienną muszlę. Charakterystycznym narządem wielu mięczaków jest tarka służąca do zeskrobywania pokarmu. Ślimaki mają zwykle skrętną muszlę i poruszają się na mięsistej nodze. Małże są filtratorami — przez skrzela przepuszczają wodę, odcedzając cząstki pokarmu; mają dwuklapową muszlę i zredukowaną głowę. Głowonogi, takie jak ośmiornice i kałamarnice, są aktywnymi drapieżnikami o zamkniętym układzie krwionośnym, dobrze rozwiniętym mózgu i oczach o zdolności rozdzielczej porównywalnej z kręgowcami.

STAWONOGI
To najliczniejsza gromada zwierząt. Mają segmentowane ciało, szkielet zewnętrzny z oskórka wysyconego chityną oraz odnóża zbudowane z członów połączonych stawami. Sztywny szkielet zewnętrzny nie rośnie wraz ze zwierzęciem, dlatego stawonogi linieją. Skorupiaki mają dwie pary czułków i oddychają skrzelami. Pajęczaki mają cztery pary odnóży krocznych, nie mają czułków, a oddychają płucotchawkami lub tchawkami. Owady mają trzy pary odnóży, jedną parę czułków, najczęściej skrzydła i oddychają tchawkami doprowadzającymi powietrze bezpośrednio do tkanek.

SZKARŁUPNIE
Dorosłe osobniki mają wtórną symetrię promienistą, najczęściej pięciopromienną. Cechą wyłączną tej grupy jest układ wodny (ambulakralny) — system kanałów wypełnionych płynem, zakończonych nóżkami ambulakralnymi, które służą do poruszania się, przytwierdzania i chwytania pokarmu. Szkielet wewnętrzny zbudowany jest z płytek wapiennych. Do szkarłupni należą rozgwiazdy i jeżowce; wiele z nich ma dużą zdolność regeneracji.
''',
        flashcards: [
          Flashcard(id: 'f_k2_zw_10', front: 'Co jest cechą wyróżniającą parzydełkowce?', back: 'Komórki parzydełkowe (knidocyty) zawierające parzydełka do obezwładniania zdobyczy.'),
          Flashcard(id: 'f_k2_zw_11', front: 'Jakie dwie postacie występują u parzydełkowców?', back: 'Osiadły polip i swobodnie pływająca meduza.'),
          Flashcard(id: 'f_k2_zw_12', front: 'Dlaczego płazińce są spłaszczone grzbieto-brzusznie?', back: 'Ułatwia to wymianę gazową całą powierzchnią ciała — żadna komórka nie leży daleko od powierzchni.'),
          Flashcard(id: 'f_k2_zw_13', front: 'Jak odżywia się tasiemiec?', back: 'Ma całkowicie zredukowany układ pokarmowy — wchłania strawiony pokarm gospodarza całą powierzchnią ciała.'),
          Flashcard(id: 'f_k2_zw_14', front: 'Jakie znaczenie miało pojawienie się przewodu pokarmowego z dwoma otworami u nicieni?', back: 'Umożliwia jednokierunkowy przepływ pokarmu i jego stopniowe trawienie.'),
          Flashcard(id: 'f_k2_zw_15', front: 'Czym jest metameria i u kogo występuje?', back: 'Podziałem ciała na powtarzalne segmenty; charakteryzuje pierścienice.'),
          Flashcard(id: 'f_k2_zw_16', front: 'Jak odżywiają się małże?', back: 'Są filtratorami — odcedzają cząstki pokarmu z wody przepuszczanej przez skrzela.'),
          Flashcard(id: 'f_k2_zw_17', front: 'Czym różnią się pajęczaki od owadów?', back: 'Pajęczaki mają 4 pary odnóży krocznych i brak czułków, owady — 3 pary odnóży, 1 parę czułków i zwykle skrzydła.'),
          Flashcard(id: 'f_k2_zw_18', front: 'Dlaczego stawonogi linieją?', back: 'Sztywny szkielet zewnętrzny z chityny nie rośnie wraz ze zwierzęciem.'),
          Flashcard(id: 'f_k2_zw_19', front: 'Co jest cechą wyłączną szkarłupni?', back: 'Układ wodny (ambulakralny) z nóżkami ambulakralnymi.'),
          Flashcard(id: 'f_k2_zw_20', front: 'Czym wyróżniają się głowonogi wśród mięczaków?', back: 'Zamkniętym układem krwionośnym, dobrze rozwiniętym mózgiem i oczami o dużej zdolności rozdzielczej.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k2_zw_9', question: 'Jama chłonąco-trawiąca z jednym otworem występuje u:', options: ['Nicieni', 'Parzydełkowców', 'Pierścienic', 'Mięczaków'], correctIndex: 1, explanation: 'U parzydełkowców ten sam otwór pełni funkcję gębową i odbytową.'),
          QuizQuestion(id: 'q_k2_zw_10', question: 'Tasiemiec nie ma układu pokarmowego, ponieważ:', options: ['Nie odżywia się wcale', 'Wchłania strawiony pokarm gospodarza całą powierzchnią ciała', 'Trawi pokarm zewnątrzustrojowo', 'Odżywia się samożywnie'], correctIndex: 1, explanation: 'To przystosowanie do pasożytnictwa w jelicie żywiciela.'),
          QuizQuestion(id: 'q_k2_zw_11', question: 'Przewód pokarmowy z otworem gębowym i odbytowym pojawił się po raz pierwszy u:', options: ['Parzydełkowców', 'Płazińców', 'Nicieni', 'Szkarłupni'], correctIndex: 2, explanation: 'Nicienie jako pierwsze mają przewód pokarmowy z dwoma otworami.'),
          QuizQuestion(id: 'q_k2_zw_12', question: 'Zamknięty układ krwionośny występuje u:', options: ['Wszystkich mięczaków', 'Pierścienic i głowonogów', 'Owadów', 'Parzydełkowców'], correctIndex: 1, explanation: 'Pierścienice i głowonogi mają układ zamknięty, pozostałe mięczaki i stawonogi — otwarty.'),
          QuizQuestion(id: 'q_k2_zw_13', question: 'Skorupiaki oddychają:', options: ['Tchawkami', 'Skrzelami', 'Płucotchawkami', 'Całą powierzchnią ciała wyłącznie'], correctIndex: 1, explanation: 'Skorupiaki są zwierzętami wodnymi oddychającymi skrzelami.'),
          QuizQuestion(id: 'q_k2_zw_14', question: 'Owady mają:', options: ['4 pary odnóży krocznych i brak czułków', '3 pary odnóży i 1 parę czułków', '2 pary czułków i skrzela', 'Nóżki ambulakralne'], correctIndex: 1, explanation: 'To podstawowe cechy odróżniające owady od pozostałych stawonogów.'),
          QuizQuestion(id: 'q_k2_zw_15', question: 'Nóżki ambulakralne są elementem:', options: ['Układu nerwowego', 'Układu wodnego szkarłupni', 'Szkieletu zewnętrznego stawonogów', 'Układu wydalniczego płazińców'], correctIndex: 1, explanation: 'Układ ambulakralny to cecha wyłączna szkarłupni.'),
          QuizQuestion(id: 'q_k2_zw_16', question: 'Tarka to narząd występujący u:', options: ['Pierścienic', 'Mięczaków', 'Nicieni', 'Parzydełkowców'], correctIndex: 1, explanation: 'Tarka służy mięczakom do zeskrobywania pokarmu.'),
        ],
      ),
      Topic(
        id: 'k2_zwierzeta_kregowce',
        name: 'Przegląd kręgowców',
        theory: '''
RYBY
Ryby są zmiennocieplnymi bezowodniowcami wodnymi. Oddychają skrzelami, poruszają się dzięki płetwom, a ciało pokrywają łuski powleczone śluzem zmniejszającym opór wody. Serce jest dwudzielne — ma jeden przedsionek i jedną komorę — a krew krąży w pojedynczym obiegu. Linia boczna to narząd zmysłu odbierający drgania i ruchy wody. Pęcherz pławny u ryb kostnoszkieletowych reguluje głębokość zanurzenia. Zapłodnienie jest najczęściej zewnętrzne, a rozwój przebiega w wodzie.

PŁAZY
Płazy są zmiennocieplne i prowadzą ziemnowodny tryb życia. Ich skóra jest naga, wilgotna i silnie unaczyniona, dzięki czemu uczestniczy w wymianie gazowej obok workowatych, słabo rozwiniętych płuc. Serce jest trójdzielne — dwa przedsionki i jedna komora — a krew krąży w dwóch obiegach, jednak w komorze miesza się krew utlenowana z odtlenowaną. Zapłodnienie jest zewnętrzne i wymaga wody, a rozwój złożony: z jaja wylęga się kijanka oddychająca skrzelami, która w wyniku przeobrażenia przekształca się w postać dorosłą.

GADY
Gady jako pierwsze kręgowce w pełni uniezależniły się od wody. Ich skóra jest sucha, pozbawiona gruczołów i pokryta rogowymi łuskami lub tarczkami, co ogranicza utratę wody. Oddychają wyłącznie płucami o rozbudowanej powierzchni. Serce jest trójdzielne z niepełną przegrodą w komorze, a u krokodyli — czterodzielne. Są zmiennocieplne. Zapłodnienie jest wewnętrzne, a jaja mają osłony chroniące przed wysychaniem; jako owodniowce składają je na lądzie.

PTAKI
Ptaki są stałocieplnymi owodniowcami przystosowanymi do lotu. Ciało pokrywają pióra pełniące funkcję izolacyjną i lotną, szczęki przekształcone są w lekki dziób pozbawiony zębów, a kości są pneumatyczne, czyli wypełnione powietrzem. Z płucami połączone są worki powietrzne umożliwiające podwójne oddychanie — wymiana gazowa zachodzi zarówno przy wdechu, jak i przy wydechu, co zapewnia wysoką wydajność potrzebną podczas lotu. Serce jest czterodzielne, a obiegi krwi całkowicie rozdzielone. Ptaki składają jaja i zwykle opiekują się potomstwem.

SSAKI
Ssaki są stałocieplnymi owodniowcami. Ciało pokrywają włosy, a w skórze występują gruczoły potowe, łojowe i mleczne, których wydzieliną samice karmią młode. Serce jest czterodzielne, obiegi całkowicie rozdzielone, a przeponę wykorzystują do wentylacji płuc. Uzębienie jest zróżnicowane na siekacze, kły, przedtrzonowce i trzonowce, co odpowiada rodzajowi pokarmu. Ssaki dzielą się na stekowce składające jaja, torbacze rodzące bardzo słabo rozwinięte młode oraz łożyskowce, u których zarodek długo rozwija się w macicy, odżywiany przez łożysko.
''',
        flashcards: [
          Flashcard(id: 'f_k2_zw_21', front: 'Jak zbudowane jest serce ryby i ile obiegów krwi ma ta grupa?', back: 'Serce dwudzielne (przedsionek i komora), jeden obieg krwi.'),
          Flashcard(id: 'f_k2_zw_22', front: 'Jaką funkcję pełni linia boczna u ryb?', back: 'Odbiera drgania i ruchy wody.'),
          Flashcard(id: 'f_k2_zw_23', front: 'Dlaczego skóra płaza musi być wilgotna?', back: 'Uczestniczy w wymianie gazowej, a gazy przenikają tylko przez wilgotną powierzchnię.'),
          Flashcard(id: 'f_k2_zw_24', front: 'Dlaczego u płazów krew miesza się w sercu?', back: 'Serce jest trójdzielne — mają jedną komorę, w której łączy się krew utlenowana i odtlenowana.'),
          Flashcard(id: 'f_k2_zw_25', front: 'Jakie cechy gadów pozwoliły im uniezależnić się od wody?', back: 'Sucha skóra z rogowymi łuskami, oddychanie wyłącznie płucami, zapłodnienie wewnętrzne i jaja z osłonami.'),
          Flashcard(id: 'f_k2_zw_26', front: 'Które gady mają serce czterodzielne?', back: 'Krokodyle.'),
          Flashcard(id: 'f_k2_zw_27', front: 'Na czym polega podwójne oddychanie ptaków?', back: 'Dzięki workom powietrznym wymiana gazowa zachodzi zarówno przy wdechu, jak i przy wydechu.'),
          Flashcard(id: 'f_k2_zw_28', front: 'Wymień trzy przystosowania ptaków do lotu.', back: 'Pióra, kości pneumatyczne, lekki bezzębny dziób oraz worki powietrzne.'),
          Flashcard(id: 'f_k2_zw_29', front: 'Jaką rolę pełni przepona u ssaków?', back: 'Uczestniczy w wentylacji płuc.'),
          Flashcard(id: 'f_k2_zw_30', front: 'Wymień trzy grupy ssaków ze względu na sposób rozrodu.', back: 'Stekowce (jajorodne), torbacze (torba lęgowa) i łożyskowce (łożysko).'),
          Flashcard(id: 'f_k2_zw_31', front: 'Co oznacza zróżnicowanie uzębienia u ssaków?', back: 'Obecność siekaczy, kłów, przedtrzonowców i trzonowców, dopasowanych do rodzaju pokarmu.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k2_zw_17', question: 'Ryby mają serce:', options: ['Dwudzielne, jeden obieg krwi', 'Trójdzielne, dwa obiegi', 'Czterodzielne, dwa obiegi', 'Trójdzielne, jeden obieg'], correctIndex: 0, explanation: 'Jeden przedsionek i jedna komora obsługują pojedynczy obieg krwi.'),
          QuizQuestion(id: 'q_k2_zw_18', question: 'Wymiana gazowa przez skórę odgrywa dużą rolę u:', options: ['Gadów', 'Płazów', 'Ptaków', 'Ssaków'], correctIndex: 1, explanation: 'Naga, wilgotna i unaczyniona skóra płazów uzupełnia słabo rozwinięte płuca.'),
          QuizQuestion(id: 'q_k2_zw_19', question: 'Kijanka jest stadium rozwojowym:', options: ['Ryby', 'Płaza', 'Gada', 'Ptaka'], correctIndex: 1, explanation: 'Płazy mają rozwój złożony z przeobrażeniem.'),
          QuizQuestion(id: 'q_k2_zw_20', question: 'Sucha skóra pokryta rogowymi łuskami, bez gruczołów, jest cechą:', options: ['Płazów', 'Gadów', 'Ryb', 'Ssaków'], correctIndex: 1, explanation: 'Ogranicza to utratę wody i umożliwia życie z dala od zbiorników.'),
          QuizQuestion(id: 'q_k2_zw_21', question: 'Worki powietrzne u ptaków służą do:', options: ['Magazynowania pokarmu', 'Zwiększenia wydajności wymiany gazowej', 'Wydalania', 'Produkcji dźwięków wyłącznie'], correctIndex: 1, explanation: 'Umożliwiają podwójne oddychanie — wymianę przy wdechu i wydechu.'),
          QuizQuestion(id: 'q_k2_zw_22', question: 'Całkowicie rozdzielone obiegi krwi występują u:', options: ['Płazów i gadów', 'Ptaków i ssaków', 'Ryb', 'Wyłącznie u krokodyli'], correctIndex: 1, explanation: 'Czterodzielne serce ptaków i ssaków całkowicie oddziela krew utlenowaną od odtlenowanej.'),
          QuizQuestion(id: 'q_k2_zw_23', question: 'Gruczoły mleczne są cechą charakterystyczną:', options: ['Ptaków', 'Ssaków', 'Gadów', 'Płazów'], correctIndex: 1, explanation: 'Ich wydzieliną samice ssaków karmią młode.'),
          QuizQuestion(id: 'q_k2_zw_24', question: 'Pęcherz pławny reguluje:', options: ['Temperaturę ciała', 'Głębokość zanurzenia ryby', 'Ciśnienie krwi', 'Wymianę gazową w skrzelach'], correctIndex: 1, explanation: 'Zmiana ilości gazu w pęcherzu zmienia gęstość ciała ryby.'),
        ],
      ),
    ],
  ),

  // ===========================================================================
  // XII. WIRUSY
  // ===========================================================================
  Chapter(
    id: 'k2_wirusy',
    name: 'Wirusy',
    topics: [
      Topic(
        id: 'k2_wirusy_budowa',
        name: 'Budowa wirusów i cykle infekcyjne',
        theory: '''
WIRUSY JAKO BEZKOMÓRKOWE FORMY INFEKCYJNE
Wirusy nie mają budowy komórkowej — nie posiadają cytoplazmy, błony komórkowej ani rybosomów. Nie prowadzą własnego metabolizmu, nie odżywiają się, nie rosną i nie reagują na bodźce. Namnażają się wyłącznie wewnątrz żywej komórki, wykorzystując jej enzymy, rybosomy i substraty, dlatego określa się je jako bezwzględne pasożyty wewnątrzkomórkowe. Poza komórką gospodarza pozostają bierną cząstką. Z tego powodu wirusów nie zalicza się do organizmów żywych, choć mają materiał genetyczny i podlegają ewolucji.

BUDOWA WIRUSA
Każdy wirus zawiera materiał genetyczny — DNA albo RNA, jedno- lub dwuniciowy — otoczony białkowym płaszczem zwanym kapsydem, zbudowanym z powtarzalnych podjednostek (kapsomerów). Niektóre wirusy mają dodatkowo osłonkę lipidową pochodzącą z błony komórkowej gospodarza, w której tkwią białka wirusowe (glikoproteiny). Wirusy osłonkowe są wrażliwsze na wysychanie, detergenty i rozpuszczalniki tłuszczów, dlatego mydło skutecznie je niszczy.

RÓŻNORODNOŚĆ MORFOLOGICZNA
Wirusy przybierają różne kształty: bryłowy (dwudziestościenny, np. adenowirusy), pałeczkowaty lub spiralny (wirus mozaiki tytoniu), kulisty (wirus grypy) oraz złożony — jak bakteriofagi, które mają wielościenną główkę, ogonek i włókna ogonkowe.

ZWIĄZEK BUDOWY ZE SPOSOBEM INFEKOWANIA
Białka powierzchniowe wirusa muszą pasować do receptorów na powierzchni komórki, tak jak klucz do zamka. Decyduje to o specyficzności zakażenia: dany wirus atakuje tylko określone gatunki i określone typy komórek — na przykład HIV wnika do limfocytów T pomocniczych mających receptor CD4. Bakteriofag przytwierdza się włóknami ogonkowymi do ściany komórkowej bakterii i wstrzykuje do niej wyłącznie swój materiał genetyczny, pozostawiając kapsyd na zewnątrz. Wirusy osłonkowe wnikają do komórek zwierzęcych całe, przez zlanie się osłonki z błoną komórkową albo na drodze endocytozy.

CYKL LITYCZNY
Cykl lityczny obejmuje adsorpcję, czyli przyłączenie się wirusa do komórki, wniknięcie materiału genetycznego, przejęcie kontroli nad metabolizmem komórki, powielanie materiału genetycznego i syntezę białek wirusowych, składanie nowych cząstek, a na końcu lizę — rozpad komórki i uwolnienie potomnych wirusów. Cykl ten prowadzi do szybkiego zniszczenia komórki gospodarza.

CYKL LIZOGENICZNY
W cyklu lizogenicznym materiał genetyczny wirusa włącza się do genomu komórki gospodarza jako profag i jest powielany razem z nim przy każdym podziale komórki, nie powodując jej śmierci. Zakażenie może pozostawać utajone przez wiele pokoleń komórek. Pod wpływem czynników takich jak promieniowanie UV czy substancje chemiczne profag może się uaktywnić i przejść w cykl lityczny.

RETROWIRUSY I ODWROTNA TRANSKRYPCJA
Retrowirusy mają materiał genetyczny w postaci RNA oraz enzym — odwrotną transkryptazę. Po wniknięciu do komórki enzym ten przepisuje wirusowe RNA na DNA, czyli przeprowadza proces odwrotny do typowej transkrypcji. Powstały DNA zostaje wbudowany do genomu komórki jako prowirus i może w nim trwać przez lata. Przykładem retrowirusa jest HIV; na tej właściwości opiera się też działanie leków antyretrowirusowych blokujących odwrotną transkryptazę.
''',
        flashcards: [
          Flashcard(id: 'f_k2_wir_1', front: 'Dlaczego wirusów nie zalicza się do organizmów żywych?', back: 'Nie mają budowy komórkowej, nie prowadzą metabolizmu, nie rosną i namnażają się wyłącznie w komórce gospodarza.'),
          Flashcard(id: 'f_k2_wir_2', front: 'Z czego zbudowana jest najprostsza cząstka wirusa?', back: 'Z materiału genetycznego (DNA lub RNA) otoczonego białkowym kapsydem z kapsomerów.'),
          Flashcard(id: 'f_k2_wir_3', front: 'Skąd pochodzi osłonka lipidowa wirusa?', back: 'Z błony komórkowej gospodarza; tkwią w niej białka wirusowe.'),
          Flashcard(id: 'f_k2_wir_4', front: 'Dlaczego mydło skutecznie niszczy wirusy osłonkowe?', back: 'Rozpuszcza ich lipidową osłonkę.'),
          Flashcard(id: 'f_k2_wir_5', front: 'Co decyduje o tym, które komórki zakaża dany wirus?', back: 'Dopasowanie białek powierzchniowych wirusa do receptorów komórki.'),
          Flashcard(id: 'f_k2_wir_6', front: 'Jak infekuje bakteriofag?', back: 'Przytwierdza się włóknami ogonkowymi do ściany bakterii i wstrzykuje do niej sam materiał genetyczny, zostawiając kapsyd na zewnątrz.'),
          Flashcard(id: 'f_k2_wir_7', front: 'Wymień etapy cyklu litycznego.', back: 'Adsorpcja, wniknięcie, replikacja i synteza białek, składanie cząstek, liza komórki.'),
          Flashcard(id: 'f_k2_wir_8', front: 'Czym jest profag?', back: 'Materiałem genetycznym wirusa wbudowanym w genom bakterii i powielanym razem z nim w cyklu lizogenicznym.'),
          Flashcard(id: 'f_k2_wir_9', front: 'Na czym polega odwrotna transkrypcja?', back: 'Na przepisaniu wirusowego RNA na DNA przez odwrotną transkryptazę — odwrotnie niż w typowej transkrypcji.'),
          Flashcard(id: 'f_k2_wir_10', front: 'Do jakich komórek wnika HIV i dzięki czemu?', back: 'Do limfocytów T pomocniczych, rozpoznając receptor CD4.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k2_wir_1', question: 'Kapsyd wirusa jest zbudowany z:', options: ['Lipidów', 'Białek (kapsomerów)', 'Celulozy', 'Kwasu nukleinowego'], correctIndex: 1, explanation: 'Kapsyd to białkowy płaszcz z powtarzalnych podjednostek.'),
          QuizQuestion(id: 'q_k2_wir_2', question: 'Materiałem genetycznym wirusa może być:', options: ['Wyłącznie dwuniciowy DNA', 'Wyłącznie RNA', 'DNA albo RNA, jedno- lub dwuniciowy', 'DNA i RNA jednocześnie w każdej cząstce'], correctIndex: 2, explanation: 'Wirusy wykazują pod tym względem dużą różnorodność.'),
          QuizQuestion(id: 'q_k2_wir_3', question: 'W cyklu lizogenicznym materiał genetyczny wirusa:', options: ['Natychmiast niszczy komórkę', 'Zostaje wbudowany w genom gospodarza i jest z nim powielany', 'Pozostaje poza komórką', 'Ulega rozkładowi'], correctIndex: 1, explanation: 'Jako profag może trwać w utajeniu przez wiele pokoleń komórek.'),
          QuizQuestion(id: 'q_k2_wir_4', question: 'Liza komórki gospodarza kończy cykl:', options: ['Lizogeniczny', 'Lityczny', 'Odwrotnej transkrypcji', 'Adsorpcji'], correctIndex: 1, explanation: 'Rozpad komórki uwalnia potomne cząstki wirusa.'),
          QuizQuestion(id: 'q_k2_wir_5', question: 'Odwrotna transkryptaza katalizuje powstawanie:', options: ['RNA na matrycy DNA', 'DNA na matrycy RNA', 'Białka na matrycy RNA', 'Kapsydu'], correctIndex: 1, explanation: 'To proces odwrotny do typowej transkrypcji, charakterystyczny dla retrowirusów.'),
          QuizQuestion(id: 'q_k2_wir_6', question: 'Bakteriofag wprowadza do komórki bakterii:', options: ['Całą cząstkę wirusa', 'Wyłącznie materiał genetyczny', 'Sam kapsyd', 'Osłonkę lipidową'], correctIndex: 1, explanation: 'Kapsyd i ogonek pozostają na zewnątrz ściany komórkowej.'),
          QuizQuestion(id: 'q_k2_wir_7', question: 'Specyficzność wirusa wobec określonych komórek wynika z:', options: ['Wielkości cząstki wirusa', 'Dopasowania białek powierzchniowych do receptorów komórki', 'Rodzaju kapsydu wyłącznie', 'Temperatury otoczenia'], correctIndex: 1, explanation: 'Białka wirusa muszą pasować do receptorów komórki jak klucz do zamka.'),
          QuizQuestion(id: 'q_k2_wir_8', question: 'Wirusy namnażają się:', options: ['Przez podział komórki', 'Wyłącznie wewnątrz żywej komórki gospodarza', 'Samodzielnie w środowisku', 'Przez pączkowanie w glebie'], correctIndex: 1, explanation: 'Wirusy są bezwzględnymi pasożytami wewnątrzkomórkowymi.'),
        ],
      ),
      Topic(
        id: 'k2_wirusy_choroby',
        name: 'Choroby wirusowe, profilaktyka i znaczenie wirusów',
        theory: '''
CHOROBY PRZENOSZONE DROGĄ KROPELKOWĄ
Grypa przenosi się drogą kropelkową; wirus grypy cechuje się dużą zmiennością antygenową, dlatego odporność po przechorowaniu nie chroni przed kolejnymi odmianami, a szczepionkę trzeba przyjmować co roku. Odra, świnka i różyczka również przenoszą się drogą kropelkową i zapobiega im szczepionka skojarzona. Różyczka jest szczególnie groźna dla kobiet w ciąży — zakażenie może powodować ciężkie wady rozwojowe płodu. Ospa wietrzna przenosi się drogą kropelkową i przez kontakt z wydzieliną pęcherzyków; wirus po przechorowaniu pozostaje w organizmie w formie utajonej i może po latach uaktywnić się jako półpasiec.

CHOROBY PRZENOSZONE PRZEZ KREW I DROGĄ PŁCIOWĄ
HIV przenosi się przez kontakty płciowe, krew (wspólne igły, przetoczenia) oraz z matki na dziecko w czasie ciąży, porodu i karmienia. Wirus niszczy limfocyty T pomocnicze, co stopniowo prowadzi do załamania odporności, czyli AIDS; chory umiera na zakażenia oportunistyczne i nowotwory, którym zdrowy organizm by się przeciwstawił. Nie ma szczepionki, ale leczenie antyretrowirusowe pozwala zahamować namnażanie wirusa. Profilaktyka to prezerwatywy, sprzęt jednorazowy i testy przesiewowe.

Wirus HPV (brodawczaka ludzkiego) przenosi się przez kontakty płciowe i odpowiada za większość przypadków raka szyjki macicy; dostępna jest szczepionka, którą zaleca się przed rozpoczęciem współżycia. Wirusowe zapalenie wątroby typu B i C przenosi się przez krew i kontakty płciowe — przeciw WZW typu B istnieje szczepionka, przeciw typowi C nie, dlatego kluczowe jest unikanie kontaktu z zakażoną krwią.

CHOROBY PRZENOSZONE DROGĄ POKARMOWĄ I PRZEZ ZWIERZĘTA
Wirusowe zapalenie wątroby typu A szerzy się drogą pokarmową, przez zanieczyszczoną wodę, żywność i brudne ręce; zapobiega mu higiena oraz szczepienie. Wścieklizna przenosi się ze śliną chorego zwierzęcia, najczęściej przez ugryzienie. Nieleczona jest praktycznie zawsze śmiertelna, ale podanie szczepionki bezpośrednio po ekspozycji zapobiega rozwojowi choroby. Podstawą profilaktyki są obowiązkowe szczepienia psów oraz unikanie kontaktu z dzikimi zwierzętami zachowującymi się nietypowo.

ZASADY PROFILAKTYKI
Ponieważ antybiotyki nie działają na wirusy, podstawowe znaczenie ma zapobieganie: szczepienia ochronne, higiena rąk, unikanie kontaktu z osobami chorymi, bezpieczne kontakty płciowe, korzystanie z jednorazowego sprzętu medycznego oraz izolacja chorych w czasie epidemii. Szczepienia budują też odporność zbiorowiskową, chroniąc osoby, które z powodów zdrowotnych nie mogą być zaszczepione.

ZNACZENIE WIRUSÓW
Wirusy powodują choroby ludzi, zwierząt i roślin oraz znaczne straty w hodowli i rolnictwie. Odgrywają jednak także rolę pozytywną: regulują liczebność populacji, w tym bakterii w ekosystemach wodnych, a przenosząc geny między organizmami, uczestniczą w ewolucji. Człowiek wykorzystuje wirusy w terapii fagowej — leczeniu zakażeń bakteryjnych bakteriofagami, co zyskuje na znaczeniu wobec narastającej oporności na antybiotyki — a także jako wektory w inżynierii genetycznej i terapii genowej oraz jako podstawę produkcji niektórych szczepionek.
''',
        flashcards: [
          Flashcard(id: 'f_k2_wir_11', front: 'Dlaczego szczepionkę przeciw grypie trzeba przyjmować co roku?', back: 'Wirus grypy cechuje się dużą zmiennością antygenową — pojawiają się nowe odmiany.'),
          Flashcard(id: 'f_k2_wir_12', front: 'Dlaczego różyczka jest groźna dla kobiet w ciąży?', back: 'Zakażenie może powodować ciężkie wady rozwojowe płodu.'),
          Flashcard(id: 'f_k2_wir_13', front: 'Co łączy ospę wietrzną z półpaścem?', back: 'Ten sam wirus — po przechorowaniu pozostaje utajony i może po latach uaktywnić się jako półpasiec.'),
          Flashcard(id: 'f_k2_wir_14', front: 'Jakie komórki niszczy HIV i do czego to prowadzi?', back: 'Limfocyty T pomocnicze — prowadzi to do załamania odporności, czyli AIDS.'),
          Flashcard(id: 'f_k2_wir_15', front: 'Wymień trzy drogi zakażenia HIV.', back: 'Kontakty płciowe, krew (wspólne igły, przetoczenia) oraz z matki na dziecko.'),
          Flashcard(id: 'f_k2_wir_16', front: 'Jakiemu nowotworowi zapobiega szczepionka przeciw HPV?', back: 'Rakowi szyjki macicy.'),
          Flashcard(id: 'f_k2_wir_17', front: 'Czym różni się droga zakażenia WZW A od WZW B i C?', back: 'WZW A przenosi się drogą pokarmową, a WZW B i C przez krew i kontakty płciowe.'),
          Flashcard(id: 'f_k2_wir_18', front: 'Przeciw któremu typowi WZW nie ma szczepionki?', back: 'Przeciw WZW typu C.'),
          Flashcard(id: 'f_k2_wir_19', front: 'Jak zapobiega się wściekliźnie po ugryzieniu przez zwierzę?', back: 'Podaniem szczepionki bezpośrednio po ekspozycji — nieleczona choroba jest praktycznie zawsze śmiertelna.'),
          Flashcard(id: 'f_k2_wir_20', front: 'Dlaczego antybiotyki nie działają na wirusy?', back: 'Antybiotyki działają na struktury i procesy komórki bakteryjnej, których wirusy nie mają.'),
          Flashcard(id: 'f_k2_wir_21', front: 'Na czym polega terapia fagowa?', back: 'Na leczeniu zakażeń bakteryjnych za pomocą bakteriofagów niszczących bakterie.'),
          Flashcard(id: 'f_k2_wir_22', front: 'Czym jest odporność zbiorowiskowa?', back: 'Ochroną osób niezaszczepionych dzięki wysokiemu odsetkowi zaszczepionych w populacji.'),
        ],
        questions: [
          QuizQuestion(id: 'q_k2_wir_9', question: 'HIV atakuje przede wszystkim:', options: ['Erytrocyty', 'Limfocyty T pomocnicze', 'Komórki wątroby', 'Neurony'], correctIndex: 1, explanation: 'Niszczenie limfocytów T pomocniczych prowadzi do załamania odporności.'),
          QuizQuestion(id: 'q_k2_wir_10', question: 'Szczepionka przeciw HPV chroni przede wszystkim przed:', options: ['Wirusowym zapaleniem wątroby', 'Rakiem szyjki macicy', 'Grypą sezonową', 'Wścieklizną'], correctIndex: 1, explanation: 'HPV odpowiada za większość przypadków raka szyjki macicy.'),
          QuizQuestion(id: 'q_k2_wir_11', question: 'Drogą pokarmową przenosi się:', options: ['WZW typu A', 'WZW typu B', 'WZW typu C', 'HIV'], correctIndex: 0, explanation: 'WZW A szerzy się przez zanieczyszczoną wodę, żywność i brudne ręce.'),
          QuizQuestion(id: 'q_k2_wir_12', question: 'Wścieklizna przenosi się najczęściej przez:', options: ['Drogę kropelkową', 'Ślinę chorego zwierzęcia, przy ugryzieniu', 'Zanieczyszczoną wodę', 'Kontakty płciowe'], correctIndex: 1, explanation: 'Wirus obecny jest w ślinie zakażonego zwierzęcia.'),
          QuizQuestion(id: 'q_k2_wir_13', question: 'Antybiotyki są nieskuteczne wobec wirusów, ponieważ:', options: ['Wirusy są zbyt małe', 'Wirusy nie mają struktur komórkowych, na które działają antybiotyki', 'Wirusy żyją wyłącznie w glebie', 'Antybiotyki nie wnikają do krwi'], correctIndex: 1, explanation: 'Antybiotyki celują w ścianę komórkową, rybosomy czy metabolizm bakterii.'),
          QuizQuestion(id: 'q_k2_wir_14', question: 'Półpasiec jest wynikiem uaktywnienia wirusa:', options: ['Grypy', 'Ospy wietrznej', 'Różyczki', 'Odry'], correctIndex: 1, explanation: 'Wirus ospy wietrznej pozostaje w organizmie w formie utajonej.'),
          QuizQuestion(id: 'q_k2_wir_15', question: 'Odporność zbiorowiskowa polega na tym, że:', options: ['Każdy musi przechorować chorobę', 'Wysoki odsetek zaszczepionych chroni także osoby niezaszczepione', 'Odporność dziedziczy się po rodzicach', 'Choroba zanika samoistnie'], correctIndex: 1, explanation: 'Wysoki poziom wyszczepienia przerywa łańcuch zakażeń.'),
          QuizQuestion(id: 'q_k2_wir_16', question: 'Terapia fagowa wykorzystuje wirusy do:', options: ['Zwalczania zakażeń bakteryjnych', 'Leczenia chorób wirusowych', 'Produkcji antybiotyków', 'Diagnostyki nowotworów'], correctIndex: 0, explanation: 'Bakteriofagi niszczą bakterie, co jest cenne wobec oporności na antybiotyki.'),
        ],
      ),
    ],
  ),
];
