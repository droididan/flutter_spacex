import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex_app/core/error/Exception.dart';
import 'package:spacex_app/feature/missions/data/model/mission_model.dart';

import 'mission_scheme.dart';

abstract class MissionRemoteDataSource {
  /// will call end point http://api.spacex.land/graphql/
  ///
  /// throws [ServerException] if call fails
  Future<MissionResponse> getMissions(int limit);
}

class MissionRemoteDataSourceImpl extends MissionRemoteDataSource {
  final GraphQLClient client;

  MissionRemoteDataSourceImpl({@required this.client}) : assert(client != null);

  @override
  Future<MissionResponse> getMissions(int limit) async {
    final options = QueryOptions(
      document: readMissions,
      errorPolicy: ErrorPolicy.all,
      fetchPolicy: FetchPolicy.cacheFirst,
      variables: {
        'nLimit': limit,
      },
    );

    final graph = await client.query(options);

    return graph.hasErrors
        ? throw ServerException()
        : MissionResponse(
            (graph.data['launches'] as List<dynamic>)
                .map((dynamic mission) => MissionModel.fromJson(mission))
                .toList());
  }
}
