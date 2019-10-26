// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MissionResponseAdapter extends TypeAdapter<MissionResponse> {
  @override
  MissionResponse read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MissionResponse(
      (fields[0] as List)?.cast<MissionModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, MissionResponse obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.launches);
  }
}

class MissionModelAdapter extends TypeAdapter<MissionModel> {
  @override
  MissionModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MissionModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      links: fields[4] as Links,
    );
  }

  @override
  void write(BinaryWriter writer, MissionModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.details)
      ..writeByte(1)
      ..write(obj.missionName)
      ..writeByte(2)
      ..write(obj.launchYear)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.links);
  }
}

class LinksAdapter extends TypeAdapter<Links> {
  @override
  Links read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Links(
      (fields[0] as List)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Links obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.flickrImages);
  }
}

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
    json['id'] as String,
    links: json['links'] == null
        ? null
        : Links.fromJson(json['links'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MissionModelToJson(MissionModel instance) =>
    <String, dynamic>{
      'details': instance.details,
      'mission_name': instance.missionName,
      'launch_year': instance.launchYear,
      'id': instance.id,
      'links': instance.links,
    };

Links _$LinksFromJson(Map<String, dynamic> json) {
  return Links(
    (json['flickr_images'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'flickr_images': instance.flickrImages,
    };
