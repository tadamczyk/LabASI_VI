# How To Make Docker Image :whale:

Instrukcja, jak zainstalować Dockera :whale:, tak aby można było utworzyć obraz oraz [uruchomić swoją aplikację w Docker-Compose](https://docs.docker.com/compose/rails/#build-the-project):

1. Zainstaluj [Docker'a](https://docs.docker.com/install/) oraz [Docker Compose'a](https://docs.docker.com/compose/install/).  
2. Utwórz plik [Dockerfile (przykładowy)](Dockerfile) oraz [docker-compose.yml (przykładowy)](docker-compose.yml).  
3. Upewnij się, że w Twoim pliku [Gemfile](Gemfile) znajduje się gem 'rails'; w przypadku jego braku - dodaj go.

****

Poniższe kroki prowadzą do utworzenia obrazu Twojej aplikacji i umieszczenia jej w [repozytorium obrazów Docker'a](https://hub.docker.com/):

1. Utwórz konto na [repozytorium obrazów Docker'a](https://hub.docker.com/).  
2. Zaloguj się lokalnie wpisując poniższe polecenie, a następnie swoje dane logowania:  
> ``docker login``  
3. Znajdując się w folderze z aplikacją napisaną za pomocą frameworka Ruby on Rails wydaj w terminalu polecenia:  
> ``docker build -t <your-username>/<your-repo-name>:<your-tag-name> .``  
> ``docker push <your-username>/<your-repo-name>:<your-tag-name>``

****

Aby uruchomić swoją aplikację na dowolnym sprzęcie za pomocą Docker'a należy uruchomić terminal i wydać polecenia:

> ``docker pull <your-username>/<your-repo-name>:<your-tag-name>``  
> ``docker run -i -t --net=host <your-username>/<your-repo-name>:<your-tag-name>``

A następnie w przeglądarce internetowej wpisz adres:

> ``localhost:3000``

A jeśli używasz [Docker for Windows](https://store.docker.com/editions/community/docker-ce-desktop-windows):

1. Sprawdź swój __Subnet Address__ w zakładce __Settings__ w programie __Docker for Windows__.  
2. Wpisz w przeglądarce internetowej __Subnet Address__ + 2:
> ``(np. 10.0.75.0 -> 10.0.75.2):3000``

****

Jeśli chcesz zapisać zmiany, których dokonałeś w uruchomionej aplikacji, najpierw musisz ją wyłączyć __Ctrl + C__, a następnie wydać polecenie dzięki któremu sprawdzisz _containerID_:

> ``docker ps -a``

Gdy masz już _containerID_ naszej aplikacji to zapisz nasz kontener jako nowy obraz wydając polecenie:

> ``docker commit <containerID> <new-repo-name>:<new-repo-tag-name>``

Aby uruchomić _zmodyfikowaną_ aplikację należy wydać polecenie:

> ``docker run -i -t --net=host <new-repo-name>:<new-repo-tag-name>``

### OR

Można też uruchomić _zmodyfikowaną_ aplikację bez tworzenia nowego obrazu. Aby to zrobić należy uruchomić kontener, w którym dokonaliśmy zmian, wpisując poniższe polecenie:

> ``docker container start -i <containerID>``

****

Przydatne polecenia:

``docker images`` - wyświetla wszystkie lokalne obrazy  
``docker ps -a`` - wyświetla wszystkie lokalne kontenery  
``docker rm <containerID>`` - usuwa kontener o podanym ID  
``docker rmi <imageID>`` - usuwa obraz o podanym ID