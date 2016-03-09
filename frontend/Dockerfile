FROM nginx
MAINTAINER Yves Dubromelle "yves+git@dubronetwork.fr"

COPY taiga-front-dist/dist /taiga
COPY conf.json /taiga/conf.json
COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx-default-vhost.conf /etc/nginx/conf.d/default.conf
