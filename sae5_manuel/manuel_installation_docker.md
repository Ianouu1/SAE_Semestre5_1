# <center> Manuel d'installation</center>
### <center>Guide d'installation de Gitea sur Debian en passant par docker</center>
(**Précision :** Les commandes écrites ci-dessous sont censée être exécuter par root, d'où l'absence de `sudo`)

## Installation de docker sur Debian
en suivant les instructions de [docker.com](https://docs.docker.com/engine/install/debian/#install-using-the-repository) voici les deux commandes à exécuter afin d'installer docker : 
```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```
```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## Installation de Gitea et PostgreSQL grâce à `docker compose`

Après avoir installé docker, il y a un script bash `script_installation_docker.sh` qui automatise la création des deux containers docker et leurs déploiement (postgres et gitea). Il suffit de l'exécuter avec les commandes suivantes : 
```bash
chmod +x script_installation_docker.sh
./script_installation_docker.sh
```

## Configuration de Gitea

Si nécessaire, la configuration est modifiable manuellement dans le script d'éxecution, dans la partie `docker-compose.yml` du script on injecte des variables d'environnement dans le container gitea.
```yml
  server:
    image: gitea/gitea:nightly
    container_name: gitea
    environment:
      - USER_UID=1000
      - USER_GID=1000
      - GITEA__global__APP_NAME=La théière de l'IUT - B.U.Thé
      - GITEA__database__DB_TYPE=postgres
      - GITEA__database__HOST=db:5432
      - GITEA__database__NAME=gitea
      - GITEA__database__USER=gitea
      - GITEA__database__PASSWD=gitea
      - GITEA__log__LEVEL=debug
      - GITEA__service__DISABLE_REGISTRATION=true
      - GITEA__security__INSTALL_LOCK=true
      - GITEA__security__SECRET_KEY=zNfev6bUsqMhEM6AHy8xfXHPDvfkYEBhpRd1HOytelg=
      - GITEA__server__SSH_DOMAIN=192.168.24.146
      - GITEA__server__SSH_PORT=2222
      - GITEA__server__SSH_LISTEN_PORT=2222
      - GITEA__server__DISABLE_SSH=false
      - GITEA__server__START_SSH_SERVER=true
```

Ces variables d'environnements servent à la configuration du fichier `app.ini`
```ini
APP_NAME= \${GITEA__global__APP_NAME} # Nom de l'application

[database]
DB_TYPE = \${GITEA__database__DB_TYPE} # Base de donnée PostgreSQL
HOST = \${GITEA__database__HOST} # Adresse de la base de donnée (qui tourne dans un container différent)
NAME = \${GITEA__database__NAME} # Nom de la base de donnée
USER = \${GITEA__database__USER} # Nom d'utilisateur qui administre la BDD
PASSWD = \${GITEA__database__PASSWD} # Mot de passe de l'utilisateur qui administre la BDD

[log]
LEVEL = \${GITEA__log__LEVEL} # Logs pour debuguer l'application

[service]
DISABLE_REGISTRATION = \${GITEA__service__DISABLE_REGISTRATION}  # Si à "true" alors seul l'admin peut créer des utilisateurs

[security]
INSTALL_LOCK = \${GITEA__security__INSTALL_LOCK} # Si à "true" la page d'installation de l'application est passée (ici on l'a mise à true pour automatiser d'autant plus la création de l'application)
SECRET_KEY = \${GITEA__security__SECRET_KEY} # Clé de chiffrement de l'application

[server]
SSH_DOMAIN = \${GITEA__server__SSH_DOMAIN} # Adresse du service SSH
SSH_PORT = \${GITEA__server__SSH_PORT} # Port du service SSH affiché au client (quand il voudra clone un repo avec SSH par exemple)
SSH_LISTEN_PORT = \${GITEA__server__SSH_LISTEN_PORT} # Port du serveur SSH built-in (attention le port 22 rentre en conflit avec sshd)
DISABLE_SSH = \${GITEA__server__DISABLE_SSH} # Désactive ou non les connexions SSH
START_SSH_SERVER = \${GITEA__server__START_SSH_SERVER} # Si activé, utilise le serveur SSH "built-in" de gitea
```