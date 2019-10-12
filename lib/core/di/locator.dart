import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex_app/core/network/network_info.dart';
import 'package:spacex_app/feature/missions/data/datasource/mission_remote_datasource.dart';
import 'package:spacex_app/feature/missions/data/repository/mission_repository.dart';
import 'package:spacex_app/feature/missions/domain/repositories/mission_repository.dart';
import 'package:spacex_app/feature/missions/domain/usecases/mission_usecase.dart';
import 'package:spacex_app/feature/missions/presentation/bloc/mission_bloc.dart';

final sl = GetIt.I;

initLocator() {
  // network info
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // graph client
  sl.registerLazySingleton(() => _graphClient());

  // mission data
  sl.registerLazySingleton<MissionRemoteDataSource>(() => MissionRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<MissionRepository>(() => MissionRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));
  // mission domain
  sl.registerLazySingleton(() => GetMission(sl()));
  // mission presentation
  sl.registerLazySingleton(() => MissionBloc(getMission: sl()));
}

GraphQLClient _graphClient() {
  return GraphQLClient(
    cache: OptimisticCache(
      dataIdFromObject: typenameDataIdFromObject,
    ),
    link: HttpLink(
      uri: 'http://api.spacex.land/graphql/',
    ),
  );
}
