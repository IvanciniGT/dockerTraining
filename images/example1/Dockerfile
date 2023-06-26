# This file defines an script to create images automatically

# Inside this file we can add comments, such as these ones

# This specifies the base image that we are going to use.
FROM ubuntu:latest

# This executes commands inside a new container that is going to be created from the base image
RUN apt update
RUN apt install nginx -y

# We use RUN to execute commands while generating the container image

# Now, what we want is that when a new container is created from this image... and when that container is started
# This this command gets executed.
CMD [ "nginx", "-g", "daemon off;" ]
# In order to process this file and... to actually create the image, we need to execute:
# docker build <PATH>
              # ^ where our Dockerfile is located
              
# $ docker build . -t my_custom_nginx:latest

RUN mkdir /mycustomsettings
COPY ./myfile.txt /mycustomsettings
     # host ->    # container
     # We cannot invert those... This is not like the docker cp command
     


# This allows to :
# 1. setup an env var that could be used during image generation
# 2. is going to export that env var to the final image (as a default value)
# Once a container is created from this image... The env var default lvalue is going to be inherit.
# For sure I can change that during container creation
ENV VAR_NAME=true

RUN echo $VAR_NAME
# METADATA

# Image I want to let final image users that the main process (nginx) running in a container created from this image
# Are going to open port 80 by default
EXPOSE 80
# That makes NOTHING but to inform final users.

# In order to inform users about the default path where nginx is going to read web pages from...
VOLUME ["/var/nginx"]
# This line does nothing but to inform final users






