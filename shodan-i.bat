@ECHO OFF

ECHO SHODAN [IS-21/22-DE LUCIA] Installer @ /is-shodan-21-22/commons/

ECHO.

ECHO Inserire la password dell'utente 'root' di MySQL.

set /p SHODAN_DB_PASSWORD="shodan_db_connection_password: "

ECHO.

ECHO Download [SHODAN-MAVEN]

git clone https://github.com/is-shodan-21-22/shodan-maven.git

ECHO.

ECHO Download [COMMONS-SQL]

git clone https://github.com/is-shodan-21-22/commons.git

ECHO.

ECHO Download [DELIVERABLES-PDF]

git clone https://github.com/is-shodan-21-22/deliverables.git

ECHO.

ECHO Download [DELIVERABLES-DOCS]

git clone https://github.com/is-shodan-21-22/docs.git

ECHO.

ECHO Download [SHODAN-EXTRA-INFOPOINT]

git clone https://github.com/is-shodan-21-22/shodan-infopoint.git

ECHO.

ECHO Reaching MySQL Workbench as root@localhost...

set path=%PATH%;C:\Program Files\MySQL\MySQL Server 8.0\bin;

ECHO.

ECHO Trying to run SQL from /commons/sql/creazione.sql/

mysql --user="root" --password=%SHODAN_DB_PASSWORD% shodan < commons/sql/Creazione.sql 2> commons/err.txt

ECHO.

ECHO Trying to run SQL from /commons/sql/popolamento.sql/

mysql --user="root" --password=%SHODAN_DB_PASSWORD% shodan < commons/sql/Popolamento.sql 2> commons/err.txt

cd commons

del /f err.txt

cd ..

ECHO.

ECHO Installing Maven dependencies from /shodan-maven/pom.xml/...

ECHO.

cd shodan-maven
CALL mvn clean install -DskipTests=true
cd ..

ECHO.

ECHO Opening Visual Studio Code... [use: mvn tomcat7:run to start]

CALL code commons/shodan-workspace.code-workspace -g shodan-maven/README.md

ECHO Installazione conclusa. E' possibile chiudere la finestra. 

ECHO.

PAUSE