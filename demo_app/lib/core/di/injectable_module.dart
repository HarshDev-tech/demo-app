import 'package:demo_app/feature/dashboard/data/models/album_data.dart';
import 'package:demo_app/feature/dashboard/data/models/photo_data.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';




@module
abstract class InjectableModule {
  @preResolve
  @lazySingleton
  Future<Box<AlbumModel>> get albumBox async {
    return await Hive.openBox<AlbumModel>('albums');
  }

  @preResolve
  @lazySingleton
  Future<Box<PhotoModel>> get photoBox async {
    return await Hive.openBox<PhotoModel>('photos');
  }

  @lazySingleton
  DefaultCacheManager get cacheManager => DefaultCacheManager();
}
