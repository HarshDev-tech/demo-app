part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();
}

final class FetchAlbumsAndPhotos extends AppEvent {
  @override
  List<Object?> get props => [];
}
