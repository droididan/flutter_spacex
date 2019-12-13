import 'package:spacex_app/feature/missions/data/model/mission_model.dart';
import 'package:super_enum/super_enum.dart';

part 'mission_states.g.dart';

@superEnum
enum _MissionState {
  @object
  Empty,
  @object
  Loading,
  @Data(fields: [DataField('model', MissionResponse)])
  Loaded,
  @Data(fields: [DataField('message', String)])
  Error,
}
