# ft_server

Dockerfile that sets up an nginx server. It must run a Wordpress with a MySQL database and and PHPMyAdmin.

## Final grade : 100/100

Mandatory part : 100/100

### How to use it

Make sure Docker Desktop is running and you are in the ft_server directory.

To build the docker image, run :

```
docker build -t server .
```

The image is now created. To start an instance of it, run :

```
docker run -p 80:80 -p 443:443 -d server
```

### What now ?

You should now be able to access the Wordpress at the address https://localhost.

The different services are accessible at https://localhost/wordpress and https://localhost/phpmyadmin.
