#!/usr/bin/env bash

printf "\n\n######## Deploying Quarkus Petclinic ########\n"

# create network policy to allow traffic from ingress to app
kubectl apply -f src/main/kubernetes/allow-ingress-to-app.yml

# deploy postgresql
kubectl apply -f src/main/kubernetes/pgsql.yml
kubectl wait --for=condition=available --timeout=60s deployment/postgresql

# deploy petclinic app
kubectl apply -f src/main/kubernetes/deployment.yml
kubectl wait --for=condition=available --timeout=60s deployment/quarkus-petclinic

# create a route to access the app
kubectl apply -f src/main/kubernetes/ocp-route.yml
