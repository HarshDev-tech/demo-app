import 'package:demo_app/feature/dashboard/presentation/bloc/app_bloc.dart';
import 'package:demo_app/feature/dashboard/presentation/widgets/album_section.dart';
import 'package:demo_app/feature/dashboard/presentation/widgets/error_screen.dart';
import 'package:demo_app/feature/dashboard/presentation/widgets/loading_indicator.dart';
import 'package:demo_app/feature/dashboard/presentation/widgets/no_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:infinite_listview/infinite_listview.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final ScrollController _controller;
  late final InfiniteScrollController _infiniteController;
  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _infiniteController = InfiniteScrollController(initialScrollOffset: 0.0,keepScrollOffset: false);
    BlocProvider.of<AppBloc>(context).add(FetchAlbumsAndPhotos());
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {

        if (state is AlbumsAndPhotosLoadedState) {
          return Scaffold(
            body: ListView.builder(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                  bottom: MediaQuery.of(context).padding.bottom,
                  right: MediaQuery.of(context).padding.right,
                  left: MediaQuery.of(context).padding.left),
              controller: _controller,
              addAutomaticKeepAlives: true,
              // itemCount: state.albumPhotos.length,
              itemBuilder: (BuildContext context, int index) {
                final loopedIndex = index % state.albumPhotos.length;
                return AlbumSection(albumPhotos: state.albumPhotos[loopedIndex],infiniteScrollController: _infiniteController,);
              },
            ),
          );
        } else if (state is DataLoadingState) {
          return Scaffold(
              body: CustomLoadingIndicator(message: "data loading..."));
        } else if (state is DataErrorState) {
          return NoDataScreen(
            onPressed: () {
              BlocProvider.of<AppBloc>(context).add(FetchAlbumsAndPhotos());
            },
          );
        }else {
          return
            ErrorScreen(
            onPressed: () {
              BlocProvider.of<AppBloc>(context).add(FetchAlbumsAndPhotos());
            },
          );
        }
      },
    );
  }
}
