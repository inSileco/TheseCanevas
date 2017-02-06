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
PFLAGS = --filter pandoc-fignos --filter pandoc-tablenos --filter pandoc-eqnos --natbib --bibliography=$(REF) --latex-engine=pdflatex




ALL: $(THES)

# La site apèrs les: déterminent les fichier qui lorsqu'ils sont modifiés vont
# être recompilés; il faut complier 3 fois pour avoir tout!!

$(THES): $(THTX) $(LIMI) $(INTH) $(ITTX) $(CCTX) $(REF) $(INLI) $(CHP1)
	pdflatex these
	bibtex these
	pdflatex these
	pdflatex these


$(LIMI): $(OULI)

# J'utilise une pattern rule http://stackoverflow.com/questions/1633527/wildcard-targets-in-a-makefile
$(LIPA)/%.tex: $(LIPA)/%.md
	pandoc $< -o $@

$(ITTX): $(ITMD)
	pandoc $< -o $@ $(PFLAGS)

$(CCTX): $(CCMD)
	pandoc $< -o $@ $(PFLAGS)

$(CHP1): $(CH1M)
	pandoc $< -o chapitre1/main.tex $(PFLAGS)
	cat chapitre1/head.tex chapitre1/main.tex > $@
	sed -i -e 's/includegraphics{/includegraphics[width=\\textwidth]{/g' chapitre1/chap1.tex


clean:
	rm *.aux *.bbl *.blg *.brf *.idx *.out *.toc *.lot *.lof *.log
