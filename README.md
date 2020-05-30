# cloud-native-todo-list


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
