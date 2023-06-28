## MultiStage Dockerfile

# Start from the latest nginx image
FROM bitnami/git AS GIT_CONTAINER
# https://github.com/IvanciniGT/webEjemploAnsible.git
ARG REPOSITORY
# An argument is kind an environment var:
# - We can user the argument as an env var
# - But... the arg in not going to be persisted to the final IMAGE
# We can supply its value when calling the build command.

RUN git clone $REPOSITORY /app
RUN rm -rf /app/.git


FROM node:latest AS NODE_CONTAINER
COPY --from=GIT_CONTAINER /app /app
RUN cd /app/proyectos/aplicacion && npm install
RUN cd /app/proyectos/aplicacion && npm run build


FROM nginx:latest
RUN rm -rf /usr/share/nginx/html
COPY --from=NODE_CONTAINER /app/proyectos/aplicacion/build/ /usr/share/nginx/html/
# This container is the one commited to an image
LABEL NGINX_VERSION=1.21.1
LABEL maintainer="Ivan Osuna <ivan.osuna.ayuste@gmail.com>"

# This is decrecated... The above option (label) should be used
#MAINTAINER Ivan Osuna <ivan.osuna.ayuste@gmail.com>

HEALTHCHECK --interval=10s \
            --start-period=30s \
            --timeout=5s \
            --retries=3 \
            CMD curl http://localhost:81/ 

