USER_DOC.md

# User Documentation

## Services
- NGINX: handles HTTPS connections.
- WordPress: provides the website.
- MariaDB: stores WordPress data.

## Start the project
make

## Stop the project

To stop the running containers:

```bash
make stop
```

This stops the NGINX, WordPress, and MariaDB containers without removing them.


## Website
https://mben-cha.42.fr

## Administration panel
https://mben-cha.42.fr/wp-admin

## Credentials

All project credentials are stored in the `secrets/` directory.

* `db_root_password.txt` — password for the MariaDB root user.
* `db_password.txt` — password for the WordPress database user.
* `credentials.txt` — contains the WordPress user passwords. The first line is for the administrator user, and the second line is for the regular user.


These files are used by the services during their configuration and should not be shared publicly.
