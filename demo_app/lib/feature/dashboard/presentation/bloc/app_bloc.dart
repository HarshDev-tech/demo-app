import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:demo_app/core/usecase/usecase.dart';
import 'package:demo_app/feature/dashboard/data/models/album_data.dart';
import 'package:demo_app/feature/dashboard/data/models/photo_data.dart';
import 'package:demo_app/feature/dashboard/domain/usecases/get_albums.dart';
import 'package:demo_app/feature/dashboard/domain/usecases/get_photos.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';


part 'app_event.dart';

part 'app_state.dart';

@lazySingleton
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(this.getAlbums, this.getPhotos) : super(AppInitial()) {
    on<FetchAlbumsAndPhotos>(_fetchAlbumsAndPhotos);
  }

  final GetAlbums getAlbums;
  final GetPhotos getPhotos;

  FutureOr<void> _fetchAlbumsAndPhotos(FetchAlbumsAndPhotos event, Emitter<AppState> emit) async {
    emit(DataLoadingState());

    final albumsResult = await getAlbums(NoParams());
    final photosResult = await getPhotos(NoParams());
    // Fetch albums

    albumsResult.fold((l){
      emit(DataErrorState(errorMessage: "Failed to fetch albums ${l}"));
    },(r){
      final albums = r;
      photosResult.fold((l){
        emit(DataErrorState(errorMessage: "Failed to fetch photos"));
      }, (r){
        final photos = r;
        final List<Map<AlbumModel, List<PhotoModel>>> albumPhotos = [];
        final Map<int, List<PhotoModel>> groupedPhotos = groupBy(
          photos,
              (PhotoModel photo) => photo.albumId ?? 0,
        );
        for (final album in albums) {
          albumPhotos.add({
            album: groupedPhotos[album.id] ?? [],
          });
        }
        emit(AlbumsAndPhotosLoadedState(albumPhotos: albumPhotos));
      });
    } );

  }
}
