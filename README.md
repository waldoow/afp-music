## Table of contents
* [Comment nommer les branche](#Branches)
* [Workflow](#Workflow)
* [Commandes](#Commandes)

## Branches
 pour nommer les branches: `votre-prenom/nom-de-la-fonctionnalite`


## Workflow
Pour le workflow
  - pull master dans master (remote -> local, pour mettre a jour votre branche master)
  - merge master dans votre branche (local -> local, pour mettre la branche sur la quelle vous travaillez)
  - une fois le travail terminié, il faut commit les dernieres modification, les push et faire une pull request sur github.
  - une fois la pr validee et merge, supprimer la branche en local et en remote
    # Cas speciaux
    si vous avez des modification en cours, vous ne pouvez pas quitter votre branche et meme dans certains cas cela prendra les fichiers avec le changement de branche donc la solution c'est de commit, pour stagged les modifications, ou de stash.

	
## Commandes
des commandes utiles

```
$ git add (*/all/ ou la liste des fichier pour plus de controle)
$ git commit -m "Votre message de commit"
$ git push origin "nom de la branche"
$ git stash
$ git stash apply ou git stash pop
$ git branch "nom de la branche a creer"
$ git checkout "nom de la branche ou l'on veut se rendre"
$ git branch -D

```
