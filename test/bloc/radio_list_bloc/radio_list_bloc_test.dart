import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_radio_toni/bloc/radio_list_bloc/radio_bloc.dart';
import 'package:music_radio_toni/bloc/radio_list_bloc/radio_list_event.dart';
import 'package:music_radio_toni/bloc/radio_list_bloc/radio_state.dart';

void main() {
  group('RadioListBloc', () {
    late RadioListBloc radioListBloc;

    setUp(() {
      radioListBloc = RadioListBloc();
    });

    tearDown(() {
      radioListBloc.close();
    });

    test('initial state is RadiosLoading', () {
      expect(radioListBloc.state, isA<RadiosLoading>());
    });

    blocTest<RadioListBloc, RadioListState>(
      'emits [RadiosLoading, RadiosLoaded] when LoadRadios is added',
      build: () => RadioListBloc(),
      act: (bloc) => bloc.add(LoadRadios()),
      expect: () => [
        isA<RadiosLoading>(),
        isA<RadiosLoaded>(),
      ],
      verify: (bloc) {
        final state = bloc.state as RadiosLoaded;
        expect(state.radios, isNotEmpty);
        expect(state.radios.length, 8);
      },
    );

    blocTest<RadioListBloc, RadioListState>(
      'loads radio channels with correct data',
      build: () => RadioListBloc(),
      act: (bloc) => bloc.add(LoadRadios()),
      verify: (bloc) {
        final state = bloc.state as RadiosLoaded;
        expect(state.radios.first.title, 'Radio 3 RNE');
        expect(state.radios.first.source,
            'https://rtvelivestream.akamaized.net/rtvesec/rne/rne_r3_main.m3u8');
      },
    );

    blocTest<RadioListBloc, RadioListState>(
      'emits RadiosLoading first then RadiosLoaded',
      build: () => RadioListBloc(),
      act: (bloc) => bloc.add(LoadRadios()),
      expect: () => [
        isA<RadiosLoading>(),
        isA<RadiosLoaded>(),
      ],
    );
  });
}
