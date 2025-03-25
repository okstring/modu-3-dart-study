import 'package:intl/intl.dart';

void main() {
  final name = '오준석';

  myFunction();

  try {
    final now = DateTime.parse('2o2o-o1-o1');
    print(now);
  } catch (e) {
    print(e);
  }

}


void myFunction() {
  throw MyException('내가 만든 익셉션');
}

class MyException implements Exception {
  final String message;

  MyException(this.message);

  @override
  String toString() {
    return 'MyException{message: $message}';
  }
}