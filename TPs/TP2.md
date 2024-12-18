<div style="text-align: center;">
    <h2>TP 2 : Approfondissement de Git</h2>
    <img src="../ressources/logo_iut.png" alt="Logo IUT" style="width: 250px;"/>
</div>  

Après avoir posé les bases lors du TP1, nous allons maintenant explorer des pratiques avancées
liées à l'utilisation des tags, des branches, des outils essentiels pour gérer efficacement le travail collaboratif dans un projet.
Nous allons explorer les différentes étapes pour créer, manipuler, comparer et fusionner des branches tout en identifiant
et en résolvant des conflits potentiels qui peuvent survenir. Ce TP vous permettra donc de renforcer vos connaissances de base tout en vous familiarisant 
avec des concepts plus avancés de gestion de versions. N'hésitez pas à avoir votre cours de côté pour réaliser ce TP.

### I. Les tags
* **Question 1 :** Créer un tag léger nommé v1.0 sur le dernier commit de votre dépôt
* **Question 2 :** Créer un fichier 'test.txt' et le commit
* **Question 2 :** Créer un tag annoté nommé v1.1 avec le message : "Version avec un fichier txt"
* **Question 3 :** Afficher la liste des tags de votre dépôt
* **Question 4 :** Afficher les informations détaillées du tag v1.1 (git show <nom_du_tag>)
* **Question 6 :** Comparer les modifications entre deux tags, v1.0 et v1.1. Quelle commande permet de le faire ?
* **Question 7 :** Listez l’historique des commits correspondant au tag v1.1
* **Question 8 :** Déposer le tag v1.0 sur le dépôt distant. Quelle commande utilisez-vous ?
* **Question 9 :** Supprimer le fichier "test.txt" ainsi que le tag v1.1

<div style="text-align: center;">
    <img src="../ressources/Figure1.jpg" style="width: 150px;"/>
    <br>
    Figure 1 : Illustration de l'état du dépot git à cet instant
</div>


### II. Les branches

#### Questions de cours
1. Qu'est-ce qu'une branche dans Git ?
2. Pourquoi utilise-t-on des branches dans un projet collaboratif ?
3. Quelle est la différence entre la branche principale (main/master) et une autre branche ?

#### Questions d'introduction aux branches
* **Question 1 :** Créez 2 branches "Puissance" et "Factorielle" à partir de la branche précédente.
* **Question 2 :** Déplacez-vous dans la branche "Puissance".
* **Question 3 :** Listez toutes les branches existantes de votre dépot Git.
* **Question 4 :** (Attention n'oubliez pas de commit avant de changer de branche)
  - Dans la branche "Puissance", ajoutez une fonction "puissance(n,p)" dans le fichier "main.py" qui permet de calculer n puissance p. Une fois fait, n'oubliez pas de commit dans la branche "Puissance"
  - Déplacez-vous dans la branche "Factorielle", ajouter une fonction "factorielle(n)" dans le fichier "main.py" qui permet de calculer la factorielle de n.
* **Question 5 :** Déplacer vous dans la branche principale (main/master) et vérifier si vos modifications récentes ont été apportées sur le fichier "main.py".

Figure 2 : Illustration de l'état du dépot git à ce moment

#### Comparaison des branches
* **Question 6 :** Comparez les differences entre la branche "Puissance" et la branche "Factorielle"
* **Question 7 :** Afficher l'historique des commits de chacune des branches et faites une comparaison ("git log" pour afficher et "git diff" pour voir la difference entre deux commits, deux branches, ou l’état actuel d'un fichier)

#### Fusion
* **Question 8 :** Revenez dans la branche "Puissance" et fusionner la branche "Puissance" dans la branche principale (main/master)
* **Question 9 :** Après la fusion, déplacer vous dans la branche principale (main/master), listez les commits et vérifier que les modifications faites dans la branche "Puissance" ont bien été intégrées dans la branche principale (main/master)

#### Conflit et résolution
* **Question 10 :** Essayez de fusionner la branche "Factorielle" dans la branche principale (main/master). Observez ce qui se passe et décrivez le problème rencontré. Quelle commande vous a permis d’identifier ce problème ? (git status je crois)
* **Question 11 :** Résolvez le conflit manuellement en éditant le fichier concerné, puis finalisez la fusion.

Figure 3 : Illustration de l'état du dépot git à ce moment

#### Suppression des branches
* **Question 12 :** 
  - Créer une branche "test" 
  - Ajouter un fichier "test.txt" avec du contenu quelconque à l'intérieur
  - Essayez de supprimer la branche "test" sans l'avoir fusionné dans la branche principale. Quelle option avez-vous utilisée pour forcer la suppression de la branche ?

Figure 4 : Illustration de l'état du dépot git à ce moment

### III. SSH keygen

Ssh-keygen est une commande utilisée pour générer une paire de clés SSH (clé publique, clé privée).
Ces clés sont utilisée principalement pour établir une authentification sécurisée sur des serveurs ou services
sans avoir besoin de taper un mot de passe.

#### Définition et fonctionnement

* **Clé privée :** Une clé privée est un code cryptographique connu uniquement par son propriétaire et permet de déchiffrer
  des messages cryptés à l'aide d'une clé publique correspondante.
* **Clé publique :** Une clé publique est utilisée pour crypter des informations que seul le propriétaire de la clé privée
  est autorisé à déchiffrer. Elle peut être partagée et est installée sur le serveur pour permettre à votre machine locale de s'authentifier.
  Elle ne nécessite pas de confidentialité, puisqu'elle est partagée librement.

##### Comment ça marche ?
Une clé publique est créé pour chiffrer des données et peut être partagée librement.<br>
La clé privée, gardée secrète, sert à déchiffrer les données.<br>
Les deux clés sont liées mathématiquement, mais une clé publique ne permet pas de retrouver sa clé privée.<br>

#### Exercice d'application

** Question 1 :** 