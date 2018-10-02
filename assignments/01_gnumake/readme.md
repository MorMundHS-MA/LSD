# Assignment 1: GNU Make

Ziel dieses Assignments ist es, ein klassisches Build-Tool (_make_) zu verwenden und damit erste Erfahrungen zu sammeln.


## Voraussetzungen

Dieses Assignment benötigt einen C-Compiler und GNU Make. Auf Linux-Systemen sind beide normalerweise standardmäßig installiert. Unter Windows kann man beide Werkzeuge ebenfalls über [Cygwin](xxxx) installieren. Oft ist es allerdings einfacher, eine Linux-Umgebung zu nutzen/aufzusetzen. Hierzu können Sie entweder

  * Ein eigenes Linux in einer virtuellen Maschine installieren (z.B. [VirtualBox](https://www.virtualbox.org) mit [Ubuntu](www.ubuntu.com))
  * Ein Live-Linux auf Ihrem Rechner starten, z.B. [Slax](http://www.slax.org)
  * An der Hochschule in einem der Poolräume eine Linux-VM starten
  * Sich mit Ihrem Fakultätsaccount auf `jonathan.sv.hs-mannheim.de` anmelden
  * Unter Android die Terminal-Emulation [Termux](https://play.google.com/store/apps/details?id=com.termux) installieren
  * Den Server Ihrer Gruppe verwenden.


## C-Quellen beziehen

Zusammen mit diesem Assignment finden Sie die [Quellen](crypter/) zu einem ganz einfachen Verschlüsselungsprogramm in C. Es fehlt allerdings das Makefile und Ihre Aufgabe besteht darin, dieses zu schreiben.

Um die Quellen manuell zu bauen, benötigen Sie folgende Kommandos (Kommentare sind optional):

```console
## Die einzelnen Quelldateien kompilieren
cc -o output/main.o -c main.c
cc -o output/crypto.o -c crypto.c
cc -o output/test.o -c test.c

## Die Objektdateien zu drei Executables zusammenlinken
cc -o output/encrypt output/main.o output/crypto.o
cc -o output/decrypt output/main.o output/crypto.o
cc -o output/test output/test.o output/crypto.o
```

## Makefile

Schreiben Sie ein Makefile, dass das Bauen und Testen des Programms automatisiert. Folgende Targets sollten mindestens vorhanden sein:

  * `all` - baut alle Dateien und führt die Tests aus
  * `clean` - löscht alle Ergebnissdateien
  * `runtest` - führt die Tests aus

Weitere Targets werden für das Erstellen der Objektdateien und das Linken benötigt. Fügen Sie diese ebenfalls ein.


## Abgabe

_Abgabe_: Checken Sie den entsprechend vollständige Projekt und das dazugehörige `Makefile` in Ihr Repository ein. Überlegen Sie sich eine sinnvolle Verzeichnisstruktur, da noch weitere Übungen folgen werden.
