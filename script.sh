#!/bin/bash

echo "Début du script"
output_file="resultats.txt"
> "$output_file" # vide le fichier si déjà existant

# Initialize array to store data for each day of the week
declare -A daily_data

# Start timer
temps=$SECONDS

# Loop for 30 seconds (can be changed to 86400 seconds for 24 hours)
while (( SECONDS - temps < 30 )); do
  # Perform wget request to fetch Google's page
  wget_output=$(wget -r https://google.com 2>&1)
  
  # Extract datetime and response time from wget output
  datetime=$(echo "$wget_output" | grep "FINISHED" | awk '{print $2, $3}')
  reponse=$(echo "$wget_output" | grep "Total wall clock time:" | awk '{print $5}')  # response time in seconds
  
  # Output the datetime and response time to a file
  echo "$datetime - Temps de réponse: $reponse" >> "$output_file"
  
  # Store the response time in the corresponding day's array
  day_of_week=$(date "+%A")  # Get current day of the week (e.g., "Monday")
  daily_data["$day_of_week"]="${daily_data[$day_of_week]} $reponse"

  echo "Fin d'une boucle"
  sleep 5  # Wait for 5 seconds before the next iteration
done

# Calculate min, max, and average response time
tempsrepmin=$(awk '{print $NF}' "$output_file" | sort -n | head -1)
tempsrepmax=$(awk '{print $NF}' "$output_file" | sort -n | tail -1)
tempsrepmoy=$(awk '{sum += $NF; count++} END {if (count > 0) print sum / count}' "$output_file")

# Start the resultats.js file
echo "const resultats = {" > resultats.js
echo "  tempsRepMin: '$tempsrepmin'," >> resultats.js
echo "  tempsRepMax: '$tempsrepmax'," >> resultats.js
echo "  tempsRepMoy: '$tempsrepmoy'," >> resultats.js

# Generate data for each day of the week
echo "  data: {" >> resultats.js
for day in "Lundi" "Mardi" "Mercredi" "Jeudi" "Vendredi" "Samedi" "Dimanche"; do
  # If data for the day exists, process it; otherwise, set it to an empty array
  if [ -n "${daily_data[$day]}" ]; then
    echo "    \"$day\": [${daily_data[$day]}]," >> resultats.js
  else
    echo "    \"$day\": []," >> resultats.js
  fi
done
echo "  }" >> resultats.js

# Close the resultats.js file
echo "};" >> resultats.js

echo "Fin du script"
