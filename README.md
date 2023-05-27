# Die Satzung der noris.solar eG

In diesem Repository ist neben der Satzung ein kleines Skript integriert,
das diese in diverse Ausgabeformate exportiert und automatisch eine
einigermaßen lesbare diff-Datei erzeugt.

Um das Script zu nutzen, muss neben libreoffice `pandoc` und `xmlstarlet`
installiert sein.

## Vorgehensweise

Editiere `Satzung.fodt`.

`make` wird `Satzung.pdf`, `.docx`, `.md` und `.html` erstellen.

`make publish` generiert einen Diff aus der gecachten und der aktuellen
Markdown-Datei und speichert ihn unter dem aktuellen Datum im Ordner
`changes`.

## Warnung

Änderungen müssen von der Generalversammlung der Genossenschaft
mindestens mit Zweidrittelmehrheit beschlossen werden.
