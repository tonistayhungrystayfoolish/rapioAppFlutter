import 'package:flutter/material.dart';

class PlayPauseButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isPlaying;

  const PlayPauseButton({
    super.key,
    required this.onPressed,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          CircleAvatar(
            radius: 40.0,
            backgroundColor: Colors.white.withOpacity(0.3),
            child: Center(
              child: IconButton(
                icon: Icon(
                  size: 36.0,
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                ),
                onPressed: onPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
