import 'dart:io';

class TodoApp {

}

void main() {
  bool isExit = false;
  String? input;

  while (!isExit) {
    print('1. 입력');
    print('2. 출력');
    print('0. 종료');

    input = stdin.readLineSync();

    if (input == '0') {
      isExit = true;
    }
  }
}
