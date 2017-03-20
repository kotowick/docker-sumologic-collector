# docker-sumologic-collector

This project is based off of the SumoLogic Collector image:

  - [Dockerhub](https://hub.docker.com/r/sumologic/collector/)
  - [GitHub](github.com/sumoLogic/sumologic-collector-docker/)
 
With this image version, you can mount volumes from other containers (required volume path: /tmp/sumo/<your-app>/) you `/tmp/sumo/`. It then combines the `soures` from each `sumo-source file` under `/tmp/sumo` and writes it to `/tmp/sumo-sources.json.tmpl`.

See the example below.

## Installation

Pull the image:

```
docker pull kotowick/sumologic-collector:latest-file
```

## Customize your own build

1. *Clone this repo:*

```
git clone git@github.com:kotowick/docker-sumologic-collector.git
```

2. *Modify the Dockerfile*

3. *Build the Image*

```
docker build . -t <your-docker-image-tag>
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
