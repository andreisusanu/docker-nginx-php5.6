[![](https://badge.imagelayers.io/andreisusanu/nginx-php5.6:latest.svg)](https://imagelayers.io/?images=andreisusanu/nginx-php5.6:latest)


nginx-php5.6
============

Docker image for NGINX and PHP5.6, started using Supervisor.

Last stable NGINX installed from official stable repository (http://ppa.launchpad.net/nginx/stable/ubuntu)
Last PHP5.6 installed from Ondřej Surý's unofficial repository (http://ppa.launchpad.net/ondrej/php5/ubuntu)


Build
-----

```bash
docker build -t andreisusanu/nginx-php5.6 .
```


Run
-----
```bash
docker run \
    --name nginx-php5.6 \
    -p 80:80 \
    -v /path/to/local/www:/var/www/html \
    andreisusanu/nginx-php5.6
```