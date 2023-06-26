# Container

Isolated environment within a Linux OS where we can execute process... a number of process

Isolated environment:
- Own network configuration -> own IP
- Own fileSystem
- Own env vars
- May have limits when trying to access physical resources of the host

A container is created from a container image.

Can an OS be installed inside a container? no
Why? When working with container, there is just 1 single OS Kernel... the one in the host

    

# Container image

It is just a simple compressed file (tar), containing:
- a folder structure compatible with POSIX standard

    etc/        app settings
    home/       user data
    opt/        app (here is where we install software)
    tmp/        temporary files
    vars/       app data
    bin/        Commands

- bin/.   a bunch os preinstalled common commands
- An app (or even several apps) already installed 

This file comes also with several metadata:
- Name
- Ports that the app already installed TENDS to open
- Env vars default values
- Paths where the app TENDS to store its data (VOLUMES)
- The DEFAULT command to be executed when a container created from this image is started

Where... how are container images distributed?
Thru "container image repository registries", such as:
- Docker hub
- Quay.io           REDHAT's one
- Companies usually have their own registries
- Github or Gitlab allows to act as a registry too.


    We have all these Ubuntu, Fedora, Alpine, Debian images
        They just contain the folder structure an few common commands
        
        Alpine:
            bin/ 
                mkdir
                cd
                chmod
                sh
                cp
                mv
                cat
                ...
                50 commands
        Ubuntu:
            bin/
                same as alpine
                + bash
                + apt  
                + apt-get
        Fedora:
            bin/
                same as alpine
                + bash
                + yum
                + dnf
    
    We usually use these images as a basement to create our custom images.
    
How is a container image identified? 

By its name?
And what's that name? It is a bit more complex.

Each image has an internal ID... something like: 19283478148907198362132890123ADBCFF382398723H
For sure whe cannot use that for identifing the image

We can TAG images INSIDE A repo BELONGING A registry

So, we can refer to an image thru:
    registry_url        /       repo        :       tag
    ^
    docker hub                  nginx               
    quay.io                     mariadb
    
    If you don't specify a tag.... docker , by default tries to pull the "latest" tag
    If you don't specify a registry, docker (or your container manager) will try to pull the image from 
    the list of preconfigured registries in your host

TAGS usually follow a common structure

- But also they may contain additional info:
    - base image (alpine, oraclelinux, ubuntu, debian)
    - additional software installed: nginx-perl
    - httpd-1.5.6-php
    - httpd-1.5.6
- They contains somehow the VERSION of the software installed 
    nginx:1.22.1            < This means this actual version... version 1.22.1
          1.22              < The latest 1.22       ... Today that may be 1.22.0... In a couple of months 1.22.1
          1                 < The latest 1              1.0.1               1.9.0
          latest
            Most people belive that latest is kind a magic word in docker.... It is not ... it is just another tag.

            stable
            nightly

    1 image may have multiple tags
    
    When I upload a new Image... let's say containin version 1.2.3
    Which tags am I going to apply to that image? 1.2.3 + 1.2 + 1 + latest
    
    Actually... in a production environment which tag should be used?
    
    1.2.3. ---> maybe today 1.2.3 and for sure tomorrow is gonna be 1.2.3
                    No... What if they have fixed some bugs.... I want that 
    1.2         PERFECT FOR PROD ENV
    1      ---> maybe today ponts to 1.2.3  ---> 1.6.0
                    Here I would receive new functionality... but may come with new bugs
    latest ---> maybe today points to version 1.2.3... -> 2.0.0
    
    
    
    ---

Software versions
    version is 1.2.3
    
                    When are they increased
                    
    MAJOR = 1       When a change makes the new version incompatible with the previos one
                            ||
                        Remove functions
    MINOR = 2       New features
                    Or Deprecations
                        + may contains also fixes
    PATCH = 3       A bug fixed

---

# Docker

Whenever we want to deal with containers, we need a container manager

There are plenty: docker, crio, podman, containerd

Docker probably is the most famous one...

They started with all this.

We can install docker in any linux host.
Docker actually has 2 pieces of software:
    - a Server  <<< dockerd
    - a Client  <<< docker 
There is another clinet that we do really love... much more than docker... docker-compose 
Well... actually docker-compose is deprecated nowadays
It's been replaced by "docker compose" command


# docker client

The docker client allows us to perform operations aginst the docker daemon

The syntax of this command is extremely easy

$ docker    OBJECT_TYPE     VERB    <args>
            container       create  start   stop    restart     rm      list
            image           pull    rm      list
            volume
            network
            ...

                                            Almost any docker command has an alias (that is crazy)
## IMAGES

### List current pulled images

docker image list                           docker images

## pull an image

docker image pull IMAGE_REF                 docker pull IMAGE_REF

## Remove an image                          

docker image rm IMAGE_REF                   docker rmi IMAGE_REF

## CONTAINERS

### List current running containers

docker container list                       docker ps

### List all containers (running or not)    

docker container list --all                 docker ps --all

### Remove a container

docker container rm CONTAINER_NAME          docker rm CONTAINER_NAME  

### Create a container

docker container create <args> IMAGE_REF [COMMAND]

args:
    --name NAME                     If I don't specify a name... a random one is generated.... 
                                    We only want this if the container is going to be autoremoved
    --port, -p  IP:HOST_PORT:CONTAINER_PORT     That creates a port redirection in the host
                                                We expose the container port
    --volume, -v HOST_PATH:CONTAINER_PATH       A new layer is created in the container FS
                                                The host path is inyected (mounted) on top of the container layer
                                                So that every update on that path is actually stored in the HOST FS
    -e ENV_VAR_NAME=value           Set an environment var&value to the container
        Actual, we don't need to specify an IP
        But if we don't, "0.0.0.0" is used. That's the default IP value.
                That means every IP I have in my host
### Operate a container

docker container    start       CONTAINER_NAME
                    stop
                    restart

Each container has a default start command preconfigured

When you execute docker start ... that command is actually executed

This command is inherit by default from the docker image


### Extract data from a container

docker container inspect    CONTAINER NAME                  docker inspect CONATINER_NAME

### Execute another process in the container

docker container exec CONTAINER_NAME command


curl https://google.com


---

Where does that IP come from?

How many NICs has your personal computer
NIC? Network Interface CARD <<<< Physical Network card
- ETHERNET
- WIFI
- BLUETOOTH

How many Network Interfaces do you have?
Network Interface? It is a connection to a network

Each nic has 1 network interface?

                                                    logical connection to a network
NETWORK                         NIC                 NETWORK INTERFACE
Physical
    Your house network     < ----EthernetCard1 ---- ethernet network interface1 - IP1
                           < ----EthernetCard1 ---- ethernet network interface2 - IP2
                           < ---- Wifi adapter ---- wifi network interface
                           < ----ECard3 ----------- network interface - IP3
                           < ----ECard4 /
Virtual
    loopback               < ----------------------- network interface          - 127.0.0.1 < - NAME ASSOCIATED localhost

    Docker
        network1    172.17.0.0/16
        network2
        network3

----------------------------AMAZON NETWORK----------------------------------
   |                                                                |
   172.31.9.116:81  --->   172.17.0.2:80                            |
   |                                                                |
  IvanPC     NAT... port redirection                             YourPC
   |  |
   | 172.17.0.1
   |  |
   |  |-- 172.17.0.2 -- mynginx :80
   |  |                       |
   |  docker network          127.0.0.1
   |                          | loopback network
   |
   127.0.0.1:81  --->   172.17.0.2:80   < - localhost
   |
   | loopback
   
   
   
Node.   v16.20.0
        v12.0.0

Install node as a container ... and I can have 200 containers with differsions

reactJS ---> 3000

---

Why is not confortable (convinient) for me to work aginst the container IP
It is automatically generated.. and also... pseudoramdom