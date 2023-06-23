#!/bin/bash

function check_docker {
  if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Installing..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
    newgrp docker
    rm get-docker.sh
    echo "Docker installed successfully."
  else
    echo "Docker is installed."
  fi
}


function check_docker_compose {
  if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose is not installed. Installing..."
    curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o ./docker-compose
    sudo mv ./docker-compose /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    echo "Docker Compose installed successfully."
  else
    echo "Docker Compose is installed."
  fi
}

function check_docker_service {
  OS=$(uname -s)
  if [ "$OS" == "Linux" ]; then
    if ! systemctl is-active --quiet docker; then
      echo "Docker service is not running. Starting..."
      sudo systemctl start docker
      echo "Docker service started."
    else
      echo "Docker service is running."
    fi
  elif [ "$OS" == "Darwin" ]; then
    if ! command -v docker &> /dev/null; then
      echo "Docker is not running. Please start Docker Desktop."
    else
      echo "Docker is running."
    fi
  fi
}

function check_docker_daemon {
  if ! docker info >/dev/null 2>&1; then
    echo "Docker daemon is not running. Please start Docker daemon."
    exit 1
  else
    echo "Docker daemon is running."
  fi
}

check_docker
check_docker_compose
check_docker_service
check_docker_daemon

docker-compose up
