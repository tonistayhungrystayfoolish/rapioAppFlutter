import 'package:flutter_test/flutter_test.dart';
import 'package:music_radio_toni/bloc/radio_player_bloc/radio_player_event.dart';

void main() {
  group('RadioPlayerEvent', () {
    test('PlayPauseEvent is a RadioPlayerEvent', () {
      expect(PlayPauseEvent(), isA<RadioPlayerEvent>());
    });

    test('ToggleFavoriteEvent is a RadioPlayerEvent', () {
      expect(ToggleFavoriteEvent(), isA<RadioPlayerEvent>());
    });
  });

  group('PlayPauseEvent', () {
    test('PlayPauseEvent can be instantiated', () {
      expect(() => PlayPauseEvent(), returnsNormally);
    });

    test('PlayPauseEvent has empty props', () {
      final event = PlayPauseEvent();
      expect(event.props, isEmpty);
    });

    test('PlayPauseEvent equality with same instance', () {
      final event1 = PlayPauseEvent();
      final event2 = event1;
      expect(event1, equals(event2));
    });

    test('PlayPauseEvent equality with different instances', () {
      final event1 = PlayPauseEvent();
      final event2 = PlayPauseEvent();
      expect(event1, equals(event2));
    });

    test('PlayPauseEvent toString contains PlayPauseEvent', () {
      final event = PlayPauseEvent();
      expect(event.toString(), contains('PlayPauseEvent'));
    });

    test('PlayPauseEvent has correct runtime type', () {
      final event = PlayPauseEvent();
      expect(event.runtimeType, equals(PlayPauseEvent));
    });
  });

  group('ToggleFavoriteEvent', () {
    test('ToggleFavoriteEvent can be instantiated', () {
      expect(() => ToggleFavoriteEvent(), returnsNormally);
    });

    test('ToggleFavoriteEvent has empty props', () {
      final event = ToggleFavoriteEvent();
      expect(event.props, isEmpty);
    });

    test('ToggleFavoriteEvent equality with same instance', () {
      final event1 = ToggleFavoriteEvent();
      final event2 = event1;
      expect(event1, equals(event2));
    });

    test('ToggleFavoriteEvent equality with different instances', () {
      final event1 = ToggleFavoriteEvent();
      final event2 = ToggleFavoriteEvent();
      expect(event1, equals(event2));
    });

    test('ToggleFavoriteEvent toString contains ToggleFavoriteEvent', () {
      final event = ToggleFavoriteEvent();
      expect(event.toString(), contains('ToggleFavoriteEvent'));
    });

    test('ToggleFavoriteEvent has correct runtime type', () {
      final event = ToggleFavoriteEvent();
      expect(event.runtimeType, equals(ToggleFavoriteEvent));
    });
  });
}
