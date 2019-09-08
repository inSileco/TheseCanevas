##-- Le document à faire
THES = these.pdf
THTX = these.tex
##-- Les liminaires à faire + INLI = tous les fichiers de limi_src
LIMI = liminaires.tex
LIPA = limi_src
INLI := $(wildcard limi_src/*.md)
OULI := $(patsubst %.md,%.tex,$(wildcard limi_src/*.md))
##-- Introduction
ITMD = intro.md
ITTX = intro.tex
##-- Chapitre 1 (les autres chapitres et les annexes sont des fichiers .tex)
CHP1 = chapitre1/chap1.tex
CH1M = chapitre1/chap1.md
##-- Conclusion
CCMD = conclu.md
CCTX = conclu.tex
##-- Ref
REF = mybiblio.bib
##-- Les filtres que j'utilise et que je recommande (notamment pour la bibliographie)
##
pd_mj = $(shell pandoc --version |  grep -o "[0-9]" | head -1)
ifeq ($(pd_mj), 2)
	pdfend=--pdf-engine
else
	pdfend=--latex-engine
endif
PFLAGS = --filter pandoc-fignos --filter pandoc-tablenos --filter pandoc-eqnos --natbib --bibliography=$(REF) $(pdfend)=pdflatex



# $(THES) est la cible qui doit être produite par le fichier.
# Le bébnéfice d'un makefile est de regénéré les fichiers adéquates lorsque les
# sources ont été modifiés. Avec pdflatex plusieurs compilation sont nécesaires
# pour que les références (biblio / equation / figures...) soient correctement
# insérées (ici, j'utilise la force un peu brute ici, je pourrais vérifier un peu
# plus en détails quels fichiers sont changées et combien de fois je dois recompiler).


ALL: $(THES)

$(THES): $(THTX) $(LIMI) $(INTH) $(ITTX) $(CCTX) $(REF) $(INLI) $(CHP1)
	pdflatex these
	bibtex these
	pdflatex these
	pdflatex these

$(LIMI): $(OULI)

# J'utilise une 'pattern rule' => http://stackoverflow.com/questions/1633527/wildcard-targets-in-a-makefile
$(LIPA)/%.tex: $(LIPA)/%.md
	pandoc $< -o $@

$(ITTX): $(ITMD)
	pandoc $< -o $@ $(PFLAGS)

$(CCTX): $(CCMD)
	pandoc $< -o $@ $(PFLAGS)

$(CHP1): $(CH1M)
	pandoc $< -o chapitre1/main.tex $(PFLAGS)
	cat chapitre1/head.tex chapitre1/main.tex > $@

# Le "-" fait que l'erreur produite quand certains des fichiers à supprimer sont absents lors du "make clean" sera ignorée
# https://www.gnu.org/software/make/manual/html_node/Errors.html
clean:
	-rm intro.tex conclu.tex chapitre1/chap1.tex these.pdf *.aux *.bbl *.blg *.brf *.idx *.out *.toc *.lot *.lof *.log
