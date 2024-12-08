import 'package:demo_app/app.dart';
import 'package:demo_app/core/di/di.dart';
import 'package:demo_app/feature/dashboard/data/models/album_data.dart';
import 'package:demo_app/feature/dashboard/data/models/photo_data.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(AlbumModelImplAdapter());
  Hive.registerAdapter(PhotoModelImplAdapter());

  await configureDependencies();

  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MyApp());
}



