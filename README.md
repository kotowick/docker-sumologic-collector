# docker-sumologic-collector

**Summary:**
```
Combine multiple `sumo-source json files` from each Docker container (specificied by `--volume-from`)
Output the combined-data to /tmp/sumo-sources.json.tmpl
```

This project is based off of the SumoLogic Collector image:

```
  - [Dockerhub](https://hub.docker.com/r/sumologic/collector/)
  - [GitHub](github.com/sumoLogic/sumologic-collector-docker/)
```

## Usage

For each image you want to integrate with this SumoLogic version, add the following to your `Dockerfile`:

```
RUN mkdir /tmp/sumo/YOUR_APP_NAME
ADD ./sumo-sources.json.tmpl /tmp/sumo/YOUR_APP_NAME
VOLUME /tmp/sumo/YOUR_APP_NAME
```

## Customization

```
1. git clone git@github.com:kotowick/docker-sumologic-collector.git # clone the repo
2. Modify the Dockerfile
3. docker build . -t YOUR_OWN_IMAGE:TAG # build the image
```

## Notes

1. [Container Scenarios](https://github.com/kotowick/docker-sumologic-collector/wiki/Container-Scenarios)
2. [Usage Eamples](https://github.com/kotowick/docker-sumologic-collector/wiki/Examples)
