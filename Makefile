##-- Le document à créer
THES = these.pdf
##-- Chemins des liminaires (INLI = tous les fichiers de limi_src)
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
## Dans les versions >2 de Pandoc, le filter --latex-engine devient --pdf-engine
pd_mj = $(shell pandoc --version |  grep -o "[0-9]" | head -1)
ifeq ($(pd_mj), 2)
	pdfend=--pdf-engine
else
	pdfend=--latex-engine
endif
PFLAGS = --filter pandoc-fignos --filter pandoc-tablenos --filter pandoc-eqnos --natbib --bibliography=$(REF) $(pdfend)=pdflatex


# Dans ce qui suit, $(THES) est la cible, le fichier produit par le Makfile. 
# Le Makefile utilisé permet de 
# 1. centraliser l'ensemble des actions à rassembler l'ensembles des étapes 
# nécessaire pour créer $(THES)
# 2. regénérer les fichiers nécessaires lorsque les sources ont été modifiées

##-- Le principal document LaTeX
THTX = 

ALL: $(THES)

# Quand tous les autres fichiers (lister a droite du ":") ont été correctement 
# générés, on a juste a compiler le fichier LaTeX "these.tex". 
# Avec pdflatex, plusieurs compilation sont nécesaires pour que les références 
# (biblio / equation / figures...) soient correctement insérées dont les 
# répétitions de `pdflatex these`.
$(THES): these.tex $(LIMI) $(INTH) $(ITTX) $(CCTX) $(REF) $(INLI) $(CHP1)
	pdflatex these
	bibtex these
	pdflatex these
	pdflatex these

# les fichiers des liminaires en .md --> .tex
$(LIMI): $(OULI)

# J'utilise un 'pattern rule' => http://stackoverflow.com/questions/1633527/wildcard-targets-in-a-makefile
$(LIPA)/%.tex: $(LIPA)/%.md
	pandoc $< -o $@

$(ITTX): $(ITMD)
	pandoc $< -o $@ $(PFLAGS)

# conclu.md --> conclu.tex
$(CCTX): $(CCMD)
	pandoc $< -o $@ $(PFLAGS)

# chap1.md --> chap1.tex
$(CHP1): $(CH1M)
	pandoc $< -o chapitre1/main.tex $(PFLAGS)
	cat chapitre1/head.tex chapitre1/main.tex > $@

# Le "-" permet d'ignorer l'erreur produite quand certains des fichiers à supprimer sont absents. Voir https://www.gnu.org/software/make/manual/html_node/Errors.html
clean:
	-rm intro.tex conclu.tex chapitre1/chap1.tex these.pdf *.aux *.bbl *.blg *.brf *.idx *.out *.toc *.lot *.lof *.log
