docker container create --name=MY_CONTAINER_NAME IMAGE_REF


docker container start MY_CONTAINER_NAME

docker container stop MY_CONTAINER_NAME

docker container rm MY_CONTAINER_NAME


## Docker run

Sometimes I want just to execute a container:
- Just to do a test
- Because the cointainer is not going to execute a service (daemon)... but a command
    - npm start
    - npm build

And I don't want to keep the container after that

docker run --rm  IMAGE_REF     # --name=MY_CONTAINER_NAME

    docker image pull IMAGE_REF
    docker container create  --name=MY_CONTAINER_NAME IMAGE_REF 
    docker container start MY_CONTAINER_NAME
    docker container attach MY_CONTAINER_NAME (Keep showing the logs)
    Once the container is stopped:
        docker container rm MY_CONTAINER_NAME
        
## Container's logs

Each process running in any operating system has 3 default communication channels:
- 0 stdin
- 1 stdout
- 2 stderr

Is the stdout & stderr channels of the main running process in the container


# Bitnami

Is the world leader in container images & kubernetes deployments in the world... 
and actually is a Spanish company