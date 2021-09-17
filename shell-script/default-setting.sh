#!/bin/bash
cat << END
Description : This Script is for the IstioStudy.
Usage       : For Install istio
OS          : amazon linux2
Author      : "sangwon lee" <lee2155507@gmail.com>

END
Istio1()
{
    cd /home/ec2-user/environment
    export testname=`$(date +%Y)-$(date +%m)-$(date +%d) $(date +%H):$(date +%M):$(date +%S)`
    touch $testname.txt
    mkdir istio-install 2>> /home/ec2-user/environment/error.txt
    if [[ "${?}" -ne 0 ]]
    then
        echo "istio Install Failed."
        exit 1
    fi
    cd /home/ec2-user/environment/istio-install
    echo "Install Istio latest version"
    curl -L https://istio.io/downloadIstio | sh -
    
    ls >  /home/ec2-user/environment/$testname.txt
    a=`cat /home/ec2-user/environment/$testname.txt/bin`
    cd $a
    pwd > pwdd.txt
    aa=`cat pwdd.txt`
    export PATH=$PATH:$aa
    echo "istioctl test"
    istioctl
}


Istio2()
{
    echo "Current namespace check"
    istioctl install -y
    echo "Updated namespace check"
    kubectl get ns 
    kubectl get pod -n istio-system 
    # https://github.com/GoogleCloudPlatform/microservices-demo/blob/master/release/kubernetes-manifests.yaml
    echo "Demo MSA : kubernetes-manifest "
    cd /home/ec2-user/environment/istio-install
    wget https://raw.githubusercontent.com/GoogleCloudPlatform/microservices-demo/master/release/kubernetes-manifests.yaml
    #kubectl apply -f kubernetes-manifests.yaml
    kubectl get ns default --show-labels
    # label none check
    kubectl label namespace default istio-injection=enabled
    sleep 5s
    kubectl apply -f kubernetes-manifests.yaml
    sleep 3m
    cd /home/ec2-user/environment/istio-install/istio-1.11.2
    kubectl apply -f samples/addons/
    sleem 10s
    echo "Check namespace istio-system Pods"
    kubectl get pods -n istio-system
    echo "Check namespace istio-system Services"
    kubectl get svc -n istio-system
    kubectl port-forward svc/kiali -n istio-system 8080:20001
}

Istio;
