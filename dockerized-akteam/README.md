# Wykład z Architektury Serwisów Internetowych

| Autorzy | Wykład i laboratorium | Ruby | Ruby on Rails | Data zaliczenia | Ocena
:--:|:--:|:--:|:--:|:--:|:--:
| [![tadamczyk](https://avatars1.githubusercontent.com/u/16397764?s=40&v=4)](https://github.com/tadamczyk) [![olekkosma](https://avatars0.githubusercontent.com/u/16398511?s=40&v=4)](https://github.com/olekkosma) | [![wbzyl](https://avatars0.githubusercontent.com/u/8049?s=40&v=4)](https://github.com/egzamin/asi) | ~> 2.5 | ~> 5.2.0.rc1 | 05.04.2018 | 5.0 |

****

**MyCRUD.co?** --- **MedicalClinic**

CRUD dla przychodni lekarskiej przechowujący dane o lekarzach (specjalistach medycznych), pacjentach oraz odbytych przez nich wizytach lekarskich.  
CRUD poza standardowymi opcjami wygenewrowanymi przez framework  Ruby on Rails posiada:

* modyfikacja widoku na bardziej przyjazny użytkownikowi (gem 'bootstrap' w wersji 4.0.0);  
* dodanie paska nawigacyjnego w widokach z zakładkami do "Doctors", "Patients" i "Visits";  
* dodanie strony głównej (strona początkowa) zawierającej obraz;  
* dodanie stopki z informacją (linkiem) do naszych kont na GitHubie;  
* dodanie opcji usuwania danego wpisu w widoku "Show" dla danej tabeli;  
* dodanie wyświetlania informacji o doktorach lub pacjentach w widokach "Edit" i "Show" dla danej tabeli;  
* dodanie walidacji dla wszystkich pól znajdujących się w tabelach;  
* dodanie sortowania po wszystkich kolumnach we wszystkich tabelach;  
* dodanie wyszukiwania w tabelach lekarzy i pacjentów po imieniu lub nazwisku;  
* dodanie paginacji (po 5 elementów na stronę).

**Helper** - [PESEL Generator](https://pesel.cstudios.pl/O-generatorze/Generator-On-Line)

****

**Jak uruchomić program?**

Uruchom terminal i wpisz:  
> ``bundle install --without production``  
> ``rails db:migrate``  
> ``rails server``

A następnie w przeglądarce internetowej wpisz adres:  
> ``localhost:3000``

****

**Jak uruchomić program z obrazu na Docker Hub?**

**Docker** - [pełna instrukcja](HowToMakeDockerImage.md)

Uruchom terminal i wpisz:  
> ``docker pull tadamczyk/dockerized-akteam:latest``  
> ``docker run -i -t --net=host tadamczyk/dockerized-akteam``

A następnie w przeglądarce internetowej wpisz adres:

> ``localhost:3000``

A jeśli używasz [Docker for Windows](https://store.docker.com/editions/community/docker-ce-desktop-windows):

1. Sprawdź swój __Subnet Address__ w zakładce __Settings__ w programie __Docker for Windows__.  
2. Wpisz w przeglądarce internetowej __Subnet Address__ + 2:
> ``(np. 10.0.75.0 -> 10.0.75.2):3000``