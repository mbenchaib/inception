This project has been created as part of the 42 curriculum by *mben-cha.*

# Description

This project is about building a small infrastructure using Docker Compose.

The infrastructure consists of three services:

* **NGINX**: acts as the web server and HTTPS entry point.
* **WordPress**: runs the WordPress application using PHP-FPM.
* **MariaDB**: provides the database used by WordPress.

Each service runs in its own container and is built from a custom Dockerfile. The services communicate through a Docker network, while persistent data is stored using Docker volumes.

The project also uses Docker secrets for sensitive credentials and environment variables for regular configuration values.

The main goal is to understand how to build, configure, connect, and manage a multi-container infrastructure using Docker and Docker Compose.

# Instructions

## Requirements

The project requires:

* Docker Engine
* Docker Compose
* Make

The project is designed to run inside the project's configured virtual machine.

## Build and run

From the root of the repository, run:

```bash
make
```

The `inception` target first creates the required data directories and then builds and starts the infrastructure:

```bash
docker compose -f srcs/docker-compose.yml up --build
```

## Start the infrastructure

To start the infrastructure without forcing an image rebuild:

```bash
make up
```

## Stop the containers

To stop the running containers without removing them:

```bash
make stop
```

## Start stopped containers

```bash
make start
```

## Clean

To stop and remove the containers and Docker network:

```bash
make clean
```

## Full clean

To remove the containers, volumes, project images, and persistent project data:

```bash
make fclean
```

## Rebuild

To perform a full cleanup and rebuild the infrastructure:

```bash
make re
```

# Resources

The following resources were used to understand the technologies and concepts involved in the project:

* Docker Documentation — https://docs.docker.com/
* *Docker Deep Dive* — Nigel Poulton
* Reddit — used to read discussions and experiences from other developers when I encountered problems during the project.
* Google Search — used to find documentation, articles, and solutions when troubleshooting problems.

## AI Usage

AI was used as a learning and development assistant during the project.

It was used for:

* Understanding Docker and Docker Compose concepts before implementing them.
* Understanding containers, images, namespaces, cgroups, and filesystem layers.
* Understanding Docker networking, bridge networks, host networking, NAT, and port publishing.
* Understanding Docker volumes, bind mounts, filesystem permissions, and UID/GID behavior.
* Understanding Docker secrets and environment variables.
* Troubleshooting Docker and Docker Compose errors during development.
* Reviewing Dockerfiles, shell scripts, Docker Compose configuration, and the Makefile.
* Clarifying technical concepts and reviewing the reasoning behind implementation choices.

AI was used mainly to explain concepts, help troubleshoot problems, and review the work rather than to replace the implementation and learning process.

# Project description

## Docker

Docker is used to build and run the services of the infrastructure in separate containers.

## Sources included in the project

The project includes the Docker Compose configuration, Dockerfiles, service configurations, initialization scripts, secrets, and Makefile required to build and run the infrastructure.

## Main design choices

The project separates NGINX, WordPress, and MariaDB into individual containers. NGINX acts as the HTTPS entry point, WordPress runs the application through PHP-FPM, and MariaDB provides the database.

The services communicate through a Docker network, while persistent application data is stored separately from the containers.

## Virtual Machines vs Docker
Docker is a tool used to create and manage containers, while virtual machines are created and managed by a hypervisor. The hypervisor virtualizes the physical hardware and provides virtual hardware to each VM, which runs its own operating system and kernel. Containers, in contrast, share the host operating system's kernel while providing isolated user-space environments.
## Secrets vs Environment Variables
Environment variables are used to provide configuration values to processes, while secrets are intended for sensitive information such as passwords. In this project, WordPress uses environment variables for the database name, database user, and database host, while the database password is provided through a Docker secret and made available as a file.
## Docker Network vs Host Network
In a Docker bridge network, each container has its own network namespace, which isolates its network stack from the host and other containers. Each container can have its own IP address, and Docker creates a virtual bridge on the host that connects the containers to each other and to the host. In host networking mode, Docker does not create a separate network namespace for the container; instead, the container uses the host's network namespace directly.
## Docker Volumes vs Bind Mounts
With a Docker volume, Docker manages the storage location on the host and we refer to it by a volume name. With a bind mount, we explicitly choose a directory on the host and tell Docker to mount that directory into the container.