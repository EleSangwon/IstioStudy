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
