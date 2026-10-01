# Developer Documentation

## Prerequisites

The project requires:

* Docker
* Docker Compose
* Make

The project must be run inside the virtual machine.

## Configuration

The project uses an `.env` file for configuration values such as the database name and database user.

Sensitive information such as passwords is stored in the `secrets/` directory:

* `db_root_password.txt` — MariaDB root password.
* `db_password.txt` — password for the WordPress database user.
* `credentials.txt` — WordPress user passwords. The first line is for the administrator user and the second line is for the regular user.

## Build and Launch

To prepare the data directories, build the Docker images, and launch the project:

```bash
make
```

Other useful Makefile commands:

```bash
make up
make stop
make start
make clean
make fclean
make re
```

`make up` launches the project without forcing a rebuild.

`make stop` stops the containers.

`make start` starts stopped containers.

`make clean` stops and removes the containers and network.

`make fclean` removes the containers, volumes, images, and project data.

`make re` cleans the project and rebuilds it.

## Container and Volume Management

Check the status of the containers:

```bash
docker compose -f srcs/docker-compose.yml ps
```

View the container logs:

```bash
docker compose -f srcs/docker-compose.yml logs
```

List the Docker volumes:

```bash
docker volume ls
```

Inspect a volume:

```bash
docker volume inspect <volume_name>
```

## Data and Persistence

Before starting the project, the Makefile creates the following directories on the host:

```text
data/
├── mariadb_data/
└── wordpress_data/
```

These directories store the persistent project data.

The MariaDB data is mounted inside the MariaDB container at:

```text
/var/lib/mysql
```

The WordPress files are mounted inside the WordPress and NGINX containers at:

```text
/var/www/wordpress
```

The data is stored separately from the containers. Therefore, removing and recreating the containers does not remove the data stored in the volumes.


