// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_cache_manager/flutter_cache_manager.dart' as _i447;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/dashboard/data/datasource/local/local_data_source.dart'
    as _i454;
import '../../feature/dashboard/data/datasource/remote/remote_data_source.dart'
    as _i7;
import '../../feature/dashboard/data/models/album_data.dart' as _i365;
import '../../feature/dashboard/data/models/photo_data.dart' as _i289;
import '../../feature/dashboard/data/repository/app_repository_impl.dart'
    as _i783;
import '../../feature/dashboard/domain/repository/app_repository.dart' as _i53;
import '../../feature/dashboard/domain/usecases/get_albums.dart' as _i362;
import '../../feature/dashboard/domain/usecases/get_photos.dart' as _i812;
import '../../feature/dashboard/presentation/bloc/app_bloc.dart' as _i30;
import 'injectable_module.dart' as _i109;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i7.AppRemoteDataSource>(() => _i7.AppRemoteDataSource());
    await gh.lazySingletonAsync<_i979.Box<_i365.AlbumModel>>(
      () => injectableModule.albumBox,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i979.Box<_i289.PhotoModel>>(
      () => injectableModule.photoBox,
      preResolve: true,
    );
    gh.lazySingleton<_i447.DefaultCacheManager>(
        () => injectableModule.cacheManager);
    gh.lazySingleton<_i454.AppLocalDataSource>(() => _i454.AppLocalDataSource(
          albumBox: gh<_i979.Box<_i365.AlbumModel>>(),
          photoBox: gh<_i979.Box<_i289.PhotoModel>>(),
          cacheManager: gh<_i447.DefaultCacheManager>(),
        ));
    gh.lazySingleton<_i53.AppRepository>(() => _i783.AppRepositoryImpl(
          localDataSource: gh<_i454.AppLocalDataSource>(),
          remoteDataSource: gh<_i7.AppRemoteDataSource>(),
          cacheManager: gh<_i447.DefaultCacheManager>(),
        ));
    gh.lazySingleton<_i362.GetAlbums>(
        () => _i362.GetAlbums(gh<_i53.AppRepository>()));
    gh.lazySingleton<_i812.GetPhotos>(
        () => _i812.GetPhotos(gh<_i53.AppRepository>()));
    gh.lazySingleton<_i30.AppBloc>(() => _i30.AppBloc(
          gh<_i362.GetAlbums>(),
          gh<_i812.GetPhotos>(),
        ));
    return this;
  }
}

class _$InjectableModule extends _i109.InjectableModule {}
