import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_radio_toni/views/widgets/waver_visualizer.dart';
import 'package:wave/wave.dart';

void main() {
  group('WaveVisualizer', () {
    testWidgets('renders SizedBox widget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WaveVisualizer(),
          ),
        ),
      );

      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('renders WaveWidget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WaveVisualizer(),
          ),
        ),
      );

      expect(find.byType(WaveWidget), findsOneWidget);
    });

    testWidgets('has correct height', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WaveVisualizer(),
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.height, equals(12));
    });

    testWidgets('constructor takes no parameters', (tester) async {
      expect(
        () => const WaveVisualizer(),
        returnsNormally,
      );
    });

    testWidgets('waveWidget has config', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WaveVisualizer(),
          ),
        ),
      );

      final waveWidget = tester.widget<WaveWidget>(find.byType(WaveWidget));
      expect(waveWidget.config, isNotNull);
    });
  });
}
