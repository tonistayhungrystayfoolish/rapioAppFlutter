import 'package:flutter_test/flutter_test.dart';
import 'package:music_radio_toni/bloc/radio_player_bloc/radio_player_state.dart';

void main() {
  group('RadioPlayerState', () {
    test('RadioPlayerState can be extended', () {
      expect(RadioPlayerInitial(), isA<RadioPlayerState>());
    });

    test('RadioPlayerInitial has empty props', () {
      final state = RadioPlayerInitial();
      expect(state.props, isEmpty);
    });

    test('RadioPlayerInitial equality with same instance', () {
      final state1 = RadioPlayerInitial();
      final state2 = state1;
      expect(state1, equals(state2));
    });

    test('RadioPlayerInitial equality with different instances', () {
      final state1 = RadioPlayerInitial();
      final state2 = RadioPlayerInitial();
      expect(identical(state1, state2), isFalse);
    });

    test('RadioPlayerInitial toString contains RadioPlayerInitial', () {
      final state = RadioPlayerInitial();
      expect(state.toString(), contains('RadioPlayerInitial'));
    });

    test('RadioPlayerInitial has correct runtimeType', () {
      final state = RadioPlayerInitial();
      expect(state.runtimeType, equals(RadioPlayerInitial));
    });
  });

  group('RadioPlayerPlaying', () {
    test('RadioPlayerPlaying is a RadioPlayerState', () {
      final state = RadioPlayerPlaying();
      expect(state, isA<RadioPlayerState>());
    });

    test('RadioPlayerPlaying has empty props', () {
      final state = RadioPlayerPlaying();
      expect(state.props, isEmpty);
    });

    test('RadioPlayerPlaying equality with same instance', () {
      final state1 = RadioPlayerPlaying();
      final state2 = state1;
      expect(state1, equals(state2));
    });

    test('RadioPlayerPlaying equality with different instances', () {
      final state1 = RadioPlayerPlaying();
      final state2 = RadioPlayerPlaying();
      expect(identical(state1, state2), isFalse);
    });

    test('RadioPlayerPlaying toString contains RadioPlayerPlaying', () {
      final state = RadioPlayerPlaying();
      expect(state.toString(), contains('RadioPlayerPlaying'));
    });

    test('RadioPlayerPlaying has correct runtimeType', () {
      final state = RadioPlayerPlaying();
      expect(state.runtimeType, equals(RadioPlayerPlaying));
    });

    test('RadioPlayerPlaying instances are equal', () {
      final state1 = RadioPlayerPlaying();
      final state2 = RadioPlayerPlaying();
      expect(state1, equals(state2));
    });
  });

  group('RadioPlayerPaused', () {
    test('RadioPlayerPaused is a RadioPlayerState', () {
      final state = RadioPlayerPaused();
      expect(state, isA<RadioPlayerState>());
    });

    test('RadioPlayerPaused has empty props', () {
      final state = RadioPlayerPaused();
      expect(state.props, isEmpty);
    });

    test('RadioPlayerPaused equality with same instance', () {
      final state1 = RadioPlayerPaused();
      final state2 = state1;
      expect(state1, equals(state2));
    });

    test('RadioPlayerPaused equality with different instances', () {
      final state1 = RadioPlayerPaused();
      final state2 = RadioPlayerPaused();
      expect(identical(state1, state2), isFalse);
    });

    test('RadioPlayerPaused toString contains RadioPlayerPaused', () {
      final state = RadioPlayerPaused();
      expect(state.toString(), contains('RadioPlayerPaused'));
    });

    test('RadioPlayerPaused has correct runtimeType', () {
      final state = RadioPlayerPaused();
      expect(state.runtimeType, equals(RadioPlayerPaused));
    });

    test('RadioPlayerPaused instances are equal', () {
      final state1 = RadioPlayerPaused();
      final state2 = RadioPlayerPaused();
      expect(state1, equals(state2));
    });
  });

  group('RadioPlayerError', () {
    test('RadioPlayerError is a RadioPlayerState', () {
      final state = RadioPlayerError();
      expect(state, isA<RadioPlayerState>());
    });

    test('RadioPlayerError has empty props', () {
      final state = RadioPlayerError();
      expect(state.props, isEmpty);
    });

    test('RadioPlayerError equality with same instance', () {
      final state1 = RadioPlayerError();
      final state2 = state1;
      expect(state1, equals(state2));
    });

    test('RadioPlayerError equality with different instances', () {
      final state1 = RadioPlayerError();
      final state2 = RadioPlayerError();
      expect(identical(state1, state2), isFalse);
    });

    test('RadioPlayerError toString contains RadioPlayerError', () {
      final state = RadioPlayerError();
      expect(state.toString(), contains('RadioPlayerError'));
    });

    test('RadioPlayerError has correct runtimeType', () {
      final state = RadioPlayerError();
      expect(state.runtimeType, equals(RadioPlayerError));
    });

    test('RadioPlayerError instances are equal', () {
      final state1 = RadioPlayerError();
      final state2 = RadioPlayerError();
      expect(state1, equals(state2));
    });
  });

  group('RadioPlayerFavoriteChanged', () {
    test('RadioPlayerFavoriteChanged is a RadioPlayerState', () {
      final state = RadioPlayerFavoriteChanged(true);
      expect(state, isA<RadioPlayerState>());
    });

    test('RadioPlayerFavoriteChanged can be instantiated with true', () {
      final state = RadioPlayerFavoriteChanged(true);
      expect(state.isFavorite, isTrue);
    });

    test('RadioPlayerFavoriteChanged can be instantiated with false', () {
      final state = RadioPlayerFavoriteChanged(false);
      expect(state.isFavorite, isFalse);
    });

    test('RadioPlayerFavoriteChanged has isFavorite in props', () {
      final state = RadioPlayerFavoriteChanged(true);
      expect(state.props, contains(true));
    });

    test('RadioPlayerFavoriteChanged equality with same instance', () {
      final state1 = RadioPlayerFavoriteChanged(true);
      final state2 = state1;
      expect(state1, equals(state2));
    });

    test(
        'RadioPlayerFavoriteChanged equality with different instances same value',
        () {
      final state1 = RadioPlayerFavoriteChanged(true);
      final state2 = RadioPlayerFavoriteChanged(true);
      expect(identical(state1, state2), isFalse);
    });

    test('RadioPlayerFavoriteChanged equality with different values', () {
      final state1 = RadioPlayerFavoriteChanged(true);
      final state2 = RadioPlayerFavoriteChanged(false);
      expect(state1, isNot(equals(state2)));
    });

    test(
        'RadioPlayerFavoriteChanged toString contains RadioPlayerFavoriteChanged',
        () {
      final state = RadioPlayerFavoriteChanged(true);
      expect(state.toString(), contains('RadioPlayerFavoriteChanged'));
    });

    test('RadioPlayerFavoriteChanged has correct runtimeType', () {
      final state = RadioPlayerFavoriteChanged(true);
      expect(state.runtimeType, equals(RadioPlayerFavoriteChanged));
    });

    test('RadioPlayerFavoriteChanged true instances are equal', () {
      final state1 = RadioPlayerFavoriteChanged(true);
      final state2 = RadioPlayerFavoriteChanged(true);
      expect(state1, equals(state2));
    });

    test('RadioPlayerFavoriteChanged false instances are equal', () {
      final state1 = RadioPlayerFavoriteChanged(false);
      final state2 = RadioPlayerFavoriteChanged(false);
      expect(state1, equals(state2));
    });

    test('RadioPlayerFavoriteChanged can be instantiated', () {
      expect(() => RadioPlayerFavoriteChanged(false), returnsNormally);
    });

    test('RadioPlayerFavoriteChanged has correct props with false', () {
      final state = RadioPlayerFavoriteChanged(false);
      expect(state.props, [false]);
    });

    test('RadioPlayerFavoriteChanged has correct props with true', () {
      final state = RadioPlayerFavoriteChanged(true);
      expect(state.props, [true]);
    });
  });

  group('RadioPlayerState equality', () {
    test('RadioPlayerInitial is not equal to RadioPlayerPlaying', () {
      final state1 = RadioPlayerInitial();
      final state2 = RadioPlayerPlaying();
      expect(state1, isNot(equals(state2)));
    });

    test('RadioPlayerPlaying is not equal to RadioPlayerPaused', () {
      final state1 = RadioPlayerPlaying();
      final state2 = RadioPlayerPaused();
      expect(state1, isNot(equals(state2)));
    });

    test('RadioPlayerPaused is not equal to RadioPlayerPlaying', () {
      final state1 = RadioPlayerPaused();
      final state2 = RadioPlayerPlaying();
      expect(state1, isNot(equals(state2)));
    });

    test('RadioPlayerError is not equal to RadioPlayerPlaying', () {
      final state1 = RadioPlayerError();
      final state2 = RadioPlayerPlaying();
      expect(state1, isNot(equals(state2)));
    });

    test('RadioPlayerFavoriteChanged is not equal to RadioPlayerPlaying', () {
      final state1 = RadioPlayerFavoriteChanged(true);
      final state2 = RadioPlayerPlaying();
      expect(state1, isNot(equals(state2)));
    });
  });
}
