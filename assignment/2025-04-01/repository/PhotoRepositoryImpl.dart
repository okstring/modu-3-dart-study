import '../data_source/local/photo_data_source_impl.dart';
import '../data_source/photo_data_source.dart';
import '../model/photo.dart';
import 'PhotoRepository.dart';

class PhotorepositoryImpl implements PhotoRepository {
  final PhotoDataSource photoDataSource;

  PhotorepositoryImpl({
    PhotoDataSource? photoDataSource
  }): photoDataSource = photoDataSource ?? PhotoDataSourceImpl();

  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    const path = 'assignment/2025-04-01/assets/photos.json';
    final json = await photoDataSource.fetchPhotos(path);
    return json.map((e) => Photo.fromJson(e))
        .where((e) => e.albumId == albumId)
        .toList();
  }
}