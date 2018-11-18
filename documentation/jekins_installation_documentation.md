# Dokumentation der Jenkins-Integation (LSD)

Im folgenden sind die Schritte die zur Einführung von Jenkins notwendig waren dokumentiert.

  - Jenkins auf unserem Server mit Admin-Rechten installieren (In Ibrahims Account): (Stimmen die Befehle?)
    ```sh
    $ sudo apt update
    $ sudo apt install jenkins
    ```
- Jenkins auf unserem server starten (dies geschieht normalerweise automatisch mit jedem Boot)
    ```sh
    $ lalala
    ```
- Durch den normalen Webbrowser auf die Jenkins seite die lokal auf dem Server läuft zugreifen
    ```sh
    ServerIP:8080 (via VPN)
    http://141.19.142.56:8080
    ```
- Vorgeschlagene PlugIns installieren
- Das Adminpasswort (siehe WhatsApp-Chat) aus dem Server in der XXX.fileEnding eingeben
- Dem offiziellen Guide der Jenkins webseite folgen:

    ```sh
    https://jenkins.io/doc/book/pipeline/getting-started/#through-the-classic-ui
    ```
- Unter "General" das GitHub Projekt hinzufügen
- Unter "BuildTriggers" den GitHub Button bestätigen
- Den Webhook (GOGS) (Auf GIT?) hinzufügen und eventuell das PlugIn installieren (Wo/Wie?). Das notwendige Passwort ist das oben erwähnte Adminpasswort
- Webhook testen
- Jenkinsfile schreiben und CI-Pipeline testen:
    ```sh
    node {

   stage('Preparation') { // for display purposes
      // Get some code from a GitHub repository
      git 'https://git.informatik.hs-mannheim.de/lsd-lecture/team-2.git'

   }
   stage('Build') {
      // Run the maven build

      dir('apache-tomcat-6.0.53-src') {
          sh 'mvn package'
      }

   }

   stage('Deploy') {
            when {
              expression {
                currentBuild.result == null || currentBuild.result == 'SUCCESS'
              }
            }
            steps {
                dir('apache-tomcat-6.0.53-src') {
                  sh 'java -jar jat-with-dependencies start'
                }
            }
        }
    }
    ```


# TODO!

  - Unnötige Abhängigkeiten in der pom.xml entfernen und pushen
  - Test und deploy skript part hinzufügen (mit linux command .jar verschieben?)
