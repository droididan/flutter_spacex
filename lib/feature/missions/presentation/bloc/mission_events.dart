import 'package:super_enum/super_enum.dart';
part 'mission_events.g.dart';
@superEnum
enum _MissionEvent {
  @Data(fields: [
    DataField('limit', int),
  ])
  GetMissionsEvent,
}

//
//@immutable
//abstract class MissionEvent extends Equatable { }
//
//class GetMissionsEvent extends MissionEvent {
//  final int limit;
//
//  GetMissionsEvent([this.limit = 10]);
//
//  @override
//  List<Object> get props => [limit];
//}
//
//class DeleteMissionEvent extends MissionEvent {
//  final MissionModel mission;
//
//  DeleteMissionEvent(this.mission);
//
//  @override
//  List<Object> get props => [mission];
//}
//
