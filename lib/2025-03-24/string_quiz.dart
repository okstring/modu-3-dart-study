void main() {
  final str1 = 'Hello'; // const
  const str2 = 'Hello';

  print(identical(str1, str2)); // true

  final str3 = String.fromCharCodes('Hello'.codeUnits);   // runtime
  print(identical(str1, str3)); // false

  String str4 = 'Hel' + 'lo';  // 언어마다 다를 수 있음. 컴파일러 최적화를 하냐 안하냐에 따라 다를 수 있다
  print(identical(str1, str4)); // false


  String str5 = 'Hel${getLo()}';  // runtime
  print(identical(str1, str5)); // false
}

String getLo() {
  return 'lo';
}