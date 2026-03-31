import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_radio_toni/main.dart';

void main() {
  group('main.dart', () {
    group('kColorScheme', () {
      test('kColorScheme is a ColorScheme', () {
        expect(kColorScheme, isA<ColorScheme>());
      });

      test('kColorScheme is not Brightness.dark', () {
        expect(kColorScheme.brightness, isNot(Brightness.dark));
      });

      test('kColorScheme primary is not null', () {
        expect(kColorScheme.primary, isNotNull);
      });
    });

    group('kDarkColorScheme', () {
      test('kDarkColorScheme is a ColorScheme', () {
        expect(kDarkColorScheme, isA<ColorScheme>());
      });

      test('kDarkColorScheme has brightness dark', () {
        expect(kDarkColorScheme.brightness, equals(Brightness.dark));
      });

      test('kDarkColorScheme surface is not null', () {
        expect(kDarkColorScheme.surface, isNotNull);
      });
    });

    group('MyApp', () {
      testWidgets('MyApp is a StatelessWidget', (tester) async {
        await tester.pumpWidget(const MyApp());
        expect(find.byType(MyApp), findsOneWidget);
      });

      testWidgets('MyApp renders MaterialApp', (tester) async {
        await tester.pumpWidget(const MyApp());
        expect(find.byType(MaterialApp), findsOneWidget);
      });

      testWidgets('MyApp has light theme with kColorScheme', (tester) async {
        await tester.pumpWidget(const MyApp());
        final materialApp =
            tester.widget<MaterialApp>(find.byType(MaterialApp));
        expect(materialApp.theme, isNotNull);
        expect(materialApp.theme!.colorScheme, equals(kColorScheme));
      });

      testWidgets('MyApp has dark theme with kDarkColorScheme', (tester) async {
        await tester.pumpWidget(const MyApp());
        final materialApp =
            tester.widget<MaterialApp>(find.byType(MaterialApp));
        expect(materialApp.darkTheme, isNotNull);
        expect(materialApp.darkTheme!.colorScheme, equals(kDarkColorScheme));
      });

      testWidgets('MyApp has correct initialRoute', (tester) async {
        await tester.pumpWidget(const MyApp());
        final materialApp =
            tester.widget<MaterialApp>(find.byType(MaterialApp));
        expect(materialApp.initialRoute, equals('radio_list_screen'));
      });

      testWidgets('MyApp has onGenerateRoute', (tester) async {
        await tester.pumpWidget(const MyApp());
        final materialApp =
            tester.widget<MaterialApp>(find.byType(MaterialApp));
        expect(materialApp.onGenerateRoute, isNotNull);
      });

      testWidgets('MyApp dark theme has CardTheme with secondaryContainer',
          (tester) async {
        await tester.pumpWidget(const MyApp());
        final materialApp =
            tester.widget<MaterialApp>(find.byType(MaterialApp));
        final darkTheme = materialApp.darkTheme!;
        expect(darkTheme.cardTheme.color,
            equals(kDarkColorScheme.secondaryContainer));
      });

      testWidgets('MyApp dark theme has ElevatedButtonTheme', (tester) async {
        await tester.pumpWidget(const MyApp());
        final materialApp =
            tester.widget<MaterialApp>(find.byType(MaterialApp));
        final darkTheme = materialApp.darkTheme!;
        expect(darkTheme.elevatedButtonTheme.style, isNotNull);
      });

      testWidgets('MyApp light theme has scaffoldBackgroundColor',
          (tester) async {
        await tester.pumpWidget(const MyApp());
        final materialApp =
            tester.widget<MaterialApp>(find.byType(MaterialApp));
        expect(materialApp.theme!.scaffoldBackgroundColor,
            equals(Colors.deepPurpleAccent));
      });

      testWidgets('MyApp light theme has AppBarTheme', (tester) async {
        await tester.pumpWidget(const MyApp());
        final materialApp =
            tester.widget<MaterialApp>(find.byType(MaterialApp));
        expect(materialApp.theme!.appBarTheme, isNotNull);
      });

      testWidgets('MyApp light theme AppBarTheme has titleTextStyle',
          (tester) async {
        await tester.pumpWidget(const MyApp());
        final materialApp =
            tester.widget<MaterialApp>(find.byType(MaterialApp));
        final appBarTheme = materialApp.theme!.appBarTheme;
        expect(appBarTheme.titleTextStyle, isNotNull);
        expect(appBarTheme.titleTextStyle!.fontSize, equals(20));
      });

      testWidgets('MyApp light theme has CardTheme', (tester) async {
        await tester.pumpWidget(const MyApp());
        final materialApp =
            tester.widget<MaterialApp>(find.byType(MaterialApp));
        expect(materialApp.theme!.cardTheme, isNotNull);
      });

      testWidgets('MyApp light theme CardTheme has secondaryContainer color',
          (tester) async {
        await tester.pumpWidget(const MyApp());
        final materialApp =
            tester.widget<MaterialApp>(find.byType(MaterialApp));
        expect(materialApp.theme!.cardTheme.color,
            equals(kColorScheme.secondaryContainer));
      });

      testWidgets('MyApp light theme has ElevatedButtonTheme', (tester) async {
        await tester.pumpWidget(const MyApp());
        final materialApp =
            tester.widget<MaterialApp>(find.byType(MaterialApp));
        expect(materialApp.theme!.elevatedButtonTheme.style, isNotNull);
      });

      testWidgets('MyApp light theme has textTheme', (tester) async {
        await tester.pumpWidget(const MyApp());
        final materialApp =
            tester.widget<MaterialApp>(find.byType(MaterialApp));
        expect(materialApp.theme!.textTheme, isNotNull);
      });

      testWidgets('MyApp light theme textTheme has titleLarge', (tester) async {
        await tester.pumpWidget(const MyApp());
        final materialApp =
            tester.widget<MaterialApp>(find.byType(MaterialApp));
        expect(materialApp.theme!.textTheme.titleLarge, isNotNull);
      });

      testWidgets('MyApp light theme titleLarge has correct fontSize',
          (tester) async {
        await tester.pumpWidget(const MyApp());
        final materialApp =
            tester.widget<MaterialApp>(find.byType(MaterialApp));
        expect(materialApp.theme!.textTheme.titleLarge!.fontSize, equals(14));
      });

      testWidgets('MyApp light theme titleLarge has correct fontWeight',
          (tester) async {
        await tester.pumpWidget(const MyApp());
        final materialApp =
            tester.widget<MaterialApp>(find.byType(MaterialApp));
        expect(materialApp.theme!.textTheme.titleLarge!.fontWeight,
            equals(FontWeight.normal));
      });

      testWidgets('MyApp dark theme CardTheme has correct margin',
          (tester) async {
        await tester.pumpWidget(const MyApp());
        final materialApp =
            tester.widget<MaterialApp>(find.byType(MaterialApp));
        final cardTheme = materialApp.darkTheme!.cardTheme;
        expect(cardTheme.margin,
            equals(const EdgeInsets.symmetric(horizontal: 16, vertical: 8)));
      });

      testWidgets('MyApp light theme CardTheme has correct margin',
          (tester) async {
        await tester.pumpWidget(const MyApp());
        final materialApp =
            tester.widget<MaterialApp>(find.byType(MaterialApp));
        final cardTheme = materialApp.theme!.cardTheme;
        expect(cardTheme.margin,
            equals(const EdgeInsets.symmetric(horizontal: 16, vertical: 8)));
      });
    });

    group('runApp', () {
      testWidgets('runApp renders MyApp', (tester) async {
        await tester.pumpWidget(const MyApp());
        expect(find.byType(MyApp), findsOneWidget);
      });
    });
  });
}
