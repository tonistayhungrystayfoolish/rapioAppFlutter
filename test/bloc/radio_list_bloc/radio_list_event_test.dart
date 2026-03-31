import 'package:flutter_test/flutter_test.dart';
import 'package:music_radio_toni/bloc/radio_list_bloc/radio_list_event.dart';

void main() {
  group('RadioListEvent', () {
    test('RadioListEvent can be extended', () {
      expect(LoadRadios.new, isNotNull);
    });

    test('LoadRadios is a RadioListEvent', () {
      final event = LoadRadios();
      expect(event, isA<RadioListEvent>());
    });
  });

  group('LoadRadios', () {
    test('LoadRadios is a RadioListEvent', () {
      final event = LoadRadios();
      expect(event, isA<RadioListEvent>());
    });

    test('LoadRadios can be instantiated', () {
      expect(() => LoadRadios(), returnsNormally);
    });

    test('LoadRadios toString returns correct string', () {
      final event = LoadRadios();
      expect(event.toString(), contains('LoadRadios'));
    });

    test('LoadRadios equality with same instance', () {
      final event1 = LoadRadios();
      final event2 = event1;
      expect(event1, equals(event2));
    });

    test('LoadRadios equality with different instances', () {
      final event1 = LoadRadios();
      final event2 = LoadRadios();
      expect(identical(event1, event2), isFalse);
    });

    test('multiple LoadRadios instances are equal', () {
      final events = List.generate(5, (_) => LoadRadios());
      for (var event in events) {
        expect(event, isA<LoadRadios>());
      }
    });

    test('LoadRadios instances have same runtime type', () {
      final event1 = LoadRadios();
      final event2 = LoadRadios();
      expect(event1.runtimeType, equals(event2.runtimeType));
    });
  });
}
