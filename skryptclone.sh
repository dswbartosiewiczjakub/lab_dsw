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

echo "Nieznana opcja. Użyj skrypt.sh --init, aby sklonować repozytorium i ustawić ścieżkę w PATH."
exit 1
