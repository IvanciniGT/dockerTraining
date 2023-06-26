# Volumes

## What are volumes useful for?

- Store persitent data
- Inject my custom files overriding the image ones. (Configure the container)

    > nginx <- /etc/nginx/nginx.conf <- ./my_custom_nginx.conf

- Share information between containers
 docker container create --name mycontainer artefactos.iochannel.tech/ivancinigt/iochannel-ssh-container:0.0.1

---

# Create custom image. Procedure 1. WE NEVER USE THIS PROCEDURE

Step1: Create a new container from a base image
Step2: Update the container:
    - Copy files from/to the container
    - Install software inside the container
    - Execute commandas... mkdir touch...
Step3: Extract (compress) a new image from that running container
        docker commit CONTAINER_NAME
Step4: Tag that image
        docker image tag IMAGE_ID IMAGE_REPO:TAG
    
    WE NEVER USE THIS PROCEDURE: Almost all the work was done manually!
    
# Create custom image. Procedure 2. THIS IS THE GOOD ONE

Step1: Define a container image creation script inside a Dockerfile
Step2: User docker build to create a new image by processing this Dockerfile


npm install # -> download dependencies
npm run     # ---> this is ok for starting a dev server...
npm build   # ----> this generates a folder containing:
- My scripts packed and minified        |
- All my asserts                        |
                                        v
                                This is my artifact...
Where do I have to put that folder inside a prod env? IIS, nginx, apache httpd

Do I need node in the prod env?  NO....
We need that in the dev env...:
- To transpile from ts to js
- To lint my code
- To pack (build) the artifact
- To start a dev web server... to be serving during development our artifact

 