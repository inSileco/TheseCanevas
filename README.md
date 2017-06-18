# Qu'est-ce donc que ce répertoire?

Un canevas de thèse incluant des fichiers en Markdown. Le but est simplement
de montrer comment, avec un template [Latex](http://www.latex-project.org) bien ficelé (merci l'UQAR) et un fichier [makefile](https://www.gnu.org/software/make/manual/make.html), on peut avoir une thèse formatée
tout en profitant du confort de Markdown.

J'ai crée ce répertoire après avoir formaté ma thèse dont
la version est disponible sur [ce répertoire]().

**Attention** : le template doit être compilé avec *pdflatex*.

Also, for now, I've written all in French :flag-fr: but I'd ne happy to answer questions in English.

[![](https://img.shields.io/badge/licence-GPLv3-8f10cb.svg)](http://www.gnu.org/licenses/gpl.html)


# Ce qui doit être installé

- [GNU make](https://www.gnu.org/software/make/manual/make.html)


- [Pandoc](http://pandoc.org) pour convertir les fichier `.md` en fichier `.tex` (Pandoc fait bien plus que cela!), pour la dernière compilation j'ai utilisé la version 1.19.2.1,
- les filtres Pandoc suivants\ :
  - [Pandoc-eqnos](https://github.com/tomduck/pandoc-eqnos) pour les équations,
  - [Pandoc-tablenos](https://github.com/tomduck/pandoc-tablenos) pour les tables,
  - [Pandoc-fignos](https://github.com/tomduck/pandoc-fignos) pour les figures,
  - pour les installer:

  ```bash
  pip install pandoc-fignos pandoc-tablenos pandoc-eqnos
  ```  


- Pour la syntaxe Pandoc Markdown, plusieurs liens:
  - [le lien vers R Mardown](http://rmarkdown.rstudio.com/authoring_pandoc_markdown.html) pour
  une approche pragmatique,
  - [Common Mark](http://commonmark.org) pour plus de détails.


# Utilisation :hammer:

Il faut se placer au niveau du makefile et dans votre terminal entrez:

```bash
make
```

Pour faire un *clean build* commencez avec

```bash
make clean
```
