import 'package:dartz/dartz.dart';
import 'package:spacex_app/core/error/failure.dart';
import 'package:spacex_app/core/usecase/usecase.dart';
import 'package:spacex_app/feature/missions/data/model/mission_model.dart';
import 'package:spacex_app/feature/missions/domain/repositories/mission_repository.dart';

class GetMission implements UseCase<MissionResponse, Params> {
  final MissionRepository repository;

  GetMission(this.repository);

  @override
  Future<Either<Failure, MissionResponse>> call(Params params) async {
    return await repository.getMissions(params.limit);
  }
}

class Params {
  final int limit;
  Params(this.limit);
}