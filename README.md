# docker-nginx-server
Custom Nginx docker image allowing configuration through environment variables and can be used to deploy SPAs.

## Changes to base Nginx server

- Environment variable `NGINX_PORT`: port on which the server listens (default: `4200`)
- `/public`: default directory from which files are served
