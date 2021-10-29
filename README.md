# Installer — [/shodan-infopoint/](https://is-shodan-21-22.github.io/shodan-infopoint/)

### Installer automatico di Shodan

Prima di procedere, assicurarsi di aver installato correttamente gli [strumenti necessari](https://github.com/is-shodan-21-22/shodan-maven#strumenti).
A tal punto, è sufficiente lanciare `shodan-i.bat` e inserire la password dell'utente root@localhost di MySQL. In caso di immissione errata, riaprire l'installer. Completato il processo, verrà lanciato automaticamente Visual Studio Code. All'interno dell'IDE sarà quindi possibile aprire un terminale e digitare `mvn tomcat7:run` per avviare Shodan.
