import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_radio_toni/bloc/radio_player_bloc/radio_player_event.dart';
import 'package:music_radio_toni/bloc/radio_player_bloc/radio_player_state.dart';

class RadioPlayerBloc extends Bloc<RadioPlayerEvent, RadioPlayerState> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  bool _isFavorite = false;

  RadioPlayerBloc({required String audioSource}) : super(RadioPlayerInitial()) {
    _audioPlayer = AudioPlayer();
    _audioPlayer.setSourceUrl(audioSource);
    on<PlayPauseEvent>(_togglePlayPause);
    on<ToggleFavoriteEvent>(_toggleFavorite);
  }

  FutureOr<void> _togglePlayPause(
      PlayPauseEvent event, Emitter<RadioPlayerState> emit) async {
    _isPlaying = !_isPlaying;
    if (_isPlaying) {
      _audioPlayer.resume();
      emit(RadioPlayerPlaying());
    } else {
      _audioPlayer.pause();
      emit(RadioPlayerPaused());
    }
  }

  void _toggleFavorite(
      ToggleFavoriteEvent event, Emitter<RadioPlayerState> emit) {
    _isFavorite = !_isFavorite;
    emit(RadioPlayerFavoriteChanged(_isFavorite));
  }

  @override
  Future<void> close() async {
    await _audioPlayer.dispose();
    await super.close();
  }
}
