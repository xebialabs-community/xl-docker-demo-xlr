# xl-docker-demo-xlr #

Docker image that has XLR installed.

# Supported tags #

* `latest`, `v5.0.1.2`

# Starting #

```
docker run -v ~/xl-license:/license -p 5516:5516 xebialabs/xl-docker-demo-xlr
```

The license volume mount is needed to provide a valid license, or store a license when logging in the first time. To access the UI, browse to http://[docker_ip]:5516
