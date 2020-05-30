# cloud-native-todo-list
This application is a very simple todo list app. However this is more that a simple 
Todo List app..... It is a Cloud Native Todo List!!!. In this application I show you 
how Istio can help you to make a microservice application cloud native with services 
written in any language that you want maintaining tracing, logging and so on. 

At the moment tracing is guaranteed by Istio itself, let get started!

## installation
First of all you need fo three things: kubernetes, istio and an envoy proxy for publish on your localhost the cluster.

* docker installation 
* kubernetes installation: pheraps the best thing is use a minikube installation [following this link](https://kubernetes.io/docs/setup/learning-environment/minikube/) you can get all information about!
    * assuming that minikube was your choice now you have to start a new minikube instance you can do that with this command: ```minikube start --memory xxxx --cpus xxx --driver virtualbox --disk-size=xxxg  --profile istio ```
    * if your minikube installation does not have ingress enabled type this command:  ```minikube addons enable ingress --profile istio ```
* install istio 
    * on linux: ```curl -L https://istio.io/downloadIstio | sh -``` otherwise checkout the [official page](https://istio.io/docs/setup/getting-started/#download) and follow the instructions
    * un package the tar
    * Put ```export PATH=$PWD/bin:$PATH``` in your permanent environment
    * type teh command ```istioctl manifest apply --set profile=demo```
*  get the minikube ip with the command ```minikube ip --profile istio``` and put the value in the ${MINIKUBE_IP} placeholder in envoy.yaml file under `docker/envoy` folder

## build local image eligible to minikube
```bash

eval $(minikube --profile istio docker-env)

docker build --tag mrflick72/todo-list-website:latest .
docker build --tag mrflick72/todo-service:latest .

```

## inject envoy proxy for istio
```bash
istioctl kube-inject -f infrastructure.yml | kubectl apply -f -
istioctl kube-inject -f keycloak.yml | kubectl apply -f -
istioctl kube-inject -f todo-list-website.yml | kubectl apply -f -
istioctl kube-inject -f todo-service.yml | kubectl apply -f -

```
