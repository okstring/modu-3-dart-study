

# 내장 타입 (Built-in Types)

### Accessor, Mutator

#### Accessor

- toUpperCase() 와 같이 원본을 놔두로 리턴함

#### Mutator

- sort와 같이 원본에 접근해서 바꿈

### 타입 비교시 

```dart
int number1 = 1;
print(number is int); // true

print(number is! int); //false, 반대로 나옴
```



## String

### String interpolation

- 문자열 포맷팅

### String에서 +연산자가 느린이유

  - String 인스턴스는 **불변객체(immutable)**
  - '오' + '준석' -> 여기서 인스턴스는 3개. 인스턴스가 많아지만 느려진다.
  - for문 안에서 `'$name$i'` 이것도 결합될때마다 새로운 인스턴스가 생성이 됨.
    - **새로운 인스턴스 생성은 비용이 많이 드는 행위**

### StringBuffer

- String을 비용 적게 추가하는 방법

```dart
// 빈 StringBuffer 생성
final buffer = StringBuffer();

// 문자열 추가
buffer.write('Hello');
buffer.write(' ');
buffer.write('World');
```

- Dart는 싱글스레드 언어로 런타임 에러 신경안써도 됨

### String 알쏭달쏭 메모리 참조 값

```dart
  String str1 = 'hello';
  String str2 = 'hello';
  print(identical(str1, str2)); // true - String pool에 있는 메모리를 재활용

  int int1 = 1;
  int int2 = 1;
  print(identical(int1, int2)); // true

  double double1 = 1.0;
  double double2 = 1.0;
  print(identical(double1, double2)); // true
  print(identical(str1, String.fromCharCodes('a'.codeUnits))); // false - 위에는 코드를 돌리기 전에 메모리에 올라갈 것을 알고 있는 상태, 이건 런타임 상수이므로 힙 메모리에 들어간다.

  String str4 = 'hel' + 'lo';
  print(identical(str1, str4)); // false - + 이것도 런타임에 결정, (언어마다 다름)컴파일러가 최적화를 하냐 안하냐에 따라 다를 수 있다.
  const String str5 = 'hel' + 'lo';
  print(identical(str1, str5)); // true - const, 컴파일 타임에 하기 때문에

  String str6 = 'hel';
  String str7 = 'lo';
  print(identical(str1, '$str6$str7')); // false - 런타임에 결정
  print(identical(str1, getLo())); // false - 함수 호출은 컴파일에 분석되고 런타임에 실행
```



### ASCII 값을 통해 알파벳 변환



```dart
void main() {
  // a부터 z까지의 문자와 0부터 25까지의 값을 매핑하는 Map 생성
  Map<String, int> charMap = {};
  
  // ASCII 값을 이용하여 매핑 수행
  for (int i = 0; i < 26; i++) {
    charMap[String.fromCharCode(97 + i)] = i;
  }
```





### StringBuffer

일반 String은 불변(immutable)이어서 문자열을 수정할 때마다 새로운 문자열 객체가 생성되지만, StringBuffer는 가변(mutable)이어서 문자열을 수정할 때 새로운 객체를 만들지 않습니다.

```dart
// String을 사용한 경우
String str = '';
str += 'Hello'; // 새로운 String 객체 생성
str += ' ';     // 새로운 String 객체 생성
str += 'World'; // 새로운 String 객체 생성

// StringBuffer를 사용한 경우
StringBuffer buffer = StringBuffer();
buffer.write('Hello'); // 같은 객체에 추가
buffer.write(' ');     // 같은 객체에 추가
buffer.write('World'); // 같은 객체에 추가
String result = buffer.toString(); // 최종 변환
```







### codeUnits

```dart
String text = "Hello";
List<int> codes = text.codeUnits; // [72, 101, 108, 108, 111]
```

- 문자열의 각 문자를 UTF-16 코드 유닛으로 변환하여 정수 리스트로 반환
- 각 문자의 유니코드 값을 얻을 수 있음
- 유니코드의 기본 평면(BMP, 0x0000 ~ 0xFFFF) 문자들을 처리할 때 유용

### String.fromCharCodes

```dart
List<int> codes = [72, 101, 108, 108, 111];
String text = String.fromCharCodes(codes); // "Hello"

// 특정 범위만 변환할 때
String partial = String.fromCharCodes(codes, 1, 4); // "ell"
```

- 정수 리스트(유니코드 코드 포인트)를 받아서 문자열로 변환
- 선택적으로 시작과 끝 인덱스를 지정하여 부분 변환 가능
- `codeUnits`의 반대 작업을 수행



### startsWith



- O(n). 내부적으로 더 효율적인 기본 데이터 타입 연산을 사용하므로 실제 실행 시간은 더 빠를 수 있습니다.





### 문자열 포맷팅

```dart
  print('${str}??!');
```



### runes

이 문자열의 유니코드 코드 포인트의 Iterable

```dart
'cool'.runes
// (99, 111, 111, 108)
```



### reversed

```dart
'asd'.split('').reversed.toList().join();
```





### 숫자를 판별하는 방법

```dart
s.codeUnitAt(0) >= 48 && s.codeUnitAt(0) <= 57;
```



### 첫 번째 일치하는 인덱스 반환

```dart
const string = 'Dartisans';
print(string. indexOf('art')); // 1
```



### 하위 문자열 반환

⭐️end 인덱싱 주의

```dart
const string = 'dartlang';
var result = string.substring(1); // 'artlang'
var resultB = string.substring(1, 3); // 'ar'
```



### 정규표현식 Regex



#### 문자열에서 정규 표현식 매칭

```dart
void main() {
  RegExp exp = RegExp(r'\d+');
  String str = 'There are 123 apples and 456 oranges.';

  // 문자열에서 정규 표현식이 일치하는지 확인
  bool hasMatch = exp.hasMatch(str);
  print(hasMatch); // true

  // 문자열에서 정규 표현식과 일치하는 모든 매칭 결과 찾기
  Iterable<RegExpMatch> matches = exp.allMatches(str);
  for (var match in matches) {
    print(match.group(0)); // 123, 456
  }

  // 첫 번째 매칭 결과 찾기
  RegExpMatch? firstMatch = exp.firstMatch(str);
  if (firstMatch != null) {
    print(firstMatch.group(0)); // 123
  }
}
```

#### 문자열 변환

정규 표현식을 사용하여 문자열을 변환할 수도 있습니다.

```dart
void main() {
  RegExp exp = RegExp(r'\d+');
  String str = 'There are 123 apples and 456 oranges.';

  // 문자열에서 정규 표현식과 일치하는 부분을 변경
  String newStr = str.replaceAll(exp, '#');
  print(newStr); // There are # apples and # oranges.
}
```





## Double



### double.parse('1,1');

- 문자열을 double로 변환. 원시타입에 보통 parse를 제공한다.

# 

### 올림 내림 반올림

```dart
// 소수점 아래부분은 버려짐
(12.3).toInt();

// 반올림
(12.3).round();

// 내림
(12.3).floor();

// 올림
(12.3).ceil();
```

## int



### Int는 몇바이트인가???

- 공식적인 문서에 나오지 않음



### Clamp

- 만약 숫자가 lowerLimit보다 작으면, lowerLimit 값을 반환.
- 만약 숫자가 upperLimit보다 크면, upperLimit 값을 반환.

```dart
int foo = 16;
foo.clamp(0, 15);
// 15
```



### int.max, min

1. **-1**: 이 숫자는 이진법으로 `1111...1111` (64비트 모두 1)로 표현됩니다. 이는 부호 있는 정수에서 모든 비트가 1로 설정된 경우를 의미하며, 값은 -1입니다.
2. **<<**: 이 연산자는 좌측 시프트 연산자입니다. 정수를 지정된 비트 수만큼 왼쪽으로 이동시킵니다. 이동하는 동안 비어 있는 비트는 0으로 채워집니다.
3. **63**: 이 숫자는 좌측으로 이동할 비트 수를 나타냅니다. -1을 63비트 좌측으로 시프트하면, 가장 왼쪽 비트가 부호 비트로 설정되고 나머지 비트는 0으로 채워집니다.

```dart
int max = (1 << 63) - 1;
int min = -1 << 63;

print('Max int: $max'); // 출력: Max int: 9223372036854775807
print('Min int: $min'); // 출력: Min int: -9223372036854775808
```





### int -> List

```dart
List<int> digits = number.toString().split('').map(int.parse).toList();
print(digits); // [1, 2]
```





## List

- List 자체로는 동등성 비교가 안된다. 항상 주의!

### Array와 List 차이



| **구분**        | **Array**                                                    | **List**                                                  |
| --------------- | ------------------------------------------------------------ | --------------------------------------------------------- |
| **크기**        | **고정 크기** (생성 시 결정)                                 | **동적 크기** (자동으로 늘어남/줄어듦)                    |
| **메모리**      | 연속된 메모리 블록                                           | 유연한 메모리 할당                                        |
| **속도**        | 접근 속도 빠름 (O(1))                                        | 구조에 따라 조금 느릴 수 있음                             |
| **삽입/삭제**   | 복잡 (직접 처리 필요)                                        | 간편 (add, remove 등 지원)                                |
| **기능**        | 단순한 기능만 제공                                           | 다양한 메서드 지원                                        |
| **언어별 차이** | Java: int[] arr = new int[5]; Dart: var arr = List.filled(5, 0); | Java: ArrayList, LinkedList 등 Dart: List<int> list = []; |

- Dart에는 Array 배열이 없고 List만 있음.



### List.from, List.of 차이 정리

| **비교 항목**                       | List.of(iterable)                       | List.from(iterable)                      |
| ----------------------------------- | --------------------------------------- | ---------------------------------------- |
| **기본 기능**                       | Iterable을 복사하여 리스트 생성         | Iterable.toList()를 호출하여 리스트 생성 |
| **복사 방식**                       | 얕은 복사 (Shallow Copy)                | 얕은 복사 (Shallow Copy)                 |
| **내부 참조 유지 여부**             | 유지됨 (같은 객체 참조)                 | 유지됨 (같은 객체 참조)                  |
| **제네릭 변환 (List<int> 등)**      | 엄격함 (List<int>.of(List<num>) 불가능) | 유연함 (List<int>.from(List<num>) 가능)  |
| **성능**                            | 더 빠르고 최적화됨                      | 상대적으로 느림                          |
| **growable(가변성) 설정 가능 여부** | 무조건 growable: true                   | growable: true/false 설정 가능           |

**🔥 결론**



✅ List.of()

- 기본적인 리스트 복사에 **더 빠르고 최적화**됨 → **일반적인 복사에 추천!**
- growable: false 설정이 불가능함 (항상 가변 리스트)



✅ List.from()

- List<int>.from(List<num>)처럼 **제네릭 타입 변환이 필요할 때 사용**
- growable: false 설정이 가능 (고정 크기 리스트 만들 때 유용)



🚨 **둘 다 깊은 복사가 아님!**

👉 내부 요소까지 완전히 복사하려면 **.map((e) => List.from(e)).toList() 같은 방법이 필요**! 🚀



### List.filled(26, 0)

원하는 숫자로 리스트 채워넣기

```dart
List<int> charCount = List.filled(26, 0);
// [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
```

- 고정 List이기 때문에 가변 List로 변경하려면 **List.of**로 가변 크기 리스트로 변환해야 한다

```dart
void main() {
  // 고정 길이 리스트 생성
  List<int> fixedList = List.filled(5, 0); // [0, 0, 0, 0, 0]

  // 고정 길이 리스트를 가변 크기 리스트로 변환
  List<int> growableList = List.of(fixedList);

  // 요소 제거
  growableList.removeAt(0);

  print(growableList); // 출력: [0, 0, 0, 0]
}
```



### List -> int

```dart
void main() {
  // 예시 배열 [1, 2, 3, 4]
  List<int> numbers = [1, 2, 3, 4];
  
  // 방법 1: fold 사용
  int result1 = numbers.fold(0, (prev, curr) => prev * 10 + curr);
  print(result1); // 출력: 1234
  
  // 방법 2: reduce와 문자열 변환 사용
  int result2 = int.parse(numbers.map((e) => e.toString()).reduce((a, b) => a + b));
  print(result2); // 출력: 1234
  
  // 방법 3: join 사용
  int result3 = int.parse(numbers.join());
  print(result3); // 출력: 1234
}
```



#### 2차원 생성시 주의!!

```dart
List<List<int>> result = List.filled(matrix.length, List.filled(matrix.length, 0));
```

이러면 같은 행끼리 참조함



### toSet

### List<E>.generate

반복해서 리스트 원소 만들기

```dart
List.generate(nums.length, (_) => [0]).expand((x) => x).toList();

List<int> indices = List.generate(3, (i) => i); // [0, 1, 2]
```

### 마지막 원소까지 슬라이싱

```dart
// 두 번째 원소부터 마지막 원소까지 슬라이싱 
List<int> sliced = numbers.sublist(1);
```



### 중첩 리스트 펼치기

```dart
void main() {
  List<List<int>> nestedList = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  List<int> flatList = [for (var sublist in nestedList) ...sublist];
  print(flatList); // [1, 2, 3, 4, 5, 6, 7, 8, 9]
}
```



### 다른 리스트 모두 추가

```dart
void main() {
  List<int> list1 = [1, 2, 3];
  List<int> list2 = [4, 5, 6];
  
  list1.addAll(list2);
  
  print(list1); // 출력: [1, 2, 3, 4, 5, 6]
}

```

### Contains 메소드 사용 시 리스트 비교 불가

- `contains` 메소드는 단순히 리스트의 요소가 특정 값과 동일한지 확인하는 메소드
- 리스트 내의 리스트를 비교할 때는, 각각의 리스트 객체가 동일한지 확인하기 때문에 리스트의 내용이 동일하더라도 다른 리스트 객체로 간주될 수 있어요.
- any, every 활용

```dart
void main() {
  List<List<int>> nestedList = [[1, 2], [3, 4], [5, 6]];
  List<int> target = [3, 4];
  
  bool containsTarget = nestedList.any((list) => list.length == target.length && list.every((element) => target.contains(element)));
  
  print(containsTarget); // true
}
```





## Map

### Map - value를 dynamic으로 해야 하는 이유

- 다양한 타입의 값을 하나의 맵에 저장해야 하고, 런타임에 타입이 결정

### 맵 기본값 설정

```dart
// 키 "apple"이 존재하지 않으면 기본값 1을 설정 
myMap.putIfAbsent("apple", () => 1);
```





### entries

map을 iterable하게 만들기



### containKey

키가 존재하는지 확인

```dart
// 키가 존재하는지 확인
if (myMap.containsKey('apple')) {
  int value = myMap['apple']!;
  print('apple: $value'); // apple: 1
} else {
  print('Key "apple" does not exist in the map.');
}
```







## Set

- Dart에서는 Set도 순서가 있는걸로 만들어놨다.
- Set도 iterator도 돌릴 수 있다.





### Runes

문자열에서 유니코드 코드 포인트를 다룰 때 사용

### 문자의 유니코드 값 가져오기

```dart
void main() {
  String emoji = '👋';  
  print(emoji.runes); // (128075)
}
```



### 유니코드 값 → 문자열 변환

```dart
void main() {
  Runes runes = Runes('\u{1F600}'); // 😀 (U+1F600)
  String emoji = String.fromCharCodes(runes);
  
  print(emoji); // 😀
}
```

