#!/bin/bash

# Vérification et installation de Docker si nécessaire
echo "Vérification de Docker..."
if ! command -v docker &> /dev/null; then
    echo "Docker n'est pas installé. Installation de Docker..."
    sudo apt-get update -y
    sudo apt-get install -y ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt-get update -y

     sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo systemctl enable --now docker
else
    echo "Docker est déjà installé."
fi

# Vérification et installation de Docker Compose si nécessaire
echo "Vérification de Docker Compose..."
if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose n'est pas installé. Installation de Docker Compose..."
    sudo curl -L "https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
else
    echo "Docker Compose est déjà installé."
fi

# Création du dossier Gitea
echo "Création du dossier pour Gitea..."
mkdir -p ~/Gitea
cd ~/Gitea || exit

# Génération du fichier docker-compose.yml
echo "Création du fichier docker-compose.yml..."
cat > docker-compose.yml << EOF
version: "3.9"

networks:
  gitea:
    external: false

services:
  db:
    image: postgres:14
    restart: always
    environment:
      - POSTGRES_USER=gitea
      - POSTGRES_PASSWORD=gitea
      - POSTGRES_DB=gitea
    networks:
      - gitea
    volumes:
      - ./postgres:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD", "pg_isready", "-U", "gitea"]
      interval: 5s
      timeout: 5s
      retries: 5

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
    networks:
      - gitea
    volumes:
      - ./gitea:/data
      - ./app.ini.template:/data/gitea/conf/app.ini.template
      - /etc/timezone:/etc/timezone:ro
      - /etc/localtime:/etc/localtime:ro
    ports:
      - "3000:3000"
      - "2222:2222"
    command: >
      bash -c "
      echo 1
      && envsubst < /data/gitea/conf/app.ini.template > /data/gitea/conf/app.ini
      && echo 1.5
      && chmod 666 /data/gitea/conf/app.ini && chmod 777 /data/gitea && chmod 777 /data/git
      && echo 2
      && su - git -c '/usr/local/bin/gitea web --config /data/gitea/conf/app.ini &'
      && echo 3
      && sleep 10
      && echo 4
      && su - git -c '/usr/local/bin/gitea admin user create --username admintest --password azerty1234 --email admintest@test.com --admin'
      && echo 5
      && tail -f /dev/null
      || tail -f /dev/null"
    depends_on:
      db:
        condition: service_healthy
EOF

# Génération du fichier app.ini.template
echo "Création du fichier app.ini.template..."
cat > app.ini.template << EOF
APP_NAME= \${GITEA__global__APP_NAME}

[database]
DB_TYPE = \${GITEA__database__DB_TYPE}
HOST = \${GITEA__database__HOST}
NAME = \${GITEA__database__NAME}
USER = \${GITEA__database__USER}
PASSWD = \${GITEA__database__PASSWD}

[log]
LEVEL = \${GITEA__log__LEVEL}

[service]
DISABLE_REGISTRATION = \${GITEA__service__DISABLE_REGISTRATION}

[security]
INSTALL_LOCK = \${GITEA__security__INSTALL_LOCK}
SECRET_KEY = \${GITEA__security__SECRET_KEY}

[server]
SSH_DOMAIN = \${GITEA__server__SSH_DOMAIN}
SSH_PORT = \${GITEA__server__SSH_PORT}
SSH_LISTEN_PORT = \${GITEA__server__SSH_LISTEN_PORT}
DISABLE_SSH = \${GITEA__server__DISABLE_SSH}
START_SSH_SERVER = \${GITEA__server__START_SSH_SERVER}
EOF

# Lancement de Docker Compose
echo "Lancement de Docker Compose..."
sudo docker compose up -d

# Affichage du message de succès
echo "Docker Compose a été lancé avec succès. Gitea est en cours d'exécution."
