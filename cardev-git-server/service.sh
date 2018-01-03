#!/bin/bash

/usr/sbin/sshd -D &

git daemon --enable=receive-pack --export-all --reuseaddr /home/GIT

while true
do
    sleep 10
done
