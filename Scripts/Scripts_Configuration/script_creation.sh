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

token_name=$(date +%s | md5sum | awk '{print $1}')

response=$(curl -s -H "Content-Type: application/json" \
  -d "{\"name\":\"$token_name\", \"scopes\": [\"all\"]}" \
  -u "$username:$password" \
  http://$ipAddr:3000/api/v1/users/$username/tokens)

token=$(echo "$response" | grep -o '"sha1": *"[^"]*"' | awk -F'"' '{print $4}')

if [ -z "$token" ]; then
  echo "Erreur : Impossible de récupérer le token de l'utilisateur $username."
  exit 1
fi

logins=()
emails=()
full_names=()

while IFS=',' read -r login email full_name; do
  # Ignorer la ligne d'en-têtes
  if [ "$login" != "login" ]; then
    logins+=("$login")
    emails+=("$email")
    full_names+=("$full_name")
  fi
done < "$file"

for i in "${!logins[@]}"; do
  json_data=$(cat <<EOF
{
  "email": "${emails[$i]}",
  "password": "azerty1234",
  "username": "${logins[$i]}",
  "full_name": "${full_names[$i]}",
  "must_change_password": true,
  "login_name": "${logins[$i]}"
}
EOF
  )
  curl -s "http://$ipAddr:3000/api/v1/admin/users" \
    -H "Authorization: token $token" \
    -H "Content-Type: application/json" \
    -d "$json_data"
done
