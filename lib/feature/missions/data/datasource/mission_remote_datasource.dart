import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex_app/core/error/Exception.dart';
import 'package:spacex_app/core/network/graph.dart';
import 'package:spacex_app/feature/missions/data/model/mission_model.dart';

abstract class MissionRemoteDataSource {
  /// will call end point http://api.spacex.land/graphql/
  ///
  /// throws [ServerException] if call fails
  Future<MissionModel> getMissions(int limit);
}

class MissionRemoteDataSourceImpl extends MissionRemoteDataSource {
  final GraphQLClient client;

  MissionRemoteDataSourceImpl({this.client});

  @override
  Future<MissionModel> getMissions(int limit) async {
    final graph = await client.query(setOption(document: ""));
    return graph.hasErrors ? throw ServerException() : cast<MissionModel>(graph.data);
  }
}