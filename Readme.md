# Quick and dirty buf for ARM

This is a try to build the buf command line tool for arm 32b environment.

**Please don't use it on production.**

To build directly on an ARM environment :

```bash
docker build -t <your image name> .
```

To build on a multi platform via Docker buildx :

```bash
docker buildx build --platform linux/arm/v7 -t <your image name> --push [--progress=plain] .
```

A prebuilt image for is available on docker hub at [vsellier/buf](https://hub.docker.com/r/vsellier/buf).
