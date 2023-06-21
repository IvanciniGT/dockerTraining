docker container create \
    -v /home/ubuntu/environment/mydata/mariadb:/var/lib/mysql \
    -p 172.17.0.1:3307:3306 \
    -e MARIADB_ROOT_PASSWORD=password \
    -e MARIADB_DATABASE=database \
    -e MARIADB_USER=user \
    -e MARIADB_PASSWORD=password \
    --name mymariadb \
    mariadb:latest

docker container start mymariadb


