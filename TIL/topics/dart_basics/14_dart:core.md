## dart:core



## Library & imports 종류



### 라이브러리란?

- Dart 코드의 재사용성과 모듈화를 위해 **라이브러리(Library)** 개념을 사용.

```dart
import 'dart:math';  // Dart의 기본 라이브러리
import 'package:http/http.dart';  // 패키지 라이브러리
import 'utils.dart';  // 로컬 파일
```



### 라이브러리 종류

#### 코어 라이브러리 (dart: prefix)

- dart:core (자동 포함) → String, List, int 등 기본 기능 제공
- dart:async → Future, Stream 지원
- dart:io → 파일 및 네트워크 I/O 지원 (웹에서는 사용 불가)

#### 패키지 라이브러리 (package: prefix)

- package:를 사용해 **pub.dev**에서 제공하는 패키지를 가져올 수 있음.

```dart
import 'package:http/http.dart' as http;
```



#### 로컬 라이브러리 (relative path)

```dart
import 'utils.dart';  // 같은 폴더에 있는 utils.dart 파일 가져오기
```





### import 옵션들

#### **별칭 사용 (as)**

```dart
import 'package:math_expressions/math_expressions.dart' as math;
math.Parser p = math.Parser();
```

#### 필요한 부분만 가져오기 (show)

```dart
import 'dart:math' show Random, pi;
```

#### 특정 부분 제외하고 가져오기 (hide)

```dart
import 'dart:math' hide sin, cos;
```



### part와 part of (라이브러리 분할)

- 한 라이브러리를 여러 파일로 나누기 위해 사용.
- **일반적으로 import를 사용하고, part는 큰 라이브러리를 여러 파일로 나눌 때만 사용.**
- main.dart:

```dart
part 'utils.dart';
```

- utils.dart:

```dart
part of 'main.dart';
```





## 람다식과 함수

- 변수에 대입 가능한 객체를 **1급 객체(final class object)**라고 한다.
  - 대표적인 1급 객체: 값, 인스턴스, 함수

###  메서드와 함수의 차이

- 메서드는 클래스에 속하고 클래스를 조작하기 위한 일종의 함수
- 메서드는 이름이 있지만 함수에게 이름은 중요치않다.

### 고계함수

- 함수에서 함수를 받는 함수
- 매개변수로 넘기는 함수에 따라 예측이 안된다.
- `[1, 2, 3].reduce(max)`
  - 이 코드도 동작이 가능 - 인자 수가 맞으므로



### List<E>.unmodifiable

- 모든 내용을 포함하는 변경 불가능한 목록을 만듭니다

### moveNext()

- Iterator 클래스의 메서드로, 반복자가 다음 요소로 이동할 수 있으면 true를 반환

### map()

- 컬렉션의 각 요소를 변환하여 새로운 컬렉션을 반환

```dart
final numbers = [1, 2, 3];
final doubled = numbers.map((e) => e * 2); // [2, 4, 6]
```



### Where()

- Swift의 filter와 동일한 역할로, 조건에 맞는 요소만 필터링
- `Iterable`로 반환

```dart
final numbers = [1, 2, 3, 4, 5];
final evens = numbers.where((e) => e % 2 == 0); // [2, 4]
```



### reduce()

- 컬렉션의 요소들을 하나의 값으로 결합
- 초기값 없음

```dart
final numbers = [1, 2, 3, 4];
final sum = numbers.reduce((value, element) => value + element); // 10
```

#### max 활용



```dart
List<int> numbers = [3, 5, 2, 9, 4];
int maxValue = numbers.reduce(max);
print(maxValue); // 출력: 9
```



### fold()

- 초기값을 지정할 수 있습니다
- 반환 타입이 컬렉션의 요소 타입과 달라도 됩니다

```dart
// fold 사용 예시 1: 숫자 리스트의 합계 (초기값 0)
final numbers = [1, 2, 3, 4];
final sum = numbers.fold(0, (sum, item) => sum + item); // 10

// fold 사용 예시 2: 숫자 리스트를 문자열로 변환 (다른 타입 반환)
final numbers = [1, 2, 3];
final result = numbers.fold('', (str, item) => str + item.toString()); // "123"
```





이렇게 선언하면 오류가 난다. 초기값의 타입을 기반으로 추론하기 때문에 0을 초기값으로 넣으면 Object 타입으로 간주하기 때문

```dart
void main() {
  var l = [1, 2, 3];
  print(l.fold<int>(0, (p, e) => p + e)); // 출력: 6
}
```



### forEach()

각 요소에 대해 특정 동작을 수행

```dart
final fruits = ['apple', 'banana'];
fruits.forEach((fruit) => print(fruit));
```



### any()

- 조건을 만족하는 요소가 하나라도 있는지 확인

```dart
final numbers = [1, 2, 3];
final hasEven = numbers.any((e) => e % 2 == 0); // true
```



### every()

모든 요소가 조건을 만족하는지 확인

```dart
final numbers = [2, 4, 6];
final allEven = numbers.every((e) => e % 2 == 0); // true
```









### sort()

### compareTo

- 이것이 other보다 작으면 음수를 반환하고, 같으면 0을, other보다 크면 양수를 반환합니다.
- 기본값은 **오름차순**이라 생각하면 편함





### 올림, 내림, 반올림, 버림

| **기능**    | **메서드** | **설명**                                 |
| ----------- | ---------- | ---------------------------------------- |
| 올림        | ceil()     | 소수점 올림 → 가장 가까운 큰 정수 반환   |
| 내림        | floor()    | 소수점 내림 → 가장 가까운 작은 정수 반환 |
| 반올림      | round()    | 소수점 반올림 → 가까운 정수 반환         |
| 소수점 버림 | truncate() | 소수점 **버림** → 0 방향으로 자름        |



```dart
double num = 3.7;

print(num.ceil());       // 4 (올림)
print(num.floor());      // 3 (내림)
print(num.round());      // 4 (반올림)
print(num.truncate());   // 3 (소수점 버림)
print(num.toInt());      // 3 (소수점 버림과 동일)
```



```dart
double n = -3.7;

print(n.floor());     // -4 (내림)
print(n.truncate());  // -3 (버림)
print(n.toInt());     // -3 (버림)
```





### runtypeType

- `runtimeType`은 Dart 언어에서 모든 객체가 가지고 있는 속성(property)으로, **해당 객체의 실제 타입**을 런타임에 반환합니다.



