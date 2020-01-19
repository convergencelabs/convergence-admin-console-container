<div align="center">
  <img  alt="Convergence Logo" height="80" src="https://convergence.io/assets/img/convergence-logo.png" >
</div>

# Convergence Admin Console Docker Container
[![Build Status](https://travis-ci.org/convergencelabs/convergence-admin-console-container.svg?branch=master)](https://travis-ci.org/convergencelabs/convergence-admin-console-container)

This repository builds the official Docker Container for the [Convergence Admin Console](https://github.com/convergencelabs/convergence-admin-console). The project obtains the Convergence Admin Console distribution using npm.  To change the version of the Convergence Admin Console edit the [src/package.json](src/package.json) file.

The container is based off of the [nginx apline continer](https://hub.docker.com/_/nginx). The container uses [confd](https://github.com/kelseyhightower/confd) to write the javascript configuration file based on environment variables passed to the container.

# Running
The container requires three environment variables to be set to run properly:

- `CONVERGENCE_CONSOLE_BASE_URL`: The context url that the Convergence Admin Console will be served from.  For example, if the url will be `https://www.example.com/console/`, then this environment variable should be set to "console/". 
- `CONVERGENCE_SERVER_REST_API`: The url to the Convergence Server REST API. 
- `CONVERGENCE_SERVER_REALTIME_API`: The url to the Convergence Server Realtime API.

An example docker run might look like this:

```shell script
docker run --rm \
  --publish 8000:80 \
  --env CONVERGENCE_CONSOLE_BASE_URL=/ \
  --env CONVERGENCE_SERVER_REST_API=http://localhost:8081/ \
  --env CONVERGENCE_SERVER_REALTIME_API=https://localhost:8080/ \
  convergencelabs/convergence-admin-console
```

A convenience script has been provided to run the container after it is build.  Simply use the following command:

```shell script
scripts/run.sh
```
# Building
There are several scripts that help build the project. To locally build the docker container use the following command:

```shell script
scripts/build.sh
```

This will build the container and tag it with the `convergencelabs/convergence-admin-console` tag.

If you wish to push to a different repository or use a different tag, re-tag the build using the `docker tag` command. For example:

```shell script
docker tag convergencelabs/convergence-admin-console myrepo.example.org/convergence-admin-console:latest
docker push myrepo.example.org/convergence-admin-console
```

To clean up the build use the following command:

```shell script
scripts/clean.sh
``` 


## Support
[Convergence Labs](https://convergencelabs.com) provides several different channels for support:

- Please use the [Discourse Forum](https://forum.convergence.io) for general and technical questions, so the whole community can benefit.
- For paid dedicated support or custom development services, [contact us](https://convergence.io/contact-sales/) directly.
- Email <support@convergencelabs.com> for all other inquiries.

## License
The Convergence Admin Console is licensed under the [GNU Public License v3](LICENSE) (GPLv3) license. Refer to the [LICENSE](LICENSE) for the specific terms and conditions of the license.

The Convergence Admin Console is also available under a Commercial License. If you are interested in a non-open source license please contact us at [Convergence Labs](https://convergencelabs.com).
 