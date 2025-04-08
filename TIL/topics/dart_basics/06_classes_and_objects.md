# 클래스 및 객체 (Classes and Objects)

## 클래스 (Classes)





### GC (Garbage Collection) 

- 메모리를 정리
- 인스턴스 생성은 비용이 많이 드는 행위인것 처럼 메모리 해제도 비용이 많다.



### 메모리 구조

### ![img](https://lh7-rt.googleusercontent.com/slidesz/AGV_vUf3X4Uw4Z2c9MTc5SLD15cJprWesudqlXFbvBcdTBMFO1snw_g0GwaWrCndWgEv2XWMQHNIGcRvNwlCP1Rof1CnOnmJHAOssXZVhjLwtals-4PVNRJ8NdU3PXSAWdjlhjsWOlxSu8RxZXYyvx5In0-R5u-1Yt4=s2048?key=Zf3qadHpSF3riBjukIVZcQ)



- **Dart는 모든 타입이 레퍼런스 타입**
- 값들은 모두 Stack에 올라감



<img width="630" alt="스크린샷 2025-03-14 오전 11 00 23" src="https://gist.github.com/user-attachments/assets/2028ad16-0aa9-4287-b692-ba78d97c7b63" />

- 값을 참조하는 것

```dart
final hero1 = Hero(name: '홍길동', hp: 100);
final hero2 = hero1;
hero2.hp = 200;
```



### @override - 어노테이션

- 이런 것을 붙이자는 관례가 있다.
- 없어도 동작은 한다.

## 



### didset과 비슷하게 구현할 때 get, set 활용

```dart
class MyClass {
  int _value = 0;

  int get value => _value;
  set value(int newValue) {
    _value = newValue;
    // didSet처럼 동작할 부분
    print("value was set to $newValue");
  }
}

void main() {
  var obj = MyClass();
  obj.value = 42;
}
```

- 이 경우 기본값을 할당해야 한다. 프로퍼티가 Private일 경우 생성자에서 초기겂을 지정할 수 없다.



## 객체지향의 프로그래밍의 4대 요소와 Dart에서의 구현

예시를 잘 알아두자!

### 1. 캡슐화(Encapsulation)

- 개발자의 잘못된 접근에 대한 제어 방법을 제공
- 현실세계와 동일하게 프로그래밍 하려는 제어 방법
- 내용물을 보호막 안에 감싸는 개념
  - 데이터 은닉, 기능 결합



#### private

- Named Parameters에는 언더바에 바로 초기값 넣을 수 없다.
  - 초기화 리스트 사용
- 동일 파일내에서만 가능



#### getter, setter

getter: 읽기 전용 프로퍼티

```dart
String get greeting => 'Hello, $_name!';
```



setter: 쓰기 전용 프로퍼티

```dart
set name(String value) {
  if (value.isNotEmpty) {
    _name = value;
  }
}
```

Dart에서는 모든 인스턴스 변수에 대해 암묵적인 getter와 setter가 자동으로 생성됨

```dart
class BankAccount {
  double _balance = 0.0
  
  // getter 메서드
  double get balance => _balance;
  
  // 입금 메서드
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
    }
  }
  
  // 출금 메서드
  bool withdraw(double amount) {
    if (amount > 0 && _balance >= amount) {
      _balance -= amount;
      return true;
    }
    return false;
  }
}

void main() {
  var account = BankAccount();
  account.deposit(1000);
  print(account.balance);
}
```



### 2. 상속(Inheritance)

상속은 기존 클래스(부모 클래스)의 특성을 다른 클래스(자식 클래스)가 물려받아 재사용하고 확장할 수 있게 하는 메커니즘.

- 많은 이점 중 복사 붙여넣기의 문제점을 해결한 것이 상속
- 상속이라는 단어는 약간 애매하다. 일상적 의미와의 차이와 방향성의 오해
- **다중상속은 Dart에서 금지**\
- **Class 상속은 기능의 확장**
- **손흥민을 찍어낼 수 없다.**

```dart
// 부모 클래스
class Animal {
  String name;
  
  Animal(this.name);
  
  void makeSound() {
    print('Animal sound');
  }
  
  void eat() {
    print('$name is eating');
  }
}

// 자식 클래스
class Dog extends Animal {
  String breed;
  
  // super로 부모 클래스 생성자 호출
  Dog(String name, this.breed) : super(name);
  
  // 메서드 오버라이딩
  @override
  void makeSound() {
    print('$name barks: Woof!');
  }
  
  // 자식 클래스만의 새로운 메서드
  void fetch() {
    print('$name fetches the ball');
  }
}

void main() {
  var dog = Dog('Bobby', 'Golden Retriever');
  dog.makeSound();  // Bobby barks: Woof!
  dog.eat();        // Bobby is eating (상속받은 메서드)
  dog.fetch();      // Bobby fetches the ball
}
```

Dart에서는 `extends` 키워드로 상속을 구현한다. 메서드 오버라이딩 시 `@override` 어노테이션을 사용

#### 올바른 상속

- **'is A 원칙'이라고 하는 규칙에 따른 상속을** 따른다
  - `SuperHero is a Hero`
- 자식클래스 일수록 구체화되고, 부모 클래스일수록 추상화 인것으로 일반화 된다.



#### 잘못된 상속을 하면 안되는 이유

- 클래스를 확장할 때 현실세계와의 모순이 생긴다.
- 객체지향의 3대 특징 중. 가지 "다형성"을 이용할 수 없게 된다.



#### overload

- 오버로드(overload)는 같은 이름의 함수나 연산자를 매개변수 타입이나 개수에 따라 여러 형태로 정의하는 것.

#### override

- 기존 기능을 재 정의



### 3. 다형성(Polymorphism)

- 어떤 것을 이렇게도 부를 수 있고, 저렇게도 부를 수 있는 것
- 핸들이 있고, 오른 페달이 액셀, 왼쪽이 브레이크인 것 = 차, 그랜저, 버스 …
  **세부적인 부분 부분은 다르지만, 어쨌든 대충 보면 그냥 차다**
- 비슷한 얘들끼리 묶는 느낌



#### Switch case 문 - 타입 확인하기

```dart
final Drawable drawable = elements[i];

switch (drawable) {
    case Rectangle():
        print('사각형이 선택됨');
        break;
    case House():
        print('집이 선택됨');
        break;
    case Dog():
        print('강아지가 선택됨');
        break;
}

drawable.draw(); // 다형성: 실제 타입의 draw() 메서드 호출
```



#### 알쏭달쏭 다형성 문제

```dart
abstract class Monster {
  void run() {
    print('몬스터빔');
  }
}

class Slime extends Monster {
  int hp = 50;
  final String suffix;

  Slime(this.suffix);

  @override
  void run() {
    print('슬라임$suffix가 도망간다.');
  }
}

void main(List<String> arguments) {
  Slime slime = Slime('A');
  Monster monster = Slime('B');
  slime.run();
  monster.run();
}

// 슬라임A가 도망간다.
// 슬라임B가 도망간다.
```

- 타입 명시보다 실체가 중요하다.
- `@override` 를 했기 때문에 `slime.run()`이 실행된다





#### Dart의 `is`와 `as` 키워드

##### `is` 연산자

```dart
class Animal {}
class Dog extends Animal {}
class Cat extends Animal {}

void main() {
  // 상속 관계 체크
  Dog dog = Dog();
  Cat cat = Cat();
  
  print(dog is Animal);    // true (Dog는 Animal의 하위 클래스)
  print(cat is Animal);    // true (Cat은 Animal의 하위 클래스)
  print(dog is Cat);       // false (Dog는 Cat이 아님)
}
```

##### `as` 연산자

- 형변환(타입 캐스팅)에 사용

```dart
void main() {
  // 업캐스팅 (하위 클래스 -> 상위 클래스)
  Dog dog = Dog();
  Animal animal = dog as Animal; // Dog를 Animal로 캐스팅
  animal.makeSound();           // "멍멍!" 출력
  
  // 다운캐스팅 (상위 클래스 -> 하위 클래스)
  Animal someAnimal = Dog();
  Dog someDog = someAnimal as Dog; // 가능: someAnimal은 실제로 Dog 객체
  someDog.fetch();                // "공 가져오기!" 출력
  
  // 잘못된 캐스팅
  try {
    Animal anotherAnimal = Cat();
    Dog anotherDog = anotherAnimal as Dog; // 예외 발생: Cat은 Dog로 캐스팅할 수 없음
  } catch (e) {
    print('캐스팅 오류: $e');
  }
  
  // is와 as를 함께 사용한 안전한 캐스팅
  Animal thirdAnimal = Cat();
  if (thirdAnimal is Dog) {
    (thirdAnimal as Dog).fetch(); // is 검사를 통과했으므로 안전하게 캐스팅 가능
  } else {
    print('이 동물은 개가 아닙니다!');  // 이 부분이 실행됨
  }
}

class Animal {
  void makeSound() {
    print('동물 소리!');
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print('멍멍!');
  }
  
  void fetch() {
    print('공 가져오기!');
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print('야옹!');
  }
  
  void climb() {
    print('나무 오르기!');
  }
}
```

##### is와 as의 차이점

**is는 실체! 실제로 구현된 인스턴스를 판단!!**

1. **목적**:
   - `is`: 객체가 특정 타입인지 확인 (타입 체크)
   - `as`: 객체를 다른 타입으로 변환 (타입 캐스팅)
2. **반환 값**:
   - `is`: 불리언 값 (true/false)
   - `as`: 캐스팅된 객체
3. **안전성**:
   - `is`: 항상 안전함 (단순 체크)
   - `as`: 부적절한 캐스팅 시 예외 발생 가능



##### 안전한 캐스팅 패턴

안전한 다운캐스팅을 위해 `is`와 `as`를 함께 사용하는 패턴:

```dart
if (object is TargetType) {
  // 이미 타입 체크를 했으므로 안전
  TargetType castedObject = object as TargetType;
  // 또는 Dart에서는 스마트 캐스트 기능이 있어 다음과 같이 작성 가능
  object.targetTypeMethod();  // object가 이미 TargetType으로 취급됨
}
```





### 4. 추상화(Abstraction)

#### 추상클래스(abstract) - extend만 쓰자

- 상세 부분이 **일부 미정의 된** 클래스
- 상속의 재료로 사용되는 클래스
- 추상클래스로 하면 override가 강제된다
- 추상클래스는 인스턴스화가 안된다.
- 다이어그램에서 이택릭체는 추상클래스를 의미



#### 인터페이스(interface) - implements 만 쓰자

- 같은 인터페이스를 구현한 클래스들은 공통 메소드를 구현하고 있음을 보장
- 완전 독립적인 여러 클래스가 동일한 인터페이스 구현해야 할 때 적합
- 모든 메서드가 추상메소드여야 한다
- 필드를 가지지 않는다.
  - 하지만 Property도 메소드의 일종이니 들어갈 수 있다.
- interface 키워드는 Dart 3.0에 추가되었음
- 여러개의 기능을 가질 수 있는거지 ~~다중 상속~~이라는 표현은 약간 어색





추상화는 복잡한 시스템에서 핵심적인 부분만을 추출하여 복잡성을 감추는 과정. Dart에서는 추상 클래스와 인터페이스를 통해 구현.

```dart
// 추상 클래스
abstract class Vehicle {
  // 추상 메서드 (구현 없음)
  void start();
  void stop();
  
  // 일반 메서드 (구현 있음)
  void honk() {
    print('Beep!');
  }
}

// 인터페이스 역할을 하는 클래스
class ElectricVehicle {
  void charge() {
    print('Charging...');
  }
}

// 다중 인터페이스 구현
class ElectricCar extends Vehicle implements ElectricVehicle {
  @override
  void start() {
    print('Electric car starting silently...');
  }
  
  @override
  void stop() {
    print('Electric car stopped');
  }
  
  @override
  void charge() {
    print('Electric car charging at station');
  }
}

void main() {
  var tesla = ElectricCar();
  tesla.start();   // Electric car starting silently...
  tesla.honk();    // Beep!
  tesla.charge();  // Electric car charging at station
  tesla.stop();    // Electric car stopped
}
```

Dart에서는 `abstract` 키워드로 추상 클래스를 정의합니다. 추상 클래스는 인스턴스화할 수 없고, 구현되지 않은 추상 메서드를 포함할 수 있습니다. Dart는 별도의 인터페이스 키워드가 없지만, 모든 클래스가 암시적으로 인터페이스 역할을 할 수 있습니다.

#### 추가 내용: Dart의 특수한 객체지향 기능

Dart는 위 4가지 기본 요소 외에도 객체지향 프로그래밍을 강화하는 몇 가지 특수한 기능을 제공합니다:

#### Mixins

코드 재사용을 위한 강력한 방법으로, 클래스 간에 메서드와 속성을 공유할 수 있음.

```dart
mixin Logger {
  void log(String message) {
    print('LOG: $message');
  }
}

class DataService with Logger {
  void fetchData() {
    log('Fetching data...');
    // 데이터 가져오는 로직
  }
}
```

#### **확장 메서드(Extension methods)**

기존 클래스에 새로운 기능을 추가할 수 있는 방법

```dart
extension StringExtension on String {
  bool isValidEmail() {
    return contains('@') && contains('.');
  }
}

void main() {
  print('test@example.com'.isValidEmail());  // true
}
```



## Constructors

- 클래스에 생성자 정의가 1개도 없는 경우에 한해, 컴파일러가 “인수없음, 처리내용없음"의 기본 생성자를 자동정의 해 준다.

### 1. 기본 생성자(Default Constructor)

클래스가 생성자를 선언하지 않으면 인자가 없는 기본 생성자가 자동으로 제공됩니다.

```dart
class Point {
  double x, y;
}

// 사용: var p = Point();
```



### 2. 일반 생성자(Constructor)

클래스와 같은 이름의 메서드로 정의합니다.

```dart
class Point {
  double x, y;
  
  Point(double x, double y) {
    this.x = x;
    this.y = y;
  }
}

// 사용: var p = Point(2, 3);
```

- 잘 안쓴다.

### 3. 간편 생성자(Shorthand Constructor)

생성자 매개변수로 클래스 필드를 초기화할 수 있는 단축 구문입니다.

```dart
class Point {
  double x, y;
  
  // 간편한 초기화 구문
  Point(this.x, this.y);
}

// 사용: var p = Point(2, 3);
```



#### ⭐️ Named Parameters 함께 사용 

```dart
class Cleric {
  String name;
  final int maxHp;
  final int maxMp;
  int hp;
  int mp;

  Cleric({required this.name, this.maxHp = 50, this.maxMp = 10, this.hp = 10, this.mp = 10});
}

// final c = Cleric(name: 'Foo');
```

- required 키워드를 넣으면 인스턴스 생성 시 키워드가 보인다.
- 이 생성자를 많이 씀
- 길어지면(80자) 코드 정렬 시 각 파라미터별로 개행이된다.
- 생성자를 통해서 기본값을 넣어야 한다. 무의미한 코드 방지
- 생성자 오버로딩을 직접적으로 지원하지 않지만, 해당 생성자를 이용해서 오버로딩과 비슷한 효과를 낼 수 이싿.
- Named Parameters에는 언더바에 바로 초기값 넣을 수 없다.
  - 초기화 리스트 사용


#### Optional 넣어 매개변수를 생략 가능

```dart
class Cleric {
  static final int maxHp = 50;
  static final int maxMp = 10;
  String name;
  int hp;
  int mp;

  Cleric(this.name, {int? hp, int? mp})
    : hp = hp ?? Cleric.maxHp,
      mp = mp ?? Cleric.maxMp;
}
```



#### 선택적 위치 매개변수 (Optional Positional Parameters)



써도되고, 안써도 되고, 그러나 네임드 파라미터도 안됨

- 대괄호 []로 감싸면 선택적 매개변수로 사용 가능
- 순서대로 값을 넣어야 하며, 일부만 설정하면 나머지는 null (또는 기본값 적용)

```dart
void greet(String name, [String? message]) {
  print('$name: ${message ?? "안녕하세요!"}');
}

void main() {
  greet('Alice');          // Alice: 안녕하세요!
  greet('Bob', '반가워!'); // Bob: 반가워!
}
```



### 4. 명명된 생성자(Named Constructor)

클래스가 여러 생성자를 가질 수 있도록 하며, 의도를 명확히 전달할 수 있습니다.

```dart
class Point {
  double x, y;
  
  Point(this.x, this.y);
  
  // 명명된 생성자
  Point.origin() {
    x = 0;
    y = 0;
  }
  
  Point.fromJson(Map<String, double> json) {
    x = json['x']!;
    y = json['y']!;
  }
}

// 사용: 
// var p1 = Point.origin();
// var p2 = Point.fromJson({'x': 1.0, 'y': 2.0});
```



### 5. 리다이렉팅 생성자(Redirecting Constructor)

같은 클래스의 다른 생성자를 호출하는 생성자입니다.

```dart
class Point {
  double x, y;
  
  Point(this.x, this.y);
  
  // 리다이렉팅 생성자
  Point.origin() : this(0, 0);
}

// 사용: var p = Point.origin();
```



### 6. 상수 생성자(Const Constructor)

컴파일 타임에 상수 객체를 생성할 수 있게 합니다.

```dart
class ImmutablePoint {
  final double x, y;
  
  // 상수 생성자
  const ImmutablePoint(this.x, this.y);
}

// 사용: 
// const p1 = const ImmutablePoint(1, 2);
// 또는 Dart 2.0 이후: const p1 = ImmutablePoint(1, 2);
```



### 7. 팩토리 생성자(Factory Constructor)

항상 새 인스턴스를 생성하지 않고, 경우에 따라 캐시된 인스턴스를 반환하거나 서브클래스 인스턴스를 반환할 수 있습니다.

```dart
class Logger {
  final String name;
  static final Map<String, Logger> _cache = <String, Logger>{};
  
  // 비공개 생성자
  Logger._internal(this.name);
  
  // 팩토리 생성자
  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }
}

// 사용: var logger = Logger('UI');
```



#### factory를 활용한 fromJson

```dart
// factory constructor를 활용
factory Movie.fromJson(Map<String, dynamic> json) {
  return Movie(
    title: json['title'] as String,
    director: json['director'] as String,
    year: json['year'] as int,
  );
}
```



### 8. 초기화 리스트(Initializer List)

생성자 본문이 실행되기 전에 인스턴스 변수를 초기화할 수 있습니다.

```dart
class Point {
  final double x;
  final double y;
  final double distanceFromOrigin;
  
  // 초기화 리스트 사용
  Point(double x, double y)
      : x = x,
        y = y,
        distanceFromOrigin = sqrt(x * x + y * y);
}

// 사용: var p = Point(3, 4); // distanceFromOrigin은 5가 됨
```



#### 생성사 본문도 같이 활용 가능

```dart
Wizard(String name, int hp, int mp, Wand? wand) :
      _name = name,
      _hp = max(0, hp),
      _mp = mp,
      _wand = wand {
  if (name.length < 3) {
    throw Exception('❎이름은 3자 이상이어야 합니다.');
  }

  if (mp < 0) {
    throw Exception('❎마법사의 MP는 0 이상이어야 합니다.');
  }
}
```





### 9. 부모 클래스 생성자 호출(Super Constructor Call)

자식 클래스에서 부모 클래스의 생성자를 호출할 수 있습니다.

```dart
class Person {
  String name;
  
  Person(this.name);
}

class Student extends Person {
  int grade;
  
  // super를 사용하여 부모 클래스 생성자 호출
  Student(String name, this.grade) : super(name);
}

// 사용: var student = Student('Alice', 12);
```



### 10. 비공개 생성자(Private Constructor)

클래스 내부에서만 접근 가능한 생성자를 만들 수 있습니다.

```dart
class Singleton {
  static final Singleton _instance = Singleton._internal();
  
  // 비공개 생성자
  Singleton._internal();
  
  // 팩토리 생성자로 인스턴스에 접근
  factory Singleton() {
    return _instance;
  }
}

// 사용: var s = Singleton(); // 항상 동일한 인스턴스 반환
```



### 11. 지연 초기화(Late Initialization)

Dart 2.12부터 `late` 키워드를 사용하여 나중에 초기화할 변수를 선언할 수 있습니다.

```dart
class Person {
  late String name;
  
  Person() {
    // 생성자 본문에서 초기화
    name = 'Unknown';
  }
}

// 사용: var p = Person();
```



## 클래스를 설계할 때

- 완벽하지 않다면 설계할때는 Bottom-Up이 편하다.
  - Top-Down으로 하면 위에서부터 완벽해야 하기 때문에 생각보다 어렵다.
- Class 설계, 구현 시 남이 만든다고 생각하고 만들면 더 꼼꼼하게 만든다.







## final, const, static 정리

### final

- 초기화 시점: 런타임에 값이 결정
- 해당 파일이 실행될 때 해당 위치에서 값이 결정
- 사용 사례:
  - 인스턴스 생성 후 변경되지 않아야 하는 속성
  - 런타임에 계산되어야 하는 불변 값 등

```dart
final String name = 'John';
final currentTime = DateTime.now(); // 런타임에 계산되는 값 가능
// 실행 시에 시간이 결정되므로 사용 가능
```



### const

- 초기화 시점: 컴파일 타임에 값이 결정
- 이 파일이 실행될 때 해당 위치에서 값이 결정
- 초기화 방법: **선언 시점에** 반드시 초기화 필요
- 메모리: 동일한 값은 메모리에 한번만 저장
- **객체마다 다른 값을 가질 수 있는 필드**는 컴파일 시점에 그 값이 확정될 수 없기 때문에 `const`로 선언할 수 없다.
- 사용 사례:
  - 절대 변경되지 않는 상수 값
  - 컴파일 시점에 알 수 있는 값



```dart
const double pi = 3.14159;
const List<int> numbers = [1, 2, 3]; // 리스트도 const 가능
const currentTime = DateTime.now(); // 오류: 컴파일 타임에 값을 알 수 없음
// 컴파일 시의 시간을 담을 수 없으므로 사용 불가. 실행은 지금이 아니라 내일도 할 수 있음
```

- final, const 사용하면 사실상 클래스 안에서 get 프로퍼티를 구현한 것과 같다.



#### flutter에서 const 사용

- `const`는 컴파일 타임 상수를 만들어 메모리를 효율적으로 사용
- 동일한 `const` 객체는 앱 전체에서 하나의 인스턴스만 공유
- 런타임에 계산할 필요가 없어 성능이 향상
- Flutter에서 위젯 리빌드 시 `const` 객체는 재사용되어 성능이 최적화
- 참조 비교만으로 동등성 확인이 가능해 빠르다
- 컴파일 타임에 오류를 감지할 수 있어 런타임 오류를 예방



### static

- **특성**: 클래스에 속하는 멤버 (클래스 변수/메서드)
- 인스턴스가 아닌 **클래스 자체**에 있음
- 초기화 시점: 클래스가 처음 참조될 때 (해당 클래스의 static 멤버에 접근하거나 인스턴스를 처음 생성할 때)
  - 프로그램이 종료될 때 해제되는 것을 의미
- 이탤릭체가 static인 얘들
- 사용 사례:
  - 모든 인스턴스가 공유해야 하는 데이터
  - 인스턴스 없이 사용해야 하는 유틸리티 함수
  - 클래스 전체에 관련된 상수



#### 그럼 swift는 왜 var하고 let만 있나?

- swift에서 let은 컴파일단에서 최적화를 다 해준다.





## 메서드 (Methods)

### 함수와 메소드의 차이

#### 함수

- **단독적으로 동작하는**. 하나의 기능을 하는 함수
- 같은 입력에 같은 출력이 나와야 함수



#### 메서드

- **클래스의 기능**은 메서드
- 메서드 중에서도 함수의 기능을 하고 있는 메서드도 있다.



#### 인스턴스와 클래스

- 가상 세계에서 활동하는 것은 인스턴스 (오브젝트)
- 인스턴스를 생성하기 위한 틀이 클래스



#### 인스턴스

- 메모리에 자리잡은 상태
- new 키워드를 사용하여 클래스로부터 인스턴스를 생성. Dart에서 new 키워드는 생략 가능




## 그냥 변수 vs 클래스 내 변수/필드(Field) vs 프로퍼티(Property)



### 변수(Variable)

- 정의: 데이터를 저장하는 메모리 공간의 이름

- 위치: 함수 내부, 전역 범위, 또는 클래스 내부에 선언 가능

  ```dart
  int count = 0;  // 일반 변수
  ```

### 클래스 내 변수/필드(Field)

- 정의: 클래스 내부에 선언된 변수

- 클래스 내 변수(필드)는 객체의 상태를 저장하는 메모리 공간에 더 가깝습니다.

- 용도: 객체의 상태를 저장

- 접근성: 접근 제한자(`_`)를 통해 접근 제한 가능:

  ```dart
  class Person {  
    String name;     // 공개 필드  
    int _age;        // 비공개 필드  
    static int count; // 정적 필드             
  }
  ```

### 프로퍼티(Property)

- 정의: 클래스의 특성을 나타내는 더 포괄적인 개념

- 프로퍼티는 클래스의 특성을 나타내는 더 넓은 개념으로, 단순히 데이터 저장에 국한되지 않고 계산된 값을 제공하거나 접근 제어 로직을 포함

- 종류

  1. 필드 기반 프로퍼티: 클래스 내 변수(필드)를 직접 사용
  2. 게터/세터 기반 프로퍼티: 메서드로 접근성과 기능 제공

  ```dart
  class Rectangle {
    // 필드 기반 프로퍼티
    double width;
    double height;
    
    // 게터/세터 기반 프로퍼티 (계산된 프로퍼티)
    double get area => width * height;
    
    set size(double value) {
      width = value;
      height = value;
    }
  }
  ```

### 주요 차이점

| 특성         | 일반 변수 | 클래스 필드    | 프로퍼티(게터/세터)       |
| ------------ | --------- | -------------- | ------------------------- |
| 저장 공간    | 있음      | 있음           | 필수 아님(계산될 수 있음) |
| 접근 방식    | 직접 접근 | 점(.) 표기법   | 점(.) 표기법              |
| 접근 제어    | 범위 기반 | 언어 규칙(`_`) | 프로그래밍 로직 가능      |
| 유효성 검사  | 불가능    | 불가능         | 가능                      |
| 계산된 값    | 불가능    | 불가능         | 가능                      |
| 호출 시 동작 | 값만 반환 | 값만 반환      | 코드 실행 가능            |



### 실제 코드 예시로 보는 차이점

```dart
class User {
  // 필드(클래스 내 변수)
  String _firstName;
  String _lastName;
  int _birthYear;
  
  // 생성자
  User(this._firstName, this._lastName, this._birthYear);
  
  // 게터/세터 기반 프로퍼티
  String get fullName => '$_firstName $_lastName';
  
  int get age {
    return DateTime.now().year - _birthYear;
  }
  
  set firstName(String name) {
    if (name.isNotEmpty) {
      _firstName = name;
    }
  }
  
  // 필드 기반 프로퍼티 접근을 위한 게터/세터
  String get lastName => _lastName;
  set lastName(String name) => _lastName = name;
}

void main() {
  // 일반 변수
  int count = 10;
  
  // 사용자 객체 생성
  var user = User('John', 'Doe', 1990);
  
  // 프로퍼티 접근
  print(user.fullName);  // John Doe (계산된 프로퍼티)
  print(user.age);       // 현재 연도 - 1990 (계산된 프로퍼티)
  
  // 프로퍼티 설정 (세터 호출)
  user.firstName = '';   // 유효성 검사로 인해 변경되지 않음
  user.firstName = 'Jane'; // 유효한 값, 변경됨
  
  // 결과 확인
  print(user.fullName);  // Jane Doe
}
```



## 인스턴스 기본 조작

### ==

`external bool operator ==(Object other);`

- 동등성 비교시 사용 됨
- Comparable 인터페이스를 구현하는것과 다르다

### identical
  - 실제로 메모리 주소가 같은지(두 객체 참조가 동일한지) 알아보는 내장 함수



### Hashcode

#### Hashcode 로직 안에서 XOR 사용하는 이유

숫자 연산에서 가장 빠른게 비트 연산이기 때문

#### `Object.hash`

- 해시 알고리즘을 가지고 무작위 해시값을 만들어줌



### Class 상속은 기능의 확장

### 손흥민을 찍어낼 수 없다.



### Sort()

- **dart는 원본을 재정렬하여 반환한다**
- 카스케이드 연산자를 사용해서 반환 가능하지만 반환만 할 뿐이지원본과 똑같음
  - 원본이 훼손 안하게끔 [Collection](https://pub.dev/packages/collection) 라이브러리 활용

### CompareTo()

- Comparator 함수

  - ```dart
    Comparator<T> = int Function(T a, Tb)
    ```

  - 비교하는 규칙을 정하는 함수

- 내가 만든 class의 경우 sort에서 런타임에러가 나는데 그 이유는 **Comparable이 구현이 안돼서**

- 그렇지만 내가 만든 class의 경우 규칙이 상황마다 달라지기 때문에 규칙을 정해두지는 않는 편이다.

#### 이렇게도 활용 가능

```dart
// 오름차순의 반대인 내림차순
names.sort((a, b) => a.compareTo(b) * -1);
```



### 얕은 복사와 깊은복사

#### 깊은 복사

- 객체의 참조값만 복사하여 원본과 복사본이 같은 메모리 주소를 가리키는 복사 방식
- String, int 등 원시타입은 깊은복사

#### 얕은 복사

- 객체의 모든 값과 내부 객체까지 완전히 새로운 메모리에 복사하여 원본과 복사본이 서로 독립적인 복사 방식



## 알쏭달쏭 얕은 복사, 깊은 복사 예시

### 중첩리스트에서 복사

```dart
// 중첩 리스트에서의 복사
List<List<int>> nested = [[1, 2], [3, 4]];

// 이건 깊은 복사일까 얕은 복사일까?
List<List<int>> copy1 = List.from(nested);
copy1[0][0] = 99;
print(nested);  // [[99, 2], [3, 4]] - 내부 리스트는 얕은 복사됨!

// 진짜 깊은 복사
List<List<int>> copy2 = nested.map((list) => List.from(list)).toList();
copy2[0][0] = 77;
print(nested);  // [[99, 2], [3, 4]] - 원본 변경 안됨
print(copy2);   // [[77, 2], [3, 4]]
```



### 얕은 복사, 깊은 복사, hashCode

```dart
class Address {
  String street;

  Address(this.street);
}

class Person {
  String name;
  final int age;
  final Address address;
  List<String> hobbies;

  Person({required this.name, required this.age, required this.address, required this.hobbies});

  Person copyWith({String? name, int? age, Address? address, List<String>? hobbies}) {
    return Person(
      name: name ?? this.name,
      age: age ?? this.age,
      address: address ?? this.address,
      hobbies: hobbies ?? this.hobbies,
    );
  }

  Person deepCopy() {
    return Person(
      name: name,
      age: age,
      address: Address(address.street), // 새 Address 인스턴스
      hobbies: List.from(hobbies), // 리스트 깊은 복사
    );
  }
}


void main() {
  final person1 = Person(name: '김', age: 10, address: Address('오산시'), hobbies: []);
  final person2 = person1.copyWith(address: Address('오산시'), hobbies: []);

  print(identical(person1, person2)); // false - 다른 인스턴스
  print(identical(person1.address, person2.address)); // false - 다른 인스턴스

  person1.address.street = '서울시';
  print(person2.address.street); // 오산시 - 다른 인스턴스

  person1.name = '박';
  print(person2.name); // 김 - 다른 인스턴스

  print([person1.hashCode, person2.hashCode]); // 해시 코드 다름 - 다른 인스턴스
  print(person1 == person2); // false - 다른 인스턴스
  print(identical(person1, person2)); // false - 주소 값 다름

  print('------------------');

  final person3 = Person(name: '천', age: 20, address: Address('강원시'), hobbies: ['sing', 'read']);
  final person4 = person3.copyWith(name: '안'); // 얕은 복사
  final person5 = person3.deepCopy();

  print(identical(person3.address, person4.address)); // true - ‼️ Address는 같은 객체 사용, 인스턴스 새로 생성 등 유의
  print(identical(person3.address.street, person4.address.street)); // true - ‼️ Address는 같은 객체 사용, 인스턴스 새로 생성 등 유의


  person3.hobbies.add('talk');
  print(person4.hobbies.length); // 3 - ‼️ 원본 변경이 리스트에 영향
  print(person5.hobbies.length); // 2 - deepCopy는 원본에 영향 안받음
}

```



## 직렬화(Serialization), 역직렬화

- 데이터 구조나 객체 상태를 저장하고 나중에 재구성할 수 있는 포맷으로 변환하는 과정
- 클래스 내부의 필드에 다른 클래스가 있다면 **모두 직렬화 처리**를 해줘야 함
- 직렬화: 클래스 -> Json

![스크린샷 2025-03-25 오전 11 42 45](https://gist.github.com/user-attachments/assets/7ed7b0a8-74b9-42dc-b11e-5ad9684a1980)



### 객체를 -> Json String 형태로 직렬화 하는 과정

```dart
final User user = User(name: '홍길동', email: 'aaa@bbb.com');

// 객체 -> Map(Json)
Map<String, dynamic> json = user.toJson(); // ⭐️toJson() 네이밍 암묵적인 룰 꼭 지키기

// Map(Json) -> String
String jsonString = jsonEncode(json);
```



### String 형태의 Json을 역직렬화를 하여 -> 객체로 변환하는 과정

```dart
// 서버에서 받은 값
final String jsonString = '{"name": "John Smith","email": "john@example.com"}';

// JsonString -> Map
final Map<String, dynamic> json = jsonDecode(jsonString);

// Map -> 객체
final User user = User.fromJson(json); // ⭐️fromJson() 네이밍 암묵적인 룰 꼭 지키기
```



## abstract class, enum, sealed class 차이



### 추상 클래스 (Abstract Class)

- **핵심**: 직접 인스턴스화할 수 없는 청사진
- **특징**: 어디서나 확장 가능하고 하위 클래스 수에 제한 없음
- **용도**: 공통 인터페이스 정의, 코드 재사용, 확장 가능한 시스템
- **선언**: `abstract class Shape { ... }`
- **요점**: "이런 기능들을 구현하세요"라는 계약 정의

### Enum

- **핵심**: 고정된 상수 값의 집합
- **특징**: 확장 불가, 미리 정의된 값만 사용
- **용도**: 간단한 상수 집합(색상, 요일, 상태 등)
- **선언**: `enum Color { red, green, blue }`
- **요점**: "이 값들 중 하나만 선택 가능합니다"

### Sealed 클래스

- **핵심**: 미리 정의된 하위 타입만 가질 수 있는 추상 클래스
- **특징**: 같은 파일에서만 직접 확장 가능, 패턴 매칭 지원
- **용도**: 상태 관리, 이벤트 처리, 결과 타입 모델링
- **선언**: `sealed class Result { ... }`
- **요점**: "이것들이 가능한 모든 경우입니다"

### 선택 기준

- **확장성 필요**: 추상 클래스
- **단순한 고정 값**: enum
- **패턴 매칭과 타입 안전성**: sealed 클래스





### sealed class

- sealed class는 얘 두개가 있구나 라고 서브타입을 봉인한다.
- sealed class는 패턴매칭을 활용하여 모든 서브타입에 대한 처리를 하기 용이하다.
- enum 하고 비슷한 효과 + 다른 객체의 참조를 가질 수 있다
  - enum에는 ==, hashCode 등이 안된다.
- main이 try-catch를 안써서 간결해진다.



#### 구현

```dart
sealed class Result<T> {
  // 컴파일 단계에서 Success와 Error만 알고 있기 때문에 타입 봉인 효과를 가진다.
 factory Result.success(T data) = Success;

 factory Result.error(String message) = Error;
}

class Success<T> implements Result<T> {
 final T data;

 Success(this.data);
}

class Error<T> implements Result<T> {
 final String message;

 Error(this.message);
}

```

#### ⭐️ frezzed로도 가능하다 위와 똑같은 코드

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'result.freezed.dart';

@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success;
  const factory Result.error(Exception e) = Error;
}
```

#### Error 타입을 다양하게도 할 수 있다

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'result.freezed.dart';

@freezed
sealed class Result<D, E> with _$Result<D, E> {
  const factory Result.success(D data) = Success;
  const factory Result.error(E error) = Error;
}
```



#### 사용 예시

```dart
void main() {
  final Result<int> result = calculate(0, 10);
  
  switch(result) {
    case Success<int>():
      // smart casting
      print(result.data);
    case Error<int>():
      print(result.message);
  }
}
```











## 설계 원칙

### 응집도 (Cohesion)

- 모듈이 **하나의 목적을 수행**하는 요소들간의 연관성 척도
- 모듈 내부의 기능적인 응집 정도를 나타냄
- **높은 응집도** : 모듈이 하나의 특정 작업이나 기능에 집중

### 결합도 (Coupling)

- 모듈이 다른 모듈에 **의존**하는 정도의 척도
- 모듈과 모듈간의 상호 결합 정도를 나타냄
- **낮은 결합도** : 모듈이 서로 독립적으로 작동할 수 있을 때



**결론: 기능별로 찢는게 좋다**



### 좋은 코드를 위해 의식해야하는 6가지 코드 작성의 원칙

#### DRY - Don’t Repeat Yourself : 같은 것을 몇번씩 반복하지 말라

- 중복 코드가 있다면 메소드로 분리한다

#### PIE(Program Intently and Expressively : 명확하고 표현력 있게 기술하자)

- 애매한 이름은 쓰지 말자
- 누가 봐도 알기 쉬운 이름을 쓰자
- 컨벤션을 따르자
- 매직 넘버에 이름을 붙이자

#### SRP - Single Responsibility Principle : 클래스에 주어진 책임은 1개뿐

- 단일 책임 원칙
- 한 부분의 에러를 수정하기 위해서는 그 클래스만 수정하면 된다.
- 하지만 클래스 분리가 심해지면 오히려 관리가 어렵기도 하다.
- **외부 객체는 생성자로 주입 받아라**

#### OCP - Open Closed Principle : 개방 폐쇄 원칙

- 확장에 대해서는 열려있고 (확장은 자유롭고), 변경에 대해서는 닫혀있다 (의존 부분의 변경은 불필요)
- 즉, 수정 없이 확장 가능하도록 하자. 상속, 인터페이스를 열심히 쓰자
- Iterable, Comparator 등이 좋은 예
- String 의 경우는 상속 금지이므로 OCP에 반하는 클래스의 대표적인 예.
- 인터페이스를 적극 활용하여 확장 가능하게 하자.

```dart
// Bad implementation
class Hero extends Character {
    Hero(super.name, super.hp);
    
    @override
    void attack(Slime slime) {
        print('$name이 $slime을 공격했다.');
        print('10의 데미지!');
        slime.hp -= 10;
    }
}

// Good implementation
class Hero extends Character {
    Hero(super.name, super.hp);
    
    @override
    void attack(Character character) {
        character.hp -= 10;
    }
}
```



#### SDP - Stable Dependencies Principle : 안전한 것에 의존하라

- ATM 시스템을 예를 들면 암호 처리 같이 한번 완성되면 수정될 가능성이 없는 클래스에 의존할 만 하다
- 하지만 가장 좋은 것은 특정 클래스가 아니라 인터페이스에 의존하는 것이다
  - 클래스는 생성자가 변하거나 할 수 있으나 인터페이스는 거의 그대로이니까.

#### ADP - Acyclic Dependencies Principle: 의존성 비순환 원칙

- 의존 관계에 사이클이 발생되지 않게 한다.





### SOLID 원칙

#### SRP - Single Responsibility Principle : 클래스에 주어진 책임은 1개뿐

- 단일 책임 원칙
- 한 부분의 에러를 수정하기 위해서는 그 클래스만 수정하면 된다.
- 하지만 클래스 분리가 심해지면 오히려 관리가 어렵기도 하다.
- **외부 객체는 생성자로 주입 받아라**

#### OCP - Open Closed Principle : 개방 폐쇄 원칙

- 확장에 대해서는 열려있고 (확장은 자유롭고), 변경에 대해서는 닫혀있다 (의존 부분의 변경은 불필요)
- 즉, 수정 없이 확장 가능하도록 하자. 상속, 인터페이스를 열심히 쓰자
- Iterable, Comparator 등이 좋은 예
- String 의 경우는 상속 금지이므로 OCP에 반하는 클래스의 대표적인 예.
- 인터페이스를 적극 활용하여 확장 가능하게 하자.

```dart
// Bad implementation
class Hero extends Character {
    Hero(super.name, super.hp);
    
    @override
    void attack(Slime slime) {
        print('$name이 $slime을 공격했다.');
        print('10의 데미지!');
        slime.hp -= 10;
    }
}

// Good implementation
class Hero extends Character {
    Hero(super.name, super.hp);
    
    @override
    void attack(Character character) {
        character.hp -= 10;
    }
}
```

#### LSP 리스코프 치환 원칙

- 객체는 프로그램의 정확성을 깨뜨리지 않으면서 하위 타입의 인스턴스로 바꿀 수 있어야 한다.
- Is a 원칙 지키자



#### ISP 인터페이스 분리 원칙

- 인터페이스 하나에 다 때려넣지 말고 여러개로 쪼개라
  - Bionic 만 구현하지 말고 Attackable, Moveable, Healable 처럼 기능별로 쪼개라



#### DIP 의존관계 역전 원칙

- 인터페이스 써라
  - 메딕이 특정 객체를 받지 않고 Helable 인터페이스 구현체를 받도록 하는 것





