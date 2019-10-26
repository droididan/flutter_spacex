import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mission_model.g.dart';

@HiveType()
@JsonSerializable()
class MissionResponse {
  @HiveField(0)
  final List<MissionModel> launches;

  MissionResponse(this.launches);

  factory MissionResponse.fromJson(Map<String, dynamic> json) => _$MissionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MissionResponseToJson(this);
}

@HiveType()
@JsonSerializable()
class MissionModel {
  @HiveField(0)
  final String details;
  @HiveField(1)
  @JsonKey(name: 'mission_name')
  final String missionName;
  @HiveField(2)
  @JsonKey(name: 'launch_year')
  final String launchYear;
  @HiveField(3)
  @JsonKey(name: 'id')
  final String id;
  @HiveField(4)
  @JsonKey(name: 'links')
  final Links links;

  MissionModel(this.details, this.missionName, this.launchYear, this.id, {this.links});

  factory MissionModel.fromJson(Map<String, dynamic> json) => _$MissionModelFromJson(json);
  Map<String, dynamic> toJson() => _$MissionModelToJson(this);
}

@HiveType()
@JsonSerializable()
class Links {
  @HiveField(0)
  @JsonKey(name: 'flickr_images') final List<String> flickrImages;

  Links(this.flickrImages);

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
