import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:spacex_app/core/di/locator.dart';
import 'package:spacex_app/feature/missions/data/model/mission_model.dart';
import 'package:spacex_app/feature/missions/presentation/bloc/mission_bloc.dart';
import 'package:spacex_app/feature/missions/presentation/bloc/mission_states.dart';
import 'package:spacex_app/feature/missions/presentation/page/detail_screen.dart';

const IMAGE_SIZE = 80.0;
var logger = Logger(printer: PrettyPrinter(), filter: null);

void main() async {
  initLocator();
  await initHive();
  runApp(MyApp());
}

Future initHive() async {
  final appDocumentDir = await path.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(MissionResponseAdapter(), 0);
  Hive.registerAdapter(MissionModelAdapter(), 1);
  Hive.registerAdapter(LinksAdapter(), 2);
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
      appBar: AppBar(
        title: Center(child: Text('SpaceX')),
      ),
      body: BlocProvider(
        create: (_) => sl<MissionBloc>(),
        child: BlocBuilder<MissionBloc, MissionState>(
          builder: (context, state) {
            return state.when(
              empty: (_) => Center(child: Text('Empty State')),
              loading: (_) => Center(child: CircularProgressIndicator()),
              loaded: (event) => buildMissionList(event),
              error: (error) => Center(child: Text('Error')),
            );
          },
        ),
      ),
    );
  }

  ListView buildMissionList(Loaded state) {
    final list = state.model?.launches;
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        final mission = list[index];
        return ListTile(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Detail(
                model: mission,
              ),
            ),
          ),
          contentPadding: EdgeInsets.all(3.0),
          title: Text(mission.missionName),
          leading: mission.links.flickrImages.isNotEmpty
              ? CachedNetworkImage(
                  imageUrl: mission.links.flickrImages.first,
                  width: IMAGE_SIZE,
                  height: IMAGE_SIZE,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )
              : Container(
                  height: IMAGE_SIZE,
                  width: IMAGE_SIZE,
                  color: Colors.grey.shade200,
                ),
        );
      },
    );
  }
}
