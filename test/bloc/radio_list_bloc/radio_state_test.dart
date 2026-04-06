import 'package:flutter_test/flutter_test.dart';
import 'package:music_radio_toni/bloc/radio_list_bloc/radio_state.dart';
import 'package:music_radio_toni/model/radio_channel.dart';

void main() {
  group('RadioListState', () {
    test('RadioListState can be extended', () {
      expect(RadioInitial(), isA<RadioListState>());
    });
  });

  group('RadioInitial', () {
    test('RadioInitial is a RadioListState', () {
      final state = RadioInitial();
      expect(state, isA<RadioListState>());
    });

    test('RadioInitial can be instantiated', () {
      expect(() => RadioInitial(), returnsNormally);
    });

    test('RadioInitial equality with same instance', () {
      final state1 = RadioInitial();
      final state2 = state1;
      expect(state1, equals(state2));
    });

    test('RadioInitial equality with different instances', () {
      final state1 = RadioInitial();
      final state2 = RadioInitial();
      expect(identical(state1, state2), isFalse);
    });

    test('RadioInitial has correct toString', () {
      final state = RadioInitial();
      expect(state.toString(), contains('RadioInitial'));
    });
  });

  group('RadiosLoading', () {
    test('RadiosLoading is a RadioListState', () {
      final state = RadiosLoading();
      expect(state, isA<RadioListState>());
    });

    test('RadiosLoading can be instantiated', () {
      expect(() => RadiosLoading(), returnsNormally);
    });

    test('RadiosLoading equality with same instance', () {
      final state1 = RadiosLoading();
      final state2 = state1;
      expect(state1, equals(state2));
    });

    test('RadiosLoading equality with different instances', () {
      final state1 = RadiosLoading();
      final state2 = RadiosLoading();
      expect(identical(state1, state2), isFalse);
    });

    test('RadiosLoading has correct toString', () {
      final state = RadiosLoading();
      expect(state.toString(), contains('RadiosLoading'));
    });
  });

  group('RadiosLoaded', () {
    test('RadiosLoaded is a RadioListState', () {
      final radios = [
        RadioChannel(
          id: '1',
          title: 'Test Radio',
          source: 'https://test.com/stream.m3u8',
          imageUrl: 'https://test.com/image.jpg',
        ),
      ];
      final state = RadiosLoaded(radios);
      expect(state, isA<RadioListState>());
    });

    test('RadiosLoaded can be instantiated with radios', () {
      final radios = [
        RadioChannel(
          id: '1',
          title: 'Test Radio',
          source: 'https://test.com/stream.m3u8',
          imageUrl: 'https://test.com/image.jpg',
        ),
      ];
      expect(() => RadiosLoaded(radios), returnsNormally);
    });

    test('RadiosLoaded has radios property', () {
      final radios = [
        RadioChannel(
          id: '1',
          title: 'Test Radio',
          source: 'https://test.com/stream.m3u8',
          imageUrl: 'https://test.com/image.jpg',
        ),
      ];
      final state = RadiosLoaded(radios);
      expect(state.radios, equals(radios));
    });

    test('RadiosLoaded equality with same instance', () {
      final radios = [
        RadioChannel(
          id: '1',
          title: 'Test Radio',
          source: 'https://test.com/stream.m3u8',
          imageUrl: 'https://test.com/image.jpg',
        ),
      ];
      final state1 = RadiosLoaded(radios);
      final state2 = state1;
      expect(state1, equals(state2));
    });

    test('RadiosLoaded equality with different instances same radios', () {
      final radios1 = [
        RadioChannel(
          id: '1',
          title: 'Test Radio',
          source: 'https://test.com/stream.m3u8',
          imageUrl: 'https://test.com/image.jpg',
        ),
      ];
      final radios2 = [
        RadioChannel(
          id: '1',
          title: 'Test Radio',
          source: 'https://test.com/stream.m3u8',
          imageUrl: 'https://test.com/image.jpg',
        ),
      ];
      final state1 = RadiosLoaded(radios1);
      final state2 = RadiosLoaded(radios2);
      expect(identical(state1, state2), isFalse);
    });

    test('RadiosLoaded equality with different radios fails', () {
      final radios1 = [
        RadioChannel(
          id: '1',
          title: 'Test Radio 1',
          source: 'https://test.com/stream1.m3u8',
          imageUrl: 'https://test.com/image1.jpg',
        ),
      ];
      final radios2 = [
        RadioChannel(
          id: '2',
          title: 'Test Radio 2',
          source: 'https://test.com/stream2.m3u8',
          imageUrl: 'https://test.com/image2.jpg',
        ),
      ];
      final state1 = RadiosLoaded(radios1);
      final state2 = RadiosLoaded(radios2);
      expect(state1, isNot(equals(state2)));
    });

    test('RadiosLoaded with empty list', () {
      final state = RadiosLoaded([]);
      expect(state.radios, isEmpty);
    });

    test('RadiosLoaded with multiple radios', () {
      final radios = List.generate(
        5,
        (i) => RadioChannel(
          id: '$i',
          title: 'Radio $i',
          source: 'https://test.com/stream$i.m3u8',
          imageUrl: 'https://test.com/image$i.jpg',
        ),
      );
      final state = RadiosLoaded(radios);
      expect(state.radios.length, equals(5));
    });

    test('RadiosLoaded has correct toString', () {
      final radios = [
        RadioChannel(
          id: '1',
          title: 'Test Radio',
          source: 'https://test.com/stream.m3u8',
          imageUrl: 'https://test.com/image.jpg',
        ),
      ];
      final state = RadiosLoaded(radios);
      expect(state.toString(), contains('RadiosLoaded'));
    });
  });
}
