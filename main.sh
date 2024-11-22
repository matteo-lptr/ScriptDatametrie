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


start_time=$SECONDS

while (( SECONDS - start_time < 30 )); do
  wget_output=$(wget -r https://google.com 2>&1) #execute et garde la sortie

echo "execution"

  
  datetime=$(echo "$wget_output" | grep "FINISHED" | awk '{print $2, $3}')
  response_time=$(echo "$wget_output" | grep "Total wall clock time:" | awk '{print $5}') #extrait les infos

  
  echo "$datetime - Temps de réponse: $response_time" >> "$output_file"
echo "fin d'une boucle"
  sleep 5
done

echo "fin du script"
