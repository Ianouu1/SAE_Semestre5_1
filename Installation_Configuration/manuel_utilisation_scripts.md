# <center>Manuel d'utilisation des scripts</center>

### <center>(⚠️ Attention à bien exécuter les scripts dans le même répertoire que le `csv` à lire ⚠️)</center>

## Prérequis
Affin d'exécuter les scripts, il est nécessaire d'avoir installé `curl`:
```bash
apt install curl
```
Le premier utilisateur créé est l'admin. Une fois celui-ci créé vous pouvez exécuter les scripts nécessiant les logins de l'admin

## Le script d'installation de Gitea avec `docker`
Ce script automatise l'installation ainsi que le déploiement de l'application `Gitea` avec une configuration par défaut, il suffit de l'exécuter dans le même répertoire.

## Le script de création de compte
le script `scripts/script_creation.sh` qui va créer les comptes utilisateurs avec comme mot de passe azerty1234 en fonction d'un fichier sous format `csv` le fichier `csv` doit contenir ces headers :
```csv
login,email,full_name
```
avec login étant le numéro étudiant de l'élève. Une fois l'élève connecté à son compte il lui sera demandé de modifier son mot de passe.

## Le script de suppréssion de compte

le script `scrip/script_delete.sh` qui va supprimer les utilisateurs en fonction d'un fichier sous format `csv`, ce fichier doit contenir **UNIQUEMENT** ce header :
```
login
```
le login seul est nécessaire, car le nom d'utilisteur est unique, donc la clé primaire d'un utilisateur.

## Le script de création du TP1

Ce script va créer la base du TP1, les élèves vont devoir le fork sur leurs compte personnel. L'admin (le prof) va donc lancer ce script en précisant le lien du repo git (en SSH ou en HTTP). Avec les commits corespondant et un push sur le repo distant. 