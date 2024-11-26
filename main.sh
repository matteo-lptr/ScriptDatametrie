#!/bin/bash

echo "Début du script"
output_file="resultats.txt"
> "$output_file" # vide le fichier si deja existant

temps=$SECONDS

while (( SECONDS - temps < 30 )); do # 30 secondes modifier par 86 400 secondes pour 24h
  wget_output=$(wget -r https://google.com 2>&1)
  
  datetime=$(echo "$wget_output" | grep "FINISHED" | awk '{print $2, $3}') #$2 et $3 extrait les colonnes
  reponse=$(echo "$wget_output" | grep "Total wall clock time:" | awk '{print $5}') #$5 extrait la cinquieme colonne
  
  echo "$datetime - Temps de réponse: $reponse" >> "$output_file"
  echo "Fin d'une boucle"
  sleep 5
done

tempsrepmin=$(awk '{print $NF}' "$output_file" | sort -n | head -1) #NF prend le dernier champ
tempsrepmax=$(awk '{print $NF}' "$output_file" | sort -n | tail -1)
tempsrepmoy=$(awk '{sum += $NF; count++} END {if (count > 0) print sum / count}' "$output_file")

# fichier javascript pour les resultats
echo "const resultats = {" > resultats.js
echo "  tempsRepMin: '$tempsrepmin'," >> resultats.js
echo "  tempsRepMax: '$tempsrepmax'," >> resultats.js
echo "  tempsRepMoy: '$tempsrepmoy'" >> resultats.js
echo "};" >> resultats.js

echo "Fin du script"
