import 'package:uuid/uuid.dart';

class RadioChannel {
  late final String id;
  final String title;
  final String imageUrl;
  final String source;
  final bool favorite;

  RadioChannel({
    String? id,
    required this.title,
    required this.imageUrl,
    required this.source,
    this.favorite = false,
  }) : id = id ?? const Uuid().v4();
}
