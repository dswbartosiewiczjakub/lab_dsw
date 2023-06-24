#!/bin/bash

if [ "$1" == "--help" ]; then
  echo "Dostępne opcje:"
  echo "-h, --help: Wyświetla pomoc"
  echo "-l N, --logs N: Tworzy N plików logx.txt"
  exit 0
fi

if [ "$1" == "-l" ] || [ "$1" == "--logs" ]; then
  if [ $# -ne 2 ]; then
    echo "Podaj liczbę plików jako drugi argument."
    exit 1
  fi

  num_files=$2

  for ((i=1; i<=num_files; i++)); do
      filename="log${i}.txt"
      echo "Nazwa pliku: ${filename}" > "${filename}"
      echo "Nazwa skryptu: skrypt.sh --logs ${num_files}" >> "${filename}"
      echo "Data: $(date)" >> "${filename}"
  done

  exit 0
fi

echo "Nieznana opcja. Użyj skrypt.sh --help, aby wyświetlić dostępne opcje."
exit 1
