import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:spacex_app/feature/missions/data/model/mission_model.dart';

@immutable
abstract class MissionState extends Equatable {
  MissionState([List props = const <dynamic>[]]) : super(props);
}

class Empty extends MissionState {}

class Loading extends MissionState {}

class Loaded extends MissionState {
  final MissionResponse model;

  Loaded({@required this.model}) : super([model]);
}

class Error extends MissionState {
  final String message;

  Error({@required this.message}) : super([message]);
}