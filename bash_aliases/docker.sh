#!/bin/sh

alias dcprune="docker system prune"
alias dcpruneall="docker system prune -a"

dcstart_fun() {
  docker compose --file ~/code/setup/docker/docker-compose.yml up $1 --detach
}
alias dcstart=dcstart_fun # dcstart postgres-shared

dc_fun() {
  docker compose --file ~/code/setup/docker/docker-compose.yml $@
}
alias dc=dc_fun
