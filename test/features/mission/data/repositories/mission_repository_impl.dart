import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:spacex_app/core/network/network_info.dart';
import 'package:spacex_app/feature/missions/data/datasource/mission_local_datasource.dart';
import 'package:spacex_app/feature/missions/data/datasource/mission_remote_datasource.dart';
import 'package:spacex_app/feature/missions/data/model/mission_model.dart';
import 'package:spacex_app/feature/missions/data/repository/mission_repository.dart';

class MockRemoteDataSource extends Mock implements MissionRemoteDataSource {}

class MockLocalDataSource extends Mock implements MissionLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

main() {
  MissionRepositoryImpl repository;
  MockRemoteDataSource remoteDataSource;
  MockLocalDataSource localDataSource;
  MockNetworkInfo networkInfo;

  setUp(() {
    networkInfo = MockNetworkInfo();
    remoteDataSource = MockRemoteDataSource();
    localDataSource = MockLocalDataSource();
    repository = MissionRepositoryImpl(
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
      networkInfo: networkInfo,
    );
  });

  group('getMissionData', () {

    final mockResponse = MissionResponse([
      MissionModel('details', 'name', 'year',"4"),
      MissionModel('details1', 'name', 'year',"4"),
      MissionModel('details2', 'name', 'year',"4"),
      MissionModel('details3', 'name', 'year',"4"),
      MissionModel('details4', 'name', 'year',"4"),
      MissionModel('details5', 'name', 'year',"4"),
      MissionModel('details6', 'name', 'year',"4"),
      MissionModel('details7', 'name', 'year',"4"),
    ]);


    var limit = 10;

    test(('should check if the devidce is online'), () {
      // arrange
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      // act

      repository.getMissions(limit);

      //assert
      verify(networkInfo.isConnected);
    });

    test(('should return mission data when remote call is successful'), () async {
      // arrange
      when(remoteDataSource.getMissions(limit)).thenAnswer((_) async => mockResponse);
      // act
      final result = await repository.getMissions(limit);

      //assert
      verify(remoteDataSource.getMissions(limit));
      expect(result, equals(Right(mockResponse)));
    });

    test((''), () {
      // arrange
      // act
      //assert
    });
  });
}
