#!/bin/bash
FILE=/var/DO_NOT_STOP
do_not_stop=0
user_logged_in=0
if [ -f "$FILE" ]; then
  do_not_stop=1
fi
user=$(who | grep dboshardy)
if [ -z "$user" ]; then
  user_logged_in=1
fi
if [ $do_not_stop -eq 1 ]; then
  echo "Training is running, do not stop the instance."
  exit 0
elif [ $do_not_stop -eq 0 ]; then
  if [ $user -eq 1 ]; then
    echo "User is logged in, do not stop the instance." # short circuit
    exit 0
  fi
  echo "Training is not running, stop the instance."
  gcloud compute instances stop "$instance" --project "$project" --zone "$zone"
  exit 0
else
  echo "Failed to check if training is running."
  exit 1
fi
