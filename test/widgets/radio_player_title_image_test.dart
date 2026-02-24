import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_radio_toni/views/widgets/radio_player_title_image.dart';

void main() {
  group('RadioPlayerImageAndTitle', () {
    testWidgets('renders Column widget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RadioPlayerImageAndTitle(
              imageUrl: 'assets/images/radio1.jpg',
              title: 'Test Radio Title',
            ),
          ),
        ),
      );

      expect(find.byType(Column), findsOneWidget);
    });

    testWidgets('renders Image.asset widget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RadioPlayerImageAndTitle(
              imageUrl: 'assets/images/radio1.jpg',
              title: 'Test Radio Title',
            ),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('renders Text widget with correct title', (tester) async {
      const testTitle = 'My Test Radio';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RadioPlayerImageAndTitle(
              imageUrl: 'assets/images/radio1.jpg',
              title: testTitle,
            ),
          ),
        ),
      );

      expect(find.text(testTitle), findsOneWidget);
    });

    testWidgets('has proper container padding', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RadioPlayerImageAndTitle(
              imageUrl: 'assets/images/radio1.jpg',
              title: 'Test Radio',
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.padding,
          equals(const EdgeInsets.symmetric(horizontal: 32.0)));
    });

    testWidgets('accepts required parameters imageUrl and title',
        (tester) async {
      expect(
        () => const RadioPlayerImageAndTitle(
          imageUrl: 'assets/images/radio1.jpg',
          title: 'Test Radio',
        ),
        returnsNormally,
      );
    });

    testWidgets('text has correct styling', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RadioPlayerImageAndTitle(
              imageUrl: 'assets/images/radio1.jpg',
              title: 'Test Radio',
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Test Radio'));
      expect(text.style?.fontSize, equals(24));
      expect(text.style?.color, equals(Colors.white));
    });
  });
}
