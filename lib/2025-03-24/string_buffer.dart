void main() {
  final buffer = StringBuffer('Dart');
  buffer.write(' is ');
  buffer.write('뾰족하다');

  print(buffer);

  stringBufferTest();
  stringTest();
}

void stringBufferTest() {
  StringBuffer name = StringBuffer('오준석');

  Stopwatch stopwatch = Stopwatch();
  stopwatch.start();

  for (int i = 0; i < 100000; i++) {
    name.write('$i');
  }

  print(stopwatch.elapsed);
}

void stringTest() {
  String name = '오' + '준석';

  Stopwatch stopwatch = Stopwatch();
  stopwatch.start();

  // 오준석
  // 오준석0
  // 오준석01
  // ...
  for (int i = 0; i < 100000; i++) {
    // 새로운 인스턴스 생성은 비용(cost)이 많이 든다
    name = '$name$i'; // 문자열이 결합될 때마다 새로운 인스턴스가 생성됨.
  }

  // GC (Garbage Collection) : 메모리 정리


  print(stopwatch.elapsed);
}