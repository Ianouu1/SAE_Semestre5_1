<div style="text-align: center;">
    <h2>TP3 : Gérer les commits avec Git</h2>
    <img src="../Ressources/logo_iut.png" alt="Logo IUT" style="width: 250px;"/>
</div>

```
Ce TP est une suite du TP1 et TP2. Pour le réaliser, vous avez le choix entre le faire en ligne de commande ou à l'aide 
d'une IDE (VisualStudioCode ou une suite JetBrains).

L'objectif de ce TP est de vous familiariser à la manipulation d'historique des commits (renommage, suppression de fichiers,
rebases interactifs), gérer des erreurs dans des branches et nettoyer un dépôt de manière professionnelle.

⚠️ N'oubliez pas de joindre des captures d'écrans et d'expliquer ce que vous voyez à l'écran.
```

* **Question 1.0 :** Dans le premier TP, vous avez récupéré une branche sur Gitea. Ce qu'on ne vous a pas dit, c'est qu'il y a deux commits qui **ne mentionnent pas l'existence d'un fichier**. Vous allez devoir **trouver** et **revenir** sur ce commit 
* **Question 1.1 :** Maintenant que vous avez récupéré le fichier, **utilisez** le fichier en question et **adaptez-le avec votre nom de famille** afin d'obtenir un résultat. N'hésitez pas à spécifier ce que vous avez mis comme input et ce que vous avez reçu comme output.

**️ ⚠️ À partir de la question 1.2, le support de cours ne couvre plus le TP3. Ce sera à vous de faire les recherches là-dessus et d'expliquer ce que vous avez compris.**

* **Question 1.2 :** Pour corriger cette erreur, vous allez maintenant **renommer** les commits qui ne mentionnaient pas le nom du fichier que vous avez trouvé. Puis poussez la branche en utilisant `git push --force` afin d'écraser la précédente qui avait des commits incorrectement nommés.
* **Question 2 :** Créez une nouvelle branche avec un nom judicieux de votre choix, basculez sur cette branche puis créez un fichier nommé **gestion_nom.py**
* **Question 3.0 :** Dans ce fichier, créez une fonction qui ajoute un nom à une liste de nom. Versionnez vos changements.
* **Question 3.1 :** Ajoutez une nouvelle fonction qui vérifie si le nom est déja présent dans la liste si c'est le cas, il n'est pas ajouté. Versionnez vos changements.
* **Question 3.2 :** Ajoutez une nouvelle fonction qui permet de supprimer un nom de la liste. Mettez en ligne cette version
* **Question 3.3 :** Ajoutez une nouvelle fonction qui permet de trier par ordre Alphabétique les noms de la liste. Mettez en ligne cette version
* **Question 4 :** Supprimez un par un les 4 commits précédant créés dans la branche, puis supprimez la branche elle-même. Attention, vous devez documenter et illustrer vos résultats à chaque étape, il ne sert à rien de supprimer directement la branche.
**Travail facultatif :** Afin de vous familiariser davantage avec l’outil graphique Git intégré dans JetBrains, vous pouvez refaire les TPs, mais cette fois en utilisant l’interface graphique de JetBrains et en joignant des captures d'écrans des actions réalisées.
