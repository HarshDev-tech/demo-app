import 'dart:async';
import 'dart:io';
import 'package:demo_app/feature/dashboard/data/models/album_data.dart';
import 'package:demo_app/feature/dashboard/data/models/photo_data.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppLocalDataSource{
  final Box<AlbumModel>? albumBox;
  final Box<PhotoModel>? photoBox;
  final DefaultCacheManager? cacheManager;

  AppLocalDataSource(
      { this.albumBox, this.photoBox, this.cacheManager});

  Future<List<AlbumModel>> getAlbums() async {
    return albumBox!.values.toList();
  }

  Future<List<PhotoModel>> getPhotos() async {
    return photoBox!.values.toList();
  }

  Future<void> saveAlbums(List<AlbumModel> albums) async {
    await albumBox!.clear(); // Optional: Clear old data before saving
    await albumBox!.addAll(albums);
  }

  Future<void> savePhotos(List<PhotoModel> photos) async {
    await photoBox!.clear(); // Optional: Clear old data before saving
    await photoBox!.addAll(photos);
  }

  Future<File?> downloadAndSaveToAppDirectory(PhotoModel photo) async {
    //keyformat album_images/1.jpg
    final cacheFile = await DefaultCacheManager().getFileFromCache("${photo.albumId}${photo.id}");
    if(cacheFile != null) {
      return cacheFile.file;
    }
    unawaited(DefaultCacheManager().downloadFile(photo.url!, key: "${photo.albumId}${photo.id}"));
    return null;
  }
}
