# Test



### 화이트 박스 테스트

- 내부 구조와 동작에 중점을 두고 테스트 하는 방법
- 코드의 내부 로직, 제어흐름, 데이터흐름 등을 이해하고 검증하는데 사용
- 구문검사, 경로검사, 조건/분기검사

### 블랙박스 테스트

- 내부구조를 무시하고 기능을 테스트하는 방법
- 내부정보 알 필요 없이 사용자 관점에서 테스트
- 등가분할 - 범위를 나눠 유효한 범위
- 경계값분석 - 상한 경계, 하한 경계 측정
- 상태 전이 테스트



### Unit Test

- 특정 모듈이 의도한 대로 잘 작동하는가를 테스트하는 가장 작인 단위의 테스트



#### 좋은 Unit Test의 6가지 조건

- Fast (빠르고)
- Reliable (믿을 수 있고)
- Independent (독립적인)
- Ease of Maintenance (유지 관리가 쉽고)
- Nearly compacted code (거의 압축적인 코드)
- Dependencies should be less (의존성이 적어야 한다)

#### 단위 테스트가 꼭 필요한 경우

- DB
  - 스키마가 변경되는 경우
  - 모델 클래스가 변경되는 경우
- Network
  - 예측한 데이터가 제대로 들어오는지
- 데이터 검증
  - 예측한 데이터를 제대로 처리하고 있는지



### 테스트의 장점

- 장애에 관한 신속한 피드백, 조기 장애 감지
- 더 안전한 코드 리팩터링
- 안정적인 개발 속도



### Test Double

![img](https://learn.microsoft.com/en-us/archive/msdn-magazine/2007/september/images/cc163358.fig02.gif)

- double 경계가 모호하다! **용어에 집착하지 말고** 보통은 mock 객체로 부르자

#### Dummy Object

- **목적**: 인자로 전달되지만 사용되지 않음
- **특징**: 주로 `null` 또는 기본적인 객체 제공

#### Fake Object

- **목적**: 간단한 로직을 포함한 대체 객체
- **특징**: 실제 동작을 흉내 내지만, 가벼운 버전

#### Stub

- **목적**: 미리 정의된 응답을 반환. 실제로 동작하는 것 처럼 보이게 하는 방식
- **특징**: 테스트에서 특정 조건을 가정할 때 사용

#### Spy

- **목적**: 실제 객체처럼 동작하면서 호출 기록을 남김(count 등등)
- **특징**: `Mock`과 달리 원래 메서드 실행 가능

#### Mock Object

- **목적**: 내용에 따라 동작하도록, 특정 메서드가 호출되었는지 검증
- **특징**: 호출 횟수 및 특정 인자로 호출되었는지 확인 가능



### Mock 객체 활용

- 데이터를 가져오는 클래스에 의존하게 되면
  - 속도가 느림
  - 예기치 않은 결과를 반환하면 통과 테스트가 실패하기 시작할 수 있다.
  - 웹 서비스나 db에 의존하는대신 종속성을 mocking할 수 있다.





![img](https://github-production-user-asset-6210df.s3.amazonaws.com/62657991/428852652-8f3f5f89-3b33-41f8-be50-83b8764e794d.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20250401%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20250401T024516Z&X-Amz-Expires=300&X-Amz-Signature=21405c7f8e91ea2445f55ac23c0f623c81296d91dd53f1b50045e51d6c58a27f&X-Amz-SignedHeaders=host)

- 다형성을 활용하면 테스트할 때 원하는 객체를 활용 가능
  - 테스트용 객체를 별도로 준비하여 테스트가능





### Group

```dart
import 'package:flutter_unit_test/calculator.dart';
import 'package:test/test.dart';

void main() {
  group('calculator', () {
    Calculator calc = Calculator();

    test('add should be equal to a + b', () {
      expect(calc.add(5, 8), equals(13));
    });

    test('minus should be equal to a - b', () {
      expect(calc.minus(10, 5), equals(5));
    });

    test('square should be equal to a * a', () {
      expect(calc.square(5), equals(25));
    });
  });
}
```



### returnNormally

- void함수 활용 시, 정상 동작했다는 매쳐

### throwsException

- 에러를 던지는 함수에 대한 매칭

### throwsA

`expect(functionThatThrows, throwsA(isA<SomeException>()));`



### setupAll

- setup과 다르게 테스트 전 한번만 코드 실행

### 경계값 분석

경계값 분석(Boundary Value Analysis)은 테스트 기법 중 하나로, 입력값의 경계(최소값, 최대값) 근처에서 버그가 자주 발생하므로 경계값에서 집중적으로 테스트하는 방식



**📌 경계값 분석 뜻 (Boundary Value Analysis)**

| **항목**  | **설명**                                                 |
| --------- | -------------------------------------------------------- |
| 목적      | **오류가 발생하기 쉬운 경계에서 테스트**하여 안정성 확인 |
| 대상      | 입력값의 **최소값, 최대값**, 그리고 그 **바로 근처 값**  |
| 기대 효과 | 최소한의 테스트로 **효율적**으로 문제를 발견 가능        |





### mockito

- 외부 의존성(파일, 네트워크, DB)을 격리하여 테스트 속도와 안정성 향상
- 다양한 시나리오(성공, 실패, 예외 상황)를 쉽게 시뮬레이션 가능
- 테스트 환경과 무관하게 일관된 테스트 결과 보장
- 코드의 특정 부분만 독립적으로 검증 가능
- 메서드 호출 여부, 호출 횟수, 전달된 인자 등을 정확히 검증 가능
