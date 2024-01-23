import '../../model/radio_channel.dart';

abstract class RadioListState {}

class RadioInitial extends RadioListState {}

class RadiosLoading extends RadioListState {}

class RadiosLoaded extends RadioListState {
  final List<RadioChannel> radios;
  RadiosLoaded(this.radios);
}
