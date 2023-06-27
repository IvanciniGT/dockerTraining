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

# HealthChecks

How does docker know whether a container is running or not?

It monitors that process with PID 1 inside the container.
While that process (the one being lanchued on the start phase) is running...
For docker the container is OK.

Once that process ends, the container will be in EXITED status
Docker will check the process EXIT_CODE:
- 0 : The container has done its jon and it just finnished OK
- >0: The container exited with an error.

## Is that enough?

Is it ok to assume that the container is OK if the process is still running? It is not

The process could be in an weird status.
- Deadlock

Imagine we have a webserver.
But the webserver did receive too many requests... and It's not responding.
Is that OK? 
Maybe the webserver is answering... but with an 500 return code.

http codes:

2XX SUCCESS
3XX REDIRECTION
4XX CLIENT_ERROR
5XX SERVER_ERROR


We don't use healthchecks that much... why?
They are not enough!

Docker is a tool that we are going to use in NON PRODUCTION ENVIRONMENTS

In docker ... we have a tool called Docker Swarm...
that allow to create a cluster of servers where we can deploy containers.

But nobody uses docker swarm.

Everybody use Kubernetes.
In kubernetes we have 3 different health check types!
And we can configure plenty of each 

- Startup probe
- Liveness probe
- Readyness probe

Imagine a Database: MariaDB
Maybe the database is going to require a bunch of time to start: 1 minute or 2.... 20 minutes

The DB at certain point is going to be able to receive queries / transactions... 

Imagine I configure a backup process in my database.
- I can configure that the database stops incomming connections
- While the backup is being performed

## Containers in a production environment

Containers are not enough
In production environment (actually in dev or test environments too) we use a different concept: Pods

- Docker
- ContainerD
- CRIO
- Podman **** Pod manager

# POD

In docker we don't have that concept. In kubernetes, podman... and other tools, we do have that concept.

A pod is a set of containers, that:
- Share network configuraation (IP)
    They can talk to each other by using the word: "LOCALHOST"
- They are going to be deployed TOGETHER (In the same host)
    - They are going to be able to SHARE LOCAL VOLUMES
- THEY ARE GOING TO SCALE AT THE SAME TIME... THE SAME WAY

PRODUCTION ENVIRONMENT
  CLUSTER of nginx

- HOST 1: nginx1.... app1
            log1 50 Kbs                    5/10
             v ^
            log2 50 Kbs
          fluentd | filebeat -------> KAFKA <--- logstash ------>
- nginx2.... app1                                               LOG REPOSITORY
    logs                                                            ElasticSearch 6/10.  < Kibana 
- nginx3.... app1
    logs
- nginx4.... app1
    logs        ------->
...
- nginx10... app1
    logs        ------->
- nginx11... app1
    logs        ------->
  fluentd 11 < SIDE-CAR CONTAINER

Why do we care about those logs?
- Look for errors / BE informed when a error is produced
- We can create a dashboard to show the actual number of visitors per country/city
- The pages that are currenty being accessed

