import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MissionEvent extends Equatable {
  MissionEvent([List props = const <dynamic>[]]) : super(props);
}

class GetMissionsEvent extends MissionEvent  {
  final int limit;

  GetMissionsEvent ([this.limit = 10]) : super([limit]);
}