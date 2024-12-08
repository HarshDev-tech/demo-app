part of 'app_bloc.dart';

sealed class AppState extends Equatable {
  const AppState();
}

final class AppInitial extends AppState {
  @override
  List<Object> get props => [];
}

final class DataErrorState extends AppState {
  final String errorMessage;

  const DataErrorState({required this.errorMessage});

  @override
  String toString() {
    return errorMessage;
  }

  @override
  List<Object> get props => [];
}

final class DataLoadingState extends AppState {
  @override
  List<Object> get props => [];
}

final class AlbumsLoadedState extends AppState {
  final List<AlbumModel> albums;

  const AlbumsLoadedState({required this.albums});

  @override
  List<Object?> get props => [albums];
}

final class PhotosLoadedState extends AppState {
  final List<PhotoModel> photos;

  const PhotosLoadedState({required this.photos});

  @override
  List<Object?> get props => [photos];
}

class AlbumsAndPhotosLoadedState extends AppState {
  final List<Map<AlbumModel, List<PhotoModel>>> albumPhotos;

  const AlbumsAndPhotosLoadedState({required this.albumPhotos});

  @override
  List<Object?> get props => [albumPhotos];
}
