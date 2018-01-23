# xl-docker-demo-xlr

Docker image that has XLR installed.

## CI status

[![Docker Hub][xl-docker-demo-xlr-docker-hub-image] ][xl-docker-demo-xlr-docker-hub-url]
[![License: MIT][xl-docker-demo-xlr-license-image] ][xl-docker-demo-xlr-license-url]


[xl-docker-demo-xlr-docker-hub-image]: https://img.shields.io/badge/docker-ready-blue.svg
[xl-docker-demo-xlr-docker-hub-url]: https://registry.hub.docker.com/u/xebialabs/xl-docker-demo-xlr/
[xl-docker-demo-xlr-license-image]: https://img.shields.io/badge/License-MIT-yellow.svg
[xl-docker-demo-xlr-license-url]: https://opensource.org/licenses/MIT


## Supported tags

* `latest`, `v7.5.0.2`
* `v7.5.0.1`
* `v7.2.0.2`
* `v7.2.0.1`
* `v7.1.0.1`
* `v7.0.1.1`
* `v7.0.0.1`
* `v7.0.0.0-alpha3`
* `v7.0.0.0-alpha1`
* `v6.2.0.1`
* `v6.1.0.1`
* `v6.0.0.1`
* `v5.0.1.3`

## Starting

### Running an empty XL Release with the repository stored inside the docker container

```
docker run -v ~/xl-licenses:/license -p 15516:5516 xebialabs/xl-docker-demo-xlr
```

### Running an empty XL Release with the repository stored outside the docker container as a volume

```
docker run --rm -v [repo_location]:/opt/xlr/server/repository -v [archive_location]:/opt/xlr/server/archive -v ~/xl-licenses:/license -p 5516:5516 xebialabs/xl-docker-demo-xlr
```

**NOTE**: When starting the container the **repository** and the **archive** should be empty or have been initialized at the same time

The license volume mount is needed to provide a valid license, or store a license when logging in the first time. To access the UI, browse to http://[docker_ip]:5516

## Extending this image

If you're creating an image based on this image as a parent, know that you can add a config fragment (i.e. `myapp.conf`) to the `/etc/supervisor/conf.d` directory, see the supervisor docs [here](http://supervisord.org/configuration.html#include-section-settings). That will allow you to add your own programs to supervisor without having to override (copy/paste) the entire file.


