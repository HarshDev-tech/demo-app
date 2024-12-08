import 'package:dartz/dartz.dart';
import 'package:demo_app/core/error/failure.dart';
import 'package:demo_app/core/usecase/usecase.dart';
import 'package:demo_app/feature/dashboard/data/models/photo_data.dart';
import 'package:demo_app/feature/dashboard/domain/repository/app_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPhotos extends UseCase<List<PhotoModel>, NoParams> {
  @preResolve
  final AppRepository repository;

  GetPhotos(this.repository);

  @preResolve
  @override
  Future<Either<Failure, List<PhotoModel>>> call(NoParams params) async {
    return await repository.getPhotos();
  }
}
