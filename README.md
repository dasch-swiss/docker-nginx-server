# docker-nginx-server
Custom Nginx docker image allowing configuration through environment variables and can be used to deploy SPAs.

## Environment Variables

- `NGINX_PORT`: port on which the server listens (default: `4200`)
- `NGINX_HTML_PATH`: directory from which files are served (default: `/public`)
