# Projektdokumentation  :rocket:
##### In diesem Report werden die durchgeführten Assignments des Fachs LSD dokumentiert und reflektiert. Dazu werden die folgenden Fragen in einem Fließtext beantwortet.

    Was waren wichtige Quellen, um die Aufgabe zu lösen?
    Welche besonderen Herausforderungen gab es bei der Lösung der Aufgabe?
    Welche Erkenntnisse haben Sie bei der Lösung gewonnen?
    Was lief besonders gut?
    Was besonders schlecht?
    Was würden Sie beim nächsten Mal bei der Lösung anders angehen?
    Was würden Sie einem Team mit auf den Weg geben wollen, das diese Aufgabe nächstes Semester bearbeiten müsste?

1. ##### gnumake 	
2. ##### Server
3. ##### Tomcat
4. ##### Archaeologie
Die [Dokumentation](https://git.informatik.hs-mannheim.de/lsd-lecture/team-2/src/master/documentation) von Tomcat wie Sie in dem [Assignment](https://git.informatik.hs-mannheim.de/lsd-lecture/assignments/src/master/04_archaeologie) definiert wurde, war vom Aufwand schwer einzuschätzen. Es wurde viel Zeit dafür verschwendet Framworks zur automatischen Erzeugung von Klassendiagrammen zu probieren, welche am Ende dennoch einen eher geringen Mehrwert lieferten. Wir würden bei einer solchen Aufgabe zunächst erstmal den Code manuell durchforsten und dann eventuell Tools zur Erstellung von Diagrammen nutzen, da man durch diesen Prozess eventuell eher Besonderheiten einer Codebasis findet. Es viel auf, dass auch alte Codebasen relativ gute Codingstandards haben.
5. ##### Maven
Der Link zum Assignment ist hier zu finden [LINK](https://git.informatik.hs-mannheim.de/lsd-lecture/assignments/src/master/05_maven).
Besonders für das Schreiben der [pom.xml](https://git.informatik.hs-mannheim.de/lsd-lecture/team-2/src/master/apache-tomcat-6.0.53-src/pom.xml) war es wichtig sich im Team abzusprechen und Zeit in der Vorlesung zu nutzen, um eventuelle Fragen zum Assignment zu stellen, da es dort viele Kleinigkeiten gab die zu beachten waren, welche dann oft zu Schwierigkeiten geführt haben. Die galt besonnders für das Finden der nötigen Dependencies.
6. ##### Jenkins
Hier ist der Link zum Assignment  [Click](/lsd-lecture/assignments/src/master/06_jenkins). Das Assignment war komplett mit der [Dokumentation](https://jenkins.io/) von Jenkins lösbar. Das Installieren und Starten von Jenkins auf dem Server ging ziemlich leicht. Jedoch war es schwierig herauszufinden unter welchem Pfad die UI des Jekins-Servers aufzurufen ist. Hier hätte man genauer die Dokumentation von Anfang an lesen sollen oder schneller Feedback von anderen Teams holen. Viele Dokumentationen, die nicht von Jenkins selbst stammten, waren eher verwirrend und kaum eine Hilfe. Wir würden es jedem Team empfehlen, zunächst die GANZE Dokumentation von Jenkins durchzulesen, um zunächst einen groben Überblick über alle Funktionalitäten zu bekommen. Dies gilt besonders für Leute die keinen großen Background in CI. haben.
7. ##### Multimodule
8. ##### Docker  :whale:
Der Link zum Assignment ist hier zu finden [LINK](https://git.informatik.hs-mannheim.de/lsd-lecture/assignments/src/master/08_docker).
Durch die Dokumentation von [Docker](https://docs.docker.com/) war es relativ einfach diese Aufgabe zu lösen. Die Doku hat besonders bei dem Schreiben des [Dockerfiles](https://git.informatik.hs-mannheim.de/lsd-lecture/team-2/src/master/apache-tomcat-6.0.53-src/dockerfile) geholfen. Die Definition der Umgebungsvariable und die Tatsache, dass Docker auf dem gleichen Port wie Jenkins lief, haben kurz Probleme bereitet. Hier hat es besonders geholen, sich mit Teams die das gleiche Problem hatten auszutauschen. Die Portprobleme waren natürlich schnell behoben. Dieses Assignment hat uns besonders den Mehrwert von Docker gezeigt.
9. ##### Tests
10. ##### Refactoring
