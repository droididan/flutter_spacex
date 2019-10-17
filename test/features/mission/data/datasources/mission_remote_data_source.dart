import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:spacex_app/feature/missions/data/datasource/mission_remote_datasource.dart';
import 'package:spacex_app/feature/missions/data/datasource/mission_scheme.dart';

import '../../../../json/json_reader.dart';

class MockGraphClient extends Mock implements GraphQLClient {}

main() {
  MissionRemoteDataSourceImpl remoteDateSource;
  MockGraphClient mockGraphClient;

  setUp(() {
    mockGraphClient = MockGraphClient();
    remoteDateSource = MissionRemoteDataSourceImpl(client: mockGraphClient);
  });

  final result = QueryResult(
    data: jsonDecode(jsonReader('mission.json')),
    errors: null,
    loading: false,
  );

  group('mission', () {
    final tLimit = 10;

    test('should get missions success', () async {
      // arrange
      final options = QueryOptions(
        document: readMissions,
        errorPolicy: ErrorPolicy.all,
        fetchPolicy: FetchPolicy.cacheFirst,
        variables: <String, dynamic>{
          'nLimit': tLimit,
        },
      );

      when(mockGraphClient.query(options)).thenAnswer((_) async =>
          result);
      // act
      remoteDateSource.getMissions(tLimit);
    });
  });
}
