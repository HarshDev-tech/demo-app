import 'package:demo_app/core/di/di.dart';
import 'package:demo_app/feature/dashboard/domain/usecases/get_albums.dart';
import 'package:demo_app/feature/dashboard/domain/usecases/get_photos.dart';
import 'package:demo_app/feature/dashboard/presentation/bloc/app_bloc.dart';
import 'package:demo_app/feature/routes/route_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/theme/theme_data.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(
        getIt<GetAlbums>(), // Retrieve GetAlbums from GetIt
        getIt<GetPhotos>(), // Retrieve GetPhotos from GetIt
      ),
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: DemoAppRouteSettings.onGenerateRoutes,
      ),
    );
  }
}
