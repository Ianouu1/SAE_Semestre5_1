#!/bin/bash

echo "URL du repo: "
read repository
git clone $repository
cd $(basename "$repository" .git)

echo '' > main.py
git add main.py
git commit -m "TP1: Initialisation"

echo 'def addition(a,b):
    """
    :param a: un entier
    :param b: un entier
    :return: laddition de a+b
    """
    return a+b' > main.py
git add main.py
echo 'def chiffrement(nomdefamille):
    """
    :param nomdefamille: Votre nom de famille tout en MAJUSCULE
    :return: un entier représentant la somme des codes ASCII de chaque lettre du nom de famille
    """
    return sum(ord(char) for char in nomdefamille)

if __name__ == "__main__":
    resultat = chiffrement("TEST")
    print(resultat)' > temp.py
git add temp.py
git commit -m "TP1: Ajout d'une fonction pour faire des additions"

echo '
    def soustraction(a,b):
    """
    :param a: un entier
    :param b: un entier
    :return: la soustraction de a-b
    """
    return a-b' >> main.py
git add main.py
git rm temp.py
git commit -m "TP1: Ajout d'une fonction pour faire des soustractions"

echo '
    def division(a,b):
    """
    :param a: un entier
    :param b: un entier
    :return: la division de a/b
    """
    return a/b

def multiplication(a,b) :
    # TODO : Completer la fonction multiplication
    pass

if __name__ == "__main__" :
    resultat = addition(400, 200)
    print("Le resultat de 400+200 = ", resultat)

    resultat = soustraction(400, 200)
    print("Le resultat de 400-200 = ", resultat)

    resultat = division(400,200)
    print("Le resultat de 400/200 = ", resultat)

    resultat = multiplication(400, 200)
    print("Le resultat de 400*200 = ", resultat)' >> main.py

git add main.py
git commit -m "TP1: Ajout d'une fonction pour diviser et test des operations"

git push 