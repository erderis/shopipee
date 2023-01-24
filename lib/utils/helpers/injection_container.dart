import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:portfolio/core/network/network_info.dart';
import 'package:portfolio/features/category/data/datasources/category_image_remote.dart';
import 'package:portfolio/features/category/data/datasources/category_local.dart';
import 'package:portfolio/features/category/data/datasources/category_remote.dart';
import 'package:portfolio/features/category/data/repositories/category_image_repo_impl.dart';
import 'package:portfolio/features/category/data/repositories/category_repository_impl.dart';
import 'package:portfolio/features/category/domain/repositories/category_repository.dart';
import 'package:portfolio/features/category/domain/usecases/get_category.dart';
import 'package:portfolio/features/category/domain/usecases/upload_category_image.dart';
import 'package:portfolio/features/category/presentation/bloc/category_bloc.dart';
import 'package:portfolio/features/overview/data/datasources/traffic_local.dart';
import 'package:portfolio/features/overview/data/datasources/traffic_remote.dart';
import 'package:portfolio/features/overview/data/repositories/traffic_repository_impl.dart';
import 'package:portfolio/features/overview/domain/repositories/traffic_repository.dart';
import 'package:portfolio/features/overview/domain/usecases/get_traffic.dart';
import 'package:portfolio/features/overview/presentation/bloc/traffic_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/category/domain/repositories/category_image_repository.dart';
import '../../features/category/domain/usecases/add_category.dart';
import '../../features/category/domain/usecases/delete_category.dart';
import '../../features/category/domain/usecases/update_category.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features
  _initTraffic();
  _initCategory();

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  sl.registerLazySingleton(() => FirebaseStorage.instance);

  // final List<AddressCheckOptions> _defaultAddresses = [
  //   AddressCheckOptions(
  //     Uri.parse('https://cloudflare-dns.com/dns-query'),
  //   ),
  //   AddressCheckOptions(
  //     Uri.parse('https://mozilla.cloudflare-dns.com/dns-query'),
  //   ),
  // ];
  final customInstance = InternetConnectionCheckerPlus.createInstance(
    checkTimeout: const Duration(seconds: 3), // Custom check timeout
    checkInterval: const Duration(seconds: 3), // Custom check interval
    // addresses: _defaultAddresses,
  );
  sl.registerSingleton<InternetConnectionCheckerPlus>(
    customInstance,
  );
}

Future<void> _initTraffic() async {
  //! Features - Traffic
  //bloc
  sl.registerFactory(() => TrafficBloc(getTraffic: sl()));
  //use cases
  sl.registerLazySingleton(() => GetTraffic(sl()));
  //repository
  sl.registerLazySingleton<TrafficRepository>(() =>
      TrafficRepositoryImpl(remote: sl(), local: sl(), networkInfo: sl()));
  //data source
  //data source
  sl.registerLazySingleton<TrafficRemote>(() => TrafficRemoteImpl(db: sl()));
  sl.registerLazySingleton<TrafficLocal>(
      () => TrafficLocalImpl(sharedPreferences: sl()));
}

Future<void> _initCategory() async {
  //! Features - Traffic
  //bloc
  sl.registerFactory(() => CategoryBloc(
      getCategory: sl(),
      addCategory: sl(),
      updateCategory: sl(),
      deleteCategory: sl(),
      uploadCategoryImage: sl()));
  //use cases
  sl.registerLazySingleton(() => GetCategory(repository: sl()));
  sl.registerLazySingleton(() => AddCategory(repository: sl()));
  sl.registerLazySingleton(() => UpdateCategory(repository: sl()));
  sl.registerLazySingleton(() => DeleteCategory(repository: sl()));
  sl.registerLazySingleton(() => UploadCategoryImage(repository: sl()));
  //repository
  sl.registerLazySingleton<CategoryRepository>(() =>
      CategoryRepositoryImpl(remote: sl(), local: sl(), networkInfo: sl()));
  sl.registerLazySingleton<CategoryImageRepository>(
      () => CategoryImageRepoImpl(remote: sl(), networkInfo: sl()));
  //data source
  sl.registerLazySingleton<CategoryRemote>(() => CategoryRemoteImpl(db: sl()));
  sl.registerLazySingleton<CategoryLocal>(
      () => CategoryLocalImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<CategoryImageRemote>(
      () => CategoryImageRemoteImpl(storage: sl()));
}
