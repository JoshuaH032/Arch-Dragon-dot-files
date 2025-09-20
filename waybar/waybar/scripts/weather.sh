#!/bin/bash

API_KEY="your_openweathermap_api_key"
CITY_ID="5263045" # Wausau, WI (replace with your location’s city ID)
UNITS="imperial"  # "metric" for Celsius, "imperial" for Fahrenheit

weather=$(curl -sf "https://api.openweathermap.org/data/2.5/weather?id=$CITY_ID&units=$UNITS&appid=$API_KEY")

if [ ! -z "$weather" ]; then
  temp=$(echo $weather | jq ".main.temp" | cut -d "." -f1)
  desc=$(echo $weather | jq -r ".weather[0].description")
  icon=$(echo $weather | jq -r ".weather[0].icon")

  echo "{\"text\":\"$temp°F\", \"tooltip\":\"$desc\", \"class\":\"$icon\"}"
else
  echo "{\"text\":\"--\", \"tooltip\":\"Error fetching weather\"}"
fi
