import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/core/di/locator.dart';
import 'package:spacex_app/feature/missions/presentation/bloc/mission_events.dart';

import 'feature/missions/presentation/bloc/mission_bloc.dart';

void main() {
  initLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        builder: (_) => sl<MissionBloc>(),
        child: BlocBuilder<MissionBloc, MissionState>(
          builder: (context, state) {
            if (state is Loading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is Loaded) {
              final list = state.model.launches;
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  final mission = list[index];
                  return ListTile(
                    title: Text(mission.missionName),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
