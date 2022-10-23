#!/usr/bin/bash

docker build -f backend/Dockerfile \
  -t london-tube-lines-backend:latest ./backend

docker build -f frontend/Dockerfile \
  -t london-tube-lines-frontend:latest ./frontend

docker tag \
  london-tube-lines-backend:latest \
  ssbostan/london-tube-lines-backend:latest

docker tag \
  london-tube-lines-frontend:latest \
  ssbostan/london-tube-lines-frontend:latest

read -p "Do you what to push the images to DockerHub registry? (yes/no) " PUSH_TO_DOCKERHUB

if [[ $PUSH_TO_DOCKERHUB == "yes" ]]; then
    docker push ssbostan/london-tube-lines-backend:latest
    docker push ssbostan/london-tube-lines-frontend:latest
fi
