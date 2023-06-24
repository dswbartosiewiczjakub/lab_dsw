#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Użycie: $0 --logs <liczba_plików>"
    exit 1
fi

if [ "$1" != "--logs" ]; then
    echo "Użycie: $0 --logs <liczba_plików>"
    exit 1
fi

logs=$2

for ((i=1; i<=logs; i++))
do
    filename="plik$i.txt"
    touch "$filename"
    echo "Utworzono plik: $filename"
done

