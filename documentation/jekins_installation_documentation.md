# Dokumentation der Jenkins-Integation (LSD)


Im folgenden sind die Schritte die zur Einführung von Jenkins notwendig waren dokumentiert.

  - Jenkins auf unserem Server mit Admin-Rechten installieren (In Ibrahims Account): 
  
    ```sh
    key-hinzufügen:
    wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
    
    In sources.list 'deb https://pkg.jenkins.io/debian binary/' hinzufügen.
    
    $ sudo apt-get update
    $ sudo apt-get install jenkins
    ```
- Jenkins auf unserem server starten (dies geschieht normalerweise automatisch mit jedem Boot)
    ```sh
    $ sudo service jenkins start
    ```
- Durch den normalen Webbrowser auf die Jenkins seite die lokal auf dem Server läuft zugreifen
    ```sh
    ServerIP:8080 (via VPN)
    http://141.19.142.56:8080
    ```
- Vorgeschlagene PlugIns installieren
- Das Adminpasswort (siehe auch im WhatsApp-Chat) findet man im Ordnerverzeichnis:          /var/lib/jenkins/secrets/initialAdminPassword --> nur als root zugreifbar.
- Dem offiziellen Guide der Jenkins webseite folgen:

    ```sh
    https://jenkins.io/doc/book/pipeline/getting-started/#through-the-classic-ui
    ```
- Unter "General" das GitHub Projekt hinzufügen
- Unter "BuildTriggers" den GitHub Button bestätigen
- Den Webhook in GOGS hinzufügen. 
    -   Payload-URL:  http://141.19.142.56:8080/gogs-webhook/?job=tomcat-pipeline
    -   Secret: Das notwendige Passwort ist das oben erwähnte Adminpasswort
- GOGS Plugin in Jenkins installieren.
- Webhook testen
- Jenkinsfile schreiben und CI-Pipeline testen:
    ```sh
    node {

        stage('Preparation') {
          git 'https://git.informatik.hs-mannheim.de/lsd-lecture/team-2.git'
        }
   
        stage('Build') {
          dir('apache-tomcat-6.0.53-src') {
            sh 'mvn package'
          }
        }
   
        stage('Test') {
          dir('apache-tomcat-6.0.53-src') {
            sh 'mvn test'
          }
        }

        stage('Deploy') {
          dir('apache-tomcat-6.0.53-src/target') {
            sh 'mv tomcat-6.0.53-jar-with-dependencies.jar /var/lib/jenkins/workspace/tomcat-pipeline/apache-tomcat-6.0.53-src'
          }
        }
    }
    ```

# TODO!

