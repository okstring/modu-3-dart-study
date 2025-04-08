# Pattern



- 패턴에는 여러가지 있다.
  1. 코드를 작성하는 패턴 - 소프트웨어 디자인 패턴
  2. 아키텍처 부분 쪽으로 접근하는 패턴 - ex: repository 패턴, result 패턴
  3. 전체 구조를 얘기하는 패턴 - 아키텍처

- **소프트웨어 디자인 패턴**은 코드를 작성하는 패턴



## 소프트웨어 디자인 패턴



### GoF

- Gang Of Four라는 4명의 개발자가 정리한 디자인 패턴

| 생성(Creational) 패턴            | 구조(Structural) 패턴     | 행위(Behavioral) 패턴                |
| -------------------------------- | ------------------------- | ------------------------------------ |
| • 추상 팩토리(Abstract Factory)  | • 어댑터(Adapter)         | • 책임 연쇄(Chain of Responsibility) |
| • 빌더(Builder)⭐️                 | • 브리지(Bridge)          | • 커맨드(Command)                    |
| • 팩토리 메서드(Factory Method)⭐️ | • 컴포지트(Composite)     | • 인터프리터(Interpreter)            |
| • 프로토타입(Prototype)          | • 데코레이터(Decorator)⭐️  | • 이터레이터(Iterator)⭐️              |
| • 싱글턴(Singleton)⭐️             | • 퍼사드(Facade) ⭐️        | • 미디에이터(Mediator)               |
|                                  | • 플라이웨이트(Flyweight) | • 메멘토(Memento)                    |
|                                  | • 프록시(Proxy)           | • 옵저버(Observer)⭐️                  |
|                                  |                           | • 스테이트(State)                    |
|                                  |                           | • 스트래티지(Strategy)               |
|                                  |                           | • 템플릿 메서드(Template Method)     |
|                                  |                           | • 비지터(Visitor)                    |





### 빌더 패턴 (Builder Pattern)

- 빌더 패턴은 복잡한 객체를 단계적으로 생성하는 디자인 패턴

**주요 특징:**

- 불변 객체 생성에 효과적
- 매개변수가 많은 생성자의 대안으로 사용

**활용 사례:**

- 복잡한 설정 객체 생성
- 다양한 속성을 가진 문서 객체 생성
- 복잡한 네트워크 요청 구성
- 불변 객체를 많은 선택적 필드와 함께 생성할 때

### 팩토리 패턴 (Factory Pattern)

- 인스턴스를 찍어내는 디자인 패턴
- 클라이언트가 직접 객체를 생성하는 대신, 팩토리 클래스가 객체 생성 로직을 처리

**주요 특징:**

- 객체 생성 코드를 한 곳에 집중시켜 관리
- 클라이언트는 구체적인 클래스를 알 필요 없이 원하는 타입만 지정





### Singleton 패턴 

- 팩토리와 반대되는 개념

```dart
class RentCar {
    // static 인스턴스 미리 생성
    static final RentCar _instance = RentCar._internal();
    int _count = 0;
    
    // factory 생성자
  	// 네이밍이 싱글턴과 어울리게 써야한다.
    factory RentCar() {
        return _instance;
    }
    
    // 내부에서만 사용할 named 생성자, (기본 생성자 권리 포기)
    RentCar._internal();
    
    int increment() {
        return ++_count;
    }
    
    void main() {
        final instance1 = RentCar();
        final instance2 = RentCar();
        
        print(instance1 == instance2);    // true
    }
}
```



### Decorator 패턴 (Flutter)

- flutter에서 쓰임

```dart
void main() {
 Scaffold(
   appBar: TextWidget('App bar'),
   body: FullBorder(
     child: TextWidget('body'),
   ),  // FullBorder
   floatingActionButton: TextWidget('button'),
 );  // Scaffold
}
```



### Iterator - 반복구조

![스크린샷 2025-04-08 오전 11.41.49](/Users/okstring/Documents/image/스크린샷 2025-04-08 오전 11.41.491.png)

### Facade - 내부를 감추고 심플하게 (http 패키지, 라이브러리)

- 복잡한 하위 시스템을 단순화 하기 위한 패턴

- 이사를 가면 주소를 변경할 때, 주민센터, 카드회사, 학교 등에 알려야 한다. 이를 하나하나 일일이 하는 것은 매우 귀찮기 때문에 한번에 해 주는 서비스가 있다면 그것을 이용하면 된다는 이론

- Repository 패턴은 파사드 패턴과 비슷하지만 같지는 않다.

  - **파사드 패턴과 레포지토리 패턴의 핵심 차이**

    **파사드 패턴**: "복잡한 것들을 하나로 모아 단순하게 보여주기"

    - 여러 복잡한 시스템을 하나의 간단한 창구로 통합
    - 사용자는 내부 복잡성을 알 필요 없이 단일 인터페이스만 사용

    **레포지토리 패턴**: "데이터 접근 방법을 숨기고 표준화하기"

    - 데이터가 어디에 있든(DB, API, 파일 등) 동일한 방식으로 접근
    - 비즈니스 로직에서 데이터 저장소 세부사항을 완전히 분리

    가장 큰 차이점: 파사드는 복잡한 시스템 전체를 단순화하는 반면, 레포지토리는 specifically 데이터 접근에만 집중합니다.



### Strategy (전략 패턴) - 갈아 끼우기

- **런타임**에 알고리즘을 동적으로 교체할 수 있도록

```dart
class PaymentContext {
    PaymentStrategy strategy;
    
    PaymentContext(PaymentStrategy strategy) {
        this.strategy = strategy;
    }
    
    void setStrategy(PaymentStrategy strategy) {
        this.strategy = strategy;
    }
    
    void executePayment(int amount) {
        strategy.pay(amount);
    }
}

void main() {
    var context = new PaymentContext(new CreditCardPayment());
    context.executePayment(100); // 출력: Paid 100 using Credit Card
    
    context.setStrategy(new PayPayPayment());
    context.executePayment(200); // 출력: Paid 200 using PayPal
}
```



### Observer 패턴

옵저버 패턴은 어떤 객체의 상태 변화가 있을 때, 그 변화를 관심 있는 객체들(옵저버)에게 자동으로 알려주는 디자인 패턴

- 콜백 함수
- 관찰 대상(Subject)가 자신의 상태 변경을 여러 관찰자(Observer)에게 알리는 패턴

```dart
class Subject {
  List<void Function(String)> _observers = [];

  void addObserver(void Function(String) observer) {
    _observers.add(observer);
  }

  void notifyObservers(String message) {
    for (var observer in _observers) {
      observer(message);
    }
  }

  void doSomething() {
    print("Doing something...");
    notifyObservers("State changed!");
  }
}

void main() {
  var subject = Subject();
  subject.addObserver((msg) => print("Observer 1: $msg"));
  subject.addObserver((msg) => print("Observer 2: $msg"));
  subject.doSomething();
}
```





## 아키텍처 부분 패턴



### DataSource

- 앱이 사용하는 원천 데이터를 가져오는 통로
  - 마치 재료를 준비하는 프랩 과정
  - 다양한 형태: 파일, 텍스트, JSON, DB
- Raw 데이터 수신 및 처리
- CRUD 작업 수행
- 구현체가 하나뿐이라면 Impl 접미사를 붙이는게 관례
- csv는 JSON 대비 Key가 없고 내용만 있기 때문에 JSON 대비 대략 절반의 메모리만 사용





### Model Class, Repository 개념

- 데이터를 조회할 수 있는 클래스
- 별도의 기능을 가지지 않는 순수한 클래스로 작성
- 데이터 소스를 필요한 형태로 변환한 데이터, 앱개발을 편리하게 해주는 역할



###  비슷한 용어들

- 도메인 모델: 비즈니스 문제 영역의 개념과 규칙을 코드로 표현한 객체 모델
- Entity: 고유한 식별자(ID)를 가지며 생명주기동안 지속적으로 변경될 수 있는 도메인
- DTO: 계층간 데이터 전송을 위해 설계된 단순한 데이터 컨테이너
- POJO: 특정 프레임워크나 규약에 종속되지 않은 순수한 자바 객체
- VO: 값 자체가 의미를 갖는 불변의 객체로, 속성값이 같으면 동일한 객체로 취급
- 데이터 클래스(4종세트 포함)
  - hashCode, toString(), copyWith(), ==(equals)



### DDD(Domain Driven Design)

- 유사한 업무의 집합
- 특정 상황(주문, 결재, 로그인)이나 특정 객체(유저, 손님)가 중심이 될 수 있음
- 모델 클래스
  - 도메인을 클래스로 작성한 것



### 알쏭달쏭 const constructor

```dart
void main() {
  final user = User('name', 10);
  final user2 = User('name', 10);
  
  print(identical(user, user2)); // false: const로 생성하려면 User 앞에다가 const를 붙여야 한다.
}

class User {
  final String name;
  final int age;
  
  const User(this.name, this.age);
}
```





### Repository 패턴

- 데이터 접근에 대한 추상화 계층
- 데이터 소스 은닉
- 데이터 매핑과 변환 담당
- 데이터 소스(DB, Fild 등)와의 통신을 담당하는 객체를 캡슐화하는 디자인 패턴
- 도메인 의도가 명확히 드러남



#### 주의할 점

- Repository는 비즈니스 로직에 집중
- 복잡한 비즈니스 로직은 더 상위 계층으로
- 성능을 고려한 쿼리 설계 필요







### DTO, Mapper

### DTO(Data Transfer Object)

- 데이터 소스를 모델 클래스로 변환하는 과정에서 순수하게 클래스에 담기 위한 중간 전달 객체
- DTO에 toJson(), fromJson이 위치한다.
- 모든 필드가 Nullable 변수
  - 그러므로 불완전한 코드가 포함될 것 같다면 DTO 도입하자
- int, double 자료형은 num으로 안전하게 받는다

### Mapper

- DTO를 모델 클래스로 변환
- mapper를 따로 나누는 이유는 DTO와 의존이 되어있기 때문
- 작성 시 extension을 선호하는 이유
  - DTO는 자동으로 만들고 수정하지 않는다.
  - mapper는 복잡한 로직이 포함될 수 있어서 인간이 작성
  - 문제있으면 여기만 살핀다.



### Model

- class는 non-nullable 값만 가지고 있도록 한다





### Result 패턴

- try-catch는 런타임 에러 뿐만 아니라 논리적인 오류나 예외 상황에 대한 처리를 하기에 부족
- Result패턴은 성공, 실패시 처리에 유용한 패턴
- 뷰에 넘겨주기 직전인 일단 repository에서 result 사용



### 장점

- 타입 안정성 향상
- 에러 처리 강제성
- 에러타입의 명확한 문서화
- try-catch 남용 방지
- 비즈니스 로직과 에러 처리 분리
- 옵셔널(Nullable) 타입 감소
- 테스트 용이성

```dart
test('이메일이 유효하지 않으면 에러를 반환한다', () {
  final result = registerUser(email: 'invalid-email', password: 'password');
  
  expect(
    result,
    Result<User, RegistrationError>.error(
      error: RegistrationError.invalidEmail(),
    ),
  );
});
```



- 패턴 매칭을 통한 가독성 향상





## 아키텍처 전체 패턴





### 전체적인 **구조(Architecture)**에 대한 좋은 패턴

- MVC
- MVC2: 자바 예시
- MVP: View는 직접 통신하지 않음
- **MVVM**
- MVI



### MVC, MVP, MVVM, MVI 패턴 간략 비교

#### 주요 차이점

- **MVC**: 가장 전통적인 패턴으로 구현이 간단하나 컴포넌트 간 결합도가 높음
- **MVP**: 테스트 용이성이 높으며 View와 Presenter는 일반적으로 1:1 관계
- **MVVM**: 데이터 바인딩으로 코드량 감소, ViewModel은 View에 대해 알지 못함
- **MVI**: 상태 관리에 중점을 두며 불변성과 예측 가능성 제공, 반응형 프로그래밍과 잘 어울림

#### 적합한 사용 환경

- **MVC**: 간단한 애플리케이션, 웹 프레임워크(Spring MVC, Rails)
- **MVP**: UI 로직이 복잡하고 테스트가 중요한 애플리케이션
- **MVVM**: 데이터 바인딩 지원 환경(Angular, Vue.js, WPF)
- **MVI**: 복잡한 상태 관리가 필요한 모바일 앱, 반응형 프로그래밍 환경





