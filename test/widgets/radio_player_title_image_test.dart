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
  });
}
