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
    dispatch(GetMissionsEvent());
  }

  @override
  MissionState get initialState => Empty();

  @override
  Stream<MissionState> mapEventToState(MissionEvent event) async* {
    if (event is GetMissionsEvent) {
      yield Loading();
      final failureOrMission = await getMission(Params(event.limit));
      yield failureOrMission.fold(
        (failure) => Error(message: _mapFailure(failure)),
        (missions) => missions == null ? Empty() : Loaded(model: missions),
      );
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