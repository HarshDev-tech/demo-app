import 'package:flutter_cache_manager/file.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';


part 'photo_data.g.dart';
part 'photo_data.freezed.dart';


@freezed
class PhotoModel with _$PhotoModel{
  @HiveType(typeId: 1)
  const factory PhotoModel({
    @HiveField(0) int? albumId,
    @HiveField(1) int? id,
    @HiveField(2) String? title,
    @HiveField(3) String? url,
    @HiveField(4) String? thumbnailUrl,
    @HiveField(5) String? localPath,
  }) = _PhotoModel;

  factory PhotoModel.fromJson(Map<String, dynamic> json) => _$PhotoModelFromJson(json);

}