import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_radio_toni/model/radio_channel.dart';
import 'package:music_radio_toni/views/screens/radio_player_screen.dart';
import 'package:music_radio_toni/views/widgets/radio_item.dart';

import '../../bloc/radio_list_bloc/radio_bloc.dart';
import '../../bloc/radio_list_bloc/radio_list_event.dart';
import '../../bloc/radio_list_bloc/radio_state.dart';

class RadioListScreen extends StatefulWidget {
  static const String id = "radio_list_screen";

  const RadioListScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RadioListScreenState();
}

class _RadioListScreenState extends State<RadioListScreen> {
  late RadioListBloc _radioBloc;

  @override
  void initState() {
    _radioBloc = BlocProvider.of<RadioListBloc>(context);
    _radioBloc.add(LoadRadios());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Radio List')),
      body: BlocConsumer<RadioListBloc, RadioListState>(
        builder: (context, state) {
          if (state is RadiosLoaded) {
            return Center(
              child: GridView(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                children: state.radios
                    .map(
                      (item) => GestureDetector(
                        onTap: () => _moveToPlayerScreen(item),
                        child: RadioGridItem(radio: item),
                      ),
                    )
                    .toList(),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
        listener: (BuildContext context, RadioListState state) {},
      ),
    );
  }

  void _moveToPlayerScreen(RadioChannel radio) async {
    await Navigator.of(context, rootNavigator: true)
        .pushNamed(RadioPlayerScreen.id, arguments: radio);
  }
}
