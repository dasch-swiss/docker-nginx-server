# docker-nginx-server
Custom Nginx docker image allowing configuration through environment variables and can be used to deploy SPAs.

## Changes to base Nginx server

- Environment variable `NGINX_PORT`: port on which the server listens (default: `4200`)
- `/public`: default directory from which files are served

## Rebuilding released docker image
Released docker images can be rebuilt and updated by manually triggering the CI workflow: Actions -> CI -> Run workflow -> Select release tag as branch -> Run Workflow. This builds the image from the same source as the release, but updates the installed apt packages. The new release is tagged with the same version appended with `-<build_nr>`, e.g., `v1.0.1-123`.
