import '../data_source/comment_data_source.dart';
import '../data_source/local/comment_data_source_impl.dart';
import '../model/comment.dart';
import 'comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource commentDataSource;

  CommentRepositoryImpl({CommentDataSource? commentDataSource})
    : commentDataSource = commentDataSource ?? CommentDataSourceImpl();

  @override
  Future<List<Comment>> getComments(int postId) async {
    const path = 'assignment/2025-04-01/assets/comments.json';
    final json = await commentDataSource.fetchComments(path);
    return json
        .map((e) => Comment.fromJson(e))
        .where((e) => e.postId == postId)
        .toList();
  }
}
