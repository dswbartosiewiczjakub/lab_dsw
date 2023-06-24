#!/bin/bash

while [[ $# -gt 0 ]]; do
    key="$1"
    
    case $key in
        -h|--help)
        echo "Dostępne opcje:"
        echo "-h, --help: Wyświetla pomoc"
        echo "-l, --logs N: Tworzy N plików logx.txt"
        echo "-d, --date: Wyświetla dzisiejszą datę"
        shift
        ;;
        -l|--logs)
        if [[ -z $2 ]]; then
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

        shift
        shift
        ;;
        -d|--date)
        echo "Dzisiejsza data: $(date)"
        shift
        ;;
        *)
        echo "Nieznana opcja: $1"
        shift
        ;;
    esac
done


