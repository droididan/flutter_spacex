import 'package:json_annotation/json_annotation.dart';
part 'mission_model.g.dart';

@JsonSerializable()
class MissionModel {
  final String details;
  final String missionName;
  final String launchYear;

  MissionModel(this.details, this.missionName, this.launchYear);

  factory MissionModel.fromJson(Map<String, dynamic> json) => _$MissionModelFromJson(json);
  Map<String, dynamic> toJson() => _$MissionModelToJson(this);
}