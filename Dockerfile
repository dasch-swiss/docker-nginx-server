FROM nginx:1.23.2

LABEL maintainer="400790+subotic@users.noreply.github.com"

ENV NGINX_PORT 4200

## Update packages
RUN apt-get update && apt-get -y upgrade && rm -rf /var/lib/apt/lists/*

## Copy nginx config template
COPY config.template /etc/nginx/conf.d/config.template

## Move default nginx website
RUN mv /usr/share/nginx/html /public

CMD /bin/bash -c "envsubst '\$NGINX_PORT' < /etc/nginx/conf.d/config.template > /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"
