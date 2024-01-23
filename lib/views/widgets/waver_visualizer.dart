import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class WaveVisualizer extends StatelessWidget {
  static const _colors = [Color(0xFFFB20F6), Color(0xFFFB00FB)];

  static const _durations = [
    5000,
    4000,
  ];

  static const _heightPercentages = [
    0.65,
    0.66,
  ];

  const WaveVisualizer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 12,
      child: WaveWidget(
        config: CustomConfig(
          colors: _colors,
          durations: _durations,
          heightPercentages: _heightPercentages,
        ),
        size: const Size(double.infinity, double.infinity),
        waveAmplitude: 0,
      ),
    );
  }
}
