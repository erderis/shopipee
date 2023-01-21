import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:portfolio/core/network/network_info.dart';
import 'package:portfolio/features/overview/data/datasources/traffic_local.dart';
import 'package:portfolio/features/overview/data/datasources/traffic_remote.dart';
import 'package:portfolio/features/overview/data/repositories/traffic_repository_impl.dart';
import 'package:portfolio/features/overview/domain/repositories/traffic_repository.dart';
import 'package:portfolio/features/overview/domain/usecases/get_traffic.dart';
import 'package:portfolio/features/overview/presentation/bloc/traffic_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Traffic
  //bloc
  sl.registerFactory(() => TrafficBloc(getTraffic: sl()));
  //use cases
  sl.registerLazySingleton(() => GetTraffic(sl()));
  //repository
  sl.registerLazySingleton<TrafficRepository>(() => TrafficRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
  //data source
  sl.registerLazySingleton<TrafficRemote>(() => TrafficRemoteImpl(db: sl()));
  sl.registerLazySingleton<TrafficLocal>(
      () => TrafficLocalImpl(sharedPreferences: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  final customInstance = InternetConnectionChecker.createInstance(
    // checkTimeout: const Duration(seconds: 3), // Custom check timeout
    // checkInterval: const Duration(seconds: 3), // Custom check interval
    addresses: [],
  );
  sl.registerSingleton<InternetConnectionChecker>(
    customInstance,
  );
}
