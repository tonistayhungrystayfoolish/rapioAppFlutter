import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_radio_toni/bloc/radio_list_bloc/radio_bloc.dart';
import 'package:music_radio_toni/bloc/radio_list_bloc/radio_list_event.dart';
import 'package:music_radio_toni/bloc/radio_list_bloc/radio_state.dart';
import 'package:music_radio_toni/model/radio_channel.dart';

void main() {
  group('RadioListEvent', () {
    test('LoadRadios is a RadioListEvent', () {
      final event = LoadRadios();
      expect(event, isA<RadioListEvent>());
    });
  });

  group('RadioListState', () {
    test('RadioInitial is a RadioListState', () {
      final state = RadioInitial();
      expect(state, isA<RadioListState>());
    });

    test('RadiosLoading is a RadioListState', () {
      final state = RadiosLoading();
      expect(state, isA<RadioListState>());
    });

    test('RadiosLoaded is a RadioListState with radios list', () {
      final radios = [
        RadioChannel(
          id: '1',
          title: 'Test Radio',
          source: 'https://test.com/stream.m3u8',
          imageUrl: 'https://test.com/image.jpg',
        ),
      ];
      final state = RadiosLoaded(radios);
      expect(state.radios, radios);
      expect(state.radios.length, 1);
    });
  });

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

    test('selectedRadio starts as null', () {
      expect(radioListBloc.selectedRadio, isNull);
    });

    test('radios list starts empty', () {
      expect(radioListBloc.radios, isEmpty);
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

    blocTest<RadioListBloc, RadioListState>(
      'updates selectedRadio when set',
      build: () => RadioListBloc(),
      act: (bloc) {
        final radio = RadioChannel(
          id: 'test-id',
          title: 'Test Radio',
          source: 'https://test.com/stream.m3u8',
          imageUrl: 'https://test.com/image.jpg',
        );
        bloc.selectedRadio = radio;
      },
      verify: (bloc) {
        expect(bloc.selectedRadio, isNotNull);
        expect(bloc.selectedRadio!.title, 'Test Radio');
      },
    );

    blocTest<RadioListBloc, RadioListState>(
      'can update radios list directly',
      build: () => RadioListBloc(),
      act: (bloc) {
        final radios = [
          RadioChannel(
            id: '1',
            title: 'Custom Radio',
            source: 'https://custom.com/stream.m3u8',
            imageUrl: 'https://custom.com/image.jpg',
          ),
        ];
        bloc.radios = radios;
      },
      verify: (bloc) {
        expect(bloc.radios.length, 1);
        expect(bloc.radios.first.title, 'Custom Radio');
      },
    );
  });
}
