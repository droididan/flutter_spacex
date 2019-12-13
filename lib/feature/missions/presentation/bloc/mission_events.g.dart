// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_events.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class MissionEvent extends Equatable {
  const MissionEvent(this._type);

  factory MissionEvent.getMissionsEvent({@required int limit}) =
      GetMissionsEvent;

  final _MissionEvent _type;

//ignore: missing_return
  R when<R>({@required R Function(GetMissionsEvent) getMissionsEvent}) {
    switch (this._type) {
      case _MissionEvent.GetMissionsEvent:
        return getMissionsEvent(this as GetMissionsEvent);
    }
  }

  @override
  List get props => null;
}

@immutable
class GetMissionsEvent extends MissionEvent {
  const GetMissionsEvent({@required this.limit})
      : super(_MissionEvent.GetMissionsEvent);

  final int limit;

  @override
  String toString() => 'GetMissionsEvent(limit:${this.limit})';
  @override
  List get props => [limit];
}
