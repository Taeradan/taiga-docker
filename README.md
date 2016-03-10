# taiga-docker

Docker scripts to run your own  [Taiga](https://Taiga.io/).

## Requirements

Tools:

* `docker` >= 1.10
* `docker-compose` >= 1.6
* `make`
* `git`

Submodules (automatically pulled by the `make` command):

* [taiga-back](https://github.com/taigaio/taiga-back): Django backend
* [taiga-front](https://github.com/taigaio/taiga-front): Angular.js frontend
* [wait-for-it](https://github.com/vishnubob/wait-for-it): Script for waiting a service initialisation

## Application quick start

### Clone the repository

```bash
git clone https://github.com/Taeradan/taiga-docker.git
```

### Configure your Taiga instance

There are some files to modify according to your environment:

* `frontend/nginx-default-vhost.conf` : In case you split the containers on several machines, replace "taiga-back" by the URL where the backend can be reached.
* `frontend/conf.json` : Replace "localhost" with your Taiga instance hostname if running on a distant server.
* `backend/settings.py` : Replace "localhost" with your Taiga instance hostname if running on a distant server. In this file you can configure the mail notifications and the database settings.
* `docker-compose.yml` : If you changed the database settings in `backend/settings.py`, double check that the postgres environment variables match. In this file you can also change the data volumes locations on your filesystem.

### Run your Taiga instance

Only one commande is needed to launch your Taiga instance:

```bash
make
```

Once you've successfully installed Taiga start a web browser and point it to `http://your-url`.
You should be greeted by a login page.
The administrators username is `admin`, and the password is `123123`.

## Other actions

### Sample data

In case you want to have some pre-loaded data to familiarize with Taiga, you can run:

```bash
make demo
```

### Purge containers

If needed, you can kill, remove, and recreate the containers without losing data (if you have kept the data volumes in `docker-compose.yml`):

```bash
make recreate
```

### Upgrade Taiga

To use the latest Taiga from upstream, you can use:

```bash
make upgrade-taiga
```

### Apply local changes (for developpers)

If you have modified the Dockerfiles, you can apply your changes by running:

```bash
make build recreate
```

### Database maintenance

In case you need to acces the database, you can uncomment the port binding in the "postgres" service in `docker-compose.yml` and then runnning `make` to apply the changes.
You can then access the database locally on the port 54321 with tools such as pgadmin or psql.

Once you are in psql you can check that indeed our user & database have been created:

```bash
psql -h localhost -p 54321 -U taiga
# To list the users defined in our system use the following command
> \du
# To list the databases, the command is
> \list
```

## What's next?

The next is to add RabbitMQ and the Taiga events plugged in.
