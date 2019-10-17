import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:spacex_app/feature/missions/data/model/mission_model.dart';

@immutable
abstract class MissionEvent extends Equatable {
  MissionEvent([List props = const <dynamic>[]]) : super(props);
}

class GetMissionsEvent extends MissionEvent {
  final int limit;

  GetMissionsEvent([this.limit = 10]) : super([limit]);
}

class DeleteMissionEvent extends MissionEvent {
  final MissionModel mission;

  DeleteMissionEvent(this.mission) : super([mission]);
}
