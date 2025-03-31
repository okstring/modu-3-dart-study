void main() async {
  // bird1();
  // bird2();
  // bird3();

  await Future.wait([bird1(), bird2(), bird3()]);

  print('끝');
}

Future<void> bird1() async {
  for (int i = 0; i < 4; i++) {
    print('$i : 꾸우');
    await Future.delayed(Duration(seconds: 1));
  }
}

Future<void> bird2() async {
  for (int i = 0; i < 4; i++) {
    print('$i : 까악');
    await Future.delayed(Duration(seconds: 2));
  }
}

Future<void> bird3() async {
  for (int i = 0; i < 4; i++) {
    print('$i : 짹짹');
    await Future.delayed(Duration(seconds: 3));
  }
}
