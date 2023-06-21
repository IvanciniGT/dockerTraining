docker container create \
    -v /home/ubuntu/environment/mydata/wordpress:/var/www/html \
    -p 8080:80 \
    -e WORDPRESS_DB_NAME=database \
    -e WORDPRESS_DB_USER=user \
    -e WORDPRESS_DB_PASSWORD=password \
    -e WORDPRESS_DB_HOST=172.17.0.1:3307 \
    --name mywordpress \
    wordpress:latest

docker container start mywordpress
