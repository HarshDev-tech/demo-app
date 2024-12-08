import 'package:dartz/dartz.dart';
import 'package:demo_app/core/error/failure.dart';
import 'package:demo_app/core/usecase/usecase.dart';
import 'package:demo_app/feature/dashboard/data/models/album_data.dart';
import 'package:demo_app/feature/dashboard/domain/repository/app_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAlbums extends UseCase<List<AlbumModel>, NoParams> {
  @preResolve
  final AppRepository repository;

  GetAlbums(this.repository);

  @preResolve
  @override
  Future<Either<Failure, List<AlbumModel>>> call(NoParams params) async {
    return await repository.getAlbums();
  }
}
