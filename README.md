# Drupal 8 Development Kit

```
  ___   ___          _           
 |   \ ( _ ) ___  __| | ___ __ __
 | |) |/ _ \|___|/ _` |/ -_)\ V /
 |___/ \___/     \__,_|\___| \_/ 
                                 
```

## Quick start

First, you need to have a [Docker and Docker Compose](https://www.docker.com/) installed.

For OS X users I would also recommend to have a [docker-machine-nfs](https://github.com/adlogix/docker-machine-nfs/).

```bash
docker-compose up
```

That's all! You'll end up running with a fresh Drupal 8 installation at [http://localhost:8000](http://localhost:8000).
The administrator login is **admin**, password is **password**. Your Drupal files will be accessible at `data/htdocs`.

The phpMyAdmin is accessible at [http://localhost:8001](http://localhost:8001). The administrator login is **root**, password is **password**.

### Recreating containers

Sometimes you may want to remove existing containers and re-run everything from scratch. To do this, run:

```bash
docker-compose stop
docker-compose rm -f
```

This will stop and remove any existing containers.
Note that your data is still in the `data` folder.

