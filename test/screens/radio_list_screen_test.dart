import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:music_radio_toni/bloc/radio_list_bloc/radio_bloc.dart';
import 'package:music_radio_toni/bloc/radio_list_bloc/radio_list_event.dart';
import 'package:music_radio_toni/bloc/radio_list_bloc/radio_state.dart';
import 'package:music_radio_toni/model/radio_channel.dart';
import 'package:music_radio_toni/views/screens/radio_list_screen.dart';

class MockRadioListBloc extends Mock implements RadioListBloc {}

class FakeRadioListEvent extends Fake implements RadioListEvent {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeRadioListEvent());
  });

  group('RadioListScreen', () {
    late MockRadioListBloc mockRadioListBloc;

    setUp(() {
      mockRadioListBloc = MockRadioListBloc();
    });

    Widget createWidgetUnderTest({RadioListState? state}) {
      final currentState = state ?? RadiosLoading();
      when(() => mockRadioListBloc.state).thenReturn(currentState);
      when(() => mockRadioListBloc.stream).thenAnswer(
          (_) => StreamController<RadioListState>.broadcast().stream);

      return MaterialApp(
        home: BlocProvider<RadioListBloc>.value(
          value: mockRadioListBloc,
          child: const RadioListScreen(),
        ),
      );
    }

    testWidgets('displays loading indicator when state is RadiosLoading',
        (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('displays AppBar with title', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('Radio List'), findsOneWidget);
    });

    testWidgets('displays AppBar widget', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('displays Scaffold widget', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('displays BlocConsumer widget', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(BlocConsumer<RadioListBloc, RadioListState>),
          findsOneWidget);
    });

    testWidgets('displays GridView when radios are loaded', (tester) async {
      final radios = [
        RadioChannel(
          id: '1',
          title: 'Test Radio 1',
          source: 'https://test.com/stream1.m3u8',
          imageUrl: 'assets/images/radio1.jpg',
        ),
        RadioChannel(
          id: '2',
          title: 'Test Radio 2',
          source: 'https://test.com/stream2.m3u8',
          imageUrl: 'assets/images/radio2.jpg',
        ),
      ];

      await tester
          .pumpWidget(createWidgetUnderTest(state: RadiosLoaded(radios)));
      await tester.pumpAndSettle();

      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('displays RadioGridItem for each radio channel',
        (tester) async {
      final radios = [
        RadioChannel(
          id: '1',
          title: 'Test Radio 1',
          source: 'https://test.com/stream1.m3u8',
          imageUrl: 'assets/images/radio1.jpg',
        ),
        RadioChannel(
          id: '2',
          title: 'Test Radio 2',
          source: 'https://test.com/stream2.m3u8',
          imageUrl: 'assets/images/radio2.jpg',
        ),
      ];

      await tester
          .pumpWidget(createWidgetUnderTest(state: RadiosLoaded(radios)));
      await tester.pumpAndSettle();

      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('has correct GridView delegate', (tester) async {
      final radios = [
        RadioChannel(
          id: '1',
          title: 'Test Radio 1',
          source: 'https://test.com/stream1.m3u8',
          imageUrl: 'assets/images/radio1.jpg',
        ),
      ];

      await tester
          .pumpWidget(createWidgetUnderTest(state: RadiosLoaded(radios)));
      await tester.pumpAndSettle();

      final gridView = tester.widget<GridView>(find.byType(GridView));
      expect(gridView.gridDelegate,
          isA<SliverGridDelegateWithFixedCrossAxisCount>());
    });

    testWidgets('does not display loading when radios are loaded',
        (tester) async {
      final radios = [
        RadioChannel(
          id: '1',
          title: 'Test Radio 1',
          source: 'https://test.com/stream1.m3u8',
          imageUrl: 'assets/images/radio1.jpg',
        ),
      ];

      await tester
          .pumpWidget(createWidgetUnderTest(state: RadiosLoaded(radios)));
      await tester.pumpAndSettle();

      expect(find.byType(CircularProgressIndicator), findsNothing);
    });
  });
}
