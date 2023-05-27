# STOLEN FROM: https://tex.stackexchange.com/questions/40738/how-to-properly-make-a-latex-project
# The first rule in a Makefile is the one executed by default ("make"). It
# should always be the "all" rule, so that "make" and "make all" are identical.
all: odt md docx pdf html

# CUSTOM BUILD RULES

odt:
#	pandoc -f markdown --reference-doc=styles/style.odt -o Satzung.odt Satzung.md -s -N
#	pandoc -f markdown -t html Satzung.md -o Satzung.html -s -N
#	#pandoc -f rst --reference-doc=styles/style.odt -o Satzung.odt Satzung.rst -s -N

odt:
	libreoffice --headless --convert-to odt Satzung.fodt

md: odt
	pandoc -t markdown Satzung.odt -o - -s -N | \
	sed -e 's/\[\]{#anchor[-0-9]*}//g' > Satzung.md

docx:
	libreoffice --headless --convert-to docx Satzung.fodt

pdf:
	libreoffice --headless --convert-to pdf Satzung.fodt

html:
	libreoffice --headless --convert-to html Satzung.fodt

clean:
	rm -f Satzung.docx
	rm -f Satzung.pdf
	rm -f Satzung.md
	rm -f Satzung.odt
	rm -f Satzung.html

publish:
	./publish.sh

web:
	echo "TODO" >&2
	exit 1
