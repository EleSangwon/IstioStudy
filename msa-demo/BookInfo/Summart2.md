# Istio Example BookInfo Summary 2

## Fault Injection
```
애플리케이션의 복원력을 테스트하기 위해 오류를 삽입할 수 있다.

아래의 명렁어를 통해 jason으로 로그인 시, ratings 서비스가 7초의 딜레이가 발생하도록 한다.
kubectl apply -f samples/bookinfo/networking/virtual-service-ratings-test-delay.yaml
```

![image](https://user-images.githubusercontent.com/50174803/140648852-34af3673-100f-4058-a084-2314c86d4dd2.png)
![image](https://user-images.githubusercontent.com/50174803/140648877-cd0a1406-bbd5-412a-8012-a21d8eabbec8.png)

```
아래의 명령어를 통해 jason으로 로그인 시, ratings 서비스에서 500에러가 발생하도록 한다.
kubectl apply -f samples/bookinfo/networking/virtual-service-ratings-test-abort.yaml
```
![image](https://user-images.githubusercontent.com/50174803/140648932-8b82c4c3-98df-4934-84f9-5514ce2550ad.png)
![image](https://user-images.githubusercontent.com/50174803/140648961-9f1921ee-28f3-4f9e-9d70-bda503e336a5.png)

## 한 버전 -> 또 다른 버전으로 트래픽 점진적 마이그레이션
```
모든 review 서비스 요청에 대해 트래픽의 50% v1로 나머지 50%는 v3로 처리
브라우저를 새로고침하면 v1과 v3버전이 전환되며 표시된다.
```
![image](https://user-images.githubusercontent.com/50174803/140649072-33ef57bf-7eb8-4472-ba28-9fa0f1db0bd8.png)

## Circuit Breaking
```
서킷 브레이커는 탄력적인 마이크로서비스 애플리케이션을 만드는 데 중요한 패턴이다.
서킷 브레이커를 사용하면 지연 시간 급증 및 장애에 대한 영향 등 네트워크 특성의 원치 않는 영향을 제한할 수 있다.

만약 하나의 서비스에 장애가 발생하면, 장애 서비스를 호출하는 서비스는 대기상태가 된다.
다시 대기 중인 서비스를 호출하는 또 다른 서비스도 대기하게 되어 장애가 연쇄적으로 전파된다.

서킷브레이커는 문제가 되는 서비스를 동작하지 않도록해서 리소스 점유의 증가로 
장애가 전파되지 않도록 하는 목적이 있다.
```

```
서킷브레이크의 대상이 되는 httpbin app을 배포한다. 
httpbin 은 http 프로토콜 echo 응답 앱이다.

마이크로서비스 로드 테스트 툴 fortio를 배포한다. 
```
![image](https://user-images.githubusercontent.com/50174803/140649447-2badbd67-5d9d-411d-ba87-6a18f3ce0f2a.png)
![image](https://user-images.githubusercontent.com/50174803/140649568-09d080ac-2e9f-428e-ac23-a58aca84b6ae.png)

```
fortio pod에 접속하여 httpbin 으로 요청보내면, 정상 200 응답 코드 리턴
```
![image](https://user-images.githubusercontent.com/50174803/140650384-c9ca4764-8bde-4a30-8174-90f4a2466a2b.png)

## Circuit break DestinationRule 작성
```
서킷브레이커 설정을 적용하는 Rule 적용한다.
최소한의 커넥션만 허용하도록 설정

```
![image](https://user-images.githubusercontent.com/50174803/140650440-4006d3b4-6bc4-4d08-a4f1-7681638f828c.png)
![image](https://user-images.githubusercontent.com/50174803/140650662-f11efaae-2b86-402e-b15c-9c1c701dfa1b.png)

## Circuit break Test
```
-c 2로 두개의 동시 연결 서비스 호출하고 20개의 요청 -n 20 을 보낸다.
요청의 70& 성공하고 서킷브레이커에 의해 30% 차단 
```
![image](https://user-images.githubusercontent.com/50174803/140650771-64fa5b7c-67f7-4ab3-9f7c-280190ce7ce4.png)

```
서킷브레이커가 작동될 때 Kiali 화면
```
![image](https://user-images.githubusercontent.com/50174803/140650877-051e97eb-baca-42fa-b1d9-7a4d528024f4.png)
