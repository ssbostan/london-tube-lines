#!/usr/bin/bash

docker build -t ssbostan/london-tube-lines-backend:latest ./backend

docker build -t ssbostan/london-tube-lines-frontend:latest ./frontend

read -p "Do you what to push the images to DockerHub registry? (yes/no) " PUSH_TO_HUB

if [[ $PUSH_TO_HUB == "yes" ]]; then
    docker push ssbostan/london-tube-lines-backend:latest
    docker push ssbostan/london-tube-lines-frontend:latest
fi
