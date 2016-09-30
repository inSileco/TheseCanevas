README

# C'est quoi?

Un cannevas de thèse incluant des fichiers en Markdown. Le but est simplement
de montrer comment, avec un template Latex bien ficellé (merci l'UQAR) et un fichier [makefile](https://www.gnu.org/software/make/manual/make.html), on peut avoir une thèse toute formatée
avec le confort de Mardown.


# Ce qui doit être installé

- [GNU make](https://www.gnu.org/software/make/manual/make.html)

- [Pandoc](http://pandoc.org) pour convertir les fichier `.md` en fichier `.tex` (notez que Pandoc es bien plus que cela!)
- les filtres Pandoc suivant:
  - [Pandoc-eqnos](https://github.com/tomduck/pandoc-eqnos) pour les équations;
  - [Pandoc-tablenos](https://github.com/tomduck/pandoc-tablenos) pour les tables;
  - [Pandoc-fignos](https://github.com/tomduck/pandoc-fignos) pour les figures.


- Pour la synthaxe Pamdoc Markdown, plusieurs liens:
  - [le lien vers R Mardown](http://rmarkdown.rstudio.com/authoring_pandoc_markdown.html) pour
  une approche pragmatique;
  - [Common Mark](http://commonmark.org) pour plus de détails.


# Utilisation

Il faut se placer au niveau du makefile et dans votre terminal entrez:

```
make
```
