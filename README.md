# Qu'est-ce donc que ce répertoire?
[![](https://img.shields.io/badge/licence-GPLv3-8f10cb.svg)](http://www.gnu.org/licenses/gpl.html)
[![Build Status](https://travis-ci.org/inSileco/TheseCanevas.svg?branch=master)](https://travis-ci.org/inSileco/TheseCanevas)

:warning: :uk: Although the content of this repo is mainly in French, we'd be happy to answer questions in English as well :smiley:!

Un canevas de thèse incluant des fichiers en Markdown. Le but est simplement
de montrer comment, avec un template [Latex](http://www.latex-project.org) bien ficelé (et j'en profites pour dire merci à l'UQAR) et un fichier [makefile](https://www.gnu.org/software/make/manual/make.html), on peut avoir une thèse formatée tout en profitant du confort qu'offre Markdown.

J'ai créé ce répertoire après avoir formaté ma thèse dont
la version, un peu différente, est disponible sur [ce répertoire](https://github.com/KevCaz/thesis). Noté aussi que Alain Danet a adopté ce répertoire pour répondre au exigence de l'université de Montpellier ([voir le répertoire](https://github.com/alaindanet/TheseCanevas)).




# Installation

## Approche générale :bulb:

Ce répertoire a été conçu pour faciliter la compilation d'un document final de
thèse à partir d'un canevas LaTeX et d'un ensemble de fichier écrits en LateX ou
en Markdown. Pandoc est utilisé pour faire la conversion `.md` => `.tex` et le
document est compiler avec `pdflatex` le tout étant orchestré par un makefile.  
La section suivante donne plus de détails relatifs à ces outils.


## Outils utilisés :wrench:

1. Il faut une distribution [Latex](https://www.latex-project.org/get/), le template doit être compilé avec *pdflatex*. Voici ce que la version que j'ai utilisée lors pour la dernière compilation réussie (réalisé sous MacOS Sierra (10.12.5), Raspbian Jessie et Debian Jessie):

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

2. [GNU make](https://www.gnu.org/software/make/manual/make.html)


3. [Pandoc](http://pandoc.org) (>=2.2.0) pour convertir les fichier `.md` en fichier `.tex` (Pandoc fait bien plus que cela!), pour la dernière compilation j'ai utilisé les filtres Pandoc suivants\ :
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



## Avec Raspbian

Voici ce que j'ai utilisé pour que tout marche sur Raspbian-Jessie

Mon fichier `/etc/apt/sources.list` est:

```bash
deb http://mirrordirector.raspbian.org/raspbian/ jessie main contrib non-freerpi
deb-src http://archive.raspbian.org/raspbian/ jessie main contrib non-free rpi
deb http://archive.raspbian.org/raspbian/ stretch main
```

Mettre tout à jour:

```bash
apt-get update && apt-get upgrade
```

Installer Latex:

```bash
$ apt-get install texlive-base texlive-science texlive-extra-utils\
  texlive-font-utils texlive-fonts-extra texlive-fonts-recommended\
  texlive-latex-base texlive-latex-extra texlive-lang-english \
  texlive-lang-french
```

Installer Pandoc:

```bash
sudo apt-get install pandoc pandoc-citeproc
```

Python est déjà installé, et a été mis-à jour plus haut, il faut cependants'assurer que le `pip` soit à jour puis installer les filtres:

```bash-Jessie


sudo apt-get install python-pip
sudo easy_install -U setuptools
sudo pip install pandoc-fignos pandoc-tablenos pandoc-eqnos
```

Voilà, le `make` devrait marcher.





# Utilisation :hammer:

Il faut se placer au niveau du makefile et dans votre terminal entrez:

```bash
make
```

Pour faire un *clean build* commencez avec:

```bash
make clean
```

