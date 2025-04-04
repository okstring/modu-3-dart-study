import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-04-04/data_source/photo_data_source.dart';

import '../dto/photo_dto.dart';

class PhotoDateSourceImpl implements PhotoDataSource {
  @override
  Future<List<PhotoDto>> fetchPhotos() async {
    final jsonString = await File('lib/2025-04-04/data/photos.json').readAsString();
    // 비표준 따옴표을 표준 따옴표로 변환
    final String processedJsonString = jsonString.replaceAll('“', '"').replaceAll('”', '"');
    final List<dynamic> json = jsonDecode(processedJsonString);
    return json.map((e) {
      print(e);
      return PhotoDto.fromJson(e);
    }).toList();
  }
}