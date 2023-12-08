#!/bin/sh

alias goprod="kubectl config use-context prod"
alias godev="kubectl config use-context non-prod"
alias pods='_pods() { ave cr-stage-dev kubectl -n "$1" get pods }; _pods'
alias prodpods='_prodpods() { ave cr-prod-lead kubectl -n "$1" get pods }; _prodpods'
alias poddescribe='_poddescribe() { ave cr-stage-dev kubectl -n "$1" describe pod "$2" }; _poddescribe'
alias prodpoddescribe='_prodpoddescribe() { ave cr-prod-lead kubectl -n "$1" describe pod "$2" }; _prodpoddescribe'
alias podlog='_podlog() { ave cr-stage-dev kubectl -n "$1" logs "$2" }; _podlog'
alias prodpodlog='_prodpodlog() { ave cr-prod-lead kubectl -n "$1" logs "$2" }; _prodpodlog'
alias namespaces="ave cr-stage-dev kubectl get namespace"
alias prodnamespaces="ave cr-prod-lead kubectl get namespace"
alias releases='_releases1() { ave cr-stage-admin helm list -n "$1" }; _releases1'
alias prodreleases='_prodreleases() { ave cr-prod-lead helm list -n "$1" }; _prodreleases'
alias poddeploys='_poddeploys() { ave cr-stage-admin helm -n "$1" history "$2" }; _poddeploys'
alias prodpoddeploys='_prodpoddeploys() { ave cr-prod-lead helm -n "$1" history "$2" }; _prodpoddeploys'
alias podrollback='_podrollback() { ave cr-stage-admin helm rollback "$2" "$3" -n "$1" }; _podrollback'
alias prodpodrollback='_prodpodrollback() { ave cr-prod-lead helm rollback "$2" "$3" -n "$1" }; _prodpodrollback'
alias poddelete='_poddelete() { ave cr-stage-dev kubectl delete pods "$2" -n "$1" }; _poddelete'
alias prodpoddelete='_prodpoddelete() { ave cr-prod-lead kubectl delete pods "$2" -n "$1" }; _prodpoddelete'
alias poduninstall='_poduninstall3() { ave cr-stage-admin helm -n "$1" uninstall "$2" }; _poduninstall3'
alias podinstall='echo "ave cr-stage-admin helm ssm install <service>-nonprod callrail/<service> -n <namespace> -f config/helm/staging.yaml"'
