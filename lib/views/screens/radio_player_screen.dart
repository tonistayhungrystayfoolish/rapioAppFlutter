import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_radio_toni/bloc/radio_player_bloc/radio_player_event.dart';
import 'package:music_radio_toni/bloc/radio_player_bloc/radio_player_state.dart';
import 'package:music_radio_toni/model/radio_channel.dart';
import 'package:music_radio_toni/views/widgets/play_pause_button.dart';
import 'package:music_radio_toni/views/widgets/radio_player_title_image.dart';
import 'package:music_radio_toni/views/widgets/waver_visualizer.dart';

import '../../bloc/radio_player_bloc/radio_player_bloc.dart';

class RadioPlayerScreen extends StatefulWidget {
  static const String id = "radio_player_screen";

  const RadioPlayerScreen({super.key, required this.broadcastingData});

  final RadioChannel broadcastingData;

  @override
  State<StatefulWidget> createState() => _RadioPlayerScreenScreenState();
}

class _RadioPlayerScreenScreenState extends State<RadioPlayerScreen> {
  late RadioPlayerBloc _bloc;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<RadioPlayerBloc>(context);
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  void _playPause() {
    _bloc.add(PlayPauseEvent());
  }

  void _toggleFavorite() {
    _bloc.add(ToggleFavoriteEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.broadcastingData.title),
        actions: [
          GestureDetector(
            onTap: () {
              _toggleFavorite();
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocConsumer<RadioPlayerBloc, RadioPlayerState>(
                builder: (context, state) {
                  final bool isFavorite = state is RadioPlayerFavoriteChanged
                      ? state.isFavorite
                      : _isFavorite;

                  return Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  );
                },
                listener: (BuildContext context, RadioPlayerState state) {},
              ),
            ),
          ),
        ],
      ),
      body: BlocConsumer<RadioPlayerBloc, RadioPlayerState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: RadioPlayerImageAndTitle(
                  imageUrl: widget.broadcastingData.imageUrl,
                  title: widget.broadcastingData.title,
                ),
              ),
              PlayPauseButton(
                onPressed: _playPause,
                isPlaying: state is RadioPlayerPlaying,
              ),
              Visibility(
                visible: state is RadioPlayerPlaying,
                child: const WaveVisualizer(),
              ),
            ],
          );
        },
        listener: (BuildContext context, RadioPlayerState state) {},
      ),
    );
  }
}
