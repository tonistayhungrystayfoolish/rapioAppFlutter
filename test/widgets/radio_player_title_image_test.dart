import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_radio_toni/views/widgets/radio_player_title_image.dart';

void main() {
  group('RadioPlayerImageAndTitle', () {
    test('accepts required parameters imageUrl and title', () {
      expect(
        () => const RadioPlayerImageAndTitle(
          imageUrl: 'assets/images/radio1.jpg',
          title: 'Test Radio',
        ),
        returnsNormally,
      );
    });

    test('has required properties', () {
      const widget = RadioPlayerImageAndTitle(
        imageUrl: 'assets/images/radio1.jpg',
        title: 'Test Radio',
      );

      expect(widget.imageUrl, equals('assets/images/radio1.jpg'));
      expect(widget.title, equals('Test Radio'));
    });

    testWidgets('renders Column widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 400,
              height: 600,
              child: const RadioPlayerImageAndTitle(
                imageUrl: 'assets/images/radio1.jpg',
                title: 'Test Radio',
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Column), findsOneWidget);
    });

    testWidgets('renders Image.asset widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 400,
              height: 600,
              child: const RadioPlayerImageAndTitle(
                imageUrl: 'assets/images/radio1.jpg',
                title: 'Test Radio',
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('renders Text widget with title', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 400,
              height: 600,
              child: const RadioPlayerImageAndTitle(
                imageUrl: 'assets/images/radio1.jpg',
                title: 'Test Radio Title',
              ),
            ),
          ),
        ),
      );

      expect(find.text('Test Radio Title'), findsOneWidget);
    });

    testWidgets('has correct text style', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 400,
              height: 600,
              child: const RadioPlayerImageAndTitle(
                imageUrl: 'assets/images/radio1.jpg',
                title: 'Test Radio',
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test Radio'));
      expect(textWidget.style?.fontSize, equals(24));
      expect(textWidget.style?.color, equals(Colors.white));
    });

    testWidgets('has mainAxisAlignment spaceEvenly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 400,
              height: 600,
              child: const RadioPlayerImageAndTitle(
                imageUrl: 'assets/images/radio1.jpg',
                title: 'Test Radio',
              ),
            ),
          ),
        ),
      );

      final column = tester.widget<Column>(find.byType(Column));
      expect(column.mainAxisAlignment, equals(MainAxisAlignment.spaceEvenly));
    });

    testWidgets('renders ClipRRect widget for image', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 400,
              height: 600,
              child: const RadioPlayerImageAndTitle(
                imageUrl: 'assets/images/radio1.jpg',
                title: 'Test Radio',
              ),
            ),
          ),
        ),
      );

      expect(find.byType(ClipRRect), findsOneWidget);
    });

    testWidgets('has correct border radius on ClipRRect', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 400,
              height: 600,
              child: const RadioPlayerImageAndTitle(
                imageUrl: 'assets/images/radio1.jpg',
                title: 'Test Radio',
              ),
            ),
          ),
        ),
      );

      final clipRRect = tester.widget<ClipRRect>(find.byType(ClipRRect));
      expect(clipRRect.borderRadius, equals(BorderRadius.circular(20.0)));
    });

    testWidgets('renders Container widget with padding', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 400,
              height: 600,
              child: const RadioPlayerImageAndTitle(
                imageUrl: 'assets/images/radio1.jpg',
                title: 'Test Radio',
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('Container has symmetric horizontal padding', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 400,
              height: 600,
              child: const RadioPlayerImageAndTitle(
                imageUrl: 'assets/images/radio1.jpg',
                title: 'Test Radio',
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.padding, isNotNull);
      final padding = container.padding as EdgeInsets;
      expect(padding.left, equals(32.0));
      expect(padding.right, equals(32.0));
    });

    testWidgets('Image has BoxFit cover', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 400,
              height: 600,
              child: const RadioPlayerImageAndTitle(
                imageUrl: 'assets/images/radio1.jpg',
                title: 'Test Radio',
              ),
            ),
          ),
        ),
      );

      final image = tester.widget<Image>(find.byType(Image));
      expect(image.fit, equals(BoxFit.cover));
    });
  });
}
