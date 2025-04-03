import 'dart:typed_data';

abstract interface class ImageDataSource {
  Future<Uint8List> fetchImage(String url);
  Future<void> saveImage(Uint8List bytes, String path);
}

abstract interface class ImageRepository {
  // URL에서 이미지를 다운로드하여 지정된 경로에 저장
  Future<void> saveImage(String url, String path);

  // 여러 URL의 이미지를 지정된 디렉토리에 저장
  Future<void> saveImages(List<String> urls, String directory);
}
