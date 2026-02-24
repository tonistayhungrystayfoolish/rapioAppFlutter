import 'package:flutter_test/flutter_test.dart';
import 'package:music_radio_toni/model/radio_channel.dart';

void main() {
  group('RadioChannel', () {
    test('should create RadioChannel with required parameters', () {
      final radioChannel = RadioChannel(
        title: 'Test Radio',
        imageUrl: 'https://example.com/image.jpg',
        source: 'https://example.com/stream.m3u8',
      );

      expect(radioChannel.title, 'Test Radio');
      expect(radioChannel.imageUrl, 'https://example.com/image.jpg');
      expect(radioChannel.source, 'https://example.com/stream.m3u8');
      expect(radioChannel.favorite, false);
      expect(radioChannel.id, isNotEmpty);
    });

    test('should create RadioChannel with custom id', () {
      const customId = 'custom-uuid-123';
      final radioChannel = RadioChannel(
        id: customId,
        title: 'Test Radio',
        imageUrl: 'https://example.com/image.jpg',
        source: 'https://example.com/stream.m3u8',
      );

      expect(radioChannel.id, customId);
    });

    test('should create RadioChannel with favorite set to true', () {
      final radioChannel = RadioChannel(
        title: 'Test Radio',
        imageUrl: 'https://example.com/image.jpg',
        source: 'https://example.com/stream.m3u8',
        favorite: true,
      );

      expect(radioChannel.favorite, true);
    });

    test('should generate unique id when not provided', () {
      final radioChannel1 = RadioChannel(
        title: 'Radio 1',
        imageUrl: 'https://example.com/image1.jpg',
        source: 'https://example.com/stream1.m3u8',
      );

      final radioChannel2 = RadioChannel(
        title: 'Radio 2',
        imageUrl: 'https://example.com/image2.jpg',
        source: 'https://example.com/stream2.m3u8',
      );

      expect(radioChannel1.id, isNotEmpty);
      expect(radioChannel2.id, isNotEmpty);
      expect(radioChannel1.id, isNot(equals(radioChannel2.id)));
    });
  });
}
