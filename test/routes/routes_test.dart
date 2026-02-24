import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_radio_toni/model/radio_channel.dart';
import 'package:music_radio_toni/routes/routes.dart';
import 'package:music_radio_toni/views/screens/radio_list_screen.dart';
import 'package:music_radio_toni/views/screens/radio_player_screen.dart';

void main() {
  group('RouteGenerator', () {
    late RouteGenerator routeGenerator;

    setUp(() {
      routeGenerator = RouteGenerator();
    });

    test('generateRoute returns MaterialPageRoute for RadioListScreen', () {
      const settings = RouteSettings(name: RadioListScreen.id);
      final route = routeGenerator.generateRoute(settings);

      expect(route, isA<MaterialPageRoute>());
    });

    test('generateRoute returns MaterialPageRoute for RadioPlayerScreen', () {
      final radioChannel = RadioChannel(
        id: 'test-id',
        title: 'Test Radio',
        imageUrl: 'assets/images/radio1.jpg',
        source: 'https://test.com/stream.m3u8',
      );
      final settings = RouteSettings(
        name: RadioPlayerScreen.id,
        arguments: radioChannel,
      );
      final route = routeGenerator.generateRoute(settings);

      expect(route, isA<MaterialPageRoute>());
    });

    test('generateRoute returns error route for unknown route', () {
      const settings = RouteSettings(name: '/unknown-route');
      final route = routeGenerator.generateRoute(settings);

      expect(route, isA<MaterialPageRoute>());
    });
  });

  group('RouteConstants', () {
    test('RadioListScreen has correct id', () {
      expect(RadioListScreen.id, equals('radio_list_screen'));
    });

    test('RadioPlayerScreen has correct id', () {
      expect(RadioPlayerScreen.id, equals('radio_player_screen'));
    });
  });
}
