# Titre de niveau 1 {-}

Note: Le \{-\} dans le fichier .md signal que la section ne sera pas numérotée.

## Titre de niveau 2 {-}

# Quelques rappels sur Makdown et Pandoc

Pour la synthaxe, ci-dessous est présenté "l'essentiel"
pour la rédaction d'un document tel qu'une thèse. Pour avoir des
informations plus exhaustives et pour bien comprendre ce qu'est Markdown, voir
la [dernière spécifcation de Common Mark](http://spec.commonmark.org/0.25/).

Pour convertir le fichier Markdown (md) en un autre fichier j'utilise le
converteur universel [Pandoc](http://pandoc.org).


# Synthaxe Pandoc Markdown {-}

## Simple mises en forme {-}

Écrire en **gras** utiliser un "\\emph": *emph* (en français c'est souligner
en anglais c'est en italic). Utiliser un ^exposant^.
Utiliser un ~indice~ on peut même ~~barrer~~.
Pour faire une énumération (hyphenation)\ :

- cool
- cool2

une liste numérotée\ :

1. cool
2. cool2

## Note de bas de page et hyperlien


Une note de bas de page[^cool].
Une lien internet \[nom du lien\]\(adresse su lien\), ex: [Pandoc](http://pandoc.org).

[^cool]: Ici, mettre le texte de la note de bas de page.


## Citations {-}

Pour les citation courtes en anglais les guillemets anglais "That's one small
step for man, one giant leap for mankind". Pour les français, le mieux utilser
les code HTML: &laquo; Vive le Québec libre !  &raquo;

Pour faire une citation plus longuqe, il suffit d'utiliser '\>' citation de plus de 2 lignes:

> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.




## Symboles mathématques et équations {-}

### En ligne {-}

\$votre equation\$ Après il faut connaître les symboles latex.
Il y a plein de référence en ligne, par exemple sur [Wikilivres](https://en.wikibooks.org/wiki/LaTeX/Mathematics)

Exemple: $\overline{x}$, $\mathcal{N}$




### Équations {-}

Utiliser \$\$votre equation\$\$ Pour faire des références, j'utilise un filtre
pandoc (écrit en python) [Pandoc-eqnos](https://github.com/tomduck/pandoc-eqnos)

$$\prod_{i=1}^nu_n=1$$ {#eq:intr_1}

Voila une ref à l'équation @eq:intr_1





## Figures {-}

Pour insérer une \!\[la légende\]\(chemin vers la figure\)

![Une tite figfure](fig/fig1.pdf){width=80% #fig:intr1}

Pour faire une ref à la figure @fig:intr1.


## Tables {-}

Pour les utilisateur de R, une astuce: faîtes vos tables avec R et utiliser la
fonction 'kable' de du package [knitr](http://yihui.name/knitr/) !!

|   |Plant |Type        |Treatment  | conc| uptake|
|:--|:-----|:-----------|:----------|----:|------:|
|8  |Qn2   |Quebec      |nonchilled |   95|   13.6|
|16 |Qn3   |Quebec      |nonchilled |  175|   32.4|
|24 |Qc1   |Quebec      |chilled    |  250|   30.3|
|32 |Qc2   |Quebec      |chilled    |  350|   38.8|
|40 |Qc3   |Quebec      |chilled    |  500|   38.9|
|48 |Mn1   |Mississippi |nonchilled |  675|   32.4|
|56 |Mn2   |Mississippi |nonchilled | 1000|   31.5|
|64 |Mc1   |Mississippi |chilled    |   95|   10.5|
|72 |Mc2   |Mississippi |chilled    |  175|   11.4|
|80 |Mc3   |Mississippi |chilled    |  250|   17.9|
Table: Une petite légende. {#tbl:intr_1}

Pour faire des référence j'utilise [pandoc-tablenos](https://github.com/tomduck/pandoc-tablenos)
Et hop je vaos référence à la figured @tbl:intr_1.



## Références bibliographiques {-}

Pour faire une référence en ligne @Cazelles2016a; une citation entre
parenthèse [@Cazelles2016a]; une citation avec du texte entre parenthèse
[voir @Cazelles2016a]. Une succession de citation [@Cazelles2016a;
@MacArthur1967; @DeRuiter1995].

Références aux autres chapitre. Il faut définir des labels et puis simplement
les appeller en utiisant les \\ref{chap1}. Au chapitre \ref{chap1}, je fais un
truc super.


## Inclure du code {-}

Dans une ligne `x <- 3` et pour inclure du code sous la forme d'un bloc\ :

```R
for (i in 1:10){
  print(i)
}
```

```bash
for i in `seq 1 6`; do qsub start$i.sh ; done
```
