import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-18/wizard.dart';

void main() {
  const filePath = '/Users/junsuk/dev/FlutterProjects/modu-3-dart-study/lib/2025-03-25';
  final File myFile = File('$filePath/my_file.txt');

  // 열고 & 내용 쓰기 & 닫기
  // \n은 줄바꿈 : escape sequence
  myFile.writeAsStringSync('Hello\n', mode: FileMode.append);
  myFile.writeAsStringSync('Hello\n', mode: FileMode.append);
  myFile.writeAsStringSync('Hello\n', mode: FileMode.append);
  myFile.writeAsStringSync('Hello\n', mode: FileMode.append);

  // 파일에서 읽기
  final test = myFile.readAsStringSync();
  print(test);

  final saveFile = File('$filePath/save.txt');

  Wizard wizard = Wizard(name: '홍길동', hp: 100);

  final Map<String, dynamic> json = wizard.toJson();
  print(json.toString());

  final String jsonString = jsonEncode(json);
  print(jsonString);

  saveFile.writeAsStringSync(jsonString);
}