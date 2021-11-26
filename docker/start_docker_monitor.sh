#!/bin/bash
set -x

# do not forget to check the RPC_URL in env-template
# for standalone docker image, use forno 
# for docker-compose stack, localhost:8545 works

docker run --rm --name celo-network-monitor \
--env-file ../env-template \
--mount type=bind,source=$HOME/celo-network-monitor/addresses.baklava.yaml,target=/opt/monitor/addresses.baklava.yaml,ro \
-p 8080:8080 \
-it \
celo-network-monitor:latest

# curl the container host on tcp/8080 to trigger the monitor manually
# eg `curl -v 'http://localhost:8080`
