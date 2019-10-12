import 'package:dartz/dartz.dart';
import 'package:spacex_app/core/error/failure.dart';
import 'package:spacex_app/feature/missions/data/model/mission_model.dart';

abstract class MissionRepository {
  Future<Either<Failure, MissionResponse>> getMissions([int limit = 10]);
}
