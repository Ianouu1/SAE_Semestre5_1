#! /bin/bash

echo 'Adresse IP du serveur: '
read ipAddr

echo 'Nom du fichier CSV: '
read file
filepath="$PWD/$file"

if [ ! -f "$filepath" ]; then
  echo "Erreur : le fichier '$filepath' n'existe pas."
  exit 1
fi

echo "Nom d'utilisateur de l'admin: "
read username

echo "Mot de passe de l'utilisateur: "
read password

# Générer un nom unique pour le token
token_name=$(date +%s | md5sum | awk '{print $1}')

# Récupérer le token
response=$(curl -s -H "Content-Type: application/json" \
  -d "{\"name\":\"$token_name\", \"scopes\": [\"all\"]}" \
  -u "$username:$password" \
  http://$ipAddr:3000/api/v1/users/$username/tokens)

token=$(echo "$response" | grep -o '"sha1": *"[^"]*"' | awk -F'"' '{print $4}')

if [ -z "$token" ]; then
  echo "Erreur : Impossible de récupérer le token de l'utilisateur $username."
  exit 1
fi

while IFS=',' read -r login email full_name; do
  if [ "$login" != "login" ]; then
    response=$(curl -X "DELETE" -s -H "Content-Type: application/json" \
      -H "Authorization: token $token" \
      http://$ipAddr:3000/api/v1/admin/users/$login)
    
    if [ -z $response ]; then
      echo "Utilisateur $login supprimé avec succès"
    else
      echo $response
    fi  
  fi
done < "$file"
