# What is Service Mesh ?

```
[ Service Mesh 란 ? ]

마이크로 서비스 간 통신을 안전하고, 빠르고 신뢰할 수 있게 만들기 위해 설계된 전용 인프라 계층이다.
애플리케이션 서비스에 경량화 프록시를 사이드카 방식으로 배치하여 서비스 간 통신을 제어한다.

[ 기능 ]

Service Discovery, Load Balancing, Dynamic Request Routing
Circuit Breaking, Retry and Timeout, TLS, Distributed Tracing
Metric 수집, Access Controll, A/B Testing

[ 필요한 이유 ]

MSA 시스템에서 수 많은 마이크로 서비스가 동작하기에 관리하기 복잡하다.
또한 인스턴스가 수행되는 네트워크 간의 레이턴시, 신뢰성, 안정성 등을 보장할 수 없다.

이러한 문제점을 애플리케이션 계층에서 해결하려면 애플리케이션 언어 및 런타임에 종속성이 생기고
기능 변경 시, 비용이 발생한다.

서비스 메쉬를 사용하면 마이크로 서비스를 운영할 때 별도의 소스 코드 수정 없이 
인프라 레벨에서 관리할 수 있다. 

```
