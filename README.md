# Ant Media Server Docker Setup

This repository contains all the necessary scripts and configuration files to set up an Ant Media Server (AMS) instance using Docker and Docker Compose.

## Prerequisites

- Docker
- Docker Compose

These prerequisites can be installed manually, but the `start.sh` script will also check and install them if they're not already installed.

## Usage

1. Clone this repository:

```bash
git clone https://github.com/yourusername/yourrepository.git
```

2. Navigate to the repository's directory:

```bash
cd yourrepository
```

3. Run the start.sh script:

```bash
bash start.sh
```

The start.sh script will:

Check if Docker and Docker Compose are installed, and install them if necessary.
Check if the Docker service and Docker daemon are running, and start them if necessary.
Run docker-compose up to start the AMS instance.

## Docker Compose

The docker-compose.yml file defines the AMS service. It uses the nibrev/ant-media-server:latest Docker image and maps ports 5080, 1935, and 7777 to their corresponding ports on the host machine.

## Customizing the Dockerfile

The Dockerfile contains the commands to build the Docker image for the AMS instance. You can customize this file to suit your needs. For example, you might want to add environment variables or install additional software.

## Contributing

Please feel free to submit issues and pull requests.

## License

This project is licensed under the terms of the MIT license.
