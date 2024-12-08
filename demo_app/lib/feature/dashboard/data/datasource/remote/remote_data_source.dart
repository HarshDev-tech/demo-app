import 'package:demo_app/core/config/api_end_points.dart';
import 'package:demo_app/core/config/base_url_config.dart';
import 'package:demo_app/core/error/failure.dart';
import 'package:demo_app/core/service/api_service.dart';
import 'package:demo_app/feature/dashboard/data/models/album_data.dart';
import 'package:demo_app/feature/dashboard/data/models/photo_data.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class AppRemoteDataSource {
  Future<List<AlbumModel>> getAlbums() async {
    final response = await APIService.instance.request(
      BaseUrlConfig.baseUrlDevelopment + APIEndPoints.albums,
      DioMethod.get,
      contentType: 'application/json',
    );

    if (response.statusCode == 200) {
      return (response.data as List).map((album) => AlbumModel.fromJson(album)).toList();
    } else {
      throw ServerFailure('Failed to fetch albums from server');
    }
  }

  Future<List<PhotoModel>> getPhotos() async {

    final response = await APIService.instance.request(
      BaseUrlConfig.baseUrlDevelopment + APIEndPoints.photos,
      DioMethod.get,
      contentType: 'application/json',
    );
    if (response.statusCode == 200) {

      return (response.data as List).map((photo) => PhotoModel.fromJson(photo)).toList();
    } else {
      throw ServerFailure('Failed to fetch photos from server');
    }
  }
}
