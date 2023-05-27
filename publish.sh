#!/bin/bash

set -exu -o pipefail

O=Satzung.fodt
S=/tmp/Satzung.odt

libreoffice --headless --convert-to odt --outdir /tmp $O

T=$(xmlstarlet sel -t -v /office:document/office:meta/dc:date <Satzung.fodt | sed -e 's/T.*//')
D=changes/$T.diff
F=Satzung.cur.md
N=Satzung.new.md

if test -f $D ; then
    echo Warnung: ersetze bestehende Datei
    if test -s $D ; then
        patch -R $F $D > /tmp/$F
        mv /tmp/$F $F
    fi
fi

make md
cp Satzung.md $N

if ! diff -u $F $N > $D ; then
    echo Keine Änderungen.
else
    mv $N $F
    git add $D $F $O
    git commit -m "Update $T"

    git push --all
fi
rm $S


