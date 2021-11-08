# Request Routing 
```
라우팅할 명시적인 기본 서비스 버전이 없으면 istio가 라운드 로빈 방식으로
사용 가능한 모든 버전으로 요청을 라우팅한다.
```

## Destination rules
```
Virtual Service와 함께, Istio의 트래픽 라우팅 기능의 핵심 부분이다.
Destination rules은 가상 서비스 라우팅 규칙이 평가된 후에 적용되므로 트래픽의
실제 대상에 적용된다.

대상 규칙을 사용하여 지정된 서비스의 모든 인스턴스를 버전별로 그룹화하는 것과 같이
Service Subsets(서비스 하위집합) 을 지정한다.

대상 규칙을 사용하면, Envoy 트래픽 정책을 커스터마이즈 할 수 있다.
예를 들면, 선호하는 로드밸런싱 모델, TLS 보안 모드, 서킷 브레이커 세팅 등
```

## Virtual Service
```
오직 하나의 버전으로 라우팅하기 위해서, 
마이크로서비스의 디폴트 버전을 지정하는 가상 서비스를 적용한다. 
 
Route based on user identity
특정 사용자의 모든 트래픽이 특정 서비스 버전으로 라우팅되도록 경로 구성을 변경한다.
```

# Fault Injection
```
Injecting an HTTP delay fault
Injecting an HTTP abort fault
마이크로서비스의 복원성을 테스트하기 위해 사용
```

# Traffic Shifting
```
마이크로서비스의 한 버전에서 다른 버전으로 트래픽이 이동하는 방법
이전 버전의 마이크로 서비스에서 새 버전으로 트래픽을 점진적으로 마이그레이션한다.

Istio에서는 트래픽의 일정 비율을 한 대상에서 다른 대상으로 리디렉션하는 일련의 라우팅 규칙을 구성하여 이 목표를 달성한다.
```
![image](https://user-images.githubusercontent.com/50174803/140756149-b9b5a861-7fe9-486c-b493-4da8251b8aa3.png)


