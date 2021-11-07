# Istio Example BookInfo Summary

```
Kubectl label namespace default istio-injection=enabled
명령어를 통해Istio가 Envoy 사이드카 Proxy를 자동으로 삽입하도록 한다.
```
![image](https://user-images.githubusercontent.com/50174803/140646959-1113bd51-1783-4631-b671-76befd0722b7.png)
![image](https://user-images.githubusercontent.com/50174803/140646969-71b11ca7-6d48-46d0-98ea-0c8d6838801a.png)

## 구성도 
![image](https://user-images.githubusercontent.com/50174803/140646973-6c646f7b-1387-4a1f-8d1d-0d2a1749c4fd.png)
```
Productpage : Review, Detail 마이크로서비스로부터 데이터를 받아와서 FE 제공
Details : book 정보 제공
Reviews : book review 정보 제공 & 내부적으로 Ratings 마이크로서비스 호출
Ratings : book review와 book 등급 정보 제공
Reviews-v1 : Ratings 서비스를 호출하지 않는다.
Reviews-v2 : Ratings 서비스를 호출하고, 등급을 검은 색 별표로 표시
Reviews-v3 : Ratings 서비스를 호출하고, 등급을 빨간 색 별표로 표시
```

## 클러스터에 배포 
```
Kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml
명령어로 BookInfo 서비스를 EKS 클러스터에 배포함.

Pod 내에 Envoy Proxy 사이드카가 생성되어 하나의 파드에 컨테이너가 2개 돌아간다.
```
![image](https://user-images.githubusercontent.com/50174803/140647034-10266501-6553-46df-bc74-4bcab6ba312d.png)

## Request Routing
```
Istio Ingress Gateway를 사용하여, 서비스를 노출할 수 있다.
Gateway는 광범위한 사용자 정의 및 유연성을 제공한다.
또한 모니터링 및 라우팅 규칙 같은 기능을 통해 클러스터로 들어오는 트래픽에 적용할 수 있다.
```

![image](https://user-images.githubusercontent.com/50174803/140647153-3aa47266-bf42-44bc-a68e-a795a7eda7f6.png)

## Istio Gateway 적용
```
80 Port로 서비스되는 GW를 만들고, VirtualService 설정으로 정의된 Path 로 
들어오는 요청을 productService:9080 에서 서비스 되도록 한다.
```
![image](https://user-images.githubusercontent.com/50174803/140647750-efb0778c-c208-4f4e-98e0-121cd6d3e4f6.png)
![image](https://user-images.githubusercontent.com/50174803/140647806-dc5f658a-fbdd-4a2e-b4d8-2aa95239837e.png)


