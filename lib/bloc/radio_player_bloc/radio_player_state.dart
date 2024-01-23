import 'package:equatable/equatable.dart';

abstract class RadioPlayerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RadioPlayerInitial extends RadioPlayerState {}

class RadioPlayerPlaying extends RadioPlayerState {}

class RadioPlayerPaused extends RadioPlayerState {}

class RadioPlayerError extends RadioPlayerState {}

class RadioPlayerFavoriteChanged extends RadioPlayerState {
  final bool isFavorite;

  RadioPlayerFavoriteChanged(this.isFavorite);

  @override
  List<Object?> get props => [isFavorite];
}
