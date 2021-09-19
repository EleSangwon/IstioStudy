# What is Service Mesh ?

```
[ Service Mesh 란 ? ]

마이크로 서비스 간 통신을 안전하고, 빠르고 신뢰할 수 있게 만들기 위해 설계된 전용 인프라 계층이다.
애플리케이션 서비스에 경량화 프록시를 사이드카 방식으로 배치하여 서비스 간 통신을 제어한다.

[ 기능 ]

Service Discovery - 각 서비스 식별 
Load Balancing - 부하 분산
Dynamic Request Routing
Circuit Breaking - 전체 서비스의 장애 전파 차단
Retry and Timeout, TLS, Distributed Tracing
Metric 수집, Access Controll, A/B Testing

[ 필요한 이유 ]

MSA 시스템에서 수 많은 마이크로 서비스가 동작하기에 관리하기 복잡하다.
또한 인스턴스가 수행되는 네트워크 간의 레이턴시, 신뢰성, 안정성 등을 보장할 수 없다.

이러한 문제점을 애플리케이션 계층에서 해결하려면 애플리케이션 언어 및 런타임에 종속성이 생기고
기능 변경 시, 비용이 발생한다.

서비스 메쉬를 사용하면 마이크로 서비스를 운영할 때 별도의 소스 코드 수정 없이 
인프라 레벨에서 관리할 수 있다. 

```
# What is Istio ?

```
Istio 는 Service Mesh를 구현할 수 있는 오픈소스 솔루션


Istio를 사용하면 코드 변경없이 로드밸런싱, 서비스 간 인증, 모니터링 등을 적용하여 
마이크로 서비스를 쉽게 관리할 수 있다. 

마이크로 서비스 간의 모든 네트워크 통신을 담당할 수 있는 프록시 Envoy를 사이드카 패턴으로
마이크로 서비스들에 배포한다.

Envoy 프록시는 프록시들의 설정 값 저장 및 관리/감독을 수행하고, 프록시들에 설정 값을 전달하는 컨트롤러 역할을 수행한다.

각각의 마이크로 서비스에 사이드카 패턴으로 배포된 Envoy 프록시를 Data Plane 이라하고, Data Plane을 컨트롤하는 부분을
Control Plane이라고 한다.
```

# Istio Architecture
![image](https://user-images.githubusercontent.com/50174803/133931085-d5fc7288-0b69-4866-9b3a-4e3e020f5061.png)
