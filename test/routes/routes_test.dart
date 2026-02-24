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

    test('_errorRoute returns MaterialPageRoute with error Scaffold', () {
      final route = RouteGenerator._errorRoute() as MaterialPageRoute;

      expect(route, isA<MaterialPageRoute>());
      expect(route.builder, isNotNull);
    });

    test('_errorRoute contains Error title in AppBar', () {
      final route = RouteGenerator._errorRoute() as MaterialPageRoute;
      final errorWidget = route.builder(MockBuildContext());

      expect(errorWidget, isA<Scaffold>());
      final scaffold = errorWidget as Scaffold;
      expect(scaffold.appBar, isA<AppBar>());
      expect((scaffold.appBar as AppBar).title, isA<Text>());
      expect(((scaffold.appBar as AppBar).title as Text).data, 'Error');
    });

    test('_errorRoute contains error message in body', () {
      final route = RouteGenerator._errorRoute() as MaterialPageRoute;
      final errorWidget = route.builder(MockBuildContext());

      expect(errorWidget, isA<Scaffold>());
      final scaffold = errorWidget as Scaffold;
      expect(scaffold.body, isA<Center>());
      final center = scaffold.body as Center;
      expect(center.child, isA<Text>());
      expect((center.child as Text).data, 'Error while loading new page');
    });

    test('generateRoute uses settings.arguments for RadioPlayerScreen', () {
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
      final builderResult = route.builder(MockBuildContext(), null);

      expect(builderResult, isA<BlocProvider<RadioPlayerBloc>>());
    });

    test('generateRoute for RadioListScreen creates RadioListBloc', () {
      const settings = RouteSettings(name: RadioListScreen.id);
      final route = routeGenerator.generateRoute(settings) as MaterialPageRoute;
      final builderResult = route.builder(MockBuildContext(), null);

      expect(builderResult, isA<BlocProvider<RadioListBloc>>());
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

class MockBuildContext implements BuildContext {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
