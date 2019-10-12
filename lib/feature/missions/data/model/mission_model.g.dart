// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionResponse _$MissionResponseFromJson(Map<String, dynamic> json) {
  return MissionResponse(
    (json['launches'] as List)
        ?.map((e) =>
            e == null ? null : MissionModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MissionResponseToJson(MissionResponse instance) =>
    <String, dynamic>{
      'launches': instance.launches,
    };

MissionModel _$MissionModelFromJson(Map<String, dynamic> json) {
  return MissionModel(
    json['details'] as String,
    json['mission_name'] as String,
    json['launch_year'] as String,
  );
}

Map<String, dynamic> _$MissionModelToJson(MissionModel instance) =>
    <String, dynamic>{
      'details': instance.details,
      'mission_name': instance.missionName,
      'launch_year': instance.launchYear,
    };
