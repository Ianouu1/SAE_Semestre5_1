# TP 2 : Approfondissement de Git 

Après avoir posé les bases du travail collaboratif lors du TP1, nous allons maintenant explorer des pratiques avancées
liées à l'utilisation des branches. Cela inclura la gestion des conflits,...

### Sommaire

### 1. Les branches

#### 1.1 Définition d'une branche et de son objectif
Une branche est une version parallèle d'un dépot qui permet de travailler sur différentes fonctionnalités, corriger des bugs,
ou encore tester des idées sans affecter la branche principale (branche master). Chaque branche peut avoir ses propres modifications ainsi
que ses propres commits, et peut ensuite être fusionné dans d'autres branches (merge request). Cela permet à plusieurs 
développeurs de travailler simultanément sur des fonctionnalités ou des correctifs sans interférer les uns avec les autres. 
Grâce aux branches, il est possible d’isoler les modifications, de tester et de valider les fonctionnalités avant de les 
fusionner dans la branche principale (branche master).

#### 1.2 Gestion des branches
Explication + Illustration avec une image
#### 1.3 Merge request (fusion)
#### 1.4 Gestion des conflits

### 3. Git remote (à voir)

### 4. Modification d'un commit | Amend commit (à voir pour TP1)



#### Questions de cours
1. Qu'est-ce qu'une branche dans Git ?
2. Pourquoi utilise-t-on des branches dans un projet collaboratif ?
3. Quelle est la différence entre la branche principale (main/master) et une branche secondaire ?

#### Questions d'introduction aux branches
* Question 1 : Créer 2 branches "branches1" et "branche2" (à voir)
* Question 2 : Déplacer vous dans "branche1" et vérifier dans quelle branche vous vous trouvez.
* Question 3 : Lister toutes les branches éxistantes de votre dépot Git
* Question 4 : Créer un fichier "test.txt", ajouter du contenu puis utilisez les notions utilisées lors du TP1 afin d'effectuer un commit du fichier "test.txt" dans la branche actuelle (branche1)
* Question 5 : Déplacer vous dans la branche principale (main/master) et vérifier si le fichier "test.txt" est présent ou non

Figure 1 : Illustration de l'état du dépot git à ce moment

#### Fusion
* Question 6 : Revenez dans la branche "branche1" et fusionner la branche "branche1" dans la branche principale (main/master)
* Question 7 : Après la fusion, listez les commits pour vérifier que les modifications de "branche1" sont bien intégrées dans la branche principale (main/master)

#### Conflit et résolution
* Question 8 : Déplacer vous dans la branche "branche2", faites en sorte de récupérer les modifications présentes sur votre branche principale (main/master) que vous n’avez pas encore dans votre branche actuelle (branche2)
* Question 9 : Apporter une modification à votre fichier "test.txt" présent dans votre branche "branche2" puis revenez sur la branche principale (main/master), modifiez la même ligne dans le même fichier, puis effectuez un commit
* Question 10 : Essayez de fusionner la branche "branche2" dans la branche principale (main/master). Observez ce qui se passe et décrivez le problème rencontré. Quelle commande vous a permis d’identifier ce problème ?
* Question 11 : Résolvez le conflit manuellement en éditant le fichier concerné, puis finalisez la fusion.

Figure 2 : Illustration de l'état du dépot git à ce moment

#### Comparaison des branches
* Question 12 : Comparez les differences entre la branche principale et la branche "branche2"
* Question 13 : Afficher l'historique des commits de chacune des branches

#### Suppression des branches
* Question 14 : Supprimé la branche "branche1" après l'avoir fusionnée dans la branche principale (main/principale)
* Question 15 : Ajouter du contenu dans la branche "branche2" puis essayez de supprimer la branche sans l'avoir fusionné dans la branche principale. Quelle option avez-vous utilisée pour forcer la suppression de la branche ?

Figure 3 : Illustration de l'état du dépot git à ce moment

#### ...