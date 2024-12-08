import 'package:hive_flutter/hive_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'album_data.g.dart';
part 'album_data.freezed.dart';

@freezed
class AlbumModel with _$AlbumModel{
  @HiveType(typeId: 0)
  const factory AlbumModel({
    @HiveField(0)  int? userId,
    @HiveField(1)  int? id,
    @HiveField(2)  String? title,
  }) = _AlbumModel;

  factory AlbumModel.fromJson(Map<String, dynamic> json) => _$AlbumModelFromJson(json);

}