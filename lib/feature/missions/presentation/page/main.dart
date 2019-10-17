import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:spacex_app/core/di/locator.dart';
import 'package:spacex_app/feature/home/presentation/home.dart';
import 'package:spacex_app/feature/missions/data/model/mission_model.dart';

void main() async {
  initLocator();
  await initHive();
  runApp(MyApp());
}

Future initHive() async {
  final appDocumentDir = await path.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(MissionModelAdapter(), 1);
  Hive.registerAdapter(MissionResponseAdapter(), 0);
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

var logger = Logger(printer: PrettyPrinter(), filter: null);
//
//class Home extends StatelessWidget {
//  final bloc = sl<MissionBloc>();
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: BlocProvider(
//        builder: (_) => bloc,
//        child: BlocBuilder<MissionBloc, MissionState>(
//          builder: (context, state) {
//            if (state is Loading) {
//              return Center(child: CircularProgressIndicator());
//            }
//            if (state is Loaded) {
//              final list = state.model.launches;
//              return ListView.builder(
//                itemCount: list.length,
//                itemBuilder: (BuildContext context, int index) {
//                  final mission = list[index];
//                  return ListTile(
//                    title: Text(mission.missionName),
//                    onTap: () => bloc.dispatch(DeleteMissionEvent(mission)),
//                  );
//                },
//              );
//            }
//            return Container();
//          },
//        ),
//      ),
//    );
//  }
//}
