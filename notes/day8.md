In this example (REACT) we have been using containers for:
- To download and use Node to download dependencies, start a dev server, build the project
- We did create a custom container image, containing: (git --> nod --> nginx)
    - nginx
    - our production ready build
- Installing:
    - sonar
    - jenkins
- We were executing a pipeline in jenkins again using containers:
    - One for building the app
    - For sending the app to SonarQube

Most of this work was done thru docker-compose files


# Parameterizing Docker-compose files

Inside a docker-compose file we can use ${} to use variables

    image: ${REPO_NAME}:${IMAGE_TAG}

Docker interpret those as variables... Everything inside curly braces ${}

How can we populate the value of those vars:
- We can create a .env file... Docker will read that file automatically.
- We can create actually a file with anyother name: myvars
  In that case we will need to suply the path of that file to docker compose by using the --env-file argument
- If a varname is not found anywhere else: Docker will try to get its value from the environment variables

In addition...
- Inside the docker-compose file... we can use the tag env_file. This tag need to go inside a container definition.
    
    services:
        db:
            image: mariadb:latest
            environment:
                WORDPRESS_DB_NAME:      database
                WORDPRESS_DB_USER:      user
                WORDPRESS_DB_PASSWORD:  password
                WORDPRESS_DB_HOST:      mariadb:3306

    instead of that: We could have done this:
    
    services:
        db:
            image: mariadb:latest
            env_file:
                - mariadb.conf
                
    
    We should have in this case a file called: mariadb.conf with this content:
        WORDPRESS_DB_NAME=database
        WORDPRESS_DB_USER=user
        WORDPRESS_DB_PASSWORD=password
        WORDPRESS_DB_HOST=mariadb:3306
    
                
    
    
