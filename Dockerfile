FROM nginx:1.15

LABEL maintainer="ivan.subotic@unibas.ch"

ENV NGINX_PORT 4200
ENV NGINX_HTML_PATH "/public"

RUN mkdir -p ${NGINX_HTML_PATH}

## Copy nginx config template
COPY config.template /etc/nginx/conf.d/
RUN /bin/bash -c "envsubst < /etc/nginx/conf.d/config.template > /etc/nginx/conf.d/default.conf"

## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

CMD ["nginx", "-g", "daemon off;"]
