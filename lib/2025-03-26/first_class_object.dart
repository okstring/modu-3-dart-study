import 'dart:math';

void main() {
  // 1급 객체 : 변수에 대입할 수 있는 객체
  String name = '오준석';
  String name2 = name;
  int num = 10;
  int Function(int, int) myFunction = sum;    // 함수도 1급 객체

  Function myFunction2 = sum;

  print(myFunction(5, 5));
  print(sum(5, 5));


  List<int> nums = [1, 2, 3];

  final List<int> filteredNumbers = nums.where((e) => e.isEven).toList();


  for(int num in nums) {
  }


  nums.forEach((int value) {
    print(value);
  });

  // String Function(dynamic)
  var loudify = (String msg) => '1121323 $msg';

  print(loudify('hello'));

  myHigherOrderFunction((value) {
    print('$value : 생존코딩');
  });

  // 1 + 2, 3
  // 3 + 3
  // 6
  final result = nums.reduce(max);

  print(result);

}

void printElement(int value) {
  print(value);
}

int sum(int a, int b) => a + b;

// 고계함수
void myHigherOrderFunction(void Function(String) func) {
  print('함수 시작했다');

  // 실행 결과 예측 안 됨
  func('오준석');

  print('함수 끝났다');
}