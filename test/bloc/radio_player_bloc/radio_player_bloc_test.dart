import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:music_radio_toni/bloc/radio_player_bloc/radio_player_bloc.dart';
import 'package:music_radio_toni/bloc/radio_player_bloc/radio_player_event.dart';
import 'package:music_radio_toni/bloc/radio_player_bloc/radio_player_state.dart';
import 'package:audioplayers/audioplayers.dart';

class MockAudioPlayer extends Mock implements AudioPlayer {}

void main() {
  group('RadioPlayerEvent', () {
    test('PlayPauseEvent has correct props', () {
      final event = PlayPauseEvent();
      expect(event.props, isEmpty);
    });

    test('ToggleFavoriteEvent has correct props', () {
      final event = ToggleFavoriteEvent();
      expect(event.props, isEmpty);
    });
  });

  group('RadioPlayerState', () {
    test('RadioPlayerInitial has correct props', () {
      final state = RadioPlayerInitial();
      expect(state.props, isEmpty);
    });

    test('RadioPlayerPlaying has correct props', () {
      final state = RadioPlayerPlaying();
      expect(state.props, isEmpty);
    });

    test('RadioPlayerPaused has correct props', () {
      final state = RadioPlayerPaused();
      expect(state.props, isEmpty);
    });

    test('RadioPlayerError has correct props', () {
      final state = RadioPlayerError();
      expect(state.props, isEmpty);
    });

    test('RadioPlayerFavoriteChanged has correct props with true', () {
      final state = RadioPlayerFavoriteChanged(true);
      expect(state.props, [true]);
      expect(state.isFavorite, true);
    });

    test('RadioPlayerFavoriteChanged has correct props with false', () {
      final state = RadioPlayerFavoriteChanged(false);
      expect(state.props, [false]);
      expect(state.isFavorite, false);
    });
  });

  group('RadioPlayerBloc', () {
    late MockAudioPlayer mockAudioPlayer;

    setUpAll(() {
      registerFallbackValue(MockAudioPlayer());
    });

    setUp(() {
      mockAudioPlayer = MockAudioPlayer();
      when(() => mockAudioPlayer.setSourceUrl(any())).thenAnswer((_) async {});
      when(() => mockAudioPlayer.resume()).thenAnswer((_) async {});
      when(() => mockAudioPlayer.pause()).thenAnswer((_) async {});
      when(() => mockAudioPlayer.dispose()).thenAnswer((_) async {});
    });

    test('initial state is RadioPlayerInitial', () {
      final bloc = RadioPlayerBloc(
        audioSource: 'https://test-stream.com/stream.m3u8',
        audioPlayer: mockAudioPlayer,
      );
      expect(bloc.state, isA<RadioPlayerInitial>());
      bloc.close();
    });

    blocTest<RadioPlayerBloc, RadioPlayerState>(
      'emits RadioPlayerPlaying when PlayPauseEvent is added and was not playing',
      setUp: () {
        when(() => mockAudioPlayer.resume()).thenAnswer((_) async {});
      },
      build: () => RadioPlayerBloc(
        audioSource: 'https://test-stream.com/stream.m3u8',
        audioPlayer: mockAudioPlayer,
      ),
      act: (bloc) => bloc.add(PlayPauseEvent()),
      expect: () => [
        isA<RadioPlayerPlaying>(),
      ],
      verify: (_) {
        verify(() => mockAudioPlayer.resume()).called(1);
      },
    );

    blocTest<RadioPlayerBloc, RadioPlayerState>(
      'emits RadioPlayerPaused when PlayPauseEvent is added after playing',
      setUp: () {
        when(() => mockAudioPlayer.pause()).thenAnswer((_) async {});
      },
      build: () => RadioPlayerBloc(
        audioSource: 'https://test-stream.com/stream.m3u8',
        audioPlayer: mockAudioPlayer,
      ),
      act: (bloc) async {
        bloc.add(PlayPauseEvent());
        await Future.delayed(const Duration(milliseconds: 50));
        bloc.add(PlayPauseEvent());
      },
      expect: () => [
        isA<RadioPlayerPlaying>(),
        isA<RadioPlayerPaused>(),
      ],
      verify: (_) {
        verify(() => mockAudioPlayer.pause()).called(1);
      },
    );

    blocTest<RadioPlayerBloc, RadioPlayerState>(
      'emits RadioPlayerFavoriteChanged with isFavorite true when ToggleFavoriteEvent is added first time',
      build: () => RadioPlayerBloc(
        audioSource: 'https://test-stream.com/stream.m3u8',
        audioPlayer: mockAudioPlayer,
      ),
      act: (bloc) => bloc.add(ToggleFavoriteEvent()),
      expect: () => [
        isA<RadioPlayerFavoriteChanged>().having(
          (state) => state.isFavorite,
          'isFavorite',
          true,
        ),
      ],
    );

    blocTest<RadioPlayerBloc, RadioPlayerState>(
      'emits RadioPlayerFavoriteChanged with isFavorite false when ToggleFavoriteEvent is added second time',
      build: () => RadioPlayerBloc(
        audioSource: 'https://test-stream.com/stream.m3u8',
        audioPlayer: mockAudioPlayer,
      ),
      act: (bloc) async {
        bloc.add(ToggleFavoriteEvent());
        await Future.delayed(const Duration(milliseconds: 50));
        bloc.add(ToggleFavoriteEvent());
      },
      expect: () => [
        isA<RadioPlayerFavoriteChanged>().having(
          (state) => state.isFavorite,
          'isFavorite',
          true,
        ),
        isA<RadioPlayerFavoriteChanged>().having(
          (state) => state.isFavorite,
          'isFavorite',
          false,
        ),
      ],
    );

    blocTest<RadioPlayerBloc, RadioPlayerState>(
      'toggles between playing and paused states',
      setUp: () {
        when(() => mockAudioPlayer.resume()).thenAnswer((_) async {});
        when(() => mockAudioPlayer.pause()).thenAnswer((_) async {});
      },
      build: () => RadioPlayerBloc(
        audioSource: 'https://test-stream.com/stream.m3u8',
        audioPlayer: mockAudioPlayer,
      ),
      act: (bloc) async {
        bloc.add(PlayPauseEvent());
        await Future.delayed(const Duration(milliseconds: 50));
        bloc.add(PlayPauseEvent());
        await Future.delayed(const Duration(milliseconds: 50));
        bloc.add(PlayPauseEvent());
      },
      expect: () => [
        isA<RadioPlayerPlaying>(),
        isA<RadioPlayerPaused>(),
        isA<RadioPlayerPlaying>(),
      ],
    );

    blocTest<RadioPlayerBloc, RadioPlayerState>(
      'RadioPlayerError has correct props',
      build: () => RadioPlayerBloc(
        audioSource: 'https://test-stream.com/stream.m3u8',
        audioPlayer: mockAudioPlayer,
      ),
      verify: (_) {
        final state = RadioPlayerError();
        expect(state.props, isEmpty);
      },
    );

    test('RadioPlayerBloc close disposes audio player', () async {
      when(() => mockAudioPlayer.dispose()).thenAnswer((_) async {});
      final bloc = RadioPlayerBloc(
        audioSource: 'https://test-stream.com/stream.m3u8',
        audioPlayer: mockAudioPlayer,
      );
      await bloc.close();
      verify(() => mockAudioPlayer.dispose()).called(1);
    });
  });
}
