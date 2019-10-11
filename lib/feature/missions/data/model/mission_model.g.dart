// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionModel _$MissionModelFromJson(Map<String, dynamic> json) {
  return MissionModel(
    json['details'] as String,
    json['missionName'] as String,
    json['launchYear'] as String,
  );
}

Map<String, dynamic> _$MissionModelToJson(MissionModel instance) =>
    <String, dynamic>{
      'details': instance.details,
      'missionName': instance.missionName,
      'launchYear': instance.launchYear,
    };
