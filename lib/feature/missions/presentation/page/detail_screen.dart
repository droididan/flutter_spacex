import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:spacex_app/feature/missions/data/datasource/mission_local_datasource.dart';
import 'package:spacex_app/feature/missions/data/model/mission_model.dart';

class Detail extends StatelessWidget {
  final MissionModel model;

  Detail({Key key, this.model}) : super(key: key) {
    _init();
  }

  _init() async {
    final box = await Hive.openBox(MISSION_BOX);
    final lastSnapshot = box.getAt(box.length - 1) as MissionResponse;
    final currentMission = lastSnapshot.launches.firstWhere((mission) => mission.id == model.id);
    await box.delete(currentMission);
  }

  @override
  Widget build(BuildContext context) {
    final images = model.links.flickrImages;
    return Scaffold(
      appBar: AppBar(
        title: Text(model.missionName),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            final currentImage = images[index];
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: CachedNetworkImage(
                imageUrl: currentImage,
                width: MediaQuery.of(context).size.width,
              ),
            );
          },
          itemCount: images.length,
          padding: EdgeInsets.all(8.0),
        ),
      ),
    );
  }
}
