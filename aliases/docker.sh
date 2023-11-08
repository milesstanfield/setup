#!/bin/sh

docker_compose_up_func() {
  warn "usage: dcstart postgres-shared"
  docker compose --file ~/code/setup/docker/docker-compose.yml up $1 --detach
}
alias dcstart=docker_compose_up_func

docker_compose_func() {
  docker compose --file ~/code/setup/docker/docker-compose.yml $@
}
alias dc=docker_compose_func

alias dc_prune="docker system prune"
alias dc_prune_all="docker system prune -a"
