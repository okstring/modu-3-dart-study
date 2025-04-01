import 'dart:convert';
import 'dart:io';

import '../album_data_source.dart';

class AlbumDataSourceImpl implements AlbumDataSource {
  @override
  List<Map<String, dynamic>> fetchAlbums(String path) {
    final jsonString = File(path).readAsStringSync();
    return jsonDecode(jsonString) as List<Map<String, dynamic>>;
  }
}
