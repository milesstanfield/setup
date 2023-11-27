#!/bin/sh

docker_compose_up_func() {
  warn "usage: dcstart postgres-shared"
  docker compose --file $DOCKER_COMPOSE_PATH up $1 --detach
}
alias dcstart=docker_compose_up_func

alias dc="docker compose --file $DOCKER_COMPOSE_PATH $@"
alias dcprune="docker system prune"
alias dcpruneall="docker system prune -a"
