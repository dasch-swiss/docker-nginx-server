FROM nginx:1.15

LABEL maintainer="ivan.subotic@unibas.ch"

ENV NGINX_PORT 4200

## Copy nginx config template
COPY config.template /etc/nginx/conf.d/config.template

## Move default nginx website
RUN mv /usr/share/nginx/html /public

CMD /bin/bash -c "envsubst '\$NGINX_PORT' < /etc/nginx/conf.d/config.template > /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"
