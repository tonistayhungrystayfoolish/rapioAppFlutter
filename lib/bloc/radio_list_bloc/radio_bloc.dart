import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_radio_toni/bloc/radio_list_bloc/radio_list_event.dart';
import 'package:music_radio_toni/bloc/radio_list_bloc/radio_state.dart';
import 'package:music_radio_toni/repositories/broadcast_api_data.dart';

import '../../model/radio_channel.dart';

class RadioListBloc extends Bloc<RadioListEvent, RadioListState> {
  List<RadioChannel> radios = [];

  RadioChannel? selectedRadio;

  RadioListBloc() : super(RadiosLoading()) {
    on<LoadRadios>(_fetchRadiosData);
  }

  Future<List<RadioChannel>> _loadRadios() async {
    return availableBroadCasting;
  }

  FutureOr<void> _fetchRadiosData(
      LoadRadios event, Emitter<RadioListState> emit) async {
    emit(RadiosLoading());
    await _loadRadios().then((radios) {
      emit(RadiosLoaded(radios));
    });
  }
}
