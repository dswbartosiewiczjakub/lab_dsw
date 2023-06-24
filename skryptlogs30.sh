#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Podaj liczbę plików jako argument."
  exit 1
fi

num_files=$1

for ((i=1; i<=num_files; i++)); do
    filename="log${i}.txt"
    echo "Nazwa pliku: ${filename}" > "${filename}"
    echo "Nazwa skryptu: skrypt.sh --logs ${num_files}" >> "${filename}"
    echo "Data: $(date)" >> "${filename}"
done
