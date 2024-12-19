# Étude de fonctionnalités : Gitea

## 1/ Introduction

Gitea est une plateforme open-source de gestion de dépôts Git. Conçue pour être légère et facile à installer, elle est adaptée aux équipes de développeurs qui souhaitent hébergée eux-même leur projet. Gitea offre une alternative simplifiée à des plateformes comme GitHub, GitLab ou Bitbucket, tout en permettant un contrôle total sur l’hébergement des données.

## 2/ Les fonctionnalités

### 2.1/ Gestion des dépôts Git
Gitea prend en charge toutes les opérations Git standard et fournit des outils pour gérer efficacement les dépôts :

- Création, clonage et suppression de dépôts via l’interface web ou en ligne de commande.
- Support des branches pour le développement collaboratif.
- Création et gestion des forks, permettant aux utilisateurs de travailler sur des copies indépendantes des projets.
- Intégration des pull-requests pour proposer et réviser des modifications avant de les fusionner.

### 2.2/ Gestion des utilisateurs et permissions
Gitea offre une gestion flexible des utilisateurs :
- Création et suppression de comptes directement depuis l’interface.
- Gestion fine des permissions : propriétaire, contributeur, lecteur.
- Authentification via différents protocoles (LDAP, OAuth2, OpenID Connect, etc.).
- Support des équipes pour regrouper les utilisateurs avec des droits spécifiques sur plusieurs dépôts.

### 2.3/ Outils de collaboration
Pour faciliter le travail d’équipe, Gitea propose :
- Un système de suivi des issues (tickets) pour gérer les tâches, les bugs et les demandes de fonctionnalités.
- Un tableau Kanban intégré pour organiser les tâches visuellement.
- Un wiki par projet, permettant de documenter les processus, guides ou informations importantes.
- Notifications par email ou via webhooks pour rester informé des activités.

### 2.4/ Interface utilisateur
L’interface utilisateur de Gitea est simple et intuitive :
- Navigation claire entre les dépôts, issues, pull requests, et paramètres.
- Thèmes personnalisables (mode sombre, par exemple).
- Interface adaptée aux mobiles pour une consultation et une gestion en déplacement.

### 2.5/ Administration et configuration
Gitea est conçu pour être facilement administré :
- Installation rapide et légère, nécessitant peu de ressources (supporte SQLite, MySQL et PostgreSQL pour la base de données).
- Configuration via fichiers YAML, permettant une personnalisation avancée.
- Sauvegardes automatiques pour sécuriser les données.
- Monitoring intégré pour surveiller les performances et les logs.

### 2.6/ Compatibilité et extensions
- Gitea est compilable avec les standards Git, ce qui facilite les migrations depuis GitHub, GitLab ou Bitbucket.
- Support des clés SSH et HTTPS pour un accès sécurisé.
- Extensions via l’API REST pour ajouter des fonctionnalités personnalisées.

## 3/ Comparaison avec d’autres outils
| Critères        |    Gitea     |     Github      | GitLab |       Bitbucket |
|:----------------|:------------:|:---------------:|:------:|----------------:|
| Hébergement     | Auto-hébergé | Hébergé (cloud) | Auto-hébergé & cloud | Hébergé (cloud) |
| Open-Source     |     Oui      |       Non       | Oui |             Non |
| CI/CD intégré   |     Non      |       Oui       | Oui |             Oui |
| CGestion Kanban |     Oui      |       Non       | Oui |             Oui |

## 4/ Cas d'usage
Gitea est particulièrement adapté dans les cas suivants :
- Petites et moyennes équipes souhaitant une solution légère et facile à administrer.
- Projets nécessitant un contrôle total des données, où l’auto-hébergement est un critère clé.
- Développeurs indépendants souhaitant éviter les plateformes centralisées.
- Environnements éducatifs ou de test, où la simplicité d’installation est un avantage.

## 5/ Conclusion

Gitea est une plateforme polyvalente qui excelle par sa simplicité, sa légèreté et son caractère open-source. Bien qu’il manque certaines fonctionnalités avancées de GitLab ou GitHub (comme une CI/CD native), son positionnement auto-hébergé en fait un excellent choix pour les équipes cherchant une alternative efficace et économique.