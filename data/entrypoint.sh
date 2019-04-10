#!/bin/bash

logfile="/home/git/.gitolite/logs/gitolite-$(date +%Y-%m).log"

sudo service ssh stop
sudo service ssh start

if [ -f "$logfile" ]; then
    tail -f "$logfile";
else
    while true; do
        sleep 1
        date +%F\ %T
    done
fi
