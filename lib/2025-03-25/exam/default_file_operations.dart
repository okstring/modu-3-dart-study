import 'dart:io';

abstract interface class FileOperations {
  void copy(String sourcePath, String targetPath);
}

class DefaultFileOperations implements FileOperations {
  @override
  void copy(String sourcePath, String targetPath) {
    final sourceFile = File(sourcePath);
    final targetFile = File(targetPath);

    if (!sourceFile.existsSync()) {
      throw Exception('원본 경로가 잘못 되었습니다');
    }

    final sourceText = sourceFile.readAsStringSync();
    targetFile.writeAsStringSync(sourceText);
  }
}