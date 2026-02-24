import 'package:flutter_test/flutter_test.dart';
import 'package:music_radio_toni/model/radio_channel.dart';
import 'package:music_radio_toni/repositories/broadcast_api_data.dart';

void main() {
  group('BroadcastApiData Repository', () {
    test('availableBroadCasting returns a list of RadioChannel', () {
      final result = availableBroadCasting;
      expect(result, isA<List<RadioChannel>>());
    });

    test('availableBroadCasting contains 8 radio channels', () {
      final result = availableBroadCasting;
      expect(result.length, equals(8));
    });

    test('all radio channels have required fields', () {
      for (final radio in availableBroadCasting) {
        expect(radio.id, isNotEmpty);
        expect(radio.title, isNotEmpty);
        expect(radio.imageUrl, isNotEmpty);
        expect(radio.source, isNotEmpty);
      }
    });

    test('all radio channels have favorite set to false by default', () {
      for (final radio in availableBroadCasting) {
        expect(radio.favorite, isFalse);
      }
    });

    test('radio channels have valid URLs', () {
      for (final radio in availableBroadCasting) {
        expect(radio.source.startsWith('https://'), isTrue);
      }
    });

    test('radio channel titles are unique', () {
      final titles = availableBroadCasting.map((r) => r.title).toList();
      final uniqueTitles = titles.toSet();
      expect(titles.length, equals(uniqueTitles.length));
    });

    test('first radio channel is Radio 3 RNE', () {
      expect(availableBroadCasting.first.title, equals('Radio 3 RNE'));
    });

    test('last radio channel is Cadena SER', () {
      expect(availableBroadCasting.last.title, equals('Cadena SER'));
    });
  });
}
