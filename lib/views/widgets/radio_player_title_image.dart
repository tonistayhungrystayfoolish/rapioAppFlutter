import 'package:flutter/material.dart';

class RadioPlayerImageAndTitle extends StatelessWidget {
  final String imageUrl;
  final String title;

  const RadioPlayerImageAndTitle({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
      ],
    );
  }
}
