import 'package:dartz/dartz.dart';
import 'package:demo_app/core/error/failure.dart';
import 'package:demo_app/feature/dashboard/data/models/album_data.dart';
import 'package:demo_app/feature/dashboard/data/models/photo_data.dart';

abstract class AppRepository {
  Future<Either<Failure, List<AlbumModel>>> getAlbums();

  Future<Either<Failure, List<PhotoModel>>> getPhotos();
}
