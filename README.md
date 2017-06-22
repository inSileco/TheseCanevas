# Qu'est-ce donc que ce répertoire?

Un canevas de thèse incluant des fichiers en Markdown. Le but est simplement
de montrer comment, avec un template [Latex](http://www.latex-project.org) bien ficelé (et j'en profites pour dire merci à l'UQAR) et un fichier [makefile](https://www.gnu.org/software/make/manual/make.html), on peut avoir une thèse formatée tout en profitant du confort qu'offre Markdown.

J'ai créé ce répertoire après avoir formaté ma thèse dont
la version, un peu différente, est disponible sur [ce répertoire](https://github.com/KevCaz/thesis).


For now, I've written all in French but I'd ne happy to answer questions in English. T

[![](https://img.shields.io/badge/licence-GPLv3-8f10cb.svg)](http://www.gnu.org/licenses/gpl.html)


# Ce qui doit être installé :wrench:

- Il fait une distribution [Latex](https://www.latex-project.org/get/), le template doit être compilé avec *pdflatex*. Voici ce que la version que j'ai utilisée lors pour la dernière compilation réussie (réalisé sous MacOS Sierra (10.12.5) et Raspbian Jessie):

```
pdflatex --version                        
  pdfTeX 3.14159265-2.6-1.40.17 (TeX Live 2016)
  kpathsea version 6.2.2
  Copyright 2016 Han The Thanh (pdfTeX) et al.
  There is NO warranty.  Redistribution of this software is
  covered by the terms of both the pdfTeX copyright and
  the Lesser GNU General Public License.
  For more information about these matters, see the file
  named COPYING and the pdfTeX source.
  Primary author of pdfTeX: Han The Thanh (pdfTeX) et al.
  Compiled with libpng 1.6.21; using libpng 1.6.21
  Compiled with zlib 1.2.8; using zlib 1.2.8
  Compiled with xpdf version 3.04
```

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

Pour faire un *clean build* commencez avec:

```bash
make clean
```

# Raspbian build

Voici ce que j'ai utilisé pour que tout marche sur Raspbian-Jessie

Mon fichier `/etc/apt/sources.list` est:

```bash
deb http://mirrordirector.raspbian.org/raspbian/ jessie main contrib non-free rpi
deb-src http://archive.raspbian.org/raspbian/ jessie main contrib non-free rpi
deb http://archive.raspbian.org/raspbian/ stretch main
```

Mettre tout à jour:

```bash
apt-get update && apt-get upgrade
```

Installer Latex:

```bash
apt-get install textlive-base texlive-science texlive-extra-utils texlive-font-utils texlive-fonts-extra texlive-fonts-recommended
sudo apt-get install texlive-latex-base texlive-latex-extra texlive-lang-english texlive-lang-french
```

Installer Pandoc:

```bash
sudo apt-get install pandoc pandoc-citeproc
```

Python est déjà installé, et a été mis-à jour plus haut, il faut cependant s'assurer que le `pip` soit à jour puis installer les filtres:

```bash
sudo apt-get install python-pip
sudo easy_install -U setuptools
sudo pip install pandoc-fignos pandoc-tablenos pandoc-eqnos
```

Voila, le `make` devrait marcher.
