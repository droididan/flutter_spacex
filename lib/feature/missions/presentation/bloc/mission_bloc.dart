import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:spacex_app/core/error/failure.dart';
import 'package:spacex_app/feature/missions/domain/usecases/mission_get_usecase.dart';
import 'package:spacex_app/feature/missions/presentation/bloc/mission_events.dart';
import 'package:spacex_app/feature/missions/presentation/bloc/mission_states.dart';

class MissionBloc extends Bloc<MissionEvent, MissionState> {
  // use cases
  final GetMission getMission;

  MissionBloc({@required this.getMission}) : assert(getMission != null) {
    add(GetMissionsEvent(limit: 10));
  }

  @override
  MissionState get initialState => MissionState.empty();

  @override
  Stream<MissionState> mapEventToState(MissionEvent event) async* {
    yield Loading();

    yield* event.when(
      getMissionsEvent: (e) {
        return mapMissionEvent(e);
      },
    );
  }

  Stream<MissionState> mapMissionEvent(GetMissionsEvent e) async* {
    try {

      final failureOrMission = await getMission(Params(e.limit));
      yield failureOrMission.fold(
        (failure) => MissionState.error(message: _mapFailure(failure)),
        (missions) => missions == null ? MissionState.empty() : MissionState.loaded(model: missions),
      );
    } on Exception catch (e) {
      print('error');
    }
  }

  String _mapFailure(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'server error';
        break;

      case CacheFailure:
        return 'cache error';
        break;

      default:
        return 'try again later';
    }
  }
}
