# xl-docker-demo-xlr #

Docker image that has XLR installed.

# CI status #

[![Docker Hub][xl-docker-demo-xlr-docker-hub-image] ][xl-docker-demo-xlr-docker-hub-url]
[![License: MIT][xl-docker-demo-xlr-license-image] ][xl-docker-demo-xlr-license-url]


[xl-docker-demo-xlr-docker-hub-image]: https://img.shields.io/badge/docker-ready-blue.svg
[xl-docker-demo-xlr-docker-hub-url]: https://registry.hub.docker.com/u/xebialabs/xl-docker-demo-xld/
[xl-docker-demo-xlr-license-image]: https://img.shields.io/badge/License-MIT-yellow.svg
[xl-docker-demo-xlr-license-url]: https://opensource.org/licenses/MIT


# Supported tags #

* `latest`, `v7.0.1.1`
* `v7.0.0.1`
* `v7.0.0.0-alpha3`
* `v7.0.0.0-alpha1`
* `v6.2.0.1`
* `v6.1.0.1`
* `v6.0.0.1`
* `v5.0.1.3`

# Starting #

```
docker run -v ~/xl-license:/license -p 15516:5516 xebialabs/xl-docker-demo-xlr
```

The license volume mount is needed to provide a valid license, or store a license when logging in the first time. To access the UI, browse to http://[docker_ip]:5516
