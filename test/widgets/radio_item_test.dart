import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_radio_toni/model/radio_channel.dart';
import 'package:music_radio_toni/views/widgets/radio_item.dart';

void main() {
  group('RadioGridItem', () {
    late RadioChannel testRadio;

    setUp(() {
      testRadio = RadioChannel(
        id: 'test-id',
        title: 'Test Radio',
        imageUrl: 'assets/images/radio1.jpg',
        source: 'https://test-stream.com/stream.m3u8',
      );
    });

    testWidgets('renders Card widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RadioGridItem(radio: testRadio),
          ),
        ),
      );

      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('renders Image.asset widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RadioGridItem(radio: testRadio),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('renders Column widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RadioGridItem(radio: testRadio),
          ),
        ),
      );

      expect(find.byType(Column), findsOneWidget);
    });

    testWidgets('has proper elevation', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RadioGridItem(radio: testRadio),
          ),
        ),
      );

      final card = tester.widget<Card>(find.byType(Card));
      expect(card.elevation, equals(5));
    });

    testWidgets('has proper border radius', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RadioGridItem(radio: testRadio),
          ),
        ),
      );

      final card = tester.widget<Card>(find.byType(Card));
      expect(card.shape, isA<RoundedRectangleBorder>());
    });

    testWidgets('accepts RadioChannel as required parameter', (tester) async {
      expect(
        () => RadioGridItem(radio: testRadio),
        returnsNormally,
      );
    });
  });
}
