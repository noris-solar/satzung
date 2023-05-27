# STOLEN FROM: https://tex.stackexchange.com/questions/40738/how-to-properly-make-a-latex-project
# The first rule in a Makefile is the one executed by default ("make"). It
# should always be the "all" rule, so that "make" and "make all" are identical.
all: md docx pdf

# CUSTOM BUILD RULES

odt:
#	pandoc -f markdown --reference-doc=styles/style.odt -o Satzung.odt Satzung.md -s -N
#	pandoc -f markdown -t html Satzung.md -o Satzung.html -s -N
#	#pandoc -f rst --reference-doc=styles/style.odt -o Satzung.odt Satzung.rst -s -N

md:
	pandoc -t markdown Satzung.odt -o Satzung.md -s -N

docx: odt
	libreoffice --headless --convert-to docx Satzung.odt

pdf: odt
	libreoffice --headless --convert-to pdf Satzung.odt

html: odt
	libreoffice --headless --convert-to html Satzung.odt

clean:
	rm -f Satzung.docx
	rm -f Satzung.pdf
	rm -f Satzung.odt
