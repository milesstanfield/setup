#!/bin/sh

alias goprod="kubectl config use-context prod"
alias godev="kubectl config use-context non-prod"
alias namespaces="ave cr-stage-dev kubectl get namespace"
alias prodnamespaces="ave cr-prod-lead kubectl get namespace"

pods_func() {
  ave cr-stage-dev kubectl -n "$1" get pods
}
alias pods='pods_func'

prodpods_func() {
  ave cr-prod-lead kubectl -n "$1" get pods
}
alias prodpods='prodpods_func'

poddescribe_func() {
  warn "example: poddescribe staging messenger-staging"
  ave cr-stage-dev kubectl -n "$1" describe pod "$2"
}
alias poddescribe='poddescribe_func'

prodpoddescribe_func() {
  warn "example: prodpoddescribe prod dash-prod"
  ave cr-prod-lead kubectl -n "$1" describe pod "$2"
}
alias prodpoddescribe='prodpoddescribe_func'

podlog_func() {
  warn "example: podlog staging messenger-staging-messenger-web-5f86b785b4-x979b"
  ave cr-stage-dev kubectl -n "$1" logs "$2"
}
alias podlog='podlog_func'

prodpodlog_func() {
  warn "example: prodpodlog prod messenger-prod-messenger-web-5f86b785b4-x979b"
  ave cr-prod-lead kubectl -n "$1" logs "$2"
}
alias prodpodlog='prodpodlog_func'

releases_func() {
  ave cr-stage-admin helm list -n "$1"
}
alias releases='releases_func'

prodreleases_func() {
  ave cr-prod-lead helm list -n "$1"
}
alias prodreleases='prodreleases_func'

poddeploys_func() {
  warn "example: poddeploys staging dash-nonprod"
  warn "example: poddeploys staging mercury-staging"
  ave cr-stage-admin helm -n "$1" history "$2"
}
alias poddeploys='poddeploys_func'

prodpoddeploys_func() {
  warn "example: prodpoddeploys prod dash-prod"
  ave cr-prod-lead helm -n "$1" history "$2"
}
alias prodpoddeploys='prodpoddeploys_func'

podrollback_func() {
  warn "example: podrollback staging dash-nonprod 12"
  warn "example: podrollback staging mercury-staging 12"
  ave cr-stage-admin helm rollback "$2" "$3" -n "$1"
}
alias podrollback='podrollback_func'

prodpodrollback_func() {
  warn "example: prodpodrollback prod dash-prod 12"
  ave cr-prod-lead helm rollback "$2" "$3" -n "$1"
}
alias prodpodrollback='prodpodrollback_func'

poddelete_func() {
  ave cr-stage-dev kubectl delete pods "$2" -n "$1"
}
alias poddelete='poddelete_func'

prodpoddelete_func() {
  ave cr-prod-lead kubectl delete pods "$2" -n "$1"
}
alias prodpoddelete='prodpoddelete_func'

poduninstall_func() {
  ave cr-stage-admin helm -n "$1" uninstall "$2"
}
alias poduninstall='poduninstall_func'

podinstall_func() {
  warn "example: podinstall messenger 0.1.0 config/helm/non-prod/staging.yaml"
  ave cr-stage-admin helm ssm install $1-staging callrail/$1 -n staging --version $2 -f $3
}
alias podinstall='podinstall_func'
