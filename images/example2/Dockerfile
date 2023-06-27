# Start from the latest nginx image
FROM bitnami/git AS GIT_CONTAINER
RUN git clone https://github.com/IvanciniGT/webEjemploAnsible.git /mysite
RUN rm -rf /mysite/.git

FROM nginx:latest
RUN rm -rf /usr/share/nginx/html
COPY --from=GIT_CONTAINER /mysite /usr/share/nginx/html
# This container is the one commited to an image
