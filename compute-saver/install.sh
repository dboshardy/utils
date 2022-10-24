#!/bin/bash
if [[ -f $HOME/systemd/compute-saver.conf ]]; then
  echo "config file found"
else
  echo "config file not found"
  echo "you must first put your config file called 'compute-saver.conf' in $HOME/systemd/"
  exit 1
fi
cp compute-saver.service /etc/systemd/service/compute-saver.service
cp compute-saver.timer /etc/systemd/service/compute-saver.timer
systemctl enable compute-saver.service
systemctl enable compute-saver.timer
systemctl start compute-saver.timer
