# C'est quoi?

Un cannevas de thèse incluant des fichiers en Markdown. Le but est simplement
de montrer comment, avec un template Latex bien ficelé (merci l'UQAR) et un fichier [makefile](https://www.gnu.org/software/make/manual/make.html), on peut avoir une thèse formatée
tout en profitant du confort de Markdown.


# Ce qui doit être installé

- [GNU make](https://www.gnu.org/software/make/manual/make.html)


- [Pandoc](http://pandoc.org) pour convertir les fichier `.md` en fichier `.tex` (Pandoc est bien plus que cela!)
- les filtres Pandoc suivants\ :
  - [Pandoc-eqnos](https://github.com/tomduck/pandoc-eqnos) pour les équations,
  - [Pandoc-tablenos](https://github.com/tomduck/pandoc-tablenos) pour les tables,
  - [Pandoc-fignos](https://github.com/tomduck/pandoc-fignos) pour les figures,
  - pour les installer:

  ```bash
  pip install pandoc-fignos pandoc-tablenos pandoc-eqnos
  ```  


- Pour la synthaxe Pamdoc Markdown, plusieurs liens:
  - [le lien vers R Mardown](http://rmarkdown.rstudio.com/authoring_pandoc_markdown.html) pour
  une approche pragmatique,
  - [Common Mark](http://commonmark.org) pour plus de détails.


# Utilisation

Il faut se placer au niveau du makefile et dans votre terminal entrez:

```
make
```
