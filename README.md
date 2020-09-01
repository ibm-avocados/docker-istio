# docker istio

## Scope

A simple docker container that has everything required for istio to run on the IBM Cloud.

## Usage

Run via a `docker` `ENTRYPOINT` check: <https://phoenixnap.com/kb/docker-cmd-vs-entrypoint> if you are wondering why.

**EXAMPLE**:
```bash
docker run jjasghar/docker-istio:latest "APIKEY" "k8s.asgharlabs.io" "default"
```
