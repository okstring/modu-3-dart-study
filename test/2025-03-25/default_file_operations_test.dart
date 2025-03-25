import 'dart:io';
import '../../assignment/2025-03-25/index.dart';
import 'package:test/test.dart';

void main() {
  group('DefaultFileOperations 테스트', () {
    final defaultFileOperations = DefaultFileOperations();
    const sourcePath =
        '/Users/okstring/Documents/flutter/modu-3-dart-study/assignment/2025-03-25/my_file.txt';
    const targetPath =
        '/Users/okstring/Documents/flutter/modu-3-dart-study/assignment/2025-03-25/copy/my_file.txt';

    test('파일 복사가 정상적으로 이뤄지고 파일 이름과 내용이 같아야 한다.', () {
      defaultFileOperations.copy(sourcePath, targetPath);

      final sourceFile = File(sourcePath);
      final targetFile = File(targetPath);
      final sourceFileName = sourceFile.path.split('/').last;
      final targetFileName = targetFile.path.split('/').last;

      expect(sourceFile.readAsStringSync(), equals(targetFile.readAsStringSync()));
      expect(sourceFileName, equals(targetFileName));
    });

    tearDown(() {
      final sourceFile = File(sourcePath);
      final targetFile = File(targetPath);

      sourceFile.delete();
      targetFile.delete();
    });
  });
}
