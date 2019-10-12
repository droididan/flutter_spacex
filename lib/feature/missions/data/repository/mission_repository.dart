import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:spacex_app/core/error/failure.dart';
import 'package:spacex_app/core/network/network_info.dart';
import 'package:spacex_app/feature/missions/data/datasource/mission_remote_datasource.dart';
import 'package:spacex_app/feature/missions/data/model/mission_model.dart';
import 'package:spacex_app/feature/missions/domain/repositories/mission_repository.dart';

class MissionRepositoryImpl extends MissionRepository {
  final NetworkInfo networkInfo;
  final MissionRemoteDataSource remoteDataSource;

  MissionRepositoryImpl({@required this.networkInfo, @required this.remoteDataSource});

  @override
  Future<Either<Failure, MissionResponse>> getMissions([int limit = 10]) async {
    try {
      final missions = await remoteDataSource.getMissions(limit);
      return Right(missions);
    } on Exception catch (_) {
      return Left(ServerFailure());
    }
  }
}
