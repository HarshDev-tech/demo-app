import 'dart:isolate';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:demo_app/core/error/failure.dart';
import 'package:demo_app/feature/dashboard/data/datasource/local/local_data_source.dart';
import 'package:demo_app/feature/dashboard/data/datasource/remote/remote_data_source.dart';
import 'package:demo_app/feature/dashboard/data/models/album_data.dart';
import 'package:demo_app/feature/dashboard/data/models/photo_data.dart';
import 'package:demo_app/feature/dashboard/domain/repository/app_repository.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AppRepository)
class AppRepositoryImpl implements AppRepository {
  final AppLocalDataSource localDataSource;
  final AppRemoteDataSource remoteDataSource;
  final DefaultCacheManager cacheManager;

  AppRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.cacheManager,
  });

  @override
  Future<Either<Failure, List<AlbumModel>>> getAlbums() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    try {
      if (connectivityResult.contains(ConnectivityResult.wifi) || connectivityResult.contains(ConnectivityResult.mobile)) {
        final remoteAlbums = await remoteDataSource.getAlbums();
        await localDataSource.saveAlbums(remoteAlbums);
        return Right(remoteAlbums);
      }
      final localAlbums = await localDataSource.getAlbums();
      if (localAlbums.isNotEmpty) {
        return Right(localAlbums);
      }
      return Left(CacheFailure('No local albums available.'));

    } catch (e) {
      return Left(ServerFailure('Failed to fetch albums: $e'));
    }
  }

  @override
  Future<Either<Failure, List<PhotoModel>>> getPhotos() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    try {
      final localPhotos = await localDataSource.getPhotos();
      if (localPhotos.isNotEmpty) {
        return Right(localPhotos);
      }

      final remotePhotos = await remoteDataSource.getPhotos();
      final rootIsolateToken = RootIsolateToken.instance!;
      await preloadImages(remotePhotos,rootIsolateToken);
      await localDataSource.savePhotos(remotePhotos);
      return Right(remotePhotos);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch photos: $e'));
    }
  }

  Future<void> preloadImages(List<PhotoModel> photos, RootIsolateToken rootIsolateToken) async {
    final receivePort = ReceivePort();
    await Isolate.spawn(_cacheImagesIsolate, [receivePort.sendPort, rootIsolateToken]);

    final sendPort = await receivePort.first as SendPort;
    sendPort.send(photos);
  }

  static void _cacheImagesIsolate(List<dynamic> args) async {
    final sendPort = args[0] as SendPort;
    final rootIsolateToken = args[1] as RootIsolateToken;
    final port = ReceivePort();
    sendPort.send(port.sendPort);

    BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);

    await for (final message in port) {
      final photos = message as List<PhotoModel>;
      final cacheManager = DefaultCacheManager();

      for (final photo in photos) {
        if (photo.url != null) {
          await cacheManager.downloadFile(photo.url!, key: "${photo.id}${photo.albumId}");
        }
      }
    }
  }
}
