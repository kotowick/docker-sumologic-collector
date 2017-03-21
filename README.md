# docker-sumologic-collector

```
Additonal Feature:
------------------
Combine multiple `sumo-source json files` from each Docker container (specificied by `--volume-from`)
Output the combined-data to /tmp/sumo-sources.json.tmpl

This project is based off of the SumoLogic Collector image:

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

## Example

- docker container 1 
  - id: 4738595022..
  - app: nginx
  - volume: /tmp/sumo/nginx/ # REQUIRED
- docker container 2
  - id: 3749593030..
  - app: wordpress
  - volume: /tmp/sumo/wordpress/ # REQUIRED
 
```
docker run -e SUMO_SOURCES_JSON='/tmp/sumo-sources.json' --volumes-from 4738595022 --volumes-from 3749593030 -d kotowick/sumologic-collector:latest-file
```

```
Required Arguments:
-e SUMO_SOURCES_JSON='/tmp/sumo-sources.json'
--volumes-from (a container id)

Optional Arguments:
-e SUMO_COLLECTOR_NAME_PREFIX='' 
-e SUMO_CATEGORY='' 
-e SUMO_ACCESS_ID=''
-e SUMO_ACCESS_KEY='' 
```
