#!/bin/sh

alias dcprune="docker system prune"
alias dcpruneall="docker system prune -a"

dcstart() {
  warn "usage: dcstart postgres-shared"
  docker compose --file ~/code/setup/docker/docker-compose.yml up $1 --detach
}

dc() {
  docker compose --file ~/code/setup/docker/docker-compose.yml $@
}
