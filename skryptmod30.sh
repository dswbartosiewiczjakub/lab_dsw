#!/bin/bash

if [ "$1" == "--init" ]; then
  current_dir=$(pwd)
  repo_name=$(basename "$current_dir")
  clone_dir="$current_dir/$repo_name"

  # Klonowanie repozytorium
  git clone "$current_dir" "$clone_dir"

  # Ustawienie ścieżki w zmiennej środowiskowej PATH
  echo "export PATH=\"$clone_dir:\$PATH\"" >> "$HOME/.bashrc"

  echo "Repozytorium zostało pomyślnie sklonowane do katalogu: $clone_dir"
  echo "Ścieżka do tego katalogu została dodana do zmiennej środowiskowej PATH."
  echo "Zrestartuj terminal, aby zastosować zmiany."
  exit 0
fi

if [ "$1" == "--error" ] || [ "$1" == "-e" ]; then
  num_files=100

  if [ "$1" == "--error" ] && [ -n "$2" ]; then
    num_files=$2
  elif [ "$1" == "-e" ] && [ -n "$2" ]; then
    num_files=$2
  fi

  for ((i=1; i<=num_files; i++)); do
    error_dir="error${i}"
    error_file="${error_dir}/error${i}.txt"

    mkdir "$error_dir"
    echo "Błąd ${i}" > "$error_file"
  done

  echo "Utworzono $num_files plików errorx.txt w odpowiednich katalogach."
  exit 0
fi

echo "Nieznana opcja. Użyj skrypt.sh --init, aby sklonować repozytorium i ustawić ścieżkę w PATH."
echo "Użyj skrypt.sh --error N lub skrypt.sh -e N, aby utworzyć N plików errorx.txt."
exit 1
