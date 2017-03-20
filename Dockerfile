FROM sumologic/collector:latest-file

RUN apt-get update

RUN apt-get install ruby vim -y

ADD ./sumo-sources-parser.rb /tmp

ENTRYPOINT ruby /tmp/sumo-sources-parser.rb '/tmp/sumo/**/*.json*' /tmp/sumo-sources.json.tmpl && /bin/bash /run.sh
