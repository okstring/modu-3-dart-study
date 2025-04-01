import 'dart:convert';
import 'dart:io';

import '../photo_data_source.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  @override
  Future<List<Map<String, dynamic>>> fetchPhotos(String path) async {
    final jsonString = await File(path).readAsString();
    return jsonDecode(jsonString) as List<Map<String, dynamic>>;
  }
}
