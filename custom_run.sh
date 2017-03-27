#!/bin/bash

ruby /tmp/sumo-sources-parser.rb '/tmp/sumo/**/*.json*' /tmp/sumo-sources.json.tmpl

source <(psa-client) && env | grep SUMO

psa-client -s param-api:8080

env | grep SUMO

./run.sh
