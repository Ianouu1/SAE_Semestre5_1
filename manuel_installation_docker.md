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

C'est un `docker-compose.yml` qu'on peut trouver sur le site de [Gitea](https://docs.gitea.com/installation/install-with-docker#postgresql-database)
```yaml
version: "3"

networks:
  gitea:
    external: false

services:
  server:
    image: gitea/gitea:nightly
    container_name: gitea
    environment:
      - USER_UID=1000
      - USER_GID=1000
      - GITEA__database__DB_TYPE=postgres
      - GITEA__database__HOST=db:5432
      - GITEA__database__NAME=gitea
      - GITEA__database__USER=gitea
      - GITEA__database__PASSWD=gitea
    restart: always
    networks:
      - gitea
    volumes:
      - ./gitea:/data
      - /etc/timezone:/etc/timezone:ro
      - /etc/localtime:/etc/localtime:ro
    ports:
      - "3000:3000"
      - "222:22"
    depends_on:
      - db

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

```
en exécutant ce fichier avec `docker compose -d up` on aura un serveur Gitea avec PostgreSQL qui fonctionne dès l'éxecution sur n'importe quel environnement.

## Configuration de Gitea

Affin d'exécuter le script, il est nécessaire d'avoir installé `curl`:
```bash
apt install curl
```
Maintenant que Gitea est installé, le premier utilisateur créé sera l'admin.
Une fois celui-ci créé vous pouvez exécuter le script `scripts/script_creation.sh` qui va créer les comptes utilisateurs en fonction
d'un fichier sous format `csv` (⚠️ Attention à bien exécuter le script dans le même répertoire que celui-ci ⚠️) le fichier `csv` doit contenir ces headers :
```csv
login;password;email;fullname
```
avec login étant le numéro étudiant de l'élève

## Conseil concernant la sécurité