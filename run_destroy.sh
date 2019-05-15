#!/usr/bin/env bash

kubectl delete -f wordpress.yaml
kubectl delete -f mysql.yaml
kubectl delete -f wordpress-service.yaml
kubectl delete -f mysql-service.yaml
kubectl delete -f contentful-service.yaml
kubectl delete -f contentful.yaml




kubectl delete pvc wordpress-volumeclaim
kubectl delete pvc contentful-volumeclaim
kubectl delete pvc mysql-volumeclaim