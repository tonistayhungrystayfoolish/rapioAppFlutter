import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_radio_toni/model/radio_channel.dart';
import 'package:music_radio_toni/views/screens/radio_list_screen.dart';
import 'package:music_radio_toni/views/screens/radio_player_screen.dart';

import '../bloc/radio_list_bloc/radio_bloc.dart';
import '../bloc/radio_player_bloc/radio_player_bloc.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RadioListScreen.id:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<RadioListBloc>.value(
            value: RadioListBloc(),
            child: const RadioListScreen(),
          ),
        );

      case RadioPlayerScreen.id:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider<RadioPlayerBloc>(
              create: (context) => RadioPlayerBloc(
                audioSource: (args).source,
              ),
              child: RadioPlayerScreen(broadcastingData: args as RadioChannel),
            );
          },
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error while loading new page'),
        ),
      );
    });
  }
}
