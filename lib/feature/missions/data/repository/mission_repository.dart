import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:spacex_app/core/error/failure.dart';
import 'package:spacex_app/core/network/network_info.dart';
import 'package:spacex_app/feature/missions/data/datasource/mission_local_datasource.dart';
import 'package:spacex_app/feature/missions/data/datasource/mission_remote_datasource.dart';
import 'package:spacex_app/feature/missions/data/model/mission_model.dart';
import 'package:spacex_app/feature/missions/domain/repositories/mission_repository.dart';

class MissionRepositoryImpl extends MissionRepository {
  final NetworkInfo networkInfo;
  final MissionRemoteDataSource remoteDataSource;
  final MissionLocalDataSource localDataSource;

  MissionRepositoryImpl({@required this.networkInfo, @required this.remoteDataSource, @required this.localDataSource});

  // [Cache Policy is to get data from cache only when there's no internet.]

  @override
  Future<Either<Failure, MissionResponse>> getMissions([int limit = 10]) async {
    if (await networkInfo.isConnected) {
      try {
        final missions = await remoteDataSource.getMissions(limit);
        localDataSource.cacheMissions(missions);
        return Right(missions);
      } on Exception catch (_) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final local = await localDataSource.getCachedMissions();
        return Right(local);
      } on Exception catch (_) {
        return Left(CacheFailure());
      }
    }
  }
}