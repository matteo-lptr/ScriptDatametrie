#!/bin/bash
#echo "debut loop"

#for ((i=1; i<=30; i++)); do

#while true; do
#secs=30   # Set interval (duration) in seconds.

#SECONDS=0   # Reset SECONDS; counting of seconds will (re)start from 0(-ish).
#while (( SECONDS < secs )); do    # Loop until interval has elapsed.
#  wget -r https://google.com
  #awk '/^--/ {print $2, $3} /Total wall clock time:/ {print $5}'
#  sleep 5
# if (( SECONDS - start_time >= 30 )); then
 #       break
# fi
#done
#echo "fin"
#done


echo "debut loop"
output_file="resultats.txt"
> "$output_file" #ca vide le fichier si il existe


temps=$SECONDS

while (( SECONDS - temps < 30 )); do # 86 400 secondes pour 24h
  wget_output=$(wget -r https://google.com 2>&1) #execute et garde la sortie

echo "execution"

  
  datetime=$(echo "$wget_output" | grep "FINISHED" | awk '{print $2, $3}') #$2 et $3 extrait les colonnes
  reponse=$(echo "$wget_output" | grep "Total wall clock time:" | awk '{print $5}') #$5 extrait la cinquieme colonne

  
  echo "$datetime - Temps de réponse: $reponse" >> "$output_file"
echo "fin d'une boucle"
  sleep 5 #a modifier pour mettre les 5 mins = 300 secondes
done

tempsrepmin=$(awk '{print $NF}' "$output_file" | sort -n | head -1) #NF prend le dernier champ
tempsrepmax=$(awk '{print $NF}' "$output_file" | sort -n | tail -1)
tempsrepmoy=$(awk '{sum += $NF; count++} END {if (count > 0) print sum / count}' "$output_file")

echo "temps rep moy: $tempsrepmoy"
echo "temps rep mins : $tempsrepmin"
echo "temps rep max : $tempsrepmax"

echo "Temps de réponse minimum: $tempsrepmin" >> "$output_file"
echo "Temps de réponse maximum: $tempsrepmax" >> "$output_file"
echo "Temps de réponse moyen : $tempsrepmoy" >> "$output_file"

echo "fin du script"
