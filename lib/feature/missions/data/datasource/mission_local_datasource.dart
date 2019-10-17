import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:spacex_app/feature/missions/data/model/mission_model.dart';

abstract class MissionLocalDataSource {

  /// cache all missions
  Future<void> cacheMissions(MissionResponse mission);

  /// get all cached missions
  Future<MissionResponse> getCachedMissions();
}

const String MISSION_BOX = "missions";

class MissionLocalDataSourceImpl implements MissionLocalDataSource {
  @override
  Future<void> cacheMissions(MissionResponse mission) async {
    final missionsBox = await Hive.openBox(MISSION_BOX);
    final id = await missionsBox.add(mission);
    debugPrint('mission saved id: $id');
    missionsBox.close();
  }

  @override
  Future<MissionResponse> getCachedMissions() async {
    final missionsBox = await Hive.openBox(MISSION_BOX);
    final lastSnapshotId = missionsBox.length - 1;
    final missions = missionsBox.get(lastSnapshotId) as MissionResponse;
    missionsBox.close();
    return missions;
  }
}