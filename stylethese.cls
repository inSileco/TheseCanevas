%
% Style pour la redaction de these et de memoires.
% UQAR, 29 mai 2009.
%
% Inspire du travail de Mohammed Bahoura (UQAR) et de Gisele Legault
% (UQAM), avec leur assentimment (consenti a Pierre Saint-Laurent,
% Avril 2009).
%
% Modifi� par Fr�d�ric Cyr dans le but de rendre conforme aux exigences du guide de r�daction de janvier 2012 de l'UQAR.
% Aout 2013


% Preambule.
%
  \NeedsTeXFormat{LaTeX2e}
  \ProvidesClass{stylethese}[2009/05/10 Style pour theses UQAR]
  %\RequirePackage{doublespace,cite,indentfirst,epsfig,ifthen}
  %\RequirePackage{doublespace,indentfirst,epsfig,ifthen,remreset,graphicx,dcolumn,amsmath,makeidx,multicol,natbib}
  \RequirePackage{setspace,remreset,graphicx,makeidx,ifthen}
  \RequirePackage[english,frenchb]{babel} % frenchb default
% \RequirePackage[frenchb,english]{babel} % english default
  \LoadClassWithOptions{book}
  \DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
  \ProcessOptions\relax

% General.

  \setlength{\parindent}{1cm}
  \parskip 11pt plus 1pt minus 1pt % espace suplementaire entre les paragraphes (2 interligne)
  \newcounter{annexe}
  \setcounter{annexe}{0}

% Marges.

  \setlength{\belowcaptionskip}{0.5cm}

  \if@twoside
    \setlength\headheight     {  12pt}
    \setlength\topmargin      {-1.0cm}
    \setlength\headsep        { 1.3cm}
    \setlength\oddsidemargin  { 1.0cm} % left margin for p.1,3,5...
    \setlength\evensidemargin { 0.0cm} % left margin for p.2,4,6...
    \setlength\oddsidemargin  { 1.0cm} % left margin for p.1,3,5...
    \setlength\evensidemargin { 0.0cm} % left margin for p.2,4,6...
    \setlength\textwidth      {15.6cm}
    \setlength\textheight     {21.6cm}
  \else
    \setlength\headheight     {  12pt}
    \setlength\topmargin      {-1.0cm}
    \setlength\headsep        { 1.3cm}
%   \setlength\oddsidemargin  { 1.0cm}
    \setlength\oddsidemargin  { 0.5cm} % same margin on both side of sheet.
    \setlength\textwidth      {15.6cm}
    \setlength\textheight     {21.6cm}
  \fi

% Nouveaux environnements.

   %\newenvironment{appendices}
   %  {
   %    \begin{singlespace}
   %    \addcontentsline{toc}{chapter}{\MakeUppercase{appendices}}
   % }
   %  {\end{singlespace}\addvspace{3cm}}


  \newenvironment{chapintro}{\begin{singlespace}}{\end{singlespace}\addvspace{3cm}} % pour introduction des chapitres


  \newenvironment{liste} % pour la liste des abreviations et des symboles
                 {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                          \let\makelabel\listelabel}}
                 {\endlist}
  \newcommand*\listelabel[1]{\hspace\labelsep
                                  \normalfont\bfseries #1}

  \newenvironment{listeglossaire} % pour le glossaire
                 {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                          \let\makelabel\listeglossairelabel}}
                 {\endlist}
  \newcommand*\listeglossairelabel[1]{\hspace\labelsep
                                  \normalfont\bfseries #1}

% Environnements modifies.

  \renewenvironment{theindex}
     {\ifthenelse{\boolean{@twocolumn}}{\setboolean{@restonecol}{false}}%
                                       {\setboolean{@restonecol}{true}}%
      \addcontentsline{toc}{chapter}{\MakeUppercase{\indexname}}
      \twocolumn{\chapter*{\indexname}}%
      \markboth{\MakeUppercase\indexname}{\MakeUppercase\indexname}%
      \setlength\parindent{0pt}\setlength\parskip{0pt plus 0.3pt}%
      \setlength\columnseprule{0pt}\setlength\columnsep{35pt}%
      \thispagestyle{plain}\let\item\@idxitem }
     {\ifthenelse{\boolean{@restonecol}}{\onecolumn}{\clearpage}}

  \renewenvironment{quotation} % merci � Michael Totschnig (totschnig.michael@uqam.ca)
                 {\list{}{\listparindent 1.5em%
                          \itemindent    \listparindent
                          \rightmargin   \leftmargin
                          \parsep        \z@ \@plus\p@}%
                       \item\relax\begin{singlespace}}
                 {\end{singlespace}\endlist}

  \long\def\@makecaption#1#2{\begin{singlespace}% % Met le texte sous les figures a simple interligne
    \vskip\abovecaptionskip
    \sbox\@tempboxa{#1: #2}%
    \ifdim \wd\@tempboxa >\hsize
      #1: #2\par
    \else
      \global \@minipagefalse
      \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
    \fi
    \vskip\belowcaptionskip\end{singlespace}}% fin du simple interligne

% Type de document : these/memoire traditionnelle ou par articles.

  \newcommand\Chapitres{\newcommand\@typedoc{chapitre}}
  \newcommand\Articles{\newcommand\@typedoc{article}}

% Par defaut, le compteur des tableaux et des figures et remis a zero
%   a chaque debut de chapitre. Le guide est contre...

  \renewcommand{\thetable}{\arabic{table}}
  \@removefromreset{table}{chapter}
  \renewcommand{\thefigure}{\arabic{figure}}
  \@removefromreset{figure}{chapter}

% Definition des termes francais.

  \newcommand\@remerciements{Remerciements}
  \newcommand\@avantpropos{Avant-propos}
  \newcommand\@tabledesmatieres{Table des mati\`eres}
  \newcommand\@listedesfigures{Liste des figures}
  \newcommand\@listedestableaux{Liste des tableaux}
  \newcommand\@listeabrev{liste des abr\'{e}viations}
  \newcommand\@listesymboles{Liste des symboles}
  \newcommand\@resume{R\'esum\'e}
  \newcommand\@abstract{Abstract}
  \newcommand\@introduction{Introduction g\'en\'erale}
  \newcommand\@conclusion{Conclusion g\'en\'erale}
  \newcommand\@glossaire{glossaire}
% \newcommand\@references{Bibliographie}
  \newcommand\@references{R\'ef\'erences}
  \renewcommand\partname{Partie}
  \addto\captionsfrenchb{\renewcommand\chaptername{\@typedoc}}
  \addto\captionsfrenchb{\renewcommand\tablename{Tableau}}
  \addto\captionsenglish{\renewcommand\chaptername{\@typedoc}}
  \addto\captionsfrenchb{\renewcommand\figurename{Figure}}
  \addto\captionsenglish{\renewcommand\bibname{R\'ef\'erences}}
  \addto\captionsfrenchb{\renewcommand\bibname{R\'ef\'erences}}
% \renewcommand\appendixname{Annexe} % When babel is not in use...
% \renewcommand\indexname{Index}
% \renewcommand\figurename{Figure}
% \renewcommand\tablename{Tableau}

% Page Titre.

  \newcommand\Auteur[1]{\newcommand\@Auteur{#1}}
  \newcommand\Titre[1]{\newcommand\@Titre{#1}}
  \newcommand\Faculte[1]{\newcommand\@Faculte{#1}}
  \newcommand\Diplome[1]{\newcommand\@Diplome{#1}}
  \newcommand\Date[2]{\newcommand\@Datea{#1}\newcommand\@Dateb{#2}}
%  \newcommand\These{\newcommand\@Travail{TH\`ESE}\newcommand\@Presente{PR\'{E}SENT\'{E}E}}
  \newcommand\These{\newcommand\@Travail{Th\`ese}\newcommand\@Presente{pr\'esent\'ee}}
  \newcommand\Memoire{\newcommand\@Travail{M\'EMOIRE}\newcommand\@Presente{PR\'{E}SENT\'{E}}}

  \def\margepagetitre#1{\list{}{\leftmargin#1}\item[]}
  %\def\margepagetitre#1#2{\list{}{\leftmargin#2\topmargin#1}\item[]}
  \let\endquote=\endlist

  \newcommand\Pagetitre{
    \thispagestyle{empty}
    \begin{margepagetitre}{0in}
      % \begin{margepagetitre}{5cm}{0cm}

      \null\vskip+1.0cm % PSL
      \begin{center}
        % \hskip-1.6cm	\MakeUppercase{Universit\'{e} du Qu\'{e}bec \`{a} Rimouski}
        % \textbf{\MakeUppercase{Universit\'{e} du Qu\'{e}bec \`{a} Rimouski}}\\

        \includegraphics[width=8cm]{img/rimouski-noir.eps}


        \vfill\textbf{\@Titre}\\
  	\vfill{\@Travail}
  	{\@Presente} \\
  	\vskip0.1cm{dans le cadre du \@Faculte} \\
  	\vskip0.1cm{en vue de l'obtention du grade de \@Diplome}
  	\vfill{PAR} \\
  	\vskip0.1cm\textbf{\MakeUppercase{\textcopyright \@Auteur}}
  	\vskip1.5cm\textbf{{\@Datea} {\@Dateb}}
        \vskip1.5cm

      \end{center}
    \end{margepagetitre}
    \vskip.01cm\newpage
    \newpage\mbox{} % PSL, force a pagebreak in fake twopage.
  }

% Autres sections.

  \newcommand\remerciements{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
    \fi\chapter*{\textit{\@remerciements}}
    \phantomsection\addcontentsline{toc}{chapter}{\MakeUppercase{\@remerciements}}
    \if@restonecol
     \twocolumn\fi}

  \newcommand\avantpropos{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
    \fi\chapter*{\textit{\@avantpropos}}
    \phantomsection\addcontentsline{toc}{chapter}{\MakeUppercase{\@avantpropos}}
    \if@restonecol
     \twocolumn\fi}

  \newcommand\tabledesmatieres{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
    \fi\chapter*{\textit{\@tabledesmatieres}}
    \phantomsection\addcontentsline{toc}{chapter}{\MakeUppercase{\@tabledesmatieres}}
    \@starttoc{toc}\if@restonecol\twocolumn\fi}

  \newcommand\listedestableaux{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
    \fi\chapter*{\textit{\@listedestableaux}}
    \phantomsection\addcontentsline{toc}{chapter}{\MakeUppercase{\@listedestableaux}}
    \begin{singlespace}
    \@starttoc{lot}
    \end{singlespace}
    \if@restonecol
    \twocolumn\fi}

   \newcommand\listedesfigures{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
    \fi\chapter*{\textit{\@listedesfigures}}
    \phantomsection\addcontentsline{toc}{chapter}{\MakeUppercase{\@listedesfigures}}
    \begin{singlespace}
    \@starttoc{lof}
    \end{singlespace}
    \if@restonecol
    \twocolumn\fi}

  \newcommand\listeabrev{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
    \fi\chapter*{\textit{\@listeabrev}}
    \phantomsection\addcontentsline{toc}{chapter}{\MakeUppercase{\@listeabrev}}
    \if@restonecol
     \twocolumn\fi}

  \newcommand\listesymboles{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
    \fi\chapter*{\textit{\@listesymboles}}
    \phantomsection\addcontentsline{toc}{chapter}{\MakeUppercase{\@listesymboles}}
    \if@restonecol
     \twocolumn\fi}

  \newcommand\resume{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
    \fi\chapter*{\textit{\@resume}}
    \phantomsection\addcontentsline{toc}{chapter}{\MakeUppercase{\@resume}}
    \if@restonecol
     \twocolumn\fi}

   \newcommand\abstract{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
     \fi\chapter*{\textit{\@abstract}}
     \phantomsection\addcontentsline{toc}{chapter}{\MakeUppercase{\@abstract}}
     \if@restonecol
     \twocolumn\fi}

  \newcommand\debutcorps{\clearpage %
       \pagenumbering{arabic}}

  \newcommand\introduction{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
    \fi\chapter*{\@introduction}
    \phantomsection\addcontentsline{toc}{chapter}{\MakeUppercase{\@introduction}}
    \if@restonecol
     \twocolumn\fi}

  \newcommand\conclusion{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
%    \fi\chapter*{\textit{\@conclusion}}
    \fi\chapter*{\@conclusion}
    \phantomsection\addcontentsline{toc}{chapter}{\MakeUppercase{\@conclusion}}
    \if@restonecol
     \twocolumn\fi}

  \newcommand\glossaire{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
    \fi\chapter*{\textit{\@glossaire}}
    \phantomsection\addcontentsline{toc}{chapter}{\MakeUppercase{\@glossaire}}
    \if@restonecol
     \twocolumn\fi}

% Table des matieres et liste.

  \setcounter{secnumdepth}{4}

  \def\l@chapter#1#2{\addpenalty{-\@highpenalty}
     \parskip 0pt % remise a zero de l'espacement des paragraphes
  %  \vskip 1.0em plus 1pt  % space above chapter line
     \vskip 0.0em plus 1pt  % PSL
     \@tempdima 8.0em       % width of box holding chapter number
     %\@dottedtocline{0}{0.0em}{1.5em}
     \begingroup
     \begin{singlespace} % titre des chapitre a simple interligne
       \parindent \z@ \rightskip \@pnumwidth
       \parfillskip -\@pnumwidth
  %    \bf                  % Boldface.
       \leavevmode          % TeX command to enter horizontal mode.
       % \advance\leftskip\@tempdima  %% added 5 Feb 88 to conform to
       % \hskip -\leftskip            %% 25 Jan 88 change to \numberline
       #1\nobreak\leaders\hbox{$\m@th \mkern \@dotsep mu.\mkern \@dotsep
         mu$}\hfill
      \nobreak\hbox to\@pnumwidth{\hss #2}\par
       \penalty\@highpenalty %% added 24 May 89 as suggested by J. Leichter
      \end{singlespace} % fin de simple interligne
     \endgroup}

  \renewcommand\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
  \renewcommand\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
  \renewcommand\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
  \renewcommand\l@paragraph{\@dottedtocline{4}{10em}{5em}}
  \renewcommand\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
  \let\l@table\l@figure
  \renewcommand\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}

% Chapitres.

  \renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
  		    \thispagestyle{empty}%
  		    \global\@topnum\z@
                      \@afterindentfalse
                      \secdef\@newchapter\@snewchapter} % @newchapter = \chapter - @snewchapter =\chapter*

  \def\@newchapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \if@mainmatter
                           \refstepcounter{chapter}%
                           \typeout{\@chapapp\space\arabic{chapter}.}%
                           \addcontentsline{toc}{chapter}%
   {\protect\numberline{\MakeUppercase{\@chapapp}\space\MakeUppercase{\arabic{chapter}}} \\ \MakeUppercase{#1}}
                         \else
                           \typeout{#1}%
                           \addcontentsline{toc}{chapter}\MakeUppercase{#1}
                         \fi
                      \else
                        \typeout{#1}%
                        \addcontentsline{toc}{chapter}\MakeUppercase{#1}
                      \fi
                      \chaptermark{#1}%
%                     \addtocontents{lof}{\protect\addvspace{10\p@}}
                      \addtocontents{lof}{\protect\addvspace{0\p@}}
                      \addtocontents{lot}{\protect\addvspace{0\p@}}
                      \if@twocolumn
                        \@topnewpage[\@makenewchapterhead{#2}]
                      \else
                        \@makenewchapterhead{#2}\@afterheading
                      \fi}
  \def\@makenewchapterhead#1{%
    {\begin{center} \normalfont
      \ifnum \c@secnumdepth >\m@ne
        \if@mainmatter
          \vspace*{0.1cm}% moitier de la valeur souhaite mais fonctionne
          \normalsize\bfseries \MakeUppercase{\@chapapp}\space \MakeUppercase{\arabic{chapter}}
          \par\nobreak
  %       \vskip 1cm % moitier de la valeur souhaite mais fonctionne % PSL
        \fi
      \fi
      \interlinepenalty\@M
      \normalsize\bfseries \MakeUppercase{#1}\par\nobreak
  %   \vskip 1.5cm % moitier de la valeur souhaite mais fonctionne % PSL
      \end{center}
    }}
  \def\@snewchapter#1{\if@twocolumn
                     \@topnewpage[\@makesnewchapterhead{#1}]%
                   \else
                     \@makesnewchapterhead{#1}%
                     \@afterheading
                   \fi}
  \def\@makesnewchapterhead#1{%
    {\begin{center} \normalfont
      \interlinepenalty\@M
      \normalsize \bfseries  \MakeUppercase{#1}\par\nobreak
      \vskip 20\p@
      \end{center}
    }}

% Appendices.

  \newcommand\appendice{\if@openright\cleardoublepage\else\clearpage\fi
  		    \thispagestyle{empty}%
  		    \global\@topnum\z@
                      \@afterindentfalse
                      \secdef\@anewchapter\@sanewchapter} % @newchapter = \chapter - @snewchapter =\chapter*

  \def\@anewchapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \if@mainmatter
                           \refstepcounter{annexe}%
                           \typeout{\MakeUppercase{Annexe}\space\Roman{annexe}}%
                           \addcontentsline{toc}{chapter}%
   {\protect\numberline{\MakeUppercase{Annexe}\space \Roman{annexe}} \\ \MakeUppercase{#1}}%
                         \else
                           \typeout{#1}%
                           \addcontentsline{toc}{chapter}\MakeUppercase{#1}%
                         \fi
                      \else
                        \typeout{#1}%
                        \addcontentsline{toc}{chapter}\MakeUppercase{#1}%
                      \fi
                      \chaptermark{#1}%
                      \addtocontents{lof}{\protect\addvspace{10\p@}}%
                      \addtocontents{lot}{\protect\addvspace{10\p@}}%
                      \if@twocolumn
                        \@topnewpage[\@makeanewchapterhead{#2}]%
                      \else
                        \@makeanewchapterhead{#2}\@afterheading
                      \fi}
  \def\@makeanewchapterhead#1{%
    {\begin{center} \normalfont
      \ifnum \c@secnumdepth >\m@ne
        \if@mainmatter
          \vspace*{0.5cm}% moitier de la valeur souhaite mais fonctionne
          \normalsize\bfseries \MakeUppercase{Annexe}\space \Roman{annexe}
          \par\nobreak
          \vskip 1cm % moitier de la valeur souhaite mais fonctionne
        \fi
      \fi
      \interlinepenalty\@M
      \normalsize\bfseries \MakeUppercase{#1}\par\nobreak
      \vskip 1.5cm % moitier de la valeur souhaite mais fonctionne
      \end{center}
    }}
  \def\@sanewchapter#1{\if@twocolumn
                     \@topnewpage[\@makesanewchapterhead{#1}]%
                   \else
                     \@makesanewchapterhead{#1}%
                     \@afterheading
                   \fi}
  \def\@makesanewchapterhead#1{%
    {\begin{center} \normalfont
      \interlinepenalty\@M
      \normalsize \bfseries  \MakeUppercase{#1}\par\nobreak
      \vskip 20\p@
      \end{center}
    }}

  \renewcommand\section{\@startsection
  {section} % nom de section
  {1} % niveau (-1 part, 0 chap, 1 sect, etc)
  {\z@} % indent
  {3.5ex plus 1ex minus .2ex} % espace avant
  {2.3ex plus .2ex} % espace apres
  {\normalsize\bfseries}} % style

  \renewcommand\subsection{\@startsection
  {subsection} % nom de section
  {2} % niveau (-1 part, 0 chap, 1 sect, etc)
  {\z@} % indent
  {3.25ex plus 1ex minus .2ex} % espace avant
  {1.5ex plus .2ex} % espace apres
  {\normalsize\bfseries}}


  \renewcommand\subsubsection{\@startsection
  {subsubsection} % nom de section
  {3} % niveau (-1 part, 0 chap, 1 sect, etc)
  {\z@} % indent
  {3.25ex plus 1ex minus .2ex} % espace avant
  {1.5ex plus .2ex} % espace apres
  {\normalsize\bfseries}} % style


% Type de citation modifiee.

  \def\@biblabel#1{\hspace*{-\labelsep}} % enleve les numeros de la bibliographie

  \renewenvironment{thebibliography}[1]
       {\chapter*{\@references}%
        \addcontentsline{toc}{chapter}\MakeUppercase{\@references}
        \list{\@biblabel{\@arabic\c@enumiv}}%
             {\settowidth\labelwidth{\@biblabel{#1}}%
              \leftmargin\labelwidth
              \advance\leftmargin\labelsep
              \@openbib@code
              \usecounter{enumiv}%
              \let\p@enumiv\@empty
              \renewcommand\theenumiv{\@arabic\c@enumiv}}%
        \sloppy
        \clubpenalty4000
        \@clubpenalty \clubpenalty
        \widowpenalty4000%
        \sfcode`\.\@m}
       {\def\@noitemerr
         {\@latex@warning{Empty `thebibliography' environment}}%
        \endlist}

  \renewcommand{\@cite}[2]{{\textsuperscript{[#1]}\ifthenelse{\boolean{@tempswa}}{,#2}{}}}

  \pagestyle{myheadings}
  \pagenumbering{roman}
  \if@twoside
  \else
  \fi
  \endinput
