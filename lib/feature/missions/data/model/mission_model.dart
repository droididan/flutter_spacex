import 'package:json_annotation/json_annotation.dart';
part 'mission_model.g.dart';

@JsonSerializable()
class MissionResponse {

  final List<MissionModel> launches;
  MissionResponse(this.launches);

  factory MissionResponse.fromJson(Map<String, dynamic> json) => _$MissionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MissionResponseToJson(this);
}

@JsonSerializable()
class MissionModel {
  final String details;
  @JsonKey(name: 'mission_name')
  final String missionName;
  @JsonKey(name: 'launch_year')
  final String launchYear;

  MissionModel(this.details, this.missionName, this.launchYear);

  factory MissionModel.fromJson(Map<String, dynamic> json) => _$MissionModelFromJson(json);
  Map<String, dynamic> toJson() => _$MissionModelToJson(this);
}