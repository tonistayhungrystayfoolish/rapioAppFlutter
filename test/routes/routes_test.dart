import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_radio_toni/bloc/radio_list_bloc/radio_bloc.dart';
import 'package:music_radio_toni/bloc/radio_player_bloc/radio_player_bloc.dart';
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

    test(
        'generateRoute returns MaterialPageRoute for RadioListScreen with builder',
        () {
      const settings = RouteSettings(name: RadioListScreen.id);
      final route = routeGenerator.generateRoute(settings) as MaterialPageRoute;

      expect(route.builder, isNotNull);
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

    test(
        'generateRoute returns MaterialPageRoute for RadioPlayerScreen with builder',
        () {
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
      final route = routeGenerator.generateRoute(settings) as MaterialPageRoute;

      expect(route.builder, isNotNull);
    });

    test('generateRoute returns error route for unknown route', () {
      const settings = RouteSettings(name: '/unknown-route');
      final route = routeGenerator.generateRoute(settings);

      expect(route, isA<MaterialPageRoute>());
    });

    test('generateRoute returns error route for null route name', () {
      const settings = RouteSettings(name: null);
      final route = routeGenerator.generateRoute(settings);

      expect(route, isA<MaterialPageRoute>());
    });

    test('generateRoute for RadioListScreen contains RadioListScreen widget',
        () {
      const settings = RouteSettings(name: RadioListScreen.id);
      final route = routeGenerator.generateRoute(settings) as MaterialPageRoute;

      final widget = route.builder(_createMockContext());
      expect(widget, isA<BlocProvider<RadioListBloc>>());
    });

    test(
        'generateRoute for RadioPlayerScreen creates RadioPlayerBloc with audioSource',
        () {
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
      final route = routeGenerator.generateRoute(settings) as MaterialPageRoute;

      final widget = route.builder(_createMockContext());
      expect(widget, isA<BlocProvider<RadioPlayerBloc>>());
    });

    test('generateRoute for unknown route shows error Scaffold', () {
      const settings = RouteSettings(name: '/unknown');
      final route = routeGenerator.generateRoute(settings) as MaterialPageRoute;

      final scaffold = route.builder(_createMockContext()) as Scaffold;
      expect(scaffold.appBar, isA<AppBar>());
      expect((scaffold.appBar as AppBar).title, isA<Text>());
      expect(((scaffold.appBar as AppBar).title as Text).data, 'Error');
    });

    test('generateRoute for unknown route shows error message', () {
      const settings = RouteSettings(name: '/unknown');
      final route = routeGenerator.generateRoute(settings) as MaterialPageRoute;

      final scaffold = route.builder(_createMockContext()) as Scaffold;
      final center = scaffold.body as Center;
      final text = center.child as Text;
      expect(text.data, 'Error while loading new page');
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

BuildContext _createMockContext() {
  return _MockBuildContext();
}

class _MockBuildContext implements BuildContext {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
