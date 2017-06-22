# Titre de niveau 1 {-}

Note: Le \{-\} dans le fichier .md signal que la section ne sera pas numérotée.

## Titre de niveau 2 {-}

### Titre de niveau 3 {-}


# Quelques rappels sur Markdown et Pandoc

Pour la syntaxe, ci-dessous est présenté "l'essentiel"
pour la rédaction d'un document tel une thèse. Pour avoir des
informations plus exhaustives et pour bien comprendre ce qu'est Markdown, voir la [dernière spécification de Common Mark](http://spec.commonmark.org/0.25/).

Pour convertir le fichier Markdown (.md) en fichier Latex (.tex), j'utilise le convertisseur universel de document [Pandoc](http://pandoc.org).


# Synthaxe Pandoc Markdown {-}

## Simple mise en forme {-}

Écrire en **gras** utiliser un "\\emph": *emph* (en français c'est souligner
en anglais c'est en italic). Utiliser un ^exposant^.
Utiliser un ~indice~ on peut même ~~barrer~~.
Pour faire une énumération (hyphenation)\ :

- cool
- cool2

une liste numérotée\ :

1. cool
2. cool2


## Note de bas de page

Une note de bas de page[^cool]. Noter on peut les regrouper n'importe où  dans le document.

[^cool]: Ici, mettre le texte de la note de bas de page.


## Liens hypertextes

Une lien internet \[nom du lien\]\(adresse su lien\), ex: [Pandoc](http://pandoc.org).



## Citations {-}

Pour les citation courtes en anglais les guillemets anglais "That's one small
step for man, one giant leap for mankind". Pour les guillements français, le
plus simple est d'utiliser les codes HTML: &laquo; Vive le Québec libre! &raquo;.

Pour faire une citation plus longue que 2 lignes, il suffit d'utiliser '\>':

> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.




## Symboles mathématiques et équations {-}

### En ligne {-}

\$votre equation\$ Après il faut connaître les symboles latex.
Il y a plein de référence en ligne, par exemple sur [Wikilivres](https://en.wikibooks.org/wiki/LaTeX/Mathematics)

Exemple: $\overline{x}$, $\mathcal{N}$




### Équations {-}

Utiliser \$\$votre equation\$\$ pour insérer une équations.
Pour faire des références aux équations insérées, j'utilise un filtre
pandoc [Pandoc-eqnos](https://github.com/tomduck/pandoc-eqnos) (écrit en python).
Par exemple\ :

$$\prod_{i=1}^nu_n=1$$ {#eq:intr_1}

Voila, une référence à l'équation @eq:intr_1. Vous pouvez mettre des équations
les unes à la suite des autres, elles seront alors considérées comme deux
équations indépendantes.

$$\sum_{i=1}^nu_n=1$$ {#eq:intr_2}
$$\int_{i=1}^nu_n=1$$ {#eq:intr_3}

Sinon, il est possible d'utiliser des combinaisons de commandes \LaTeX un peu plus élaborées\ :

$$
\left \{
\begin{array}{c @{=} c}
    x & \sin a \cos b \\
    y & \sin a \sin b \\
\end{array}
\right.
$$ {#eq:intr_4}


## Figures {-}

Pour insérer une \!\[la légende\]\(chemin vers la figure\)

![Une petite figure](fig/fig1.pdf){ #fig:intr1 width=80% }

Pour faire une référence à la figure @fig:intr1. Pour ce faire j'utilise
[Pandoc-fignos](https://github.com/tomduck/pandoc-fignos)


## Tables {-}

Pour les utilisateurs de R, une astuce: faîtes vos tables avec R et utiliser la fonction `kable` du package [knitr](http://yihui.name/knitr/)!

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

Table: Une petite légende. {#tbl:id1}

Pour faire référence à une table, j'utilise [pandoc-tablenos](https://github.com/tomduck/pandoc-tablenos)
Et maintenant, je peux faire référence à la table @tbl:id1.




## Références bibliographiques {-}

Pour faire une référence en ligne @Cazelles2016a; une citation entre
parenthèse [@Cazelles2016a]; une citation avec du texte entre parenthèse
[voir @Cazelles2016a]. Une succession de citation [@Cazelles2016a;
@MacArthur1967; @DeRuiter1995].

Références aux autres chapitre. Il faut définir des labels et puis simplement
les appeler en utilisant les \\ref{chap1}. Au chapitre \ref{chap1}, je fais un
truc super.




## Inclure du code {-}

Dans une ligne `x <- 3`, et pour inclure du code sous la forme d'un bloc\ :


```R
for (i in 1:10){
  print(i)
}
```

```bash
for i in `seq 1 6`; do qsub start$i.sh ; done
```
