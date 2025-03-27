import 'dart:io';

abstract interface class FileOperations {
  Future<void> copy(String sourcePath, String targetPath);
}

class DefaultFileOperations implements FileOperations {
  @override
  Future<void> copy(String sourcePath, String targetPath) async {
    final sourceFile = File(sourcePath);
    final targetFile = File(targetPath);

    if (!sourceFile.existsSync()) {
      throw Exception('원본 경로가 잘못 되었습니다');
    }

    final sourceText = await sourceFile.readAsString();
    await targetFile.writeAsString(sourceText);
  }
}