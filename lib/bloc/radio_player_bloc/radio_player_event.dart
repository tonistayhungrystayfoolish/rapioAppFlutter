import 'package:equatable/equatable.dart';

abstract class RadioPlayerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PlayPauseEvent extends RadioPlayerEvent {}

class ToggleFavoriteEvent extends RadioPlayerEvent {}
