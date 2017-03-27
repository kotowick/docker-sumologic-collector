FROM sumologic/collector:latest-file

LABEL maintainer "info@speko.io"

RUN apt-get update

RUN apt-get install ruby vim curl -y

RUN $(curl -o /usr/local/psa-client -LOk `curl --silent https://api.github.com/repos/kotowick/go-aws-param-store-api-client/releases/latest | /usr/bin/awk '/browser_download_url/ { print $2 }' | /bin/sed 's/"//g'`)

ADD ./sumo-sources-parser.rb /tmp

ENTRYPOINT ruby /tmp/sumo-sources-parser.rb '/tmp/sumo/**/*.json*' /tmp/sumo-sources.json.tmpl && /bin/bash /run.sh
