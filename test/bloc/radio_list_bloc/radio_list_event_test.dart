import 'package:flutter_test/flutter_test.dart';
import 'package:music_radio_toni/bloc/radio_list_bloc/radio_list_event.dart';

void main() {
  group('LoadRadios', () {
    test('LoadRadios is a RadioListEvent', () {
      final event = LoadRadios();
      expect(event, isA<RadioListEvent>());
    });
  });
}
