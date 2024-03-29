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
    * type the command ```istioctl install --set profile=demo -y```

## build local image eligible to minikube
Pushing directly to the in-cluster Docker daemon (docker-env) [for more information](https://minikube.sigs.k8s.io/docs/handbook/pushing/#5-building-images-inside-of-minikube-using-ssh) 

in order to build docker image in the same docker registry type the following command:
```eval $(minikube --profile istio docker-env) ```

for build todo-list-website type ```make build``` in todo-list-website folder
while for build  todo-service folder and fire the follow command ```docker build --tag mrflick72/todo-service:latest .```
 
keep in mind that all the command should run in the same shell in which the command ```eval $(minikube --profile istio docker-env) ``` is executed

Another thing to do is add the minikube ip linked to the local.todo-list.com dns name in your hosts file. In order to 
gain the correct minikube ip you can use the follow command ```minikube ip -p istio```

## inject envoy proxy for istio
in order to deploy all k8s yaml instrumented by istio execute the follow commands
PAY ATTENTION!!! in todo-list-website.yml there is a ${MINIKUBE_IP} placeholder this have to replaced with ```minikube ip --profile istio``` value
```bash
istioctl kube-inject -f infrastructure.yml | kubectl apply -f -
istioctl kube-inject -f monitoring.yml | kubectl apply -f -
istioctl kube-inject -f keycloak.yml | kubectl apply -f -
istioctl kube-inject -f todo-list-website.yml | kubectl apply -f -
istioctl kube-inject -f todo-service.yml | kubectl apply -f -
```

## Istio goodies
Now that the app is up and running in order to explore the power of istio even with only envoy proxy in place you can type the command:
```istioctl dashboard grafana```
```istioctl dashboard kiali```
```istioctl dashboard jaeger```
and automatically you can start to explore:
* On grafana how so many metrics out of the box you can leverage by the platform
* On jaeger how even without the powerful spring cloud sleuth used on the website, you can leverage of distributed tracing spanned from teh website to the service written in GO 
* On kiali the topological insight that istio can infer from the platform in order to manage your service mesh.

## Conclusion
Istio is a super powerful platform that can help you to manage your service mesh, in kubernetes or bare metal in a consistent way. 
That's all?......... no it is only the surface stay tuned soon other improvement and example of how leverage of Istio feature will come!
 
## contents

### kiali dashboard
![](images/kiali_1.png)
![](images/kiali_2.png)

### jeager dashboard!
![](images/jeager.png)
