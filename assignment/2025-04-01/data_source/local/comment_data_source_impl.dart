import 'dart:convert';
import 'dart:io';

import '../comment_data_source.dart';

class CommentDataSourceImpl implements CommentDataSource {
  @override
  Future<List<Map<String, dynamic>>> fetchComments(String path) async {
    final jsonString = await File(path).readAsString();
    return jsonDecode(jsonString);
  }
}
