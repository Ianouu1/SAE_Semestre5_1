<div style="text-align: center;">
    <h2>TP 2 : Initiation aux tags et approfondissement de la gestion de branches</h2>
    <img src="../Ressources/logo_iut.png" alt="Logo IUT" style="width: 250px;"/>
</div>  

Après avoir posé les bases lors du TP1, nous allons maintenant explorer des pratiques avancées
liées à l'utilisation des tags, des branches et des outils essentiels pour gérer efficacement le travail collaboratif dans un projet.
Nous allons explorer les différentes étapes pour créer, manipuler, comparer et fusionner des branches tout en identifiant
et en résolvant des conflits potentiels qui peuvent survenir. Ce TP vous permettra donc de **renforcer vos connaissances de base** tout en vous familiarisant
avec des concepts plus avancés de gestion de versions. N'hésitez pas à avoir votre cours de côté pour réaliser ce TP. **Et n'oubliez pas de mettre en pratique ce que vous avez appris lors du TP1**.

### I. Les tags
* **Question 1 :** Créez un tag léger nommé **v1.0** sur le dernier commit de votre dépôt.
* **Question 2 :** Créez un fichier **test.txt** et le commit.
* **Question 3 :** Créez un tag annoté nommé **v1.1** avec le message : "TP2 : Version avec un fichier txt"
* **Question 4 :** Affichez la liste des tags de votre dépôt.
* **Question 5 :** Affichez les informations détaillées du tag **v1.1**.
* **Question 6 :** Comparez les modifications entre deux tags, **v1.0** et **v1.1**.
* **Question 7 :** Listez l’historique des commits correspondant au tag **v1.0**.
* **Question 8 :** Déposez le tag **v1.0** sur le dépôt distant.
* **Question 9 :** Supprimez le fichier **test.txt** ainsi que le tag **v1.1**.

<div style="text-align: center;">
    <img alt="illustration de l'état du dépot git après les précédentes questions" src="../Ressources/Figure1.png" style="width: 450px;"/>
    <br>
    Figure 1 : Illustration de l'état du dépot git à cet instant
</div>


### II. Les branches

#### Questions de cours
* **Question 1 :** Qu'est-ce qu'une branche dans Git ?
* **Question 2 :** Pourquoi utilise-t-on des branches dans un projet collaboratif ?
* **Question 3 :** Quelle est la différence entre la branche principale (**main/master**) et une autre branche ?

#### Questions d'introduction aux branches
* **Question 4 :** Créez 2 branches **TP2_Puissance** et **TP2_Factorielle** à partir de la branche précédente. Comme précisé dans le cours, c'est une bonne pratique d'avoir un identifiant d'une User Story dans le nom de la branche. On considèrera qu'un TP équivaut à une User Story.
* **Question 5 :** Déplacez-vous dans la branche **TP2_Puissance**.
* **Question 6 :** Listez toutes les branches existantes de votre dépot local.
* **Question 7 :** (Attention n'oubliez pas de commit avant de changer de branche)
  - Dans la branche **TP2_Puissance**, ajoutez une fonction "puissance(n, p)" dans le fichier "main.py" qui permet de calculer n puissance p.
  - Dans la branche **TP2_Factorielle**, ajoutez une fonction "factorielle(n)" dans le fichier "main.py" qui permet de calculer la factorielle de n.
* **Question 8 :** Déplacez-vous dans la branche principale (**main/master**) et fusionnez les branches **TP2_Puissance** et **TP2_Factorielle** (le premier merge devrait bien se passer, le deuxième aura un conflit : expliquez pourquoi il y a eu un conflit).

<div style="text-align: center;">
    <img alt="illustration de l'état du dépot git après les précédentes questions" src="../Ressources/Figure2.png" style="width: 450px;"/>
    <br>
    Figure 2 : Illustration de l'état du dépot git à ce moment
</div>

* **Question 9 :** Affichez l'historique de commits des branches **TP2_Puissance** et **TP2_Factorielle**, puis comparez les differences entre elles.