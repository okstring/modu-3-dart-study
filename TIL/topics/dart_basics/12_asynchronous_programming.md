## 비동기 지원 (Asynchronous Support)



## 비동기 프로그래밍



### 동기

- 작업완료를 기다리는 방식의 차이
- A라는 행위와 B라는 행위가 순차적으로 작동한다면 동기라고 한다. 
- 작업 요청을 했을 때 요청의 **결과값(return)을 직접 받는 것이다**.

### 비동기

- 기다리지 않고 다른 작업을 시작함
- **동시성, 병렬성을 모두 표현할 수 있음**
- 콜백을 통한 처리가 비동기 처리라고 할 수 있다.
- `호출된 함수`의 수행 결과 및 종료를 `호출된 함수` **혼자 직접 신경 쓰고 처리**한다면(as a callback fn.) Asynchronous

### 비동기(async) 프로그래밍

#### Callback

- 콜백은 비동기 작업이 완료된 후 실행되는 함수



#### Future

- Future는 Dart에서 비동기 작업의 결과를 나타내는 객체
- then() 사용하면 순서, 결과 예측이 잘 안됨

```dart
Future<String> fetchData() {
  return Future.delayed(Duration(seconds: 2), () {
    return "가져온 데이터";
  });
}

void main() {
  print('fetchData 호출 전')
  Future<String> future = fetchData();
  
  future.then((data) {
    print('데이터: $data');
  }).catchError((error) {
    print('오류: $error');
  });
  
  print('fetchData 호출 후');
}
```

#### async-await

- ⭐️ 비동기 코드를 동기 코드처럼 작성할 수 있어 가독성이 향상

```dart
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return "가져온 데이터";
}

void main() async {
  print('fetchData 호출 전');
  
  try {
    String data = await fetchData();
    print('데이터: $data');
  } catch (error) {
    print('오류: $error');
  }
  
  print('fetchData 완료 후');
}
```



##### wait()

- 두 작업이 모두 완료될때까지 기다림
- 병렬이 필요하면 이렇게 해라!

```dart
// Future<Movie> getMovieInfo() async {
//   ...
// }


final stopwatch = Stopwatch()..start();
final futures = [getMovieInfo(), getMovieInfo()];
final result = await Future.wait(futures); // 두 작업이 모두 완료될 때까지 기다림
print(result); // 이제 실제 Movie 객체 리스트가 출력됨
print(stopwatch.elapsed);
```





### 동시성 vs 병렬설

#### 동시성

- 여러 작업을 번갈아가면서 처리하는 것

#### 병렬성(Parallelism)

- 여러 작업을 실제로 동시에 처리하는 것
- 멀티코어 환경에서 실제로 여러 스레드가 병렬로 실행될 수 있음



### thread

- 프로그램 내에서 실행되는 흐름의 단위



## 아이솔레이트 (Isolates)
