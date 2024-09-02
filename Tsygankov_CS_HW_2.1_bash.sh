#!/bin/bash
websites=("https://google.com" "https://facebook.com" "https://twitter.com")
logfile="website_status.log"
for website in "${websites[@]}"
do
  response=$(curl -L -s -o /dev/null -w "%{http_code}" "$website")
  if [ "$response" -eq 200 ]; then
    status="UP"
  else
    status="DOWN"
  fi
  echo "[${website}] is ${status}" >> "$logfile"
done
echo "Результати записані у файл $logfile"
