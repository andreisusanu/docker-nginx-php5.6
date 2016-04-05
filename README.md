[![](https://badge.imagelayers.io/andreisusanu/nginx-php5.6:latest.svg)](https://imagelayers.io/?images=andreisusanu/nginx-php5.6:latest)


nginx-php5.6
============

Docker image for Ubuntu Xenial, NGINX and PHP5.6.
Supervisor is used to start services (php5-fpm and nginx).


Build image
-----------

```bash
docker build -t andreisusanu/nginx-php5.6 .
```


Run container
-------------
```bash
docker run \
    --name nginx-php5.6 \
    -p 8000:80 \
    -v /path/to/local/www:/var/www/html \
    andreisusanu/nginx-php5.6
```

Test container
--------------
```bash
http://localhost:8000/
```


Run bash on container (for debug)
---------------------------------
```bash
docker exec -it nginx-php5.6 bash
```
