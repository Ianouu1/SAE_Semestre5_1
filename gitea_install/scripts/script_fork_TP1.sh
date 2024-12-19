#!/bin/bash

echo 'Donnez le nom du fichier CSV : '
read file
filepath="$PWD/$file"

# token user3 : 94702430560f4e24d10fc40d26b6640b1955d6a9
# il faut donner le token du user qui veut fork

curl -s -H "Content-Type: application/json" \
 -H "Authorization: token 94702430560f4e24d10fc40d26b6640b1955d6a9" \
    'http://localhost:3000/api/v1/repos/alexis/nique/forks'