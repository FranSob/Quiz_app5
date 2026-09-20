# Dane i zgodność

Wersja z dnia 20 września 2026 r.

Ta strona zbiera w jednym miejscu szczegóły techniczne: gdzie leżą dane, kto ma do nich dostęp i jak spełniamy wymagania RODO oraz zasad Google Play. Ogólne zasady opisuje [Polityka prywatności](polityka-prywatnosci.md).

## Gdzie są przechowywane dane

| Co | Gdzie | Kto ma dostęp |
|---|---|---|
| Konto (e-mail, skrót hasła) | Supabase, region UE (Frankfurt) | administrator danych, Supabase jako podmiot przetwarzający |
| Postęp nauki | Supabase, region UE (Frankfurt) | wyłącznie właściciel konta |
| Status subskrypcji | Supabase, region UE (Frankfurt) | zapisuje serwer, użytkownik tylko odczytuje |
| Pseudonim i XP w lidze (dobrowolne) | Supabase, region UE (Frankfurt) | osoby z tej samej klasy |
| Dane płatności (karta) | Google Play | wyłącznie Google — nie mamy do nich dostępu |
| Postęp bez konta | pamięć telefonu | wyłącznie użytkownik |

## Podmioty przetwarzające

- **Supabase Inc.** — baza danych i logowanie, dane w UE.
- **Google Ireland Ltd.** — dystrybucja aplikacji, płatności, powiadomienia o stanie subskrypcji.
- **[DOSTAWCA_POCZTY]** — wysyłka maili z potwierdzeniem adresu i linkiem do zmiany hasła.

## Zabezpieczenia

- Połączenie z serwerem wyłącznie po TLS.
- Reguły bezpieczeństwa na poziomie wiersza w bazie (RLS): zapytanie jednego użytkownika nie jest w stanie sięgnąć po dane innego.
- Tabela subskrypcji jest dla aplikacji tylko do odczytu — status Premium ustawia serwer po weryfikacji zakupu w Google Play. Zmiana danych w telefonie nie odblokuje Premium.
- Hasła przechowywane jako skróty (hashe), po stronie Supabase.
- Klucze serwerowe nie znajdują się w kodzie aplikacji ani w repozytorium.
- Liga: kod klasy działa jak hasło wstępu. Tabeli klas nie da się odczytać w całości — dołączenie odbywa się przez funkcję w bazie, która sprawdza konkretny kod. Widać wyłącznie członków własnej klasy, a XP w rankingu liczy serwer z zapisanego postępu, więc nie da się go podać z telefonu.

## Realizacja praw użytkownika

| Prawo | Jak z niego skorzystać |
|---|---|
| Dostęp do danych i przeniesienie | Profil → Konto → Moje dane (podgląd i kopiowanie pełnego zapisu) |
| Usunięcie danych | Profil → Konto → Usuń konto (natychmiast) lub e-mail na [E-MAIL_KONTAKTOWY] |
| Sprostowanie | zmiana w profilu lub e-mail |
| Wycofanie zgody na ligę | Profil → Liga klasy → Opuść klasę (pseudonim i wynik znikają z rankingu) |
| Ograniczenie, sprzeciw, skarga | e-mail na [E-MAIL_KONTAKTOWY]; skarga do Prezesa UODO |

Adres strony do usunięcia konta, wymagany przez Google Play: [ADRES_STRONY_USUWANIA_KONTA].

## Dzieci i młodzież

- Grupa docelowa: 13 lat i więcej.
- Osoby poniżej 16 lat zakładają konto za zgodą rodzica lub opiekuna — potwierdzenie zgody jest warunkiem założenia konta.
- Brak reklam, brak narzędzi śledzących, brak profilowania, brak przekazywania danych brokerom.
- Aplikacja nie zbiera lokalizacji, kontaktów, zdjęć ani listy zainstalowanych aplikacji.

## Deklaracja „Bezpieczeństwo danych" w Google Play

Do wpisania w formularzu w Konsoli Google Play:

- Zbierane dane: **adres e-mail** (konto, wymagane do logowania) oraz **aktywność w aplikacji** (postęp nauki).
- Cel: **funkcjonalność aplikacji** i **zarządzanie kontem**.
- Dane są szyfrowane w trakcie przesyłania: **tak**.
- Użytkownik może poprosić o usunięcie danych: **tak**, z poziomu aplikacji.
- Dane są udostępniane innym firmom: **nie**.
- Dane wykorzystywane do reklam lub śledzenia: **nie**.

## Zgłaszanie incydentów

Jeśli zauważysz lukę bezpieczeństwa albo wyciek danych, napisz na [E-MAIL_KONTAKTOWY]. Naruszenie ochrony danych zgłaszamy Prezesowi UODO w ciągu 72 godzin od stwierdzenia, a osobom, których dotyczy — jeśli wiąże się z wysokim ryzykiem.

## Co jeszcze warto wiedzieć

- Treści edukacyjne są przygotowane na potrzeby aplikacji i nie pochodzą z arkuszy CKE.
- Wskaźnik gotowości to szacunek opanowania materiału, a nie prognoza wyniku matury.
- Aplikacja działa bez konta — wtedy żadne dane nie opuszczają telefonu.
