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
}
Istio;