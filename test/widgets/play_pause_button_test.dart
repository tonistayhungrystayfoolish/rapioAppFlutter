import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_radio_toni/views/widgets/play_pause_button.dart';

void main() {
  group('PlayPauseButton', () {
    testWidgets('displays play icon when isPlaying is false', (tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PlayPauseButton(
              onPressed: () => wasPressed = true,
              isPlaying: false,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.play_arrow), findsOneWidget);
      expect(find.byIcon(Icons.pause), findsNothing);
    });

    testWidgets('displays pause icon when isPlaying is true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PlayPauseButton(
              onPressed: () {},
              isPlaying: true,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.pause), findsOneWidget);
      expect(find.byIcon(Icons.play_arrow), findsNothing);
    });

    testWidgets('calls onPressed when button is tapped', (tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PlayPauseButton(
              onPressed: () => wasPressed = true,
              isPlaying: false,
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.play_arrow));
      await tester.pump();

      expect(wasPressed, isTrue);
    });

    testWidgets('renders CircleAvatar widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PlayPauseButton(
              onPressed: () {},
              isPlaying: false,
            ),
          ),
        ),
      );

      expect(find.byType(CircleAvatar), findsOneWidget);
    });

    testWidgets('renders IconButton widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PlayPauseButton(
              onPressed: () {},
              isPlaying: false,
            ),
          ),
        ),
      );

      expect(find.byType(IconButton), findsOneWidget);
    });
  });
}
