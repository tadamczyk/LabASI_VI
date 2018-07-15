# Laboratorium z Architektury Serwisów Internetowych

| Wykład i laboratorium | Student | Ruby | Ruby on Rails |
:--:|:--:|:--:|:--:
| [dr Włodzimierz Bzyl](https://github.com/egzamin/asi) | [Tomasz Adamczyk](https://github.com/tadamczyk) | ~> 2.5 | >= 5.2.0.rc1 |

****

**MyCRUD.co ?**

CRUD przechowujący dane o doktorach (pracownikach przychodni lekarskiej), takie jak: imię, nazwisko, stanowisko, PESEL.  
CRUD poza standardowymi opcjami wygenewrowanymi przez framework posiada:  
* opcje usuwania danego doktora w widoku "Show";  
* wyświetlanie informacji o doktorach w widokach "Edit" i "Show";  
* dodanie paska nawigacyjnego (NavBaru) w widokach;  
* dodanie stopki z informacją (linkiem) do mojego konta na GitHubie;  
* modyfikacja widoku na bardziej przyjazny użytkownikowi.

****

**Jak uruchomić program?**

Uruchom terminal i wpisz:  
``bundle install --without production``  
``rails db:migrate``  
``rails server``  
``localhost:3000`` lub ``sigma.ug.edu.pl:3000``

**Strona na Heroku (ocena - 5.0)** -> [kliknij tutaj](https://desolate-depths-73479.herokuapp.com/) 
